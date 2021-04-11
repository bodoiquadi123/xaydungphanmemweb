-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th4 08, 2021 lúc 04:14 AM
-- Phiên bản máy phục vụ: 10.4.18-MariaDB
-- Phiên bản PHP: 8.0.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_laravel_mypham`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `admin`
--

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `admin_email` varchar(50) NOT NULL,
  `admin_name` varchar(50) NOT NULL,
  `admin_pw` varchar(50) NOT NULL,
  `admin_phone` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `admin`
--

INSERT INTO `admin` (`admin_id`, `admin_email`, `admin_name`, `admin_pw`, `admin_phone`) VALUES
(2, 'adminroot@gmail.com', 'binhle', '123', 941690340);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_customer` int(11) DEFAULT NULL,
  `date_order` date DEFAULT NULL,
  `total` float DEFAULT NULL COMMENT 'tổng tiền',
  `payment` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'hình thức thanh toán',
  `note` varchar(500) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `date_order`, `total`, `payment`, `note`, `created_at`, `updated_at`) VALUES
(14, 14, '2017-03-23', 160000, 'COD', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 13, '2017-03-21', 400000, 'ATM', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 12, '2017-03-21', 520000, 'COD', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 11, '2017-03-21', 420000, 'COD', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(15, 15, '2017-03-24', 220000, 'COD', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` int(10) UNSIGNED NOT NULL,
  `id_bill` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(11) NOT NULL COMMENT 'số lượng',
  `unit_price` double NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(18, 15, 62, 5, 220000, '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(17, 14, 2, 1, 160000, '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(16, 13, 60, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(15, 13, 59, 1, 200000, '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(14, 12, 60, 2, 200000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(13, 12, 61, 1, 120000, '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(12, 11, 61, 1, 120000, '2017-03-21 07:16:09', '2017-03-21 07:16:09'),
(11, 11, 57, 2, 150000, '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `gender` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `phone_number` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  `note` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone_number`, `note`, `created_at`, `updated_at`) VALUES
(15, 'ê', 'Nữ', 'huongnguyen@gmail.com', 'e', 'e', 'e', '2017-03-24 07:14:32', '2017-03-24 07:14:32'),
(14, 'hhh', 'nam', 'huongnguyen@gmail.com', 'Lê thị riêng', '99999999999999999', 'k', '2017-03-23 04:46:05', '2017-03-23 04:46:05'),
(13, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '23456789', 'Vui lòng giao hàng trước 5h', '2017-03-21 07:29:31', '2017-03-21 07:29:31'),
(12, 'Khoa phạm', 'Nam', 'khoapham@gmail.com', 'Lê thị riêng', '1234567890', 'Vui lòng chuyển đúng hạn', '2017-03-21 07:20:07', '2017-03-21 07:20:07'),
(11, 'Hương Hương', 'Nữ', 'huongnguyenak96@gmail.com', 'Lê Thị Riêng, Quận 1', '234567890-', 'không chú', '2017-03-21 07:16:09', '2017-03-21 07:16:09');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` int(10) NOT NULL,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'tiêu đề',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'nội dung',
  `image` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT 'hình',
  `create_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `update_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `news`
--

INSERT INTO `news` (`id`, `title`, `content`, `image`, `create_at`, `update_at`) VALUES
(1, 'Mùa trung thu năm nay, Hỷ Lâm Môn muốn gửi đến quý khách hàng sản phẩm mới xuất hiện lần đầu tiên tại Việt nam \"Bánh trung thu Bơ Sữa HongKong\".', 'Những ý tưởng dưới đây sẽ giúp bạn sắp xếp tủ quần áo trong phòng ngủ chật hẹp của mình một cách dễ dàng và hiệu quả nhất. ', 'sample1.jpg', '2017-03-11 06:20:23', '0000-00-00 00:00:00'),
(2, 'Tư vấn cải tạo phòng ngủ nhỏ sao cho thoải mái và thoáng mát', 'Chúng tôi sẽ tư vấn cải tạo và bố trí nội thất để giúp phòng ngủ của chàng trai độc thân thật thoải mái, thoáng mát và sáng sủa nhất. ', 'sample2.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(3, 'Đồ gỗ nội thất và nhu cầu, xu hướng sử dụng của người dùng', 'Đồ gỗ nội thất ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Xu thế của các gia đình hiện nay là muốn đem thiên nhiên vào nhà ', 'sample3.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(4, 'Hướng dẫn sử dụng bảo quản đồ gỗ, nội thất.', 'Ngày nay, xu hướng chọn vật dụng làm bằng gỗ để trang trí, sử dụng trong văn phòng, gia đình được nhiều người ưa chuộng và quan tâm. Trên thị trường có nhiều sản phẩm mẫu ', 'sample4.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00'),
(5, 'Phong cách mới trong sử dụng đồ gỗ nội thất gia đình', 'Đồ gỗ nội thất gia đình ngày càng được sử dụng phổ biến nhờ vào hiệu quả mà nó mang lại cho không gian kiến trúc. Phong cách sử dụng đồ gỗ hiện nay của các gia đình hầu h ', 'sample5.jpg', '2016-10-20 02:07:14', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `id_type` int(10) UNSIGNED DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit_price` float DEFAULT NULL,
  `promotion_price` float DEFAULT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `unit` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `new` tinyint(4) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `new`, `created_at`, `updated_at`) VALUES
