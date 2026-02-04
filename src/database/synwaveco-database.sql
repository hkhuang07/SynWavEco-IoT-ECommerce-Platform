-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Feb 03, 2026 at 11:10 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `greentech-commerce`
--

-- --------------------------------------------------------

--
-- Table structure for table `alert_thresholds`
--

DROP TABLE IF EXISTS `alert_thresholds`;
CREATE TABLE IF NOT EXISTS `alert_thresholds` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `iot_device_id` bigint UNSIGNED NOT NULL,
  `metric_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `min_value` decimal(8,2) DEFAULT NULL,
  `max_value` decimal(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `alert_thresholds_iot_device_id_metric_key_unique` (`iot_device_id`,`metric_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `alert_thresholds`
--

INSERT INTO `alert_thresholds` (`id`, `iot_device_id`, `metric_key`, `min_value`, `max_value`, `created_at`, `updated_at`) VALUES
(1, 2, 'temperature', 18.00, 30.00, '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(2, 2, 'humidity', 50.00, 75.00, '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(3, 3, 'light_value', 800.00, 3500.00, '2025-12-14 05:47:49', '2025-12-14 05:47:49'),
(6, 5, 'ph_value', 5.50, 8.00, '2025-12-17 08:10:04', '2025-12-17 08:10:04'),
(7, 6, 'moisture_value', 30.00, 60.00, '2025-12-17 08:12:01', '2025-12-17 08:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `articles`
--

DROP TABLE IF EXISTS `articles`;
CREATE TABLE IF NOT EXISTS `articles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `userid` bigint UNSIGNED NOT NULL,
  `productid` bigint UNSIGNED DEFAULT NULL,
  `articletypeid` bigint UNSIGNED NOT NULL,
  `topicid` bigint UNSIGNED DEFAULT NULL,
  `statusid` bigint UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int NOT NULL DEFAULT '0',
  `is_enabled` tinyint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `articles_slug_unique` (`slug`),
  KEY `articles_userid_foreign` (`userid`),
  KEY `articles_productid_foreign` (`productid`),
  KEY `articles_articletypeid_foreign` (`articletypeid`),
  KEY `articles_topicid_foreign` (`topicid`),
  KEY `articles_statusid_foreign` (`statusid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `articles`
--

INSERT INTO `articles` (`id`, `userid`, `productid`, `articletypeid`, `topicid`, `statusid`, `title`, `slug`, `summary`, `content`, `image`, `views`, `is_enabled`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 1, 2, 'Semtech launches power-efficient rugged 5G RedCap routers', 'semtech-launches-power-efficient-rugged-5g-redcap-routers', 'Semtech Corporation, a provider of high-performance semiconductor, Internet of Things (IoT) systems and cloud connectivity service solutions, has announced two new AirLink 5G RedCap routers that address a critical gap in industrial and commercial IoT: the need for future-proof and energy-efficient 5G connectivity scaled to real-world IoT application needs.', '<p><a href=\"https://www.semtech.com/\"><strong>Semtech Corporation</strong></a>, a provider of high-performance semiconductor, Internet of Things (IoT) systems and cloud connectivity service solutions, has announced two new AirLink 5G RedCap routers that address a critical gap in industrial and commercial IoT: the need for future-proof and energy-efficient 5G connectivity scaled to real-world IoT application needs.</p><p>“5G RedCap adoption is accelerating, with connections projected to surpass 656 million globally by 2030 (including eRedCap),” said Shobhit Srivastava, the senior principal analyst at <strong>Omdia</strong>. “The technology delivers the right combination of attributes for industrial applications: <a href=\"https://www.iot-now.com/2025/05/16/151601-5g-networks-to-carry-80-of-global-mobile-traffic-by-2030/\">5G network</a> longevity, power efficiency and 5G performance that matches real-world industrial requirements—without the cost premium of traditional 5G. As LTE networks phase out through the 2030s, 5G RedCap will provide organisations with a deployment path that makes both technical and economic sense.”</p><p>The new&nbsp;<a href=\"https://www.semtech.com/RX400\">AirLink RX400</a>&nbsp;and&nbsp;<a href=\"https://www.semtech.com/EX400\">AirLink EX400&nbsp;</a>routers deliver 5G RedCap performance while consuming less than 1 watt of power when idle, enabling deployments in remote, off-grid locations previously served by existing LTE networks or expensive, high-power traditional 5G solutions. Both routers deliver the throughput and low latency necessary for IoT applications and have a 2×2 Multiple Input Multiple Output (MIMO) antenna configuration—to simplify integration into existing and new deployments.</p><p>Based on 3GPP Release 17 and 5G Standalone (SA) architecture, 5G RedCap technology delivers enhanced network performance and future-proof longevity as carriers continue to modernise their infrastructure. The RX400 and EX400 support 5G RedCap but also LTE Cat-4 for flexible connectivity and immediate deployments.</p><h3>Industrial IoT caught between existing 4G and traditional 5G</h3><p>“Industrial IoT has been caught between traditional 5G that’s too power-hungry and expensive for off-grid applications, and 4G LTE networks that have limited long-term viability,” said Kinana Hussain, the vice president of AirLink networking solutions at Semtech. “AirLink 5G RedCap routers change the game. With sub-1W power consumption and ruggedised designs built for extreme conditions, these RedCap routers deliver 5G at IoT economics. This enables customers to upgrade their networks today to match the long lifespan industrial operations require, finally providing a sustainable path for connecting remote critical infrastructure.”</p><h3>Key applications and use cases</h3><p>The sub-1W power efficiency of both routers enables entirely new 5G deployment scenarios:</p><ul><li><strong>Remote infrastructure monitoring</strong>: Off-grid supervisory control and data acquisition (SCADA) or advanced metering infrastructure (AMI) backhaul in energy and utilities</li><li><strong>Critical infrastructure monitoring</strong>: Remote system monitoring in oil and gas &nbsp;</li><li><strong>Distributed commercial IoT</strong>: Retail, manufacturing and agricultural operations</li><li><strong>Temporary installations</strong>: Mobile deployments where grid power is unavailable or cost-prohibitive</li><li><strong>AirLink RX400</strong>: Rugged 5G RedCap router for outdoor environments</li></ul><p>The AirLink RX400 is the industry’s most power efficient 5G RedCap router with a rugged IP64 and MIL-STD-810H design for challenging outdoor environments and applications requiring maximum reliability. The combination of rugged design and low power consumption optimises it for critical infrastructure applications where grid power is unavailable, enabling solar-powered operation in remote locations.</p><p>The router supports global private LTE and 5G bands, including Anterix Band 106 (900 MHz spectrum standardised under 3GPP Release 18), delivering the versatility and future-proofing that is essential for mission-critical deployments across energy, utilities and industrial sectors. The router also features a single/dual serial port, a single Gigabit Ethernet port, edge computing capabilities, and optional Wi-Fi 6.</p><h3>AirLink EX400: Semi-rugged design for commercial IoT</h3><p>The AirLink EX400 features a semi-rugged design for use in IoT applications in retail, manufacturing and agricultural operations. The router features dual Gigabit Ethernet ports, edge computing capabilities and optional <a href=\"https://www.iot-now.com/2024/04/04/143489-iot-devices-wi-fi-6e-and-the-future-of-wi-fi-7/\">Wi-Fi 6</a>.</p><h3>Comprehensive network management</h3><p>The RX400 and EX400 include one year of AirLink Complete with hardware warranty, 24/7 support and remote management through the cloud-based AirLink Management Service (ALMS) platform. This allows organisations to securely monitor, manage and automatically update router deployments at scale without overwhelming IT support teams.</p><p>Semtech is also expanding management options for its AirLink OS-based routers—including the AirLink RX400 and AirLink EX400—through optional management via AirLink Manager (AM) and AirLink Mobility Manager (AMM) platforms. These management solutions can be deployed hosted or on-premises, providing AirLink customers with flexibility to choose the management solution that best fits their operational and organisational requirements—using the same field-tested management infrastructure trusted by energy and industrial organisations worldwide.</p><h3>Availability</h3><p>The AirLink RX400 and AirLink EX400 routers can be ordered now through qualified&nbsp;<a href=\"https://www.sierrawireless.com/find-a-partner/#contact\">Semtech authorised AirLink channel partners</a>.</p><h3>See the AirLink RX400 and AirLink EX400 at DistribuTECH 2026</h3><p>Learn more about the new AirLink RX400 and EX400 5G RedCap routers alongside Semtech’s complete portfolio of cellular routers, modules and connectivity solutions at DistribuTECH 2026, Feb. 2-5, 2026, in booth #645, San Diego, CA.</p><p>For more information about the AirLink RX400 and AirLink EX400 routers, register for our&nbsp;<a href=\"https://attendee.gotowebinar.com/register/3722446546399649115?source=press-release\">upcoming webinar</a>&nbsp;or visit:</p><ul><li>AirLink RX400:&nbsp;<a href=\"http://www.semtech.com/RX400\">www.semtech.com/RX400</a>&nbsp;&nbsp;</li><li>AirLink EX400:&nbsp;<a href=\"http://www.semtech.com/RX400\">www.semtech.com/EX400</a>&nbsp;&nbsp;</li></ul><p><strong>Comment on this article via X:&nbsp;</strong><a href=\"https://www.iot-now.com/\"><strong>@IoTNow_</strong></a><strong>&nbsp;and visit our homepage&nbsp;</strong><a href=\"https://www.iot-now.com/\"><strong>IoT Now</strong></a></p><p>Posted on: January 29, 2026</p><p><strong>Categories: </strong><a href=\"https://www.iot-now.com/news/companies/\"><strong>Companies</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/connectivity-2/\"><strong>Connectivity</strong></a><strong> </strong><a href=\"https://www.iot-now.com/devices-modules/\"><strong>Devices &amp; Modules</strong></a><strong> </strong><a href=\"https://www.iot-now.com/edge/\"><strong>Edge</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/\"><strong>IoT News</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/network-and-infrastructure/\"><strong>Network &amp; Infrastructure</strong></a><strong> </strong><a href=\"https://www.iot-now.com/platforms-applications/\"><strong>Platforms &amp; Applications</strong></a><strong> </strong><a href=\"https://www.iot-now.com/pr/\"><strong>Press Release</strong></a><strong> </strong><a href=\"https://www.iot-now.com/retail/\"><strong>Retail</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/smart-utilities/\"><strong>Utilities</strong></a></p><p><strong>Tags: </strong><a href=\"https://www.iot-now.com/tag/3gpp-release-17/\"><strong>3GPP Release 17</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/4g-lte/\"><strong>4G LTE</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/5g-connectivity/\"><strong>5G connectivity</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/5g-network/\"><strong>5G network</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/5g-performance/\"><strong>5G performance</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/5g-solutions/\"><strong>5G solutions</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/5g-standalone/\"><strong>5G standalone</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/airlink-5g-redcap-routers/\"><strong>AirLink 5G RedCap routers</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/airlink-ex400/\"><strong>AirLink EX400</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/airlink-mobility-manager-amm/\"><strong>AirLink Mobility Manager (AMM)</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/airlink-rx400/\"><strong>AirLink RX400</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/alms-platform/\"><strong>ALMS platform</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/commercial-iot/\"><strong>commercial IoT</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/distributech/\"><strong>Distributech</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/edge-computing/\"><strong>Edge Computing</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/industrial-applications/\"><strong>industrial applications</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/iot-application/\"><strong>IoT application</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/low-power-consumption/\"><strong>low power consumption</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/lte-networks/\"><strong>LTE networks</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/mimo-antenna/\"><strong>MIMO antenna</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/monitoring/\"><strong>monitoring</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/oil-and-gas/\"><strong>oil and gas</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/omdia/\"><strong>Omdia</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/private-lte/\"><strong>private LTE</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/retail/\"><strong>retail</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/semtech-corporation/\"><strong>Semtech Corporation</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/wi-fi-6/\"><strong>Wi-Fi 6</strong></a></p>', 'articles/semtech-launches-power-efficient-rugged-5g-redcap-routers-1769767976.jpg', 0, 1, '2026-01-30 03:12:58', '2026-01-30 03:12:58'),
(2, 1, NULL, 1, 1, 2, '139 million homes in Europe and North America were smart at the end of 2024', '139-million-homes-in-europe-and-north-america-were-smart-at-the-end-of-2024', 'Smart home and home automation systems include a wide range of solutions for controlling, monitoring and automating functions in the home. Berg Insight’s definition of a smart home system is one that is accessible from remote and includes a smartphone app or a web portal user interface. Devices that can only be controlled and automated locally, through switches, timers, sensors and remote controls, are thus not included in the scope of this study. Smart home systems can be grouped into seven primary categories: security and access control systems; energy management and climate control systems; audio-visual and entertainment systems; lighting and window control systems; home appliances; service robotics and irrigation and water management systems.', '<p>Smart home and home automation systems include a wide range of solutions for controlling, monitoring and automating functions in the home. <a href=\"https://www.berginsight.com/\"><strong>Berg Insight</strong></a>’s definition of a smart home system is one that is accessible from remote and includes a smartphone app or a web portal user interface. Devices that can only be controlled and automated locally, through switches, timers, sensors and remote controls, are thus not included in the scope of this study. Smart home systems can be grouped into seven primary categories: security and access control systems; energy management and climate control systems; audio-visual and entertainment systems; lighting and window control systems; home appliances; service robotics and irrigation and water management systems.</p><p>A point solution will in many cases constitute a consumer’s first smart home purchase. The most popular point solutions to date, in terms of sold units, include smart thermostats, smart light bulbs, smart plugs, connected security cameras, voice-controlled smart speakers and floor cleaning robots. These products are marketed by incumbent OEMs such as <strong>Signify</strong>, <strong>Resideo</strong>, <strong>Danfoss</strong>, <strong>Belkin</strong>, <strong>Chamberlain</strong>, <strong>Schlage</strong>, <strong>Assa Abloy</strong> and <strong>iRobot</strong> and newer entrants such as <strong>Ecobee</strong>, <strong>Sonos</strong>, <strong>Arlo</strong>, <strong>Nuki</strong>, <strong>Mysa</strong>, <strong>IKEA</strong>, <strong>Wyze Labs</strong> and <strong>SharkNinja</strong>. In the whole-home system market, traditional home automation vendors such as <strong>Crestron Electronics</strong>, <strong>Control4</strong>, <strong>Savant Systems</strong>, <strong>eQ-3</strong>, <strong>Shelly</strong>, <strong>Somfy</strong> and <strong>Loxone</strong> are facing new competition as companies from adjacent industries have entered the market. Communications and security service providers such as <strong>Verisure</strong>, <strong>ADT</strong>, <strong>Vivint</strong>, <strong>Comcast</strong>, <strong>SimpliSafe</strong> and <strong>Telus</strong> have established themselves among the largest whole-home solution vendors in North America and Europe by combining home security services with <a href=\"https://www.iot-now.com/2023/02/20/127971-home-3-0-emerging-smart-home-solutions-for-connected-world/\">smart home features</a>.</p><p>The North American smart home market continues to grow. The installed base of smart home systems reached 305.8 million at the end of 2024. An estimated 64.4 million of these were multifunction or whole-home systems whereas 241.4 million were point solutions designed for one specific function. As some homes have more than one smart system in use, the installed base totalled an estimated 66.7 million smart homes at the end of the year. This corresponds to 44.8% of all households, placing North America as the most advanced smart home market in the world. Between 2024 and 2029, the number of households that adopt smart home systems is forecasted to grow at a compound annual growth rate (CAGR) of 6.4%, resulting in 90.9 million smart homes at the end of the forecast period. Market revenues reached US$ 52.4 billion (€ 48.4 billion) in 2024. The market is expected to grow at a CAGR of 9.3% between 2024 and 2029, reaching US$ 81.8 billion (€ 75.6 billion) in yearly revenues at the end of the forecast period.</p><p>The European market for smart home systems is still behind the North American market in terms of market penetration and maturity. However, the market has now grown to become almost as large as the North American market. At the end of 2024, there were a total of 240.1 million smart home systems in use in the EU27+3 countries. Around 46.4 million of these systems were multifunction or whole-home systems whereas 193.7 million were point solutions. This corresponds to around 72.8 million smart homes when overlaps are taken into account, meaning that 30.7% of all households in Europe were smart at the end of the year. The number of European households to adopt <a href=\"https://www.iot-now.com/2024/04/22/144080-smart-home-technology-saves-money-and-helps-protect-the-planet/\">smart home systems</a> is forecasted to grow at a compound annual growth rate (CAGR) of 7.2% during the next five years, resulting in 102.8 million smart homes by 2029. Market revenues reached € 39.3 billion (US$ 42.5 billion) in 2024. The market is forecasted to grow at a CAGR of 11.7% between 2024 and 2029 to reach € 68.3 billion (US$ 73.9 billion) at the end of the forecast period.</p><p>The outlook for the smart home market in the coming years is positive. Connectivity adds several benefits to the most commonly used products and systems in the home, including home security systems, door locks, indoor climate control devices, lights, irrigation systems, home appliances and entertainment solutions. The ability to view information and manage various settings of the home remotely enables energy and cost savings, enhances security and safety, and provides convenience for homeowners. In several product categories, connectivity is now becoming a standard feature and consumers are increasingly expecting new products to be smart and connected.</p><p>Discover more insights and detailed market analysis in&nbsp;<strong>Berg Insight</strong>’s latest report, “<a href=\"https://www.berginsight.com/smart-homes-and-home-automation\">Smart Homes and Home Automation, 12th edition</a>“.</p><p><strong>Comment on this article via X:&nbsp;</strong><a href=\"https://www.iot-now.com/\"><strong>@IoTNow_</strong></a><strong>&nbsp;and visit our homepage&nbsp;</strong><a href=\"https://www.iot-now.com/\"><strong>IoT Now</strong></a></p><p>Posted on: January 23, 2026</p><p><strong>Categories: </strong><a href=\"https://www.iot-now.com/news/business-and-markets/\"><strong>Business &amp; Markets</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/companies/\"><strong>Companies</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/connectivity-2/\"><strong>Connectivity</strong></a><strong> </strong><a href=\"https://www.iot-now.com/devices-modules/\"><strong>Devices &amp; Modules</strong></a><strong> </strong><a href=\"https://www.iot-now.com/health-safety/\"><strong>Health &amp; Safety</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/\"><strong>IoT News</strong></a><strong> </strong><a href=\"https://www.iot-now.com/news/products-and-services/\"><strong>Products &amp; Services</strong></a><strong> </strong><a href=\"https://www.iot-now.com/smart-homes-2/\"><strong>Smart Homes</strong></a></p><p><strong>Tags: </strong><a href=\"https://www.iot-now.com/tag/adt/\"><strong>ADT</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/arlo/\"><strong>Arlo</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/audio-visual/\"><strong>audio-visual</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/belkin/\"><strong>Belkin</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/berg-insight/\"><strong>Berg Insight</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/chamberlain/\"><strong>Chamberlain</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/climate-control-systems/\"><strong>climate control systems</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/comcast/\"><strong>Comcast</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/connected-security-cameras/\"><strong>connected security cameras</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/connectivity/\"><strong>connectivity</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/control4/\"><strong>Control4</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/crestron-electronics/\"><strong>Crestron Electronics</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/danfoss/\"><strong>Danfoss</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/door-locks/\"><strong>door locks</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/ecobee/\"><strong>Ecobee</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/energy-management/\"><strong>energy management</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/entertainment-systems/\"><strong>entertainment systems</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/eq-3/\"><strong>eQ-3</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/europe/\"><strong>Europe</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/floor-cleaning-robots/\"><strong>floor cleaning robots</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/home-appliances/\"><strong>home appliances</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/home-automation/\"><strong>home automation</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/ikea/\"><strong>IKEA</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/indoor-climate-control-devices/\"><strong>indoor climate control devices</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/irobot/\"><strong>iRobot</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/irrigation-systems/\"><strong>irrigation systems</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/loxone/\"><strong>Loxone</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/mysa/\"><strong>Mysa</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/north-america/\"><strong>North America</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/nuki/\"><strong>Nuki</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/oems/\"><strong>OEMs</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/remote-controls/\"><strong>remote controls</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/resideo/\"><strong>Resideo</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/savant-systems/\"><strong>Savant Systems</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/schlage/\"><strong>Schlage</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/security/\"><strong>security</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/sensors/\"><strong>sensors</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/service-robotics/\"><strong>service robotics</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/sharkninja/\"><strong>SharkNinja</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/shelly/\"><strong>Shelly</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/signify/\"><strong>Signify</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/smart-home/\"><strong>Smart Home</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/smart-home-system/\"><strong>smart home system</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/smart-light-bulbs/\"><strong>smart light bulbs</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/smart-plugs/\"><strong>smart plugs</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/smart-thermostats/\"><strong>smart thermostats</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/smartphone/\"><strong>smartphone</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/somfy/\"><strong>SOMFY</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/sonos/\"><strong>Sonos</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/switches/\"><strong>Switches</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/telus/\"><strong>TELUS</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/timers/\"><strong>timers</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/verisure/\"><strong>Verisure</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/vivint/\"><strong>Vivint</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/voice-controlled-smart-speakers/\"><strong>voice-controlled smart speakers</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/water-management-systems/\"><strong>water management systems</strong></a><strong> </strong><a href=\"https://www.iot-now.com/tag/wyze-labs/\"><strong>Wyze Labs</strong></a></p>', 'articles/139-million-homes-in-europe-and-north-america-were-smart-at-the-end-of-2024-1769768697.jpg', 0, 1, '2026-01-30 03:24:57', '2026-01-30 03:24:57'),
(3, 1, NULL, 32, 1, 3, 'ARDUINO MEGA 2560 – HẠT NHÂN CỦA SỰ HIỆP LỰC VÀ KẾT NỐI KHÔNG GIỚI HẠN! ⚡️🦾', 'arduino-mega-2560-hat-nhan-cua-su-hiep-luc-va-ket-noi-khong-gioi-han', 'ARDUINO MEGA 2560 – HẠT NHÂN CỦA SỰ HIỆP LỰC VÀ KẾT NỐI KHÔNG GIỚI HẠN! ⚡️🦾\r\n\r\nBạn đã thấy những \"làn sóng\" năng lượng rỉ ra từ các linh kiện và luồng điện xanh cuộn trào bên dưới bo mạch chưa? Đó chính là hiện thân của Wav (Wave) – làn sóng công nghệ mạnh mẽ mà SynWavEco mang đến để hiện thực hóa những dự án IoT phức tạp nhất của bạn.\r\n\r\nĐã đến lúc nâng tầm trải nghiệm sống thông minh với sức mạnh I/O vượt trội từ \"người anh cả\" dòng Arduino.', '<p>ARDUINO MEGA 2560 – HẠT NHÂN CỦA SỰ HIỆP LỰC VÀ KẾT NỐI KHÔNG GIỚI HẠN! <img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t5d/1/16/26a1.png\" alt=\"⚡️\"><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t54/1/16/1f9be.png\" alt=\"🦾\"></p><p>Bạn đã thấy những \"làn sóng\" năng lượng rỉ ra từ các linh kiện và luồng điện xanh cuộn trào bên dưới bo mạch chưa? Đó chính là hiện thân của Wav (Wave) – làn sóng công nghệ mạnh mẽ mà SynWavEco mang đến để hiện thực hóa những dự án IoT phức tạp nhất của bạn.</p><p>Đã đến lúc nâng tầm trải nghiệm sống thông minh với sức mạnh I/O vượt trội từ \"người anh cả\" dòng Arduino.</p><p>________________________________________</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tf4/1/16/2728.png\" alt=\"✨\"> GIÁ TRỊ CỐT LÕI TỪ HỆ SINH THÁI SYNNAVECO:</p><p>• Syn (Synergy) – Hiệp lực thông minh: Khẳng định triết lý $1 + 1 &gt; 2$, Arduino Mega 2560 kết nối hàng chục cảm biến và thiết bị ngoại vi cùng lúc, tạo nên một hệ thống vận hành thống nhất và mạnh mẽ.</p><p>• Wav (Wave) – Sự lan tỏa năng lượng: Đại diện cho các phương thức truyền tin không dây, giúp dữ liệu từ dự án của bạn luôn được đồng bộ thời gian thực lên Website Laravel.</p><p>• Eco (Ecosystem) – Hiệu quả kinh tế: Một hệ sinh thái bền vững nơi các sản phẩm tương trợ lẫn nhau, giúp tối ưu hóa chi phí vận hành cho các mô hình nông nghiệp sạch hay nhà thông minh.</p><p>________________________________________</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/taa/1/16/1f4ca.png\" alt=\"📊\"> THÔNG SỐ KỸ THUẬT CHUẨN \"PRO\":</p><p>• CPU: ATmega2560 16MHz – Đảm bảo sự ổn định và chính trực trong xử lý dữ liệu.</p><p>• Flash Memory: 256KB (Integrated) – Không gian lưu trữ mã nguồn cực lớn cho các thuật toán phức tạp.</p><p>• RAM: 8KB SRAM – Xử lý đa nhiệm mượt mà.</p><p>• Power: Linh hoạt qua cổng 5V USB hoặc 7-12V Barrel Jack.</p><p>• Giá ưu đãi: Chỉ $18.50 USD / 450.000 VNĐ.</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tb9/1/16/1f6e0.png\" alt=\"🛠\"> ỨNG DỤNG THỰC TẾ:</p><p>Từ hệ thống giám sát nông nghiệp sạch, robot tự hành nhiều chân đến các dự án quản lý giao thông đô thị... Arduino Mega 2560 là lựa chọn tối ưu cho những Maker đòi hỏi số lượng chân cắm (I/O) khổng lồ.</p><p>________________________________________</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t84/1/16/1f381.png\" alt=\"🎁\"> CHIẾN LƯỢC ƯU ĐÃI ĐỘC QUYỀN (CHỈ TRONG 72 GIỜ):</p><p>• <img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t50/1/16/1f525.png\" alt=\"🔥\"> Voucher: Nhập mã SYNMega10 để giảm ngay 10% cho đơn hàng đầu tiên.</p><p>• <img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/ta0/1/16/1f4d8.png\" alt=\"📘\"> Quà tặng: Tặng kèm E-book hướng dẫn lập trình và kho Project mẫu độc quyền từ SynWavEco.</p><p>• <img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t16/1/16/1f69a.png\" alt=\"🚚\"> Freeship: Miễn phí vận chuyển toàn quốc cho 50 đơn hàng đầu tiên hoàn tất đặt hàng nhanh nhất!</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/tc6/1/16/1f680.png\" alt=\"🚀\"> \"Beyond Connectivity: Elevating Smart-Life Experiences and Integrity\"</p><p>________________________________________</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t1c/1/16/1f6d2.png\" alt=\"🛒\"> SỞ HỮU NGAY TẠI:</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t51/1/16/1f449.png\" alt=\"👉\"> TikTok Shop: [<a href=\"https://www.tiktok.com/@synwaveco?_r=1&amp;_t=ZS-930JjJfguQr&amp;fbclid=IwZXh0bgNhZW0CMTAAYnJpZBExYWlXejFMUmlPbkw2T0tGOHNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR6omiBJ5azF3J298KA1U1XjIhT0dWOstnVtO3SVRF7cV4QREoIQ3-QgrvrhMQ_aem_q-XRoHL8i6VXW__YkbVqFw\"><strong>https://www.tiktok.com/@synwaveco?_r=1&amp;_t=ZS-930JjJfguQr</strong></a>]</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t3f/1/16/1f30d.png\" alt=\"🌍\"> KHÁM PHÁ HỆ SINH THÁI:</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t87/1/16/1f4fa.png\" alt=\"📺\"> YouTube Channel: [<a href=\"https://l.facebook.com/l.php?u=https%3A%2F%2Fwww.youtube.com%2F%40LENGUYENMINHTIEN-k6u%3Ffbclid%3DIwZXh0bgNhZW0CMTAAYnJpZBExYWlXejFMUmlPbkw2T0tGOHNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR6WEUnkgdbMF_Q3G4jpuRH5BB0GPF4s6WWOhbKHsJCPcOY1S_iGaSBFsveRiA_aem_3OAN0_yucfz-MR0XpGIFqQ&amp;h=AT0yWBkjz7N92K4rKOfBUtBPh9Mn4PJhps11Anql4UpwSa-KkHE_fssGVUFwA59jY5VwXxQ9oRBpE9X2TmWzl4xCzwCYaeCr69E3XvPBUXD6IcvaN5By6ZNVFKOmpXEvN-MRnKDJvGst4J_QOyFGDRa0OiciqvZIOQ&amp;__tn__=-UK-R&amp;c[0]=AT3jX_BuUoiDekVLtetKra_hePKLJug3oeGjFsJSI4fD5NRdd-MqXZLf-fheF-COOf1-6-Q34NnEIL1OaFWuH0t2b7P4vYNgmKjYRdxG72bffMbzAecV2O0ZXtTnN1zJJSAaPnr6SVi_QYAIGh-HIJ2cP7wBwLFGDgpxTe-imwm4FRcLHOlLMRZTuZIDOlc6fGC7Qa94yUyanz3ngjQ3J_5IA-0gig\"><strong>www.youtube.com/@LENGUYENMINHTIEN-k6u</strong></a>]</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t8c/1/16/1f4bb.png\" alt=\"💻\"> Open Source Platform: [<a href=\"https://l.facebook.com/l.php?u=https%3A%2F%2Fgithub.com%2Fhkh...%2FSynthWavEco-IoT-ECommerce-Platform%3Ffbclid%3DIwZXh0bgNhZW0CMTAAYnJpZBExYWlXejFMUmlPbkw2T0tGOHNydGMGYXBwX2lkEDIyMjAzOTE3ODgyMDA4OTIAAR6c9DGwTv9J9OTXAvq_TLXBQj1GnmSddN_U2yqi6Y5ysTM1GFB8XqRhxlhaWA_aem_xWMAOwRab7-eGPuBhMRFCQ&amp;h=AT2DKmp9em5BlhpGJJe1LraVUlQHsBeFIwsfB0u6Ru_DOnWxtj1GajPEKkzrw_TIM3YJPSQPOjqUGjqGgOra8fFbfr4gNfoob5w4Adp_Rvks_TpLqWKR2OjuUG2-mJU-9vzSoIXO26Hj5FK3wYDeyRShz-K12Xdy9Q&amp;__tn__=-UK-R&amp;c[0]=AT3jX_BuUoiDekVLtetKra_hePKLJug3oeGjFsJSI4fD5NRdd-MqXZLf-fheF-COOf1-6-Q34NnEIL1OaFWuH0t2b7P4vYNgmKjYRdxG72bffMbzAecV2O0ZXtTnN1zJJSAaPnr6SVi_QYAIGh-HIJ2cP7wBwLFGDgpxTe-imwm4FRcLHOlLMRZTuZIDOlc6fGC7Qa94yUyanz3ngjQ3J_5IA-0gig\"><strong>https://github.com/hkh.../SynthWavEco-IoT-ECommerce-Platform</strong></a>]</p><p><img src=\"https://static.xx.fbcdn.net/images/emoji.php/v9/t4d/1/16/1f4de.png\" alt=\"📞\"> Hotline hỗ trợ kỹ thuật 24/7: 0924202149</p><p><a href=\"https://www.facebook.com/hashtag/synwaveco?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#SynWavEco</strong></a> <a href=\"https://www.facebook.com/hashtag/arduinomega?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#ArduinoMega</strong></a> <a href=\"https://www.facebook.com/hashtag/iot?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#IoT</strong></a> <a href=\"https://www.facebook.com/hashtag/smarthome?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#SmartHome</strong></a> <a href=\"https://www.facebook.com/hashtag/beyondconnectivity?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#BeyondConnectivity</strong></a> <a href=\"https://www.facebook.com/hashtag/technology2026?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#Technology2026</strong></a> <a href=\"https://www.facebook.com/hashtag/makervietnam?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#MakerVietnam</strong></a> <a href=\"https://www.facebook.com/hashtag/electronics?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#Electronics</strong></a> <a href=\"https://www.facebook.com/hashtag/holographicui?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#HolographicUI</strong></a> <a href=\"https://www.facebook.com/hashtag/integritytech?__eep__=6&amp;__cft__[0]=AZayyuB_s0lMvR8p3wq-_4WAkvXcVsB21YpwhKyGn90Dri7fgaLtCy-61ZU3sI_-gy8h6iGGyBPXeWVDWajgbL6zWE6xT-btbogbB_Kiv0Fq9Jx3oSQl2uoy2Cc4SrZN8BJQGjxU0_UHianfyZeQjEYCB6sYo77d7-zxUqWyr4v6EMi6h9otuMNymYfKvsB-J_3B1neTc0H_J5vHAPwq0e0p&amp;__tn__=*NK-R\"><strong>#IntegrityTech</strong></a></p>', 'articles/arduino-mega-2560-hat-nhan-cua-su-hiep-luc-va-ket-noi-khong-gioi-han-1769768975.jpg', 0, 1, '2026-01-30 03:29:35', '2026-01-30 03:29:35');

-- --------------------------------------------------------

--
-- Table structure for table `article_statuses`
--

DROP TABLE IF EXISTS `article_statuses`;
CREATE TABLE IF NOT EXISTS `article_statuses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_statuses`
--

INSERT INTO `article_statuses` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Draft', NULL, '2026-01-29 01:59:56', '2026-01-29 02:10:02'),
(2, 'Pending Review', NULL, '2026-01-29 02:10:12', '2026-01-29 02:10:12'),
(3, 'Published', NULL, '2026-01-29 02:10:19', '2026-01-29 02:10:19'),
(4, 'Hidden', NULL, '2026-01-29 02:10:31', '2026-01-29 02:10:31'),
(5, 'Rejected', NULL, '2026-01-29 02:10:43', '2026-01-29 02:10:43'),
(6, 'Scheduled', NULL, '2026-01-29 02:10:57', '2026-01-29 02:10:57'),
(8, 'Archived', NULL, '2026-01-29 02:11:21', '2026-01-29 02:11:21');

-- --------------------------------------------------------

--
-- Table structure for table `article_types`
--

DROP TABLE IF EXISTS `article_types`;
CREATE TABLE IF NOT EXISTS `article_types` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `article_types_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `article_types`
--

INSERT INTO `article_types` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'News', 'news', '2026-01-29 06:27:14', '2026-01-29 06:27:14'),
(2, 'Announcement', 'announcement', '2026-01-29 06:28:33', '2026-01-29 06:28:33'),
(3, 'Press Release', 'press-release', '2026-01-29 06:28:41', '2026-01-29 06:28:41'),
(4, 'Event', 'event', '2026-01-29 06:28:47', '2026-01-29 06:28:47'),
(5, 'Tutorial', 'tutorial', '2026-01-29 06:29:03', '2026-01-29 06:29:03'),
(6, 'Guide', 'guide', '2026-01-29 06:29:10', '2026-01-29 06:29:10'),
(7, 'Documentation', 'documentation', '2026-01-29 06:29:15', '2026-01-29 06:29:15'),
(8, 'Tips & Tricks', 'tips-tricks', '2026-01-29 06:29:24', '2026-01-29 06:29:24'),
(9, 'Review', 'review', '2026-01-29 06:29:33', '2026-01-29 06:29:33'),
(10, 'Comparison', 'comparison', '2026-01-29 06:29:41', '2026-01-29 06:29:41'),
(11, 'Case Study', 'case-study', '2026-01-29 06:29:48', '2026-01-29 06:29:48'),
(12, 'Tech News', 'tech-news', '2026-01-29 06:29:57', '2026-01-29 06:29:57'),
(13, 'IoT Tutorials', 'iot-tutorials', '2026-01-29 06:30:03', '2026-01-29 06:30:03'),
(14, 'Smart Farming Tips', 'smart-farming-tips', '2026-01-29 06:30:10', '2026-01-29 06:30:10'),
(15, 'Device Reviews', 'device-reviews', '2026-01-29 06:30:17', '2026-01-29 06:30:17'),
(16, 'Success Stories', 'success-stories', '2026-01-29 06:30:24', '2026-01-29 06:30:24'),
(18, 'Climate Watch', 'climate-watch', '2026-01-29 06:31:52', '2026-01-29 06:31:52'),
(19, 'Green Initiative', 'green-initiative', '2026-01-29 06:31:59', '2026-01-29 06:31:59'),
(20, 'Conservation News', 'conservation-news', '2026-01-29 06:32:06', '2026-01-29 06:32:06'),
(21, 'Eco-friendly Tips', 'eco-friendly-tips', '2026-01-29 06:32:15', '2026-01-29 06:32:15'),
(22, 'Academic Research', 'academic-research', '2026-01-29 06:32:23', '2026-01-29 06:32:23'),
(23, 'E-Learning Guide', 'e-learning-guide', '2026-01-29 06:32:30', '2026-01-29 06:32:30'),
(24, 'Curriculum Update', 'curriculum-update', '2026-01-29 06:32:37', '2026-01-29 06:32:37'),
(25, 'Market Analysis', 'market-analysis', '2026-01-29 06:32:45', '2026-01-29 06:32:45'),
(26, 'Economic Outlook', 'economic-outlook', '2026-01-29 06:32:52', '2026-01-29 06:32:52'),
(27, 'Financial Briefing', 'financial-briefing', '2026-01-29 06:32:58', '2026-01-29 06:32:58'),
(28, 'Software Review', 'software-review', '2026-01-29 06:33:09', '2026-01-29 06:33:09'),
(29, 'AI & Robotics', 'ai-robotics', '2026-01-29 06:33:16', '2026-01-29 06:33:16'),
(30, 'Cybersecurity Alert', 'cybersecurity-alert', '2026-01-29 06:33:24', '2026-01-29 06:33:24'),
(31, 'Tech Breakthrough', 'tech-breakthrough', '2026-01-29 06:33:34', '2026-01-29 06:33:34'),
(32, 'IoT Innovation', 'iot-innovation', '2026-01-29 06:33:41', '2026-01-29 06:33:41');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
CREATE TABLE IF NOT EXISTS `categories` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `parent_id` bigint UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_name_unique` (`name`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `image`, `description`, `parent_id`, `created_at`, `updated_at`) VALUES
(1, 'IoT Board', 'iot-board', 'categories/iot-board.jpg', 'The IoT Board category showcases compact, versatile, and power-efficient hardware platforms designed to connect, sense, and control in modern Internet of Things systems. These boards integrate essential microcontrollers or System-on-Chip (SoC) architectures, wireless communication protocols, and a range of peripherals to support rapid development of connected devices across industries such as smart home, industrial automation, healthcare, and environmental monitoring.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(2, 'Sensor Module', 'sensor-module', 'categories/sensor-module.jpg', 'The Sensor Module category showcases compact, plug-and-play sensing solutions that empower edge devices and embedded systems with accurate, real-time data. These modules bundle high-precision sensors, signal conditioning, and sometimes microcontroller capability into a single, easy-to-integrate package, enabling rapid development of applications across IoT, robotics, industrial automation, and consumer electronics.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(3, 'Actuator & Relay', 'actuator-relay', 'categories/actuator-relay.jpg', 'The Actuator & Relay category highlights devices that convert electrical energy into mechanical motion or switching actions, enabling controlled actuation and automation across a wide range of systems. These components are essential for translating digital commands into physical movement, force, or power routing in embedded, industrial, and consumer applications.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(4, 'Development Kit', 'development-kit', 'categories/development-kit.jpg', 'The Development Kit category features comprehensive bundles designed to accelerate hardware and software prototyping, enabling developers to bring ideas to life quickly and efficiently. These kits provide a cohesive set of hardware boards, sensors, peripherals, documentation, and software tools that work together out-of-the-box, reducing integration effort and shortening time-to-market.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(5, 'Gateway & Edge Device', 'gateway-edge-device', 'categories/gateway-edge-device.jpg', 'The Gateway & Edge Device category highlights compact, powerful hardware designed to bridge local environments with cloud services and remote networks. These devices perform edge computing, data aggregation, protocol translation, and secure communication, enabling efficient, low-latency processing close to the source of data while reducing bandwidth and centralized cloud load', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(6, 'Wireless Module', 'wireless-module', 'categories/wireless-module.jpg', 'The Wireless Module category features compact, production-ready radio modules that enable reliable wireless communication across diverse applications. These modules integrate radio transceivers, protocol stacks, and often microcontroller or SoC capabilities into a small, embeddable package, allowing developers to add wireless connectivity quickly and securely.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(7, 'Battery & Power Management', 'battery-power-management', 'categories/battery-power-management.jpg', 'This category focuses on power sources, energy storage, and intelligent power management solutions that maximize runtime and reliability in embedded and IoT devices. Products include batteries (Li-ion, Li-Po, NiMH), supercapacitors, power regulators, battery management systems (BMS), DC-DC converters, energy harvesting modules, and low-power optimization accessories. Ideal for portable devices, remote sensors, wearables, and energy-conscious deployments.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(8, 'Enclosure & Hardware Accessories', 'enclosure-hardware-accessories', 'categories/enclosure-hardware-accessories.jpg', 'A curated range of enclosures, mounting hardware, heat sinks, conformal coatings, cable assemblies, and protective seals designed to protect hardware while enabling robust field deployment. This category covers form-factor considerations, EMI shielding, thermal management accessories, and ruggedized components suitable for industrial, outdoor, and consumer environments.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(9, 'Home Automation', 'home-automation', 'categories/home-automation.jpg', 'Components and modules that empower interconnected smart homes. Includes controllers, sensors, actuators, hubs, and connectivity solutions designed for easy integration, seamless user experiences, and energy-efficient automation across lighting, climate control, security, and convenience applications.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(10, 'Microcontroller', 'microcontroller', 'categories/microcontroller.jpg', 'A broad range of microcontroller boards and modules that deliver simple, cost-effective processing for embedded projects. Highlights include various cores, GPIO, timers, PWM, and periphery options, with rich development ecosystems and beginner-friendly tooling.', NULL, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(11, 'LIGHT Sensor', 'light-sensor', NULL, 'Modules specialized for measuring ambient light intensity (Lux), used in smart lighting and environment monitoring applications.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(12, 'TEMPERATURE Sensor', 'temperature-sensor', NULL, 'Technical and analog sensors used to measure the temperature of the environment, liquids, or surfaces with high accuracy.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(13, 'PH Sensor', 'ph-sensor', NULL, 'Specialized probes and electronic modules to measure the pH concentration of solutions or soil, critical for hydroponics and plant nutrition management.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(14, 'NPK Sensor', 'npk-sensor', NULL, 'Industrial soil sensors designed to measure Nitrogen (N), Phosphorus (P), and Potassium (K) levels in agricultural soil.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(15, 'SOIL MOISTURE Sensor', 'soil-moisture-sensor', NULL, 'Capacitive or resistive sensors used to determine the water content (moisture level) in agricultural soil for irrigation control.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(16, 'SOUND Sensor', 'sound-sensor', NULL, 'Microphone modules and processing circuits used for detecting and measuring sound intensity in the environment.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(17, 'MAGNETIC FIELD Sensor', 'magnetic-field-sensor', NULL, 'Hall effect sensors or magnetometers used to measure magnetic fields or detect the presence of metal objects.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(18, 'IMPACT/VIBRATION Sensor', 'impact-vibration-sensor', NULL, 'Mechanical or vibration sensors used to detect physical contact, collision, or shock events in the monitoring system.', 2, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(19, 'Arduino Board', 'arduino-board', NULL, 'Popular microcontroller platforms (UNO, Mega, Nano) widely used for education, prototyping, and small-scale automation.', 10, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(20, 'Raspberry Pi Board', 'raspberry-pi-board', NULL, 'Single Board Computers (SBCs) and microcontrollers (Pico, Pico W) used for IoT applications, robotics, and edge computing.', 1, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(21, 'STM32 Board', 'stm32-board', NULL, 'High-performance development boards (Nucleo, Discovery) featuring ARM Cortex-M microcontrollers for industrial and complex embedded systems.', 1, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(22, 'ESP Board', 'esp-board', NULL, 'Boards integrated with Wi-Fi/Bluetooth (ESP32, ESP32-S3, ESP32-C3, etc.), highly favored for connected IoT solutions due to cost and performance.', 1, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(23, 'Actuator', 'actuator', NULL, 'Drive devices, including Servo and Stepper Motors, used to execute physical actions and precise positioning.', 3, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(24, 'Relay', 'relay', NULL, 'Relay modules used for switching high-power electrical circuits, typically controlling AC/DC appliances or garden equipment.', 3, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(25, 'LED & Lighting', 'led-lighting', NULL, 'Various types of LEDs, LED modules, and lighting solutions, including high-power LEDs for illumination.', 3, '2025-12-12 01:21:29', '2025-12-12 01:21:29'),
(28, 'Components & Parts', 'components-parts', NULL, 'Passive electronic components, wires, and other small parts used for assembly and repair (Top Level Category).', NULL, '2025-12-14 05:09:48', '2025-12-14 05:09:48');

-- --------------------------------------------------------

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
CREATE TABLE IF NOT EXISTS `comments` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `articleid` bigint UNSIGNED NOT NULL,
  `userid` bigint UNSIGNED NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_censored` bigint UNSIGNED NOT NULL DEFAULT '0',
  `is_enabled` bigint UNSIGNED NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `comments_articleid_foreign` (`articleid`),
  KEY `comments_userid_foreign` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `device_metrics`
--

DROP TABLE IF EXISTS `device_metrics`;
CREATE TABLE IF NOT EXISTS `device_metrics` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `iot_device_id` bigint UNSIGNED NOT NULL,
  `metric_key` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `device_metrics_iot_device_id_metric_key_unique` (`iot_device_id`,`metric_key`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `device_metrics`
--

INSERT INTO `device_metrics` (`id`, `iot_device_id`, `metric_key`, `description`, `unit`, `created_at`, `updated_at`) VALUES
(1, 2, 'temperature', 'Temperature', 'C', '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(2, 2, 'humidity', 'Humidity', '%', '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(3, 3, 'light_value', 'Light', 'lux', '2025-12-14 05:47:49', '2025-12-14 05:47:49'),
(6, 5, 'ph_value', 'PH Value', '%', '2025-12-17 08:10:04', '2025-12-17 08:10:04'),
(7, 6, 'moisture_value', 'Moisture value', '%', '2025-12-17 08:12:01', '2025-12-17 08:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `iot_devices`
--

DROP TABLE IF EXISTS `iot_devices`;
CREATE TABLE IF NOT EXISTS `iot_devices` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `device_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `last_seen` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `iot_devices_device_id_unique` (`device_id`),
  KEY `iot_devices_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `iot_devices`
--

INSERT INTO `iot_devices` (`id`, `product_id`, `device_id`, `location`, `is_active`, `last_seen`, `created_at`, `updated_at`) VALUES
(2, 2, 'ESP_SENSOR_DHT22_01', 'Smart Garden Wokwi', 1, NULL, '2025-12-11 01:41:59', '2025-12-11 01:41:59'),
(3, 11, 'light_sensor', 'Smart Garden Wokwi', 1, NULL, '2025-12-14 05:47:49', '2025-12-14 05:47:49'),
(5, 13, 'ph_sensor', 'Smart Garden Wokwi', 1, NULL, '2025-12-17 08:10:04', '2025-12-17 08:10:04'),
(6, 15, 'soil_moisture_sensor', 'Smart Garden Wokwi', 1, NULL, '2025-12-17 08:12:01', '2025-12-17 08:12:01');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `manufacturers`
--

DROP TABLE IF EXISTS `manufacturers`;
CREATE TABLE IF NOT EXISTS `manufacturers` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact_email` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `manufacturers_name_unique` (`name`),
  UNIQUE KEY `manufacturers_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `manufacturers`
--

INSERT INTO `manufacturers` (`id`, `name`, `slug`, `logo`, `description`, `address`, `contact_phone`, `contact_email`, `created_at`, `updated_at`) VALUES
(1, 'Arduino.cc', 'arduinocc', 'manufacturers/arduinocc.png', 'Arduino.cc is the company behind the Arduino open-source electronics platform, which includes both hardware and software designed to help people easily build interactive projects.', 'Via Pila 2/6, 22077 Olgiate Comasco (CO), Italy', '39 031 98901', 'infor@arduino.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(2, 'Espressif Systems', 'espressif-systems', 'manufacturers/espressif-systems.png', 'Espressif Systems is a leading fabless semiconductor company globally recognized for its development of power-efficient, highly integrated Wi-Fi and Bluetooth low-power Internet of Things (IoT) solutions. They are the creators of the popular ESP8266 and ESP32 series of microcontrollers, which have become industry standards for connecting embedded devices to the internet due to their cost-effectiveness, strong performance, and robust development environment. The company focuses on providing secure, stable, and cost-effective chip solutions for the smart home, industrial automation, and consumer electronics markets.', '101, Block 2, 690 Bibo Road, Zhang Jiang High-Tech Park, ShangHai, Chinese', '86 21 2416-0733', 'sales@espressif.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(3, 'STMicroelectronics', 'stmicroelectronics', 'manufacturers/stmicroelectronics.png', 'STMicroelectronics is a global semiconductor leader that designs, develops, manufactures, and markets a broad portfolio of semiconductor solutions. The company is a key innovator in the smart driving, smart industry, smart home & city, and communications infrastructure markets. They are particularly renowned as the primary manufacturer of the highly popular 32-bit ARM Cortex-M based STM32 family of microcontrollers, widely used across educational, prototyping, and industrial applications.', '39 Chemin du Champ des Filles, 1228 Plan-les-Ouates, Geneva, Switzerland', '41 22 929 29 29', 'stmicroelectronics@gmail.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(4, 'Raspberry Pi Foundation', 'raspberry-pi-foundation', 'manufacturers/raspberry-pi-foundation.png', 'UK-based charity focused on advancing computer science education through affordable, powerful single-board computers.', 'Station Road, Cambridge, CB1 2JH, UK', '+44 1223 322600', 'press@raspberrypi.org', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(5, 'Tuya Smart', 'tuya-smart', 'manufacturers/tuya-smart.png', 'Global IoT platform providing cloud connectivity and smart device solutions for home automation and smart agriculture.', 'Building A, Huamao Center, Hangzhou, Zhejiang, China', '+86 400 8599 888', 'sales@tuya.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(6, 'Adafruit', 'adafruit', 'manufacturers/adafruit.png', 'Open-source hardware company specializing in educational electronics, sensors, and components for makers and engineers.', '150 Bowery, New York, NY 10012, USA', '+1 646 681 5933', 'support@adafruit.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(7, 'GreenGrowth Inc.', 'greengrowth-inc', 'manufacturers/greengrowth-inc.png', 'Dedicated to sustainable agriculture, producing premium organic fertilizers, soil amendments, and biological pest controls.', '789 Green Acres Blvd, Fresno, CA 93706, USA', '+1 559 123 4567', 'info@greengrowth.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(8, 'ECO-Power Solutions', 'eco-power-solutions', 'manufacturers/eco-power-solutions.png', 'Specializing in robust solar power kits and energy storage solutions optimized for off-grid IoT deployments in harsh environments.', '101 Clean Energy Way, Phoenix, AZ 85007, USA', '+1 602 876 5432', 'solar@ecopower.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(9, 'HANNA Instruments', 'hanna-instruments', 'manufacturers/hanna-instruments.png', 'Manufacturer of analytical instrumentation used worldwide for measuring pH, conductivity, temperature, and nutrient concentration.', '584 Smithfield Drive, Woonsocket, RI 02895, USA', '+1 401 765 7788', 'service@hannainst.com', '2025-12-12 00:54:49', '2025-12-12 00:54:49'),
(10, 'Seed Studio (Seeed)', 'seed-studio-seeed', 'manufacturers/seed-studio-seeed.png', 'Providing hardware components and services for IoT and open-source communities, known for the XIAO series of mini development boards.', '98 Meihua Road, Futian District, Shenzhen, China', '+86 755 8352 6969', 'sales@seeed.cc', '2025-12-12 01:35:30', '2025-12-14 18:41:00'),
(11, 'M5Stack', 'm5stack', 'manufacturers/m5stack.png', 'Famous for their modular, stackable IoT development kits built around the ESP32 platform, focusing on rapid application development.', 'Bantian High-Tech Park, Longgang District, Shenzhen, China', '+86 755 2390 0969', 'support@m5stack.com', '2025-12-12 01:35:30', '2025-12-12 01:35:30'),
(12, 'Waveshare', 'waveshare', 'manufacturers/waveshare.png', 'Manufacturer specializing in display modules, e-paper, and electronic components, often providing accessories for Raspberry Pi and Arduino.', '4/F, Bld. L4, No.2, North Zone, Haina Industrial Park, Shenzhen, China', '+86 755 8332 5532', 'contact@waveshare.com', '2025-12-12 01:35:30', '2025-12-12 01:35:30'),
(13, 'DFRobot', 'dfrobot', 'manufacturers/dfrobot.png', 'Robotics and open-source hardware provider, offering a wide array of sensors, modules (including SOUND and IMPACT), and DIY kits.', '9F, T3 Bld, Software Park, Nanshan, Shenzhen, China', '+86 21 6153 0860', 'techsupport@dfrobot.com', '2025-12-12 01:35:30', '2025-12-12 01:35:30'),
(14, 'Pololu', 'pololu', 'manufacturers/pololu.jpg', 'Leading supplier of electronic components, specializing in servo controllers, motor drivers, and small robotic parts.', '920 Pilot Rd, Las Vegas, NV 89119, USA', '+1 702 262 6648', 'info@pololu.com', '2025-12-12 01:35:30', '2025-12-14 18:43:03'),
(15, 'SparkFun Electronics', 'sparkfun-electronics', 'manufacturers/sparkfun-electronics.png', 'Open-source electronics retailer providing breakout boards, sensors, and educational resources, similar to Adafruit.', '6333 Dry Creek Pkwy, Niwot, CO 80544, USA', '+1 303 284 0979', 'contact@sparkfun.com', '2025-12-12 01:35:30', '2025-12-14 18:43:39');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_00_000000_create_roles_table', 1),
(2, '0001_01_01_000000_create_users_table', 1),
(3, '0001_01_01_000001_create_cache_table', 1),
(4, '0001_01_01_000002_create_jobs_table', 1),
(5, '2025_11_07_101644_create_categories_table', 1),
(6, '2025_11_07_101645_create_manufactures_table', 1),
(7, '2025_11_07_101646_create_products_table', 1),
(8, '2025_11_07_101648_create_product_details_table', 1),
(9, '2025_11_07_101649_create_product_images_table', 1),
(10, '2025_11_07_101651_create_order_statuses_table', 1),
(11, '2025_11_07_101652_create_orders_table', 1),
(12, '2025_11_07_101653_create_order_items_table', 1),
(13, '2025_11_07_101654_create_iot_devices_table', 1),
(14, '2025_11_07_101655_create_device_metrics_table', 1),
(15, '2025_11_07_102956_create_alert_thresholds_table', 1),
(16, '2025_12_10_084906_update_roles_column_in_users_table', 2),
(19, '2026_01_23_061239_create_article_statuses_table', 3),
(22, '2026_01_23_061237_create_topics_table', 4),
(27, '2026_01_23_061238_create_article_types_table', 5),
(28, '2026_01_23_061426_create_articles_table', 5),
(29, '2026_01_23_061445_create_comments_table', 5);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint UNSIGNED NOT NULL,
  `order_status_id` bigint UNSIGNED NOT NULL,
  `shipping_address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_phone` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtotal` decimal(10,2) NOT NULL DEFAULT '0.00',
  `tax_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `shipping_fee` decimal(10,2) NOT NULL DEFAULT '0.00',
  `total_amount` decimal(10,2) NOT NULL DEFAULT '0.00',
  `payment_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_user_id_foreign` (`user_id`),
  KEY `orders_order_status_id_foreign` (`order_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `order_status_id`, `shipping_address`, `contact_phone`, `subtotal`, `tax_amount`, `shipping_fee`, `total_amount`, `payment_method`, `notes`, `created_at`, `updated_at`) VALUES
(1, 1, 4, 'Can Xay , Binh Duc 4, Binh Duc, An Giang, Vietnam', '0924202149', 40.50, 0.30, 0.50, 41.30, 'COD', 'Delive me after 10 A.M', '2025-12-10 00:06:48', '2025-12-10 01:23:53'),
(2, 1, 1, 'Long Xuyen, An Giang, Vietnam', '0924202149', 40.50, 0.20, 0.60, 41.30, 'Credit Card', 'I order JPX Express delivery service', '2025-12-10 00:21:38', '2025-12-10 01:20:43'),
(3, 1, 3, 'Dong Xuyen, An Giang, Vietnam', '0924202150', 65.00, 0.40, 0.64, 66.04, 'Bank Transfer', 'Ninja Shipping delivery service', '2025-12-10 01:06:05', '2025-12-10 01:21:52'),
(4, 1, 3, 'My Xuyen, An Giang, Vietnam', '0924202149', 39.99, 0.81, 0.76, 41.56, 'E-Wallet', 'I want use Viettel delivery service', '2025-12-10 01:23:23', '2025-12-10 01:23:23'),
(13, 1, 1, 'An Giang', '0924202149', 13.00, 1.00, 0.00, 14.00, 'Cash on Delivery', NULL, '2025-12-14 15:40:24', '2025-12-14 15:40:24'),
(14, 1, 1, 'An Giang, Vietnam', '0924816462', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:55:45', '2025-12-14 16:55:45'),
(15, 1, 1, 'An Giang,Vietnam', '0924202143', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:56:11', '2025-12-14 16:56:11'),
(16, 1, 1, 'An Giang, Vietnam', '0924202149', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:56:51', '2025-12-14 16:56:51'),
(17, 1, 1, 'An Giang, Vietnam', '0924202148', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 16:57:51', '2025-12-14 16:57:51'),
(18, 1, 1, 'An Giang, Vietnam', '0924202149', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 17:03:27', '2025-12-14 17:03:27'),
(19, 1, 1, 'An Giang, Vietnam', '0924202149', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 17:09:27', '2025-12-14 17:09:27'),
(20, 1, 1, 'Long Xuyen, An Giang, Vietnam', '0924202148', 15.00, 2.00, 0.00, 17.00, 'Cash on Delivery', NULL, '2025-12-14 17:14:18', '2025-12-14 17:14:18'),
(21, 1, 1, 'An Giang', '092347564', 5.00, 1.00, 0.00, 6.00, 'Cash on Delivery', NULL, '2025-12-14 19:57:18', '2025-12-14 19:57:18'),
(22, 1, 1, 'An Giang', '028737728', 3.00, 0.00, 0.00, 3.00, 'Cash on Delivery', NULL, '2025-12-15 04:00:25', '2025-12-15 04:00:25'),
(23, 1, 1, 'An Giang', '545624524', 78.00, 8.00, 0.00, 86.00, 'Cash on Delivery', NULL, '2025-12-15 12:20:44', '2025-12-15 12:20:44'),
(24, 1, 1, 'An Giang', '545624524', 78.00, 8.00, 0.00, 86.00, 'Cash on Delivery', NULL, '2025-12-15 12:20:46', '2025-12-15 12:20:46'),
(25, 1, 1, 'An Giang, Vietnam', '05471375882', 21.00, 3.00, 0.00, 24.00, 'Cash on Delivery', 'Shipping Free', '2025-12-17 05:38:28', '2025-12-17 05:38:28'),
(26, 1, 2, 'An Giang', '03743584211', 102.00, 10.00, 10.20, 122.20, 'Credit Card', NULL, '2025-12-17 05:56:26', '2025-12-17 05:57:22'),
(27, 1, 1, 'Long Xuyen, An Giang, Vietnam', '0924202149', 80.00, 9.00, 8.00, 97.00, 'Credit Card', 'Fast Shipping Service', '2025-12-17 10:32:30', '2025-12-17 10:32:30'),
(28, 14, 1, 'He Bei, China', '0928743344', 65.00, 7.00, 6.50, 78.50, 'Cash on Delivery', 'Fast Shiping', '2026-01-22 23:04:50', '2026-01-22 23:04:50'),
(29, 11, 1, 'Hà Tây, Hà Nội', '09237183713', 28.00, 3.00, 7.00, 38.00, 'Credit Card', 'Fast JPX', '2026-01-30 22:59:08', '2026-01-30 22:59:08');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
CREATE TABLE IF NOT EXISTS `order_items` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `order_id` bigint UNSIGNED NOT NULL,
  `product_id` bigint UNSIGNED NOT NULL,
  `quantity` int NOT NULL,
  `price_at_order` decimal(10,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_order_id_foreign` (`order_id`),
  KEY `order_items_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price_at_order`, `created_at`, `updated_at`) VALUES
(13, 2, 9, 1, 28.00, '2025-12-10 01:20:43', '2025-12-10 01:20:43'),
(14, 2, 1, 1, 12.50, '2025-12-10 01:20:43', '2025-12-10 01:20:43'),
(15, 3, 5, 1, 65.00, '2025-12-10 01:21:52', '2025-12-10 01:21:52'),
(17, 1, 1, 1, 12.50, '2025-12-10 01:23:53', '2025-12-10 01:23:53'),
(18, 1, 9, 1, 28.00, '2025-12-10 01:23:53', '2025-12-10 01:23:53'),
(19, 4, 3, 1, 39.99, '2025-12-10 01:24:05', '2025-12-10 01:24:05'),
(28, 13, 1, 1, 12.50, '2025-12-14 15:40:24', '2025-12-14 15:40:24'),
(29, 14, 8, 1, 15.00, '2025-12-14 16:55:45', '2025-12-14 16:55:45'),
(30, 15, 8, 1, 15.00, '2025-12-14 16:56:11', '2025-12-14 16:56:11'),
(31, 16, 8, 1, 15.00, '2025-12-14 16:56:51', '2025-12-14 16:56:51'),
(32, 17, 8, 1, 15.00, '2025-12-14 16:57:51', '2025-12-14 16:57:51'),
(33, 18, 8, 1, 15.00, '2025-12-14 17:03:27', '2025-12-14 17:03:27'),
(34, 19, 8, 1, 15.00, '2025-12-14 17:09:27', '2025-12-14 17:09:27'),
(35, 20, 8, 1, 15.00, '2025-12-14 17:14:18', '2025-12-14 17:14:18'),
(36, 21, 2, 1, 4.99, '2025-12-14 19:57:18', '2025-12-14 19:57:18'),
(37, 22, 17, 1, 2.50, '2025-12-15 04:00:26', '2025-12-15 04:00:26'),
(38, 23, 5, 1, 65.00, '2025-12-15 12:20:44', '2025-12-15 12:20:44'),
(39, 23, 1, 1, 12.50, '2025-12-15 12:20:44', '2025-12-15 12:20:44'),
(40, 24, 5, 1, 65.00, '2025-12-15 12:20:46', '2025-12-15 12:20:46'),
(41, 24, 1, 1, 12.50, '2025-12-15 12:20:46', '2025-12-15 12:20:46'),
(42, 25, 25, 1, 6.00, '2025-12-17 05:38:28', '2025-12-17 05:38:28'),
(43, 25, 26, 1, 15.00, '2025-12-17 05:38:29', '2025-12-17 05:38:29'),
(46, 26, 27, 2, 16.00, '2025-12-17 05:57:22', '2025-12-17 05:57:22'),
(47, 26, 34, 1, 70.00, '2025-12-17 05:57:22', '2025-12-17 05:57:22'),
(48, 27, 26, 1, 15.00, '2025-12-17 10:32:30', '2025-12-17 10:32:30'),
(49, 27, 5, 1, 65.00, '2025-12-17 10:32:30', '2025-12-17 10:32:30'),
(50, 28, 5, 1, 65.00, '2026-01-22 23:04:51', '2026-01-22 23:04:51'),
(51, 29, 9, 1, 28.00, '2026-01-30 22:59:09', '2026-01-30 22:59:09');

-- --------------------------------------------------------

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
CREATE TABLE IF NOT EXISTS `order_statuses` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_statuses_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `order_statuses`
--

INSERT INTO `order_statuses` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Pending', '2025-12-09 21:47:58', '2025-12-09 21:47:58'),
(2, 'Shipping', '2025-12-09 21:48:14', '2025-12-09 21:48:14'),
(3, 'Confirmed', '2025-12-09 21:48:41', '2025-12-09 21:49:10'),
(4, 'Paid', '2025-12-09 21:49:01', '2025-12-09 21:49:25'),
(5, 'Canceled', '2025-12-09 21:49:38', '2025-12-09 21:49:38');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_reset_tokens`
--

INSERT INTO `password_reset_tokens` (`email`, `token`, `created_at`) VALUES
('huykyunh.k@gmail.com', '$2y$12$YegIzApcmqFAb6eM2G0kEOdvFvX9HZF3m9EbVtki9QzkRo4QHKu5m', '2025-12-14 10:47:44');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `category_id` bigint UNSIGNED NOT NULL,
  `manufacturer_id` bigint UNSIGNED NOT NULL,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(250) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `stock_quantity` int NOT NULL DEFAULT '0',
  `description` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `products_slug_unique` (`slug`),
  KEY `products_category_id_foreign` (`category_id`),
  KEY `products_manufacturer_id_foreign` (`manufacturer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `manufacturer_id`, `name`, `slug`, `price`, `stock_quantity`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, 2, 'ESP32-S3 IoT Development Board', 'esp32-s3-iot-development-board', 285000.00, 500, 'High-performance IoT board featuring integrated Wi-Fi, Bluetooth, and camera interface for AI vision applications.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(2, 2, 6, 'DHT22 Temperature/Humidity Module', 'dht22-temperaturehumidity-module', 65000.00, 1200, 'Digital sensor providing reliable and accurate temperature and humidity readings for climate monitoring.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(3, 3, 5, 'Smart Irrigation Valve (Zigbee)', 'smart-irrigation-valve-zigbee', 380000.00, 80, 'Motorized valve for automated water flow control, compatible with smart home ecosystems like Zigbee.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(4, 3, 7, 'Organic Soil Booster (10kg)', 'organic-soil-booster-10kg', 150000.00, 350, 'Slow-release organic fertilizer mix designed to improve soil structure and long-term plant health.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(5, 1, 4, 'Raspberry Pi 5 (4GB RAM)', 'raspberry-pi-5-4gb-ram', 500000.00, 40, 'Flagship single-board computer, ideal for complex local data processing and edge computing applications.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(6, 2, 9, 'Industrial NPK Sensor (RS485)', 'industrial-npk-sensor-rs485', 450000.00, 90, 'Rugged sensor module for deep soil monitoring, communicating NPK levels via the Modbus protocol.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(7, 3, 8, 'Solar Smart Panel Kit (10W)', 'solar-smart-panel-kit-10w', 320000.00, 210, 'Compact solar panel and charge controller kit designed to power remote garden sensors and devices.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(8, 3, 5, 'Peristaltic Dosing Pump (12V)', 'peristaltic-dosing-pump-12v', 250000.00, 150, 'Precision pump used for accurately dosing liquid nutrients or pH modifiers into the water supply.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(9, 1, 2, 'Arduino UNO R4 WiFi', 'arduino-uno-r4-wifi', 480000.00, 10, 'Easy-to-use development board with built-in Wi-Fi, combining classic simplicity with modern connectivity.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(10, 2, 6, 'I2C LCD Display (20x4)', 'i2c-lcd-display-20x4', 125000.00, 600, 'Standard 20 character by 4 line display module, perfect for displaying real-time sensor data and system status.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(11, 2, 6, 'Light Sensor (BH1750)', 'light-sensor-bh1750', 55000.00, 1500, 'Digital light intensity sensor providing accurate Lux readings via I2C interface.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(12, 2, 6, 'Temperature Sensor (DS18B20)', 'temperature-sensor-ds18b20', 60000.00, 1200, 'Digital waterproof temperature probe utilizing the OneWire protocol.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(13, 2, 9, 'PH Sensor Probe', 'ph-sensor-probe', 420000.00, 250, 'Industrial pH electrode for continuous liquid acidity monitoring.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(14, 2, 9, 'NPK Sensor Probe', 'npk-sensor-probe', 490000.00, 180, 'Soil sensor for measuring NPK nutrient levels, communicates via RS485 (Modbus).', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(15, 2, 6, 'Soil Moisture Sensor (Capacitive)', 'soil-moisture-sensor-capacitive', 55000.00, 1100, 'Capacitive sensor providing stable analog output, less prone to corrosion.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(16, 2, 13, 'Sound Sensor Module (KY-038)', 'sound-sensor-module-ky-038', 52000.00, 900, 'Basic analog sound detection module with adjustable sensitivity.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(17, 2, 13, 'Magnetic Field Sensor (Hall Effect)', 'magnetic-field-sensor-hall-effect', 50000.00, 800, 'Hall effect sensor used to detect magnetic fields or metallic objects.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(18, 2, 13, 'Impact/Vibration Sensor', 'impactvibration-sensor', 50000.00, 1100, 'Simple digital switch activated by vibration or impact.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(19, 10, 1, 'Board Arduino Rev3', 'board-arduino-rev3', 115000.00, 150, 'Classic ATmega328P based board, fundamental for electronics prototyping.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(20, 10, 1, 'Board Arduino Mega', 'board-arduino-mega', 295000.00, 80, 'High I/O count board based on ATMega2560 for complex projects.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(21, 10, 1, 'Board Arduino Nano', 'board-arduino-nano', 85000.00, 300, 'Compact, breadboard-friendly ATMega328P board.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(22, 1, 2, 'Board Franzininho-WiFi (ESP32 S2)', 'board-franzininho-wifi-esp32-s2', 185000.00, 120, 'Brazilian open-source board featuring the ESP32-S2 chip.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(23, 10, 6, 'ATtiny85', 'attiny85', 55000.00, 1800, 'Tiny, low-cost microcontroller for simple, small projects.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(24, 1, 4, 'Board Raspberry Pi Pico', 'board-raspberry-pi-pico', 125000.00, 600, 'Low-cost, high-performance RP2040 microcontroller board.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(25, 1, 4, 'Board Raspberry Pi Pico W', 'board-raspberry-pi-pico-w', 195000.00, 450, 'Raspberry Pi Pico with integrated 2.4 GHz Wi-Fi.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(26, 1, 3, 'Board STM32 Nuclear64 c031c6', 'board-stm32-nuclear64-c031c6', 340000.00, 100, 'STM32 Nucleo board featuring a Cortex-M0+ core.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(27, 1, 3, 'Board STM32 Nuclear64 l031k6', 'board-stm32-nuclear64-l031k6', 385000.00, 90, 'Low-power STM32 Nucleo board ideal for battery applications.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(28, 1, 2, 'Board ESP32-S2', 'board-esp32-s2', 145000.00, 350, 'Basic ESP32 variant optimized for security and USB/touch applications.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(29, 1, 2, 'Board ESP32-S3', 'board-esp32-s3', 225000.00, 300, 'Advanced ESP32 with AI acceleration and vector instructions.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(30, 1, 2, 'Board ESP32-C3', 'board-esp32-c3', 95000.00, 400, 'RISC-V based ESP32 with Wi-Fi and Bluetooth LE.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(31, 1, 2, 'Board ESP32-C6', 'board-esp32-c6', 245000.00, 280, 'First ESP32 supporting Wi-Fi 6, Zigbee, and Thread protocols.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(32, 1, 2, 'Board ESP32-H2', 'board-esp32-h2', 215000.00, 220, 'ESP32 chip focused on low-power connectivity, supporting Zigbee and Thread.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(33, 1, 2, 'Board ESP32-P4', 'board-esp32-p4', 460000.00, 50, 'New high-performance ESP32 designed for complex HMI and multi-media tasks.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(34, 4, 2, 'Board ESP32-S3 BOX3', 'board-esp32-s3-box3', 500000.00, 30, 'Complete development kit for voice interaction and AIoT applications.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(35, 1, 11, 'M5Stack Core S3', 'm5stack-core-s3', 500000.00, 45, 'Modular, stackable ESP32-S3 development kit with screen and battery.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(36, 1, 10, 'XIAO ESP32 C3', 'xiao-esp32-c3', 135000.00, 200, 'Ultra-small ESP32-C3 board, suitable for space-constrained projects.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(37, 1, 10, 'XIAO ESP32 S3', 'xiao-esp32-s3', 195000.00, 150, 'Ultra-small ESP32-S3 board with strong processing power.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(38, 3, 14, 'Servo PWM (SG90)', 'servo-pwm-sg90', 65000.00, 1200, 'Popular micro servo motor used for precision angular control (9g).', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(39, 3, 14, 'Relay Module (1-Channel)', 'relay-module-1-channel', 55000.00, 1500, 'Single-channel relay module often controlled by microcontrollers.', '2025-12-12 01:46:53', '2026-02-03 10:19:34'),
(40, 3, 14, 'High Brightness LED (10-Pack)', 'high-brightness-led-10-pack', 50000.00, 5000, 'Basic indicator or lighting components, sold in a pack of 10.', '2025-12-12 01:46:53', '2026-02-03 10:19:34');

-- --------------------------------------------------------

--
-- Table structure for table `product_details`
--

DROP TABLE IF EXISTS `product_details`;
CREATE TABLE IF NOT EXISTS `product_details` (
  `product_id` bigint UNSIGNED NOT NULL,
  `memory` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpu` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `graphic` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `power_specs` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_details`
--

INSERT INTO `product_details` (`product_id`, `memory`, `cpu`, `graphic`, `power_specs`, `created_at`, `updated_at`) VALUES
(1, '8MB SPI RAM', 'Dual-Core LX7', 'N/A', '3.3V DC', '2025-12-09 22:49:15', '2025-12-09 22:49:15'),
(2, NULL, NULL, NULL, '3.3V-5V DC', '2025-12-09 22:56:43', '2025-12-09 22:56:43'),
(3, NULL, 'ARM Cortex M0', NULL, '12V DC, 2A', '2025-12-09 22:57:55', '2025-12-12 01:46:53'),
(4, NULL, NULL, NULL, NULL, '2025-12-09 22:59:05', '2025-12-12 01:46:53'),
(5, '4GB LPDDR4X', 'Broadcom BCM2712', 'VideoCore VII', '5V DC, 5A', '2025-12-09 23:00:10', '2025-12-12 01:46:53'),
(6, NULL, 'STM32F103', NULL, '9V-24V DC', '2025-12-09 23:02:36', '2025-12-12 01:46:53'),
(7, NULL, NULL, NULL, '18V Solar Out', '2025-12-09 23:03:17', '2025-12-12 01:46:53'),
(8, NULL, NULL, NULL, '12V DC', '2025-12-09 23:04:08', '2025-12-12 01:46:53'),
(9, '32KB SRAM', 'Renesas RA4M1', NULL, '5V DC', '2025-12-09 23:05:10', '2025-12-12 01:46:53'),
(10, NULL, NULL, NULL, '5V DC', '2025-12-09 23:05:52', '2025-12-12 01:46:53'),
(11, 'N/A', 'N/A', 'N/A', '3.3V-5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(12, 'N/A', 'N/A', 'N/A', '3.0V-5.5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(13, 'N/A', 'N/A', 'N/A', 'N/A', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(14, 'N/A', 'N/A', 'N/A', '9V-24V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(15, 'N/A', 'N/A', 'N/A', '3.3V-5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(16, 'N/A', 'N/A', 'N/A', '5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(17, 'N/A', 'N/A', 'N/A', '3.3V-5V DC', '2025-12-12 00:13:12', '2025-12-12 01:46:53'),
(18, 'N/A', 'N/A', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(19, '2KB SRAM', 'ATmega328P', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(20, '8KB SRAM', 'ATmega2560', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(21, '2KB SRAM', 'ATmega328P', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(22, '4MB Flash', 'ESP32-S2', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(23, '512B SRAM', 'ATtiny85', 'N/A', '3.3V-5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(24, '264KB SRAM', 'RP2040', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(25, '264KB SRAM', 'RP2040', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(26, '12KB SRAM', 'STM32C031C6', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(27, '8KB SRAM', 'STM32L031K6', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(28, '320KB SRAM', 'Dual-Core', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(29, '512KB SRAM', 'Dual-Core LX7', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(30, '400KB SRAM', 'Single-Core RISC-V', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(31, '512KB SRAM', 'Dual-Core', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(32, '256KB SRAM', 'Single-Core RISC-V', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(33, '750KB SRAM', 'Dual-Core', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(34, '512KB + 16MB PSRAM', 'Dual-Core LX7', 'N/A', '5V DC (USB-C)', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(35, '512KB + 8MB PSRAM', 'Dual-Core LX7', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(36, '400KB SRAM', 'Single-Core RISC-V', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(37, '512KB + 4MB PSRAM', 'Dual-Core LX7', 'N/A', '3.3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(38, 'N/A', 'N/A', 'N/A', '4.8V-6V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(39, 'N/A', 'N/A', 'N/A', '5V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(40, 'N/A', 'N/A', 'N/A', '2V-3V DC', '2025-12-12 01:46:53', '2025-12-12 01:46:53');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

DROP TABLE IF EXISTS `product_images`;
CREATE TABLE IF NOT EXISTS `product_images` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `product_id` bigint UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_avatar` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_images_product_id_foreign` (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `product_id`, `url`, `is_avatar`, `created_at`, `updated_at`) VALUES
(1, 10, 'products/i2c-lcd-display-20x4.jpg', 1, '2025-12-11 05:48:55', '2025-12-14 18:31:32'),
(2, 9, 'products/arduino-uno-r4-wifi.jpg', 1, '2025-12-11 05:53:31', '2025-12-14 18:30:04'),
(4, 8, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-11 05:57:11', '2025-12-11 05:57:11'),
(5, 7, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-11 05:58:18', '2025-12-11 05:58:18'),
(8, 14, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-12 00:13:12', '2025-12-12 00:13:12'),
(9, 15, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-12 00:13:12', '2025-12-12 00:13:12'),
(10, 16, 'products/sound-sensor-module-ky-038.jpg', 1, '2025-12-12 00:13:12', '2025-12-14 18:34:18'),
(11, 17, 'products/magnetic-field-sensor-hall-effect.jpg', 1, '2025-12-12 00:13:12', '2025-12-14 18:35:55'),
(12, 9, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-12 00:28:11', '2025-12-12 00:28:11'),
(13, 10, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-12 00:28:11', '2025-12-12 00:28:11'),
(14, 11, 'products/light-sensor-bh1750.jpg', 1, '2025-12-12 00:28:11', '2025-12-14 18:32:48'),
(15, 12, 'products/temperature-sensor-ds18b20.jpg', 1, '2025-12-12 00:28:11', '2025-12-14 18:33:40'),
(16, 7, 'products/solar-smart-panel-kit-10w.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(17, 8, 'products/peristaltic-dosing-pump-12v.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(18, 9, 'products/arduino-uno-r4-wifi.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(19, 10, 'products/i2c-lcd-display-20x4.jpg', 1, '2025-12-12 01:46:53', '2025-12-12 01:46:53'),
(20, 2, 'products/dht22-temperaturehumidity-module.jpg', 1, '2025-12-14 18:26:12', '2025-12-14 18:26:12'),
(21, 1, 'products/esp32-s3-iot-development-board.jpg', 1, '2025-12-14 18:26:55', '2025-12-14 18:26:55'),
(22, 3, 'products/smart-irrigation-valve-zigbee.jpg', 1, '2025-12-14 18:27:33', '2025-12-14 18:27:33'),
(23, 4, 'products/organic-soil-booster-10kg.jpg', 1, '2025-12-14 18:28:06', '2025-12-14 18:28:06'),
(24, 5, 'products/raspberry-pi-5-4gb-ram.jpg', 1, '2025-12-14 18:28:41', '2025-12-14 18:28:41'),
(25, 6, 'products/industrial-npk-sensor-rs485.jpg', 1, '2025-12-14 18:29:26', '2025-12-14 18:29:26'),
(26, 13, 'products/ph-sensor-probe.jpg', 1, '2025-12-14 18:35:03', '2025-12-14 18:35:03'),
(27, 18, 'products/impactvibration-sensor.jpg', 1, '2025-12-14 18:36:53', '2025-12-14 18:36:53'),
(28, 19, 'products/board-arduino-rev3.jpg', 1, '2025-12-14 18:37:55', '2025-12-14 18:37:55'),
(29, 20, 'products/board-arduino-mega.jpg', 1, '2025-12-14 18:39:24', '2025-12-14 18:39:24'),
(30, 21, 'products/board-arduino-nano.jpg', 1, '2025-12-14 18:57:51', '2025-12-14 18:57:51'),
(31, 23, 'products/attiny85.jpg', 1, '2025-12-15 12:54:12', '2025-12-15 12:54:12'),
(32, 22, 'products/board-franzininho-wifi-esp32-s2.jpg', 1, '2025-12-15 12:55:46', '2025-12-15 12:55:46'),
(33, 24, 'products/board-raspberry-pi-pico.jpg', 1, '2025-12-15 12:56:28', '2025-12-15 12:56:28'),
(34, 25, 'products/board-raspberry-pi-pico-w.webp', 1, '2025-12-15 12:58:24', '2025-12-15 12:58:24'),
(35, 26, 'products/board-stm32-nuclear64-c031c6.jpg', 1, '2025-12-15 12:59:05', '2025-12-15 12:59:05'),
(36, 27, 'products/board-stm32-nuclear64-l031k6.jpg', 1, '2025-12-15 12:59:39', '2025-12-15 12:59:39'),
(37, 28, 'products/board-esp32-s2.jpg', 1, '2025-12-15 13:00:12', '2025-12-15 13:00:12'),
(38, 40, 'products/high-brightness-led-10-pack.jpg', 1, '2025-12-15 13:01:15', '2025-12-15 13:01:15'),
(39, 39, 'products/relay-module-1-channel.jpg', 1, '2025-12-15 13:02:09', '2025-12-15 13:02:09'),
(40, 38, 'products/servo-pwm-sg90.jpg', 1, '2025-12-15 13:02:52', '2025-12-15 13:02:52'),
(41, 37, 'products/xiao-esp32-s3.jpg', 1, '2025-12-15 13:03:34', '2025-12-15 13:03:34'),
(42, 29, 'products/board-esp32-s3.jpg', 1, '2025-12-16 00:42:50', '2025-12-16 00:42:50'),
(43, 30, 'products/board-esp32-c3.jpg', 1, '2025-12-16 00:44:42', '2025-12-16 00:44:42'),
(44, 31, 'products/board-esp32-c6.jpg', 1, '2025-12-16 00:45:24', '2025-12-16 00:45:24'),
(45, 32, 'products/board-esp32-h2.jpg', 1, '2025-12-16 00:46:25', '2025-12-16 00:46:25'),
(46, 33, 'products/board-esp32-p4.jpg', 1, '2025-12-16 00:46:59', '2025-12-16 00:46:59'),
(47, 34, 'products/board-esp32-s3-box3.jpg', 1, '2025-12-16 00:47:30', '2025-12-16 00:47:30'),
(48, 35, 'products/m5stack-core-s3.jpg', 1, '2025-12-16 00:48:52', '2025-12-16 00:48:52'),
(49, 36, 'products/xiao-esp32-c3.jpg', 1, '2025-12-16 00:50:00', '2025-12-16 00:50:00');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
CREATE TABLE IF NOT EXISTS `roles` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'Full access to manage the application, including user accounts, permissions, and configuration settings.', '2025-11-08 12:01:46', '2025-12-10 07:00:43'),
(2, 'Users', 'Regular user with access to standard features and resources of the system.', '2025-11-08 12:01:46', '2025-12-10 07:00:50'),
(3, 'Saler', 'Responsible for sales-related activities, such as managing product listings, processing orders, and handling customer inquiries.', '2025-11-08 12:01:46', '2025-11-08 12:01:46'),
(4, 'Shipper', 'Handles logistics and shipping tasks, including dispatching orders and tracking shipments.', '2025-11-08 12:01:46', '2025-11-08 12:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('2sx7wxJ3GtWGM0awexr6ZwSYsc7KLxhjdmGHh4Hh', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiNDIzQmNKM0lsOEJjbFRsZW4wZWdDQzZjSG9RUjNlUjhlZUlrbUpRMiI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9zeW53YXZlY28tZWNvbW1lcmNlIjtzOjU6InJvdXRlIjtzOjEzOiJmcm9udGVuZC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770113284),
('6zYrhq1wLSsXlqNFaTqw42rKBRkc3oldfgPRCIIL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQ0l6RkxYM1AxY2RYcXc1SWNuM1RjT0Y3WmtsVDNVWXhqMWtZN3h5QyI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NTU6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9zeW53YXZlY28tZWNvbW1lcmNlL2FkbWluaXN0cmF0b3IiO3M6NToicm91dGUiO3M6MTg6ImFkbWluaXN0cmF0b3IuaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1770116360),
('Fa5SHbFa3DagqNNpjWpv7iEQxSzXaRVk4KkMK4tE', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/144.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiem51cTZrYUREWm9wM01LRFVlYmR5bHFtcWtsZW5DbEZBZkhYaWxSQSI7czo5OiJfcHJldmlvdXMiO2E6Mjp7czozOiJ1cmwiO3M6NDE6Imh0dHA6Ly8xMjcuMC4wLjE6ODA3MC9zeW53YXZlY28tZWNvbW1lcmNlIjtzOjU6InJvdXRlIjtzOjEzOiJmcm9udGVuZC5ob21lIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1770113284);

-- --------------------------------------------------------

--
-- Table structure for table `topics`
--

DROP TABLE IF EXISTS `topics`;
CREATE TABLE IF NOT EXISTS `topics` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `topics_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `topics`
--

INSERT INTO `topics` (`id`, `name`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Technology', 'technology', 'Technology is the driving force behind modern innovation, transforming the way we live, work, and connect. This topic explores the latest breakthroughs in computing, artificial intelligence, cybersecurity, robotics, and sustainable tech, alongside the social, ethical, and economic implications of rapid technological change', 'topics/technology.jpg', '2026-01-28 06:41:19', '2026-01-28 06:41:19'),
(3, 'Environment', 'environment', 'Discussions about environmental challenges, sustainable practices, climate change, conservation, and the impact of human activity on ecosystems. Includes topics like renewable energy, pollution, biodiversity, and policy responses.', 'topics/environment.jpg', '2026-01-30 03:15:58', '2026-01-30 03:15:58'),
(4, 'E-commerce', 'e-commerce', 'Explores online shopping trends, digital marketplaces, logistics, consumer behavior, cybersecurity, and the economic impact of e-commerce on traditional retail and small businesses.', 'topics/e-commerce.jpg', '2026-01-30 03:16:39', '2026-01-30 03:16:39'),
(5, 'Education', 'education', 'Examines teaching methods, learning technologies, access to education, pedagogy, assessment, and reforms in different educational systems. Includes topics like remote learning and lifelong learning.', 'topics/education.jpg', '2026-01-30 03:17:13', '2026-01-30 03:17:13'),
(6, 'Politics', 'politics', 'Analyzes governance, public policy, political theory, elections, party systems, international relations, and the role of institutions in shaping society. Can include debates on democracy, representation, and civic engagement.', 'topics/politics.jpg', '2026-01-30 03:18:07', '2026-01-30 03:18:07'),
(7, 'Current Affairs', 'current-affairs', 'Reports and analyses of recent events, policy changes, social movements, economic developments, and global news. Emphasizes context, causation, and implications for various stakeholders.', 'topics/current-affairs.jpg', '2026-01-30 03:18:49', '2026-01-30 03:18:49'),
(8, 'Healthcare', 'healthcare', 'Covers public health, medical innovations, healthcare systems, access to care, health policy, and global health challenges such as pandemics and health equity.', 'topics/healthcare.jpg', '2026-01-30 03:20:40', '2026-01-30 03:20:40'),
(9, 'Sports', 'sports', 'Sport encompasses physical activities involving skill, strategy, and competition. It ranges from individual pursuits to team-based games, emphasizing training, performance, discipline, fair play, and the cultural, social, and economic impacts of sports on individuals and communities.', 'topics/sports.jpg', '2026-01-30 03:22:32', '2026-01-30 03:22:32');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_card` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '2',
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `background` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `jobs` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `school` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`),
  UNIQUE KEY `users_id_card_unique` (`id_card`),
  KEY `roles` (`roles`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `username`, `phone`, `id_card`, `is_active`, `roles`, `address`, `avatar`, `background`, `jobs`, `school`, `company`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Administrator', 'admin@gmail.com', NULL, '$2y$12$5iCL/.h1SfMgfAWXTeqlsuX9eLW92WZmbcH.XN6uzwTSB7RKSjIG2', 'admin', '0924202149', '089204002620', 1, '1', 'Binh Duc, An Giang, Vietnam', 'users/avatar/administrator.jpg', 'users/administrator.jpg', 'Administrator', 'An Giang University', 'HK.Huang', 'gFG8bY0gLCbk2hJ6tXKCGSJVVce42MUSfyJKLimFzCDRXTJBDtNc8AQsLVWi', '2025-11-08 05:06:29', '2026-01-29 04:20:51'),
(2, 'Phong Thụy Anh', 'fengshuiying07@gmail.com', NULL, '$2y$12$Yp12yiDHD0VmXxpczHLWF.lSs3/xKfUF2CDnoUvPOLYzCddFHNWsm', 'fengshuiying', '0924202150', '08920402720', 1, '3', 'Binh Duc, An Giang, Vietnam', 'users/phong-thuy-anh.jpg', 'users/phong-thuy-anh.png', 'Streamer', 'Dalat University', 'HK.Huang', NULL, '2025-12-10 01:39:19', '2025-12-17 09:14:15'),
(3, 'Lâm Tư Thụy', 'linsiruin07@gmail.com', NULL, '$2y$12$R6DYLZxI4I50dc/Jo0DzRuhp/fu4dKJPvWW27L7bLSd/5maVtHFge', 'linsirui', '0924202148', '08920402820', 1, '4', 'Nan Jing, China', 'users/lam-tu-thuy.jpg', 'users/lam-tu-thuy.png', '4th Year Student', 'Nan Jing', 'HK.Huang', '3vFqpkeZLIF9TSRcUN8WQHmIDMm9EVdcWLoGbmi6fDimUBnW5SBKtsaZ0DvG', '2025-12-10 02:04:29', '2025-12-17 09:15:26'),
(4, 'Vũ Trường Ưu', 'yuzhangyou07@gmail.com', NULL, '$2y$12$5Y18jxymdOIXz.kcBqBSaOzrajNaFwJKyH/FFExjJTgbQFLKBSe9G', 'yuzhangyou', '0924202147', '089204002920', 1, '2', 'Dalat, LamDong, Vietnam', 'users/avatar/vu-truong-uu.jpg', 'users/background/vu-truong-uu.jpg', 'Web Designer', 'DaLat University', 'HK.Huang', NULL, '2025-12-10 02:17:39', '2025-12-22 05:22:43'),
(5, 'Trần Tịch', 'chenji07@gmail.com', NULL, '$2y$12$VRIJA44HlFtBjiZv.5C3VepaDHopt/XuiGbKfOYEAEYhiO95ytXIC', 'chenji', '0924202146', '089204002520', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-10 02:25:56', '2025-12-10 02:25:56'),
(6, 'Triệu Cẩm Đan', 'zhaojindan@gmail.com', NULL, '$2y$12$yi.PASHCZKIyGQcllWATQuHQoMk9hXBhxY4qJazsNdsMqLRgywpia', 'zhaojindan', '0924202145', '089204002420', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-10 02:32:51', '2025-12-10 02:32:51'),
(7, 'Dương Ái Sa', 'yangaisha@gmail.com', NULL, '$2y$12$qvQpQcZp2O0Bkz1moPSfqe2oMymtEhPBBFs6/WhgKzLQCx2xN4Jqu', 'yangaisha', '0924202146', '089204002320', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-12 06:54:19', '2025-12-12 06:54:19'),
(9, 'Huỳnh Quốc Huy', 'huykyunh.k@gmail.com', NULL, '$2y$12$DqfhZOm9/IG4Bjdq/n2J1.PaiDDbH5eUd5XscfKbTEWL6VnPOxYKi', 'huykyun', '0924202149', '089204002621', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-14 10:40:11', '2025-12-14 10:40:11'),
(10, 'Hoàng Thời Niệm', 'huangshinian@gmail.com', NULL, '$2y$12$ovnXbUbGD.N8sWxG5jFXPOAtW3uxu/JmIOTHAPZqQNKt60yC5XvWG', 'huangshinian', '0924202149', '087273273981', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-15 09:20:26', '2025-12-15 09:20:26'),
(11, 'Hà Min', 'hemin@gmail.com', NULL, '$2y$12$JAO2vmrBIaCglbOcjGPVku88K8dMkt313AYy9Xb327.5g89nsPnRu', 'hemin', NULL, NULL, 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-15 09:45:31', '2025-12-15 09:45:31'),
(12, 'Tống Hạ Dương', 'tongxiayang@gmail.com', NULL, '$2y$12$eS8FGmki1X99S0uuhmxIa.YxP1Pf0PpQmAjW3JQIVn1iUpLsU5yna', 'tongxiayang', '0924202147', '089204002220', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-16 06:39:05', '2025-12-16 06:39:05'),
(13, 'Phong Thụy Thu', 'fengsijiu@gmail.com', NULL, '$2y$12$C1nTcb6l7eQO4.Wrn79JseW5eNPjVYg81Dq5fDsxlOEtvBjppCM/K', 'fensijiu', '0924202159', '089204002120', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2025-12-17 04:17:53', '2025-12-17 04:17:53'),
(14, 'Hà Thụy Mẫn', 'heruimen@gmail.com', NULL, '$2y$12$Sy7KLaL.p4UY3JXyuVsOcuB0UAI0bKFdigUzHG7.neioR5GgPgYVS', 'heruimen', '0924271734', '089204002020', 1, '2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2026-01-22 22:59:19', '2026-01-22 22:59:19');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alert_thresholds`
--
ALTER TABLE `alert_thresholds`
  ADD CONSTRAINT `alert_thresholds_iot_device_id_foreign` FOREIGN KEY (`iot_device_id`) REFERENCES `iot_devices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `articles`
--
ALTER TABLE `articles`
  ADD CONSTRAINT `articles_articletypeid_foreign` FOREIGN KEY (`articletypeid`) REFERENCES `article_types` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_productid_foreign` FOREIGN KEY (`productid`) REFERENCES `products` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_statusid_foreign` FOREIGN KEY (`statusid`) REFERENCES `article_statuses` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_topicid_foreign` FOREIGN KEY (`topicid`) REFERENCES `topics` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `articles_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_articleid_foreign` FOREIGN KEY (`articleid`) REFERENCES `articles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_userid_foreign` FOREIGN KEY (`userid`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

--
-- Constraints for table `device_metrics`
--
ALTER TABLE `device_metrics`
  ADD CONSTRAINT `device_metrics_iot_device_id_foreign` FOREIGN KEY (`iot_device_id`) REFERENCES `iot_devices` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `iot_devices`
--
ALTER TABLE `iot_devices`
  ADD CONSTRAINT `iot_devices_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_order_status_id_foreign` FOREIGN KEY (`order_status_id`) REFERENCES `order_statuses` (`id`) ON DELETE RESTRICT,
  ADD CONSTRAINT `orders_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `order_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_category_id_foreign` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `products_manufacturer_id_foreign` FOREIGN KEY (`manufacturer_id`) REFERENCES `manufacturers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_details`
--
ALTER TABLE `product_details`
  ADD CONSTRAINT `product_details_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `product_images`
--
ALTER TABLE `product_images`
  ADD CONSTRAINT `product_images_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
