-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.8.3-MariaDB-1:10.8.3+maria~jammy - mariadb.org binary distribution
-- 서버 OS:                        debian-linux-gnu
-- HeidiSQL 버전:                  12.0.0.6468
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

-- 테이블 test.board 구조 내보내기
CREATE TABLE IF NOT EXISTS `board` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '번호',
  `title` varchar(100) NOT NULL COMMENT '제목',
  `content` text NOT NULL COMMENT '내용',
  `read_cnt` int(11) NOT NULL DEFAULT 0 COMMENT '조회수',
  `writer` varchar(20) NOT NULL COMMENT '작성자',
  `write_time` datetime NOT NULL COMMENT '작성일',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 test.board:~4 rows (대략적) 내보내기
INSERT INTO `board` (`id`, `title`, `content`, `read_cnt`, `writer`, `write_time`) VALUES
	(31, '1234', '<p>222</p>', 0, 'test', '2022-08-15 10:26:59'),
	(33, '테스트', '<p><strong>ㅈㅂㄷㅂㅈㄷㅂㅈㄷ</strong><i><strong>ㄷㄷㄷㄷㄷ</strong></i></p>', 0, 'test', '2022-08-15 11:54:17'),
	(34, '4566', '<p>2323</p>', 0, 'test', '2022-08-15 13:48:13');

-- 테이블 test.board_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `board_file` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '파일 번호',
  `board_no` int(10) NOT NULL COMMENT '게시판 번호',
  `orgin_name` varchar(50) NOT NULL COMMENT '원본 이름',
  `random_name` varchar(50) NOT NULL COMMENT '랜덤 이름',
  `regdate` datetime NOT NULL COMMENT '등록 날짜',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `board_no` (`board_no`) USING BTREE,
  CONSTRAINT `FK_board_file_board` FOREIGN KEY (`board_no`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 test.board_file:~3 rows (대략적) 내보내기
INSERT INTO `board_file` (`id`, `board_no`, `orgin_name`, `random_name`, `regdate`) VALUES
	(9, 31, 'IMG_20160831_011519.jpg', '66641d55-f853-469c-a9e7-365d1b62ec36', '2022-08-15 10:26:59'),
	(11, 34, 'IMG_20160831_011506.jpg', '56649850-df85-428f-b01e-01567b856c87', '2022-08-15 13:48:13');

-- 테이블 test.buylist 구조 내보내기
CREATE TABLE IF NOT EXISTS `buylist` (
  `member` varchar(50) NOT NULL,
  `board_title` varchar(50) DEFAULT NULL,
  `board_no` int(11) NOT NULL,
  `buy_date` datetime NOT NULL,
  KEY `FK_buylist_board` (`board_no`),
  CONSTRAINT `FK_buylist_board` FOREIGN KEY (`board_no`) REFERENCES `board` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 test.buylist:~2 rows (대략적) 내보내기
INSERT INTO `buylist` (`member`, `board_title`, `board_no`, `buy_date`) VALUES
	('test', '1234', 31, '2022-08-15 14:17:04'),
	('test', '4566', 34, '2022-08-15 14:17:08');

-- 테이블 test.user_list 구조 내보내기
CREATE TABLE IF NOT EXISTS `user_list` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `authority` varchar(50) NOT NULL DEFAULT 'ROLE_USER',
  `enabled` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 test.user_list:~2 rows (대략적) 내보내기
INSERT INTO `user_list` (`name`, `password`, `authority`, `enabled`) VALUES
	('jinwook', '$2a$10$rOcIyI2gZ/WYev1boOvMP.HGIuhLSaFklnbm3R/uJ/ndcXQ1ZFJr2', 'ROLE_USER', 1),
	('test', '$2a$10$ujn4ke12drpjHMO4SIYITOxrqdrlgQ9EBspOQANJS69SJ37eQxGPa', 'ROLE_USER', 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