(1, 'Sữa dưỡng cân bằng ẩm', 5, 'Sữa dưỡng chiết xuất từ việt quất innisfree Blueberry Rebalancing Lotion giúp dưỡng ẩm gấp 3 lần, duy trì trạng thái cân bằng dầu - ẩm mà không gây nhờn rít.', 450000, 320000, 'scb.png', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(2, 'Xịt khoáng dưỡng ẩm nha đam', 6, 'Xịt khoáng chiết xuất từ nha đam innisfree Aloe Revital Skin Mist giúp cân bằng ẩm và làm dịu da như toner.', 380000, 0, 'Hinh2.png', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(3, 'Sữa dưỡng ẩm chống lão hóa', 5, 'Sữa dưỡng ẩm innisfree Jeju Lava Seawater Lotion chiết xuất từ nước biển sâu dung nham Jeju giúp cân bằng độ ẩm và cải thiện độ săn chắc để ngăn ngừa dấu hiệu lão hóa.', 250000, 230000, 'hinh3.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(4, 'Sữa dưỡng innisfree Jeju', 5, 'Sữa dưỡng chống oxy hóa và ngăn ngừa lão hóa từ lựu innisfree Jeju Pomegranate Revitalizing Emulsion giúp duy trì độ ẩm cân bằng, dưỡng sáng và trẻ hóa làn da.', 260000, 0, 'sd4.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(5, 'Sữa dưỡng ẩm sáng da', 5, 'Sữa dưỡng innisfree Cherry Blossom Lotion dưỡng ẩm và dưỡng sáng da tự nhiên với chiết xuất cánh hoa anh đào Jeju và Betaine có trong củ dền\r\n', 260000, 0, 'hinh5.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(6, 'Sữa dưỡng ẩm chất trà xanh', 5, 'Sữa dưỡng ẩm kết hợp tình chất từ trà xanh innisfree Green Tea Seed Essence in Lotion với công nghệ khóa ẩm kép, cung cấp đủ ẩm cho làn da sáng mịn.', 310000, 280000, 'hinh6.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(7, 'Sữa dưỡng dành cho da mụn', 5, 'Sữa dưỡng chiết xuất từ dầu Bija Jeju innisfree Bija Trouble Lotion giúp cân bằng, dưỡng ẩm và bảo vệ da, phù hợp cho làn da mụn.', 360000, 0, 'hinh7.png', 'hộp', 1, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(8, 'Sữa dưỡng chống lão hóa', 5, 'Sữa dưỡng chống lão hóa chuyên sâu 9 loại thảo mộc màu tím đậm innisfree Perfect 9 Repair Lotion EX 160ml', 260000, 230000, 'hinh8.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(9, 'Sữa dưỡng ẩm trà xanh', 5, 'Sữa dưỡng cân bằng độ ẩm innisfree Green Tea Balancing Lotion EX chiết xuất từ trà xanh độc quyền Beauty Green Tea phục hồi độ căng mọng và cân bằng ẩm - dầu trên da, cho làn da mịn màng, sáng khỏe.', 360000, 350000, 'hinh9.png', 'hộp', 0, '2016-10-26 03:00:16', '2016-10-24 22:11:00'),
(11, 'Dầu dưỡng môi từ trà xanh', 3, 'Dầu dưỡng môi innisfree Green Tea Lip Conditioning Oil chiết xuất từ hạt trà xanh và hỗn hợp dầu thực vật, giúp dưỡng ẩm sâu, tẩy tế bào chết và nhanh chóng phục hồi đôi môi mềm mại.', 150000, 0, 'hinh11.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(12, 'Son dưỡng môi trà xanh', 3, 'Son dưỡng môi innisfree Green Tea Lip Balm chiết xuất từ trà xanh Jeju và hỗn hợp dầu thiên nhiên giúp dưỡng ẩm và chăm sóc đôi môi mềm mại.', 300000, 280000, 'hinh12.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(13, 'Mặt nạ ngủ môi trà xanh', 3, 'Mặt nạ ngủ cho môi innisfree Lip Sleeping Mask With Green Tea chiết xuất từ trà xanh giúp dưỡng ẩm và chăm sóc đôi môi mềm mại từ trong giấc ngủ.', 310000, 270000, 'hinh13.png', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(14, 'Mặt nạ ngủ môi dầu hoa cải', 3, 'Mặt nạ ngủ cho môi innisfree Lip Sleeping Mask With Canola Oil chiết xuất từ dầu hoa cải giúp dưỡng ẩm và tẩy tế bào chết, chăm sóc đôi môi mềm mại từ trong giấc ngủ.', 230000, 210000, 'hinh14.png', 'cái', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(15, 'Son dưỡng môi chuyên sâu', 3, 'Son dưỡng môi innisfree Canola Honey Lip Balm Deep Moisture chiết xuất từ mật ong hoa cải giúp dưỡng ẩm sâu, tăng độ đàn hồi và hình thành màng chắn bảo vệ đôi môi.', 250000, 220000, 'hinh15.png\r\n', 'cái', 1, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(16, 'Son dưỡng môi mật ong hoa', 3, 'Son dưỡng môi innisfree Canola Honey Lip Balm chiết xuất từ mật ong hoa cải giúp dưỡng môi ẩm mượt, tạo màu nhẹ nhàng cho làn môi.', 250000, 230000, 'hinh16.png', 'hộp', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(17, 'Son dưỡng môi innisfree', 3, 'Son dưỡng môi innisfree My Lip Balm Set chứa dầu dưỡng ẩm thiên nhiên cùng hương trà thư giãn, cho đôi môi ẩm mượt và hồng hào tự nhiên.', 250000, 230000, 'hinh17.png', 'cai', 0, '2016-10-12 02:00:00', '2016-10-27 02:24:00'),
(18, 'Mặt nạ ngủ ', 2, 'Mặt nạ dạng hũ innisfree Capsule Recipe Pack chiết xuất thiên nhiên giúp nuôi dưỡng từng nhu cầu của làn da. Thiết kế dạng hũ nhỏ thuận tiện mang theo đi du lịch hoặc trải nghiệm sản phẩm.', 280000, 0, 'hinh18.png\r\n', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(19, 'Mặt nạ tơ dưỡng da', 2, 'Mặt nạ tơ innisfree Skin Clinic Mask siêu mịn, chăm sóc làn da hiệu quả với các hoạt chất: Từ cấp nước, dưỡng ẩm, dưỡng sáng, dưỡng da săn chắc đến làm dịu da. Nguyên liệu mỏng nhẹ, ôm sát làn da hoàn hảo để hoạt chất được hấp thụ vào da hiệu quả hơn.', 150000, 0, 'hinh19.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(20, 'Mặt nạ dưỡng ẩm sáng da', 2, 'Mặt nạ innisfree Jeju Root Energy Mask chiết xuất từ các loại rau củ Jeju kết hợp với 5 loại Hyaluronic Acid giúp dưỡng ẩm dồi dào cho làn da. Có chất liệu 100% cellulose thuần chay, mặt nạ lành tính và được ngâm trong dầu hướng dương 72h tăng cường hiệu quả dưỡng ẩm.', 120000, 0, 'hinh20.png\r\n', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(21, 'Mặt nạ giấy nước ép thiên', 2, 'Mặt nạ giấy innisfree My Real Squeeze Mask chiết xuất từ nước ép tự nhiên đảo Jeju, giải quyết các vấn đề khác nhau của làn da. Làm từ 100% cellulose lành tính, mặt nạ ứng dụng công nghệ vắt - ép lạnh để tối ưu hóa dưỡng chất.', 120000, 90000, 'hinh21.png\r\n', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(22, 'Tinh chất cải thiện nếp nhăn tảo biển', 1, 'Tinh chất dạng dầu cải thiện nếp nhăn Wrinkle Science Oil Serum, chiết xuất từ mầm tảo bẹ Undaria, giúp dưỡng ẩm và điều trị nếp nhăn trên da.', 230000, 210000, 'Hinh_22.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(23, 'Tinh chất đặc trị Hallabong', 1, 'Tính chất đặc trị dưỡng sáng da innisfree Brightening Pore Spot Treatment chiết xuất từ vỏ quýt tươi Jeju Hallabong giúp làm mờ các vết thâm trên da để da đều màu và sáng khỏe hơn.', 380000, 0, 'Hinh_23.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(24, 'Tinh chất đặc trị nếp nhăn tảo biển ', 1, 'Tinh chất điều trị nếp nhăn chuyên sâu innisfree Wrinkle Science Spot Treatment, chiết xuất từ mầm tảo bẹ Undaria giàu Omega-3, giúp làm đầy vùng nếp gấp sâu quanh mắt, khóe miệng và các nếp nhăn khác trên khuôn mặt.', 480000, 0, 'Hinh24.png', 'Tuýp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(25, 'Tinh chất dưỡng mắt chống lão hóa', 1, 'Tinh chất từ nước biển sâu dung nham innisfree Jeju Lava Seawater Eye Serum EX giúp dưỡng ẩm và chống lão hóa vùng da quanh mắt mỏng manh.', 280000, 0, 'Hinh_25.png', 'Chai', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(26, 'Tinh chất chống lão hóa chuyên sâu', 1, 'Tinh chất chống lão hóa chuyên sâu từ 9 loại thảo mộc màu tím đậm innisfree Perfect 9 Repair Serum EX giúp chống nhăn, làm sáng da và cải thiện 9 dấu hiệu lão hóa điển hình.', 350000, 0, 'Hinh26.png', 'Chai', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(27, 'Tinh chất cải thiện nếp nhăn ', 1, 'Tinh chất innisfree Bija Trouble Spot Essence chiết xuất từ dầu Bija Jeju, Acid Salicylic BHA, Madecassoside giúp làm dịu, ngăn ngừa mụn phát triển, bảo vệ vùng da mụn.', 100000, 80000, 'hinh27.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(28, 'Tinh chất dưỡng ẩm', 1, 'Tinh chất chiết xuất từ dầu Bija Jeju, Acid Salicylic BHA, Madecassoside giúp làm dịu, ngăn ngừa mụn phát triển, bảo vệ vùng da mụn.', 120000, 0, 'hinh28.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(29, 'Tinh chất trị mụn', 1, 'Tinh chất trị mụn innisfree Bija Trouble Spot Essence chiết xuất từ dầu Bija Jeju, Acid Salicylic BHA, Madecassoside giúp làm dịu, ngăn ngừa mụn phát triển, bảo vệ vùng da mụn.', 100000, 0, 'hinh29.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(30, 'Bộ dưỡng da sáng khỏe', 4, 'Dưỡng và chăm da sáng rạng ngời toàn diện với combo gồm 11 sản phẩm bao gồm 1 son dưỡng, 1 kem dưỡng sáng da, 1 tinh chất đặc trị làm sáng da, 1 chống nắng dạng thỏi, 3 mặt nạ làm sáng da, 2 son móng và 1 túi Ecobag.', 380000, 350000, 'hinhs.png', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(31, 'Sữa rửa mặt sạch sâu', 4, 'Sữa rửa mặt táo xanh innisfree Apple Seed Soft Cleansing Foam giúp làm sạch bụi bẩn và bã nhờn sâu trong lỗ chân lông, các acid hữu cơ trong hạt táo giúp da mịn màng, sảng khoái.', 380000, 350000, 'hinh31.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(32, 'Sữa rửa mặt ', 4, 'Sữa rửa mặt innisfree Bija Trouble Facial Foam chiết xuất từ dầu hạt Bija, Acid Salicylic BHA và hạt hoa hồng, giúp làm sạch bụi bẩn từ sâu bên trong lỗ chân lông, đặc biệt phù hợp cho làn da dầu mụn.', 380000, 360000, 'hinh32.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(33, 'Sữa rửa mặt tạo bọt', 4, 'Sữa rửa mặt tạo bọt mịn innisfree Green Barley Bubble Cleanser chiết xuất từ lúa mạch xanh giúp làm sạch sâu bên trong lỗ chân lông và loại bỏ tế bào chết cho làn da sạch thoáng, mịn màng.', 290000, 230000, 'hinh33.png', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(34, 'Sữa rửa mặt tẩy tế bào', 4, 'Sữa rửa mặt innisfree Sea Salt Perfect Cleanser thành phần từ muối biển dung nham hàm lượng cao giúp loại bỏ các tế bào da chết và tạp chất còn bám lại trên bề mặt cho da trở nên mịn màng và ẩm mượt.', 290000, 0, 'hinh34.png', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(35, 'Sữa rửa mặt sạch sâu', 4, 'Sữa rửa mặt sạch sâu sảng khoái innisfree My Makeup Cleanser Creamy Foam, làm sạch lớp trang điểm và bổ sung dầu dưỡng để làn da thêm mềm mịn.', 330000, 320000, 'hinh35.png', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(36, 'Sữa rửa mặt cân bằng độ pH', 4, 'Sữa rửa mặt dịu nhẹ chiết xuất từ việt quất innisfree Blueberry Rebalancing 5.5 Cleanser có tính acid nhẹ, cân bằng độ pH giúp làm sạch nhẹ nhàng cho làn da ẩm mịn, sảng khoái.', 220000, 200000, 'hinh36s.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(37, 'Sữa rửa mặt dưỡng sáng da', 4, 'Sữa rửa mặt làm sáng da innisfree Brightening Pore Facial Cleanser chiết xuất từ vỏ quýt tươi Jeju Hallabong với lớp bọt siêu mịn giúp loại bỏ hiệu quả bã nhờn nằm sâu trong lỗ chân lông, mang lại làn da tươi sáng rạng rỡ.', 310000, 300000, 'hinh37.png', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(38, 'Xà phòng rửa mặt', 4, 'Xà phòng innisfree Volcanic Pore Soap làm sạch bã nhờn từ sâu bên trong lỗ chân lông. Loại bỏ bụi bẩn, mụn đầu đen và làm se khít lỗ chân lông, mang đến làn da khoẻ mạnh, sảng khoái.', 250000, 230000, 'hinh38.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(39, 'Sữa rửa mặt chống oxy hóa', 4, 'Sữa rửa mặt chống oxy hóa và ngăn ngừa lão hóa từ lựu innisfree Jeju Pomegranate Revitalizing Foam Cleanser giúp làm sạch, dưỡng sáng và trẻ hóa làn da mà không gây kích ứng.', 320000, 310000, 'hinh39.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(40, 'Sữa rửa mặt sạch sâu', 4, 'Sữa rửa mặt đá tro núi lửa innisfree Volcanic Pore Cleansing Foam Ex làm sạch sâu, se khít lỗ chân lông và giúp da thư giãn.', 250000, 220000, 'hinh40.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(41, 'Sữa rửa mặt', 4, 'Sữa rửa mặt sạch sâu sảng khoái innisfree My Makeup Cleanser Creamy Foam, làm sạch lớp trang điểm và bổ sung dầu dưỡng để làn da thêm mềm mịn.', 250000, 210000, 'hinh41.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(42, 'Xịt khoáng dưỡng ẩm', 6, 'Xịt khoáng dưỡng ẩm innisfree Bija Cica Mist chiết xuất từ rau má Centella Asiatica 4X và dầu hạt Bija giúp làm dịu và cấp ẩm nhẹ nhàng cho làn da mụn.', 250000, 230000, 'hinh42.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(43, 'Xịt khoáng dưỡng sáng', 6, 'Xịt khoáng dưỡng ẩm, sáng da hoa anh đào innisfree Jeju Cherry Blossom Mist giúp cấp nước tức thì cho làn da khô, mang đến làn da rạng rỡ không tì vết.', 320000, 0, 'hinh43.png', 'cái', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(44, 'Xịt khoáng dưỡng ẩm', 6, 'Xịt khoáng cao cấp siêu mịn innisfree Green Tea Mist (Micro) từ trà xanh đảo Jeju giúp dưỡng ẩm tức thì và làm dịu da nhờ tia mịn phun sương.', 220000, 0, 'hinh44.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(45, 'Xịt khoáng kiềm dầu', 6, 'Xịt khoáng innisfree No Sebum Setting Spray giúp kiềm dầu và cố định lớp trang điểm, hạn chế tình trạng lớp nền xuống tông.', 320000, 0, 'hinh45.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(46, 'Xịt khoáng phục hồi da', 6, 'Xịt khoáng tia mịn Black Tea Youth Enhancing Ampoule Mist, với các phân tử siêu nhỏ, mịn như sương, cấp nước và tạo hàng rào giữ ẩm cho da tức thì. ', 420000, 0, 'hinh46.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(47, 'Xịt thơm toàn thân', 6, 'Xịt thơm tóc và toàn thân innisfree Perfumed Body & Hair Mist lấy cảm hứng từ hương thơm tươi mới, dài lâu của phong cảnh Jeju mang lại cảm giác thư giãn và dễ chịu.', 240000, 0, 'hinh47.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(48, 'Tinh chất dưỡng sáng', 6, 'Dưỡng sáng toàn diện và chăm sóc lỗ chân lông từ quýt Brightening Pore Serum giúp dưỡng sáng, chăm sóc lỗ chân lông và cấp nước. Vỏ quýt Hallabong còn chống oxy hóa mạnh mẽ, giúp làm đều màu da và cải thiện vết thâm hiệu quả chỉ sau 04 tuần sử dụng.', 340000, 0, 'hinh48.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(49, 'Tinh chất dưỡng mắt', 7, 'Tinh chất chiết xuất từ trà đen Black Tea Youth Eye Serum với kết cấu mỏng nhẹ, đẩy lùi các dấu hiệu mệt mỏi, lão hóa và nếp nhăn ở vùng da quanh mắt mỏng manh.', 220000, 210000, 'hinh49.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(50, 'Tinh chất dưỡng mắt', 7, 'Tinh chất chống oxy hóa từ lựu innisfree Jeju Pomegranate Revitalizing Eye Essence kích thích tuần hoàn máu, giảm căng thẳng và dưỡng ẩm cho vùng da quanh mắt mỏng manh.', 330000, 310000, 'hinh50.png', 'cái', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(51, 'Thanh lăn dưỡng ẩm ', 7, 'Thanh lăn trà xanh innisfree Green Tea Seed Eye & Face Ball giúp dưỡng ẩm, giảm căng thẳng và cải thiện nếp nhăn, có thể sử dụng cho vùng da quanh mắt mỏng manh.', 250000, 0, 'hinh51.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(52, 'Tinh chất dưỡng mi ', 7, 'Tinh chất dưỡng mi innisfree Lash Solution Ampoule chứa hàm lượng caffeine cao nguồn gốc từ thực vật giúp tái tạo và nuôi dưỡng sợi mi chắc khỏe.', 450000, 0, 'hinh52.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(53, 'Kem dưỡng vùng mắt', 7, 'Kem dưỡng mắt chống lão hóa chuyên sâu từ 9 loại thảo mộc màu tím đậm innisfree Perfect 9 Repair Eye Cream EX giúp làm giảm quầng thâm, bọng mắt và cải thiện 9 dấu hiệu lão hóa điển hình.', 410000, 0, 'hinh53.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(54, 'Kem dưỡng ẩm vùng da', 7, 'Kem dưỡng ẩm trà xanh dịu nhẹ innisfree Green Tea Seed Eye Cream, chống oxy hóa cho vùng da quanh mắt mỏng manh.', 350000, 0, 'hinh54.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(55, 'Gel dưỡng ẩm làm dịu da', 7, 'Gel dưỡng ẩm làm dịu da mụn nhạy cảm innisfree Bija Cica Gel EX chiết xuất từ tinh chất rau má, dầu hạt Bija và D-Panthenol giúp bảo vệ và tăng cường sức đề kháng cho da, làm mờ thâm mụn mới.', 380000, 0, 'hinh55.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(56, 'Kem dưỡng chống oxy hóa', 7, 'Kem dưỡng dạng viên nang chứa dưỡng chất dầu hạt lựu innisfree Jeju Pomegranate Revitalizing Capsule Cream giúp lưu giữ dưỡng chất hiệu quả nhất, chống oxy hóa, làm sáng da từ bên trong và cải thiện dấu hiệu lão hóa sớm.', 550000, 0, 'hinh56.png', 'hộp', 0, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(57, 'Kem dưỡng dạng gel', 7, 'Kem trị mụn dạng gel dưỡng ẩm Bija Trouble Gel Cream kết hợp với tinh dầu bija và nồng độ cao (2%) Acid Salicylic BHA giữ cho làn da sạch mụn.', 480000, 0, 'hinh57.png', 'hộp', 1, '2016-10-13 02:20:00', '2016-10-19 03:20:00'),
(58, 'Mặt nạ ngủ chống oxy hóa', 2, 'Mặt nạ ngủ dạng viên nang chứa dưỡng chất dầu hạt lựu innisfree Jeju Pomegranate Revitalizing Capsule Sleeping Pack chống oxy hóa mạnh mẽ và chăm sóc đặc biệt cho da trong lúc ngủ, giúp làn da sáng khỏe và săn chắc từ bên trong.', 190000, 150000, 'hinh58.png', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(59, 'Mặt nạ dưỡng da chuyên sâu', 2, 'Mặt nạ innisfree Second Skin Mask với 4 loại, chiết xuất từ đậu nành lên men, giúp dưỡng ẩm, dưỡng sáng, săn chắc và làm dịu da. Chất liệu bio - cellulose giúp mặt nạ ôm sát gương mặt, đưa dưỡng chất vào sâu bên trong và duy trì độ ẩm dài lâu.', 130000, 0, 'hinh59.png', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(60, 'Mặt nạ dưỡng sáng', 2, 'Mặt nạ innisfree Bright Solution Mask kết hợp dưỡng sáng và bổ sung dưỡng chất cho da 2 trong 1. mang đến làn da sáng trong, ẩm mượt.', 180000, 0, 'hinh60.png', '', 0, '2016-10-26 17:00:00', '2016-10-11 17:00:00'),
(61, 'Xịt khoảng dưỡng ẩm', 6, 'Xịt khoáng nước biển sâu dung nham innisfree Jeju Lava Seawater Mist EX giúp dưỡng ẩm và ngăn ngừa dấu hiệu lão hóa sớm.', 250000, 220000, 'hinh61.png', 'cái', 1, NULL, NULL),
(62, 'Xịt khoáng dưỡng ẩm', 6, 'Xịt khoáng dưỡng ẩm sâu innisfree Olive Real Oil Mist chứa phức hợp Olive Power Activator™ (Vitamin E, Tocopherol và Acid Oleic) dưỡng ẩm và chống oxy hóa cho làn da khô, đồng thời giúp lớp nền trang điểm mượt mà hơn.', 260000, 240000, 'hinh62.png', 'cái', 0, NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` int(11) NOT NULL,
  `link` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `slide`
--

INSERT INTO `slide` (`id`, `link`, `image`) VALUES
(1, '', 'banner1.jpg'),
(2, '', 'banner2.jpg'),
(3, '', 'banner3.jpg'),
(4, '', 'banner4.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Tinh chất', 'Tinh chất dạng dầu cải thiện nếp nhăn Wrinkle Science Oil Serum, chiết xuất từ mầm tảo bẹ Undaria, giúp dưỡng ẩm và điều trị nếp nhăn trên da.', 'H1.png', NULL, NULL),
(2, 'Mặt nạ', 'Mặt nạ dạng hũ innisfree Capsule Recipe Pack chiết xuất thiên nhiên giúp nuôi dưỡng từng nhu cầu của làn da. Thiết kế dạng hũ nhỏ thuận tiện mang theo đi du lịch hoặc trải nghiệm sản phẩm.', 'H2.png', '2016-10-12 02:16:15', '2016-10-13 01:38:35'),
(3, 'Dưỡng môi', 'Dầu dưỡng môi innisfree Green Tea Lip Conditioning Oil chiết xuất từ hạt trà xanh và hỗn hợp dầu thực vật, giúp dưỡng ẩm sâu, tẩy tế bào chết và nhanh chóng phục hồi đôi môi mềm mại.', 'H3.png', '2016-10-18 00:33:33', '2016-10-15 07:25:27'),
(4, 'Sữa rửa mặt ', 'Sữa rửa mặt innisfree Super Volcanic Pore Micellar Cleansing Foam 2X được cải tiến, giúp làm sạch sâu lỗ chân lông mà không làm da khô căng, khó chịu.', 'H4.png', '2016-10-26 03:29:19', '2016-10-26 02:22:22'),
(5, 'Sữa dưỡng', 'Sữa dưỡng chiết xuất từ việt quất innisfree Blueberry Rebalancing Lotion giúp dưỡng ẩm gấp 3 lần, duy trì trạng thái cân bằng dầu - ẩm mà không gây nhờn rít.', 'H5.png', '2016-10-28 04:00:00', '2016-10-27 04:00:23'),
(6, 'Xịt khoáng', 'Xịt khoáng tia mịn Black Tea Youth Enhancing Ampoule Mist, với các phân tử siêu nhỏ, mịn như sương, cấp nước và tạo hàng rào giữ ẩm cho da tức thì. Có thể dùng thay thế toner để đơn giản hóa quy trình dưỡng da.', 'H6.png', '2016-10-25 17:19:00', NULL),
(7, 'Dưỡng mắt', 'Tinh chất dưỡng mi innisfree Lash Solution Ampoule chứa hàm lượng caffeine cao nguồn gốc từ thực vật giúp tái tạo và nuôi dưỡng sợi mi chắc khỏe.\r\n', 'H7.png', '2016-10-25 17:19:00', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `full_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `full_name`, `email`, `password`, `phone`, `address`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Hương Hương', 'huonghuong08.php@gmail.com', '$2y$10$rGY4KT6ZSMmLnxIbmTXrsu2xdgRxm8x0UTwCyYCAzrJ320kYheSRq', '23456789', 'Hoàng Diệu 2', NULL, '2017-03-23 07:17:33', '2017-03-23 07:17:33');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_ibfk_1` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_ibfk_2` (`id_product`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `admin`
--
ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
