# Venuvibe Event Planning Platform



## 🌟 Overview
Venuvibe is a comprehensive event planning platform designed to connect users with vendors and streamline the event organization process. It features a modern, responsive frontend and a robust custom PHP backend to handle reservations, user management, and administrative tasks.

![Venuvibe Home](screenshots/home.png)
## 🚀 Tech Stack

### Frontend
- **Framework:** React 18
- **Language:** TypeScript
- **Build Tool:** Vite
- **Styling:** TailwindCSS
- **State Management:** React Context / Hooks
- **HTTP Client:** Native Fetch / Axios (implied)

### Backend
- **Language:** PHP 8+
- **Database:** MySQL
- **ORM/DB Access:** PDO (PHP Data Objects)
- **Dependency Manager:** Composer
- **Authentication:** Custom JWT / Session-based (implied from auth naming)

## ✨ Features

### User Features
- **User Authentication:** Secure Login and Signup functionality.
- **Profile Management:** Users can manage their personal profiles.
- **Event Browsing:** extensive catalog of venues and services.
- **Booking System:** Request and manage bookings for events.

### Vendor Features
- **Service Listings:** Vendors can list their services and venues.
- **Booking Management:** Accept or decline booking requests.
- **Transactions:** Monitor earnings and transaction history.

### Admin Features
- **Dashboard:** Comprehensive overview of platform content.
- **User & Vendor Management:** Administrative control over user accounts.
- **Reports:** Generate and view platform performance reports.

## 📂 Project Structure

```
Venuvibe-Event-Planning-Platform/
├── backend/                # PHP Backend Source
│   ├── config/             # DB and App Configuration
│   ├── src/                # Application Logic (Models, Controllers, API)
│   ├── database/           # SQL Scripts
│   └── vendor/             # Composer Dependencies
├── frontend/               # React Frontend Source
│   ├── src/                # Components, Pages, Hooks
│   ├── public/             # Static Assets
│   └── dist/               # Production Build
└── README.md               # project Documentation
```

## 🛠️ Installation & Setup

### Prerequisites
- Node.js & npm (for Frontend)
- PHP 8.0+ & Composer (for Backend)
- MySQL Server (e.g., via XAMPP/WAMP)

### 1. Backend Setup
1. Navigate to the backend directory:
   ```bash
   cd backend
   ```
2. Install PHP dependencies:
   ```bash
   composer install
   ```
3. Configure the database:
   - Create a MySQL database (e.g., `venuvibe_db`).
   - Import the schema from `backend/database/database.sql`.
   - Update `backend/config/database.php` with your DB credentials.
4. Start the backend server (if not using XAMPP/Apache):
   ```bash
   php -S localhost:8000 -t .
   ```

### 2. Frontend Setup
1. Navigate to the frontend directory:
   ```bash
   cd frontend
   ```
2. Install Node dependencies:
   ```bash
   npm install
   ```
3. Create a `.env` file (if needed) and point to your backend API URL.
4. Start the development server:
   ```bash
   npm run dev
   ```
5. Open your browser at `http://localhost:5173` (or the port shown in terminal).

