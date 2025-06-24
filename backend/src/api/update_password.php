<?php
require_once __DIR__ . '/../../config/database.php';
require_once __DIR__ . '/../../config/cors.php';
require_once __DIR__ . '/../models/user.php';
require_once __DIR__ . '/../utils/api_response.php';
require_once __DIR__ . '/../utils/jwt.php';

ini_set('log_errors', 1);
ini_set('error_log', __DIR__ . '/../../logs/php_errors.log');
ini_set('display_errors', 0);

// Initialize database connection
$database = new Database();
$db = $database->getConnection();

// Get the JWT token from the Authorization header
$authHeader = $_SERVER['HTTP_AUTHORIZATION'] ?? '';
if (!$authHeader || !preg_match('/Bearer\s(\S+)/', $authHeader, $matches)) {
    error_log("Update_password.php: Missing or invalid Authorization header");
    ApiResponse::error("Authorization token is required", 401);
    exit;
}

$token = $matches[1];
error_log("Update_password.php: Token received: $token");

// Validate JWT token
$jwt = new JWT();
$payload = $jwt->validate($token);
if (!$payload) {
    error_log("Update_password.php: Token validation failed");
    ApiResponse::error("Invalid or expired token", 401);
    exit;
}

if (!isset($payload['user_id'])) {
    error_log("Update_password.php: Token payload missing user_id");
    ApiResponse::error("Invalid token payload", 401);
    exit;
}

$userId = $payload['user_id'];
error_log("Update_password.php: Validated user ID: $userId");

// Parse input data
$data = json_decode(file_get_contents("php://input"));
if (empty($data->id) || empty($data->currentPassword) || empty($data->newPassword)) {
    error_log("Update_password.php: Missing required fields");
    ApiResponse::error("All fields are required", 400);
    exit;
}

// Verify that the user ID matches the token
if ($data->id !== $userId) {
    error_log("Update_password.php: User ID mismatch. Request ID: {$data->id}, Token ID: $userId");
    ApiResponse::error("Unauthorized: User ID mismatch", 401);
    exit;
}

// Initialize User model
$user = new User($db);
$user->id = $data->id;

// Check if user exists
if (!$user->getById($data->id)) {
    error_log("Update_password.php: User not found for ID: {$data->id}");
    ApiResponse::error("User not found", 404);
    exit;
}

// Verify current password
if (!$user->verifyPassword($data->currentPassword)) {
    error_log("Update_password.php: Invalid current password for user ID: {$data->id}");
    ApiResponse::error("Current password is incorrect", 400);
    exit;
}

// Validate new password
if (!preg_match('/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/', $data->newPassword)) {
    error_log("Update_password.php: New password does not meet requirements for user ID: {$data->id}");
    ApiResponse::error(
        "Password must be at least 8 characters, include uppercase, lowercase, number, and special character",
        400
    );
    exit;
}

// Hash the new password
$user->password = password_hash($data->newPassword, PASSWORD_DEFAULT);

// Update the password
if ($user->updatePassword()) {
    error_log("Update_password.php: Password updated successfully for user ID: {$data->id}");
    ApiResponse::success([], "Password changed successfully");
} else {
    error_log("Update_password.php: Failed to update password for user ID: {$data->id}");
    ApiResponse::error("Failed to change password", 500);
}
?>