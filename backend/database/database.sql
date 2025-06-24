-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 24, 2025 at 03:37 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `venuvibe`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `name`, `email`, `password`, `creation_date`) VALUES
(5, 'admin', 'admin@venuvibe.com', '$2y$10$l0E8l.zbuM9CNUHmphyw0.kwHpc5/lAi5eRcvvyzBAXQeN8neLmuO', '2025-06-10 11:46:23');

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creation_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`id_client`, `name`, `email`, `password`, `creation_date`) VALUES
(5, 'abdelhay', 'abdelhay.mallouli.solicode@gmail.com', '$2y$10$qtnLBd.D4oOzsWlqe9GeXOPd3D2MO/rrA3c.ITeS1m0ZvnhD2ON/y', '2025-06-24 10:21:48'),
(6, 'mallouliabdelhay831', 'mallouli.abdelhay.solicode@gmail.com', '', '2025-06-24 10:32:40'),
(7, 'ibouha', 'admin@gmail.com', '$2y$10$M2U4kwQEnUi/D4sGCaFQKejLDMaBXR72F78o4TUAmRILNXoKGNxsO', '2025-06-24 11:41:18');

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `id_event` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `event_date` date NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `banner_image` varchar(255) DEFAULT NULL,
  `description` text DEFAULT '',
  `status` enum('Planned','Ongoing','Completed','Cancelled') DEFAULT 'Planned',
  `expected_guests` int(11) DEFAULT NULL,
  `budget` decimal(12,2) DEFAULT NULL,
  `creation_date` datetime DEFAULT current_timestamp(),
  `id_client` int(11) NOT NULL,
  `id_type` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_providers`
--

CREATE TABLE `oauth_providers` (
  `id_oauth` int(11) NOT NULL,
  `id_client` int(11) NOT NULL,
  `provider` varchar(50) NOT NULL,
  `provider_id` varchar(255) NOT NULL,
  `provider_data` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`provider_data`)),
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_providers`
--

INSERT INTO `oauth_providers` (`id_oauth`, `id_client`, `provider`, `provider_id`, `provider_data`, `created_at`) VALUES
(3, 6, 'google', '108872080932087569926', '{\"name\":\"MALLOULI Abdelhay\",\"given_name\":\"MALLOULI\",\"family_name\":\"Abdelhay\",\"picture\":\"https:\\/\\/lh3.googleusercontent.com\\/a\\/ACg8ocIiZyWUFyvCLypF_bTKgbGn80mBa054_y5k0Wjw2nfIeBNa8Q=s96-c\",\"email\":\"mallouli.abdelhay.solicode@gmail.com\"}', '2025-06-24 10:32:40');

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `id_request` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `deadline` date DEFAULT NULL,
  `status` enum('Open','In Progress','Completed','Cancelled') DEFAULT 'Open',
  `id_event` int(11) NOT NULL,
  `id_transaction` int(11) DEFAULT NULL,
  `id_vendor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `id_transaction` int(11) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `transaction_date` datetime DEFAULT current_timestamp(),
  `id_event` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `type`
--

CREATE TABLE `type` (
  `id_type` int(11) NOT NULL,
  `type_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `type`
--

