<?php
/**
 * Config file for authentication settings
 */

// Authentication settings
define('JWT_SECRET', '4b48ff8c31ba999fb73fd12310cfc2c1'); // md5 hash value of "abdelhay_pfe_venuvibe"
define('JWT_EXPIRATION', 86400);; // Token expiration time in seconds (24 hour)
error_log("auth_config.php loaded: JWT_SECRET=" . substr(JWT_SECRET, 0, 8) . "...");
define('PASSWORD_RESET_EXPIRATION', 1800); // Password reset token expiration (30 minutes)

// Security settings
define('PASSWORD_MIN_LENGTH', 8);
define('BCRYPT_COST', 12); // Higher is more secure but slower
?>