INSERT INTO `type` (`id_type`, `type_name`) VALUES
(2, 'Birthday'),
(4, 'Concert'),
(3, 'Corporate'),
(1, 'Wedding');

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `id_vendor` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `category` varchar(100) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `rating` decimal(3,2) DEFAULT NULL,
  `creation_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`id_vendor`, `name`, `category`, `description`, `phone`, `email`, `image`, `rating`, `creation_date`) VALUES
(1, 'Elite Catering', 'Catering', 'Premium catering services for all events', '555-0101', 'contact@elitecatering.com', 'https://cdn.pixabay.com/photo/2016/03/27/18/53/drinks-1283608_1280.jpg', 4.50, '2025-05-30 19:33:39'),
(2, 'Starlight Decor', 'Decoration', 'Elegant decor solutions for memorable events', '555-0102', 'info@starlightdecor.com', 'https://cdn.pixabay.com/photo/2021/11/22/18/29/laser-show-6817130_1280.jpg', 4.60, '2025-05-30 19:33:39'),
(3, 'Harmony Music', 'Music', 'Live music and DJ services', '555-0103', 'bookings@harmonymusic.com', 'https://cdn.pixabay.com/photo/2020/11/27/07/32/choir-5781096_1280.jpg', 4.70, '2025-05-30 19:33:39'),
(4, 'Bliss Photography', 'Photography', 'Professional event photography', '555-0104', 'hello@blissphoto.com', 'https://www.weddedblissphotography.com/wp-content/uploads/2014/04/27-12610-pp_gallery/Vernon-Wedding-Photographer-Wedded-Bliss-Photography-www.weddedblissphotography.com-0160(pp_w799_h533).jpg', 4.90, '2025-05-30 19:33:39'),
(5, 'Golden Venue', 'Venue', 'Luxury venue rentals', '555-0105', 'reservations@goldenvenue.com', 'https://cdn0.weddingwire.com/vendor/118851/3_2/960/jpg/a-4_51_2158811-169774370863218.webp', 4.50, '2025-05-30 19:33:39'),
(6, 'Tasty Treats', 'Catering', 'Custom cakes and desserts', '555-0106', 'orders@tastytreats.com', 'https://www.somewhatsimple.com/wp-content/uploads/2018/05/cake_mix_cookies_10.jpg', 4.70, '2025-05-30 19:33:39'),
(7, 'Bright Lights', 'Lighting', 'Event lighting specialists', '555-0107', 'info@brightlights.com', 'https://upload.wikimedia.org/wikipedia/en/6/6b/CeeLo-BrightLightsBiggerCity.jpg', 4.60, '2025-05-30 19:33:39'),
(8, 'Pure Elegance', 'Floral', 'Floral arrangements and designs', '555-0108', 'contact@pureelegance.com', 'https://res.cloudinary.com/ufn/image/upload/c_pad,f_auto,q_auto,fl_progressive,dpr_1.5,w_241,h_270/1622836145948_6.jpg', 4.80, '2025-05-30 19:33:39'),
(9, 'Vibe Entertainment', 'Entertainment', 'Interactive entertainment services', '555-0109', 'events@vibeent.com', 'https://cdn0.weddingwire.com/vendor/173800/3_2/960/jpg/1528347552-3b05eb7edc12bad2-1528347551-1383ba5375745fcd-1528347551397-1-Vibe_Entertainment.jpeg', 4.50, '2025-05-30 19:33:39'),
(10, 'Crystal Events', 'Event Planning', 'Full-service event planning', '555-0110', 'plan@crystalevents.com', 'https://crystalfes.com/media/pages/galerie/6f2c89c5a3-1702416790/salle-fetes-fes-600x450-crop.jpg', 4.90, '2025-05-30 19:33:39'),
(11, 'Gourmet Bites', 'Catering', 'Gourmet food catering', '555-0111', 'info@gourmetbites.com', 'https://static.wixstatic.com/media/d425e0_f3d99e7b721445739657d9a26abd6b4b~mv2.jpg/v1/fill/w_742,h_496,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/d425e0_f3d99e7b721445739657d9a26abd6b4b~mv2.jpg', 4.70, '2025-05-30 19:33:39'),
(12, 'Skyline Rentals', 'Rentals', 'Furniture and equipment rentals', '555-0112', 'rentals@skylinerentals.com', 'https://images.squarespace-cdn.com/content/v1/5f85d73f24a4090c6e56e9fd/2a1daf2f-d05b-48da-aeb0-6435d05035f6/IMG_1312.jpg', 4.60, '2025-05-30 19:33:39'),
(13, 'Moments Captured', 'Videography', 'Videography and drone services', '555-0113', 'book@momentscaptured.com', 'https://2bridges.b-cdn.net/wp-content/uploads/2019/08/candidphotography-1.jpg', 4.80, '2025-05-30 19:33:39'),
(14, 'Festive Planners', 'Event Planning', 'Creative event coordination', '555-0114', 'contact@festiveplanners.com', 'https://shop.christmasphere.com/cdn/shop/products/il_fullxfull.3488991509_a5l2.jpg?v=1668626789&width=1946', 4.70, '2025-05-30 19:33:39'),
(15, 'Luxe Transport', 'Transportation', 'Luxury transportation services', '555-0115', 'book@luxetransport.com', 'https://www.infinity-luxe-chauffeur.com/wp-content/uploads/2024/02/autocar-location-infinity-luxe-1024x576.png', 4.60, '2025-05-30 19:33:39'),
(16, 'Chic Designs', 'Styling', 'Custom event styling', '555-0116', 'design@chicdesigns.com', 'https://www.reveriesocial.com/wp-content/uploads/2024/01/Bold-Color-Maximalist.webp', 4.80, '2025-05-30 19:33:39'),
(17, 'Melody Bands', 'Music', 'Live bands for all occasions', '555-0117', 'info@melodybands.com', 'https://cdn.alivenetwork.com/images/extrabandpics/av5.jpg', 4.70, '2025-05-30 19:33:39'),
(18, 'Sparkle Events', 'Decoration', 'Event decor and props', '555-0118', 'events@sparkleevents.com', 'https://projectparty.com.au/wp-content/uploads/2021/09/sparkling-events-party-hire-1st-1024x767.jpeg', 4.60, '2025-05-30 19:33:39'),
(19, 'Tasteful Menus', 'Catering', 'Customized catering services', '555-0119', 'orders@tastefulmenus.com', 'https://blog.lisi.menu/wp-content/uploads/2023/05/17.-Menu-17-1-1024x683.jpg', 4.80, '2025-05-30 19:33:39'),
(20, 'Dream Stages', 'Stage and Sound', 'Stage and sound system rentals', '555-0120', 'rentals@dreamstages.com', 'https://theoneupgroup.com/wp-content/uploads/2023/06/Stage-Platform.jpg', 4.70, '2025-05-30 19:33:39');

-- --------------------------------------------------------

--
-- Table structure for table `vendor_type`
--

CREATE TABLE `vendor_type` (
  `id_vendor` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  `price` decimal(12,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `vendor_type`
--

INSERT INTO `vendor_type` (`id_vendor`, `id_type`, `price`) VALUES
(1, 1, 1500.00),
(1, 2, 900.00),
(1, 3, 2000.00),
(1, 4, 1200.00),
(2, 1, 1000.00),
(2, 2, 500.00),
(2, 3, 1500.00),
(2, 4, 800.00),
(3, 1, 1200.00),
(3, 2, 600.00),
(3, 3, 1800.00),
(3, 4, 2000.00),
(4, 1, 800.00),
(4, 2, 400.00),
(4, 3, 1000.00),
(4, 4, 600.00),
(5, 1, 2500.00),
(5, 2, 1000.00),
(5, 3, 3000.00),
(5, 4, 1500.00),
(6, 1, 600.00),
(6, 2, 300.00),
(6, 3, 800.00),
(6, 4, 500.00),
(7, 1, 900.00),
(7, 2, 450.00),
(7, 3, 1200.00),
(7, 4, 700.00),
(8, 1, 1100.00),
(8, 2, 550.00),
(8, 3, 1400.00),
(8, 4, 900.00),
(9, 1, 1300.00),
(9, 2, 650.00),
(9, 3, 1600.00),
(9, 4, 1100.00),
(10, 1, 2000.00),
(10, 2, 900.00),
(10, 3, 2500.00),
(10, 4, 1300.00),
(11, 1, 1400.00),
(11, 2, 700.00),
(11, 3, 1800.00),
(11, 4, 1000.00),
(12, 1, 850.00),
(12, 2, 400.00),
(12, 3, 1100.00),
(12, 4, 600.00),
(13, 1, 950.00),
(13, 2, 450.00),
(13, 3, 1200.00),
(13, 4, 700.00),
(14, 1, 1700.00),
(14, 2, 800.00),
(14, 3, 2200.00),
(14, 4, 1200.00),
(15, 1, 2000.00),
(15, 2, 900.00),
(15, 3, 2500.00),
(15, 4, 1300.00),
(16, 1, 1100.00),
(16, 2, 550.00),
(16, 3, 1400.00),
(16, 4, 800.00),
(17, 1, 1300.00),
(17, 2, 650.00),
(17, 3, 1600.00),
(17, 4, 1000.00),
(18, 1, 1000.00),
(18, 2, 500.00),
(18, 3, 1300.00),
(18, 4, 700.00),
(19, 1, 1600.00),
(19, 2, 800.00),
(19, 3, 2000.00),
(19, 4, 1100.00),
(20, 1, 1800.00),
(20, 2, 900.00),
(20, 3, 2300.00),
(20, 4, 1200.00);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`id_event`),
  ADD KEY `id_client` (`id_client`),
  ADD KEY `id_type` (`id_type`),
  ADD KEY `event_date` (`event_date`);

--
-- Indexes for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD PRIMARY KEY (`id_oauth`),
  ADD UNIQUE KEY `provider_unique` (`id_client`,`provider`),
  ADD UNIQUE KEY `provider_id_unique` (`provider`,`provider_id`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`id_request`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `id_transaction` (`id_transaction`),
  ADD KEY `id_vendor` (`id_vendor`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`id_transaction`),
  ADD KEY `id_event` (`id_event`),
  ADD KEY `transaction_date` (`transaction_date`);

--
-- Indexes for table `type`
--
ALTER TABLE `type`
  ADD PRIMARY KEY (`id_type`),
  ADD UNIQUE KEY `type_name` (`type_name`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`id_vendor`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `vendor_type`
--
ALTER TABLE `vendor_type`
  ADD PRIMARY KEY (`id_vendor`,`id_type`),
  ADD KEY `id_type` (`id_type`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `id_event` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  MODIFY `id_oauth` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `id_request` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `id_transaction` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `type`
--
ALTER TABLE `type`
  MODIFY `id_type` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `id_vendor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `event_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE,
  ADD CONSTRAINT `event_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`) ON DELETE CASCADE;

--
-- Constraints for table `oauth_providers`
--
ALTER TABLE `oauth_providers`
  ADD CONSTRAINT `oauth_providers_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id_client`) ON DELETE CASCADE;

--
-- Constraints for table `request`
--
ALTER TABLE `request`
  ADD CONSTRAINT `request_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE CASCADE,
  ADD CONSTRAINT `request_ibfk_2` FOREIGN KEY (`id_transaction`) REFERENCES `transaction` (`id_transaction`) ON DELETE SET NULL,
  ADD CONSTRAINT `request_ibfk_3` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`) ON DELETE SET NULL;

--
-- Constraints for table `transaction`
--
ALTER TABLE `transaction`
  ADD CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`id_event`) REFERENCES `event` (`id_event`) ON DELETE CASCADE;

--
-- Constraints for table `vendor_type`
--
ALTER TABLE `vendor_type`
  ADD CONSTRAINT `vendor_type_ibfk_1` FOREIGN KEY (`id_vendor`) REFERENCES `vendor` (`id_vendor`) ON DELETE CASCADE,
  ADD CONSTRAINT `vendor_type_ibfk_2` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
