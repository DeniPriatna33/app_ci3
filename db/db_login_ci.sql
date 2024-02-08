/*
 Navicat Premium Data Transfer

 Source Server         : MYSQL
 Source Server Type    : MySQL
 Source Server Version : 100421 (10.4.21-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_login_ci

 Target Server Type    : MySQL
 Target Server Version : 100421 (10.4.21-MariaDB)
 File Encoding         : 65001

 Date: 08/02/2024 22:38:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tbl_login
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login`;
CREATE TABLE `tbl_login`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `image` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role_id` int NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_login
-- ----------------------------
INSERT INTO `tbl_login` VALUES (1, 'user', 'user@gmail.com', 'default.jpg', '$2y$10$6kUGI50K1gQWfBP8Wjyuw.1HsbkBnGDtR1NGCfzzKPMPqozzKx/CW', 2, 1, '2023-10-26 20:52:03');
INSERT INTO `tbl_login` VALUES (2, 'Deni Priatna', 'denidani33@gmail.com', 'Chibi_Anime.jpeg', '$2y$10$lVwdJ6vcGdNuFgxGfeBMX.Av74jvxPlPRuLYmiJgAHZCNKNbahVgS', 1, 1, '2023-11-01 22:37:57');
INSERT INTO `tbl_login` VALUES (8, 'Deni', 'snapzone33@gmail.com', 'default.jpg', '$2y$10$DJ4T6MJCt9OgKUc/bhaFn.juL1ah8ygpEYbZWareLKc73laCCWE4.', 2, 1, '2023-11-03 19:51:21');

-- ----------------------------
-- Table structure for tbl_login_access_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login_access_menu`;
CREATE TABLE `tbl_login_access_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NULL DEFAULT NULL,
  `menu_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_login_access_menu
-- ----------------------------
INSERT INTO `tbl_login_access_menu` VALUES (1, 1, 1);
INSERT INTO `tbl_login_access_menu` VALUES (3, 2, 2);
INSERT INTO `tbl_login_access_menu` VALUES (5, 3, 3);
INSERT INTO `tbl_login_access_menu` VALUES (18, 1, 2);
INSERT INTO `tbl_login_access_menu` VALUES (20, 1, 3);
INSERT INTO `tbl_login_access_menu` VALUES (21, 1, 4);
INSERT INTO `tbl_login_access_menu` VALUES (22, 2, 4);

-- ----------------------------
-- Table structure for tbl_login_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login_menu`;
CREATE TABLE `tbl_login_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_login_menu
-- ----------------------------
INSERT INTO `tbl_login_menu` VALUES (1, 'Admin');
INSERT INTO `tbl_login_menu` VALUES (2, 'User');
INSERT INTO `tbl_login_menu` VALUES (3, 'Menu');
INSERT INTO `tbl_login_menu` VALUES (4, 'Crud');

-- ----------------------------
-- Table structure for tbl_login_role
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login_role`;
CREATE TABLE `tbl_login_role`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `role` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_login_role
-- ----------------------------
INSERT INTO `tbl_login_role` VALUES (1, 'Administrator');
INSERT INTO `tbl_login_role` VALUES (2, 'Member');

-- ----------------------------
-- Table structure for tbl_login_sub_menu
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login_sub_menu`;
CREATE TABLE `tbl_login_sub_menu`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `menu_id` int NULL DEFAULT NULL,
  `title` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `icon` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `is_active` int NULL DEFAULT NULL,
  `urutan` int NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_login_sub_menu
-- ----------------------------
INSERT INTO `tbl_login_sub_menu` VALUES (1, 1, 'Dashnoard', 'admin', 'mdi mdi-av-timer', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (2, 2, 'My Profile', 'user', 'mdi mdi-account-multiple', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (3, 3, 'Menu Management', 'menu', 'far fa-list-alt', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (4, 2, 'Edit Profile', 'user/edit', 'mdi mdi-pencil-box-outline', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (5, 3, 'Submenu Management', 'menu/submenu', 'far fa-list-alt', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (7, 1, 'Role', 'admin/role', 'mdi mdi-account-star-variant', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (8, 2, 'Change Password', 'user/changepassword', 'mdi mdi-account-key', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (9, 4, 'Crud V1', 'crud/crud_v1', 'mdi mdi-adjust', 1, 1);
INSERT INTO `tbl_login_sub_menu` VALUES (10, 4, 'Crud Ajax v1', 'crud/crud_ajax_v1', 'mdi mdi-adjust', 1, 5);
INSERT INTO `tbl_login_sub_menu` VALUES (11, 4, 'Crud Serverside V1', 'crud/crud_serverside_v1', 'mdi mdi-adjust', 1, 10);
INSERT INTO `tbl_login_sub_menu` VALUES (12, 4, 'Crud Ajax v2', 'crud/crud_ajax_v2', 'mdi mdi-adjust', 1, 6);
INSERT INTO `tbl_login_sub_menu` VALUES (16, 4, 'Crud Serverside V2', 'crud/crud_serverside_v2', 'mdi mdi-adjust', 1, 11);
INSERT INTO `tbl_login_sub_menu` VALUES (17, 4, 'Crud V2', 'crud/crud_v2', 'mdi mdi-adjust', 1, 2);
INSERT INTO `tbl_login_sub_menu` VALUES (21, 4, 'Crud Multiple V1', 'crud/crud_multiple_v1', 'mdi mdi-adjust', 1, 12);
INSERT INTO `tbl_login_sub_menu` VALUES (22, 4, 'Crud Multiple V2', 'crud/crud_multiple_v2', 'mdi mdi-adjust', 1, 13);
INSERT INTO `tbl_login_sub_menu` VALUES (23, 4, 'Crud Serverside V3', 'crud/crud_serverside_v3', 'mdi mdi-adjust', 1, 12);

-- ----------------------------
-- Table structure for tbl_login_token
-- ----------------------------
DROP TABLE IF EXISTS `tbl_login_token`;
CREATE TABLE `tbl_login_token`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `token` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_login_token
-- ----------------------------
INSERT INTO `tbl_login_token` VALUES (8, 'snapzone33@gmail.com', 'qohDC1D10Fhdr5GAlmSvwf4QMm8Z0WmI29qeiHuYT5s=', '2023-11-03 13:31:59');
INSERT INTO `tbl_login_token` VALUES (9, 'snapzone33@gmail.com', 'RUvn9/dSdV7j9k5LV7NOg7QKqhR2/xukEyafcg5jAO8=', '2023-11-03 13:50:36');

-- ----------------------------
-- Table structure for tbl_mahasiswa
-- ----------------------------
DROP TABLE IF EXISTS `tbl_mahasiswa`;
CREATE TABLE `tbl_mahasiswa`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nik` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `jurusan` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1076 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of tbl_mahasiswa
-- ----------------------------
INSERT INTO `tbl_mahasiswa` VALUES (1, 'Dani N N', '111', 'dani@gmail.com', 'Teknik Planologi');
INSERT INTO `tbl_mahasiswa` VALUES (2, 'Zero', '000', 'Zero@yahoo.com', 'Teknik Lingkungan');
INSERT INTO `tbl_mahasiswa` VALUES (3, 'Twice', '222', 'one@outlook.comTwice', 'Teknik Pangan');
INSERT INTO `tbl_mahasiswa` VALUES (4, 'Budi', '87878', 'Budi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (21, 'Chu', 'jFjlbvAem8', 'ccy3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (23, 'dC5s2jDniC', '455OkYJ2VD', 'tinwingfo@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (24, 'crxe4CKARK', 'tPQgvCxEAa', 'mxiu@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (25, 'ruAbu6b0wq', 'YW9k6hrZJ2', 'ziyixu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (27, 'Dvfn5Daqv7', 'xuhJx8mSIJ', 'jiang1993@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (28, 'DTGWBMWIhT', 'cxjoW6866i', 'seiko514@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (29, '5OmrUSefor', '0jDchwStuW', 'uchidai@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (30, 'XE0ptrMQbR', 'VI1DKMr7Eh', 'edith515@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (31, 'GOMvcWMaIT', '3dRu9JlBrE', 'wingsuen807@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (32, 'FbIe8lXaUT', 'X25mcfHPcT', 'jphill@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (33, 'lUdCgk7OKC', '8FcfCGzpRo', 'gongxiuying1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (34, 'vDmgnXAgih', 'ZQCGgUGt1z', 'gvasquez518@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (35, 'wqsQZB1EWm', 'lA01dmDX7y', 'twyue@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (36, '9mmzhgQjwR', 'F06hjmXY0K', 'cming87@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (37, 'gi1Gq3pwJn', 'UFqVye4pwB', 'manqi@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (38, 'OLGS828Vmh', '8MNTXY8Sgh', 'chribake@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (39, 'leI8Wj68WR', '9o0gXMDXmS', 'fan1948@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (40, 'RVWnBievnw', 'MOVXvfFy5c', 'hicks9@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (41, 'KfTOGVWJSp', 'ArjSqdMzdf', 'kkchan821@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (42, 'NQHF9Hc5qI', 'AW2XFhnFSH', 'jihu11@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (43, 'VCLwdy4wnt', 'PeJhucJiTn', 'hanata@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (44, 'HFIv1tJgyw', 'dtMwxMLRRy', 'aitsu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (45, 'xHO5BCwnh9', 'o5lIDbzNML', 'yue801@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (46, 'Vf5VUxs4jw', 'UNhhTb3AsL', 'kojimashino@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (47, '3OYIhOBSsC', 'MkyI0R5kka', 'minato719@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (48, 'LKQyh5E88g', 'C7CD5pVj4r', 'wongwaisan1975@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (49, 'AfKLcqHyVo', 'Zvlj2Zhx5K', 'saitha@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (50, 'up6Bj9AML5', '2o8HPKA0gS', 'zhangzhennan@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (51, 'ctsNYHqdgo', 'rSGEO7Y1sy', 'adamssheil@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (52, 'T9sZTyINIV', '0FmFgY8O3r', 'airikono818@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (53, 'fQcA34CZQO', 'qlVryZDE2K', 'sp71@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (54, '4oj5wQuu5j', 'hJv8OyZNho', 'chan46@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (55, '44JX6grZLP', 'n1OiwoikCo', 'saitokazu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (57, 'voCY6UF4Yb', 'pZ3X6thuWV', 'ayatofujiwara402@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (60, '5q9wkwSI0Q', '3dNbxUNZyg', 'waisan09@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (61, '2o1QEBE6wr', 'HLgFGdirrp', 'liaocy206@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (62, 'AvYEzkgBqd', 'ZuZ8YTKuKQ', 'yamendo@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (63, '5IssykpPzO', 'n9HVFR3m76', 'ldann610@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (64, '7djp60bAqf', 'U8MOMWDTYQ', 'lu5@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (65, 'Tzx780FbK1', 'Ljv4c5Tt2i', 'kwanwaiy@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (66, 'oskj5QZBYx', 'HiLCyBpeho', 'longjuan@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (67, 'zWf2BC3Ktx', 'VvHn3eTj7a', 'lam98@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (68, 'eshWVf62rr', 'z4AChUw6o5', 'zhiyuan08@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (69, 'JzrbqkkJgb', 'IdUrEGaR3E', 'yunfat10@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (70, 'Tku2pIntcn', 'uUd8PISLgD', 'hina7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (71, 'Fk9behDv6m', 'OuVY87CxoJ', 'lan08@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (72, 'bpxhSo8Xae', 'eLPRaljBuT', 'robertsheather92@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (73, 'DmhWixmPU4', 'G04eodQhvB', 'dmende@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (74, 'U3mkUR97lb', 'TGxLFCpoLU', 'kwokyin1207@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (75, 'ILv4DcSjIe', 'nvHGWPbYGF', 'hkl@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (76, 'TOIi4oUm2r', 'nl60cKYSc2', 'misaki818@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (77, 'xPmPHBpc5H', 'PM3zf4dT4r', 'kamtc1@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (78, 'cBCqX6Hyqt', 'jyQuwwWJzV', 'travisdavis@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (79, 'k6wRGGYAK8', 'ZwxNVdFWtu', 'xzh@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (80, 'jeLXWZtKjJ', 'n7WLgcwSSZ', 'cartehenry526@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (81, '2OG7NqGdxl', '3VVy7JDzE4', 'dmill3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (82, '8tCYBzY0bY', 'WxXt5og7cf', 'hanab@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (83, 'cGgB7bE1CP', 'LDkRIGKvWx', 'westemily7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (84, 'e7G7sQwU47', 'w5HjNEEcOP', 'okmak04@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (85, 'k2peW6Iha2', 'xT0CuE5IIJ', 'siuhm@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (86, 'uNbzxSMf5y', 'vdMIJI3hYi', 'bshaw@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (87, '53jLsco4wS', '94h2nQciTg', 'mtro@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (88, 'RreByfk5Bp', 'JB53q73F5k', 'edwarj97@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (89, 'lHf2WNQGx5', 'bPJa5DDAom', 'simsean@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (90, '9ZUPtZMIuh', 'KIlwr7GJBT', 'develyn6@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (91, 'LcrHtqmqRs', 'tvUvObZrFR', 'ortiz728@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (92, 't6edn93HRK', 'EJCH2OAP92', 'airi99@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (93, 'TSYGIGgya1', '7BS8sTUIGO', 'zhongzi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (94, 'ISZRGUyPwL', 'GGW8tynQaf', 'suryan@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (95, 'vboemv3Zif', 'nXMmTMe58D', 'yami1212@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (96, '7KGYBQD3CZ', 'YLQ9q3Xyub', 'mmiu8@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (97, '4s2yDHa3tw', 'eHrmeav3L6', 'muratananami@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (98, 'OS96kuWq56', 'RdfxcNskKi', 'saaoshi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (99, 'gj1AdhfOr0', 'ne0MeXO6Wm', 'kysiu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (100, '4HtBENLgma', 'wyi5FYvrxT', 'hmying@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (101, 'PprtxPuDoc', 'jKq69ivRIN', 'hty8@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (102, 'GvoVCFggUB', 'wj6tIsxcPg', 'tsubasainoue520@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (103, 'wLrTufKttA', 'jF4XNXBG4k', 'gzitao@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (104, 'vHNZJ8eHKk', '1LuO9uOmZD', 'cstewart@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (105, 'XywaE44INL', 'tUQ4PVIGnf', 'lwingsze10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (106, 'dhgsfrDy0U', 'vZtbNSuZ2X', 'yuitookada@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (107, 'IYGaZX8aIG', 'g9jhjFeTxm', 'yuehoyin@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (108, 'WK65m1RTa6', 'NPyPQLThyb', 'tsubasa47@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (109, 'S9dcB4GVps', 'ZdNepehD31', 'xionglu@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (110, 'x4cTouhTkE', 'PTYtk8gCxU', 'ellis@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (111, 'hvzRmQcv1s', '9XPI5gmwcp', 'spennathan224@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (112, 'oKYFRuD6dL', 'wQoU73jIeK', 'sanom@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (113, '7V3zrq45i7', 'W3WhngroFs', 'hikari7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (114, '3zNGgvPPhW', 'qyWDEdK52P', 'fujirena906@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (115, '1GcwvQKIoM', 'kKUUKFd1C2', 'heunwy@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (116, 'mC6faYEYqX', 'QwmSrOLcZU', 'sakufujiwara@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (117, 'YcCz3SFiun', 'GedlLKMhDQ', 'marshallgrace@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (118, 'asvZREtrac', 'WPOd2u8SZ7', 'valewilson@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (119, 'KgiKPMu6Rw', 'swmQw2mKTL', 'lutang1027@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (120, 'Vq9BOejkSk', 'vDJJYfxKQr', 'yamyf227@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (121, 'SYspJjtcLI', 'WtRitOHU1I', 'lai3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (122, 'IqWF4jtpXZ', 'RnLsF0M1pv', 'seikoa@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (123, 'QYQSKLDzGl', 'ax8sHGXdxV', 'yanzhennan829@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (124, 'onnEWTaof4', 'yhWkdZ0xm1', 'cagr42@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (125, '7kuMGTjxUZ', 'irUGmAf2Qz', 'zhongxiuying3@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (126, 'dKBWhnddiw', 'I5DKBhes15', 'kai@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (127, '4gglPPVvbE', 'gGfNRAjloB', 'watanabeminato@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (128, 'OFGeZ9DKZT', 'p7zCEP2B4v', 'takwahka@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (129, 'SlzGeiQIfx', '4WPuIQoeaE', 'rmurata@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (130, 'oRfbURqtbb', 'dK6qDMclnu', 'myersbradley@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (131, 'dLwr76a7fa', 'ADd9MHeVHc', 'steka@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (132, 'r2FngGouMv', 'xZfVwVAbTv', 'changyunx@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (133, '1WE4oc4Ls9', 'Ydjp8medhU', 'haradarena@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (134, 'lLY4sXGA32', 'Dxgady1upJ', 'garzahaz324@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (135, '5m2AlXWDOc', 'MCIie3PLoa', 'zxu@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (136, '42Pnh8ceKo', 'BYmB3BTBXN', 'wsy@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (137, 'nxIyAKK5El', 'ZvJCYcCS68', 'anqi2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (138, '61QhB9MIgW', 'FwaFbU7yMu', 'waihanlo@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (139, 'Ged3l65RLD', '9O23mnUfvG', 'bobbycolem17@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (140, 'jy2bQX1wR2', '7JhlKnYbmp', 'eaor1989@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (141, 'aA8X4Jq3Wl', 'UtCqDpgM3A', 'yuito6@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (142, 'hJKmZuqDQb', 'z0ZagPA1Ew', 'tiwingsuen@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (143, '1zdAzQxupf', '4dYNmO8h7s', 'zcao@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (144, 'MUzHVZfFZh', 'c7Xl2WagsB', 'hernandezri306@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (145, 'cJb0kjYrjn', 'IzOyc4Xaw1', 'harrisondoris@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (146, 'P1Kkjh2MGd', 'pJ0ZTPXWpa', 'sphilip64@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (147, 'we6hytrKOG', 'jfyz4bUR1G', 'xiaxia@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (148, '5PcWjwR5m6', 'O9T7j5zxCx', 'onkay83@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (149, '0yiAL8W5WC', 'QnXNx13n4O', 'maguti@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (150, 'IJVBVRTN7R', 'MQBydJI6GN', 'milljuanita@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (151, '1xHAU5rkkP', 'rhe8gzcsfy', 'xurui1015@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (152, '8ZpTHeNSmW', 'reiI6bb05z', 'iwasaya@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (153, '3Yxi2Ahkvr', 'bYkc6YTIkC', 'laiyanta@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (154, 'PLRxO89159', 'sJwVCr2t6c', 'shannonross@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (155, '0WEkZD61o0', '2EffcRqSJ4', 'zitwang@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (156, 'oMH3CyxNea', 'Rsa8pFRXGJ', 'ruif806@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (157, '6rFB4vACR2', 'yN0ZMPsKJn', 'wkyeung48@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (158, 'VPrhZwZpAk', 'tAzooEktHR', 'zitazo7@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (159, 'osxdrix8ui', 'fVd2bJNpyW', 'morita604@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (160, 'ToD1mYx5jc', 'KrlZpGuzTs', 'xichang705@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (161, 'Xgvk1ZprHq', 'fCPcFYoWHi', 'rui44@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (162, 'Sy9KPjb2CE', 'hEk033aeGn', 'hinasakurai502@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (163, '5uWTGyNA3I', 'Kkf63dtMK0', 'yujia@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (164, 'l0yWN4dryq', '6rlopdM7QT', 'hasegawa43@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (165, 'ty5rqd4nYd', 'hf0CuO07WA', 'xialan5@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (166, 'UcG9zxpgOu', 'b9WbMeMN5U', 'airiim@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (167, '3woDvAnzcR', 'Kgu72HFI4y', 'luxu1115@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (168, 'OYRZwKwoqW', 'rxRnsqU5bk', 'rhazel@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (169, 'MYX6HasPtY', 'yXmH5EZ4as', 'zhouziyi2@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (170, 'zukURJ6oGa', 'VUC9PfJhUx', 'fukuda4@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (171, 'cHWBAfuRB5', 'tNomp2A6qm', 'tamura07@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (172, 'evN4mzyjtr', 'BNNREbOBmj', 'harui@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (173, 'LEPOAC4gPr', 'lNBNFGK8YS', 'kwokyin1949@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (174, '7sopeVU1rV', 'M0xR4jThMK', 'mf10@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (175, 'GsQ54iLWjH', 'j0sUqZWUVm', 'whitekyle@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (176, 'Wn8rGzztVn', 'xdgudxoLN8', 'fungtinwi@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (177, 'P1BaV4yhqi', 'Z9yJgVgD84', 'frederick130@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (178, 'me9268Tbl9', 'zzfXoRTu57', 'ragar@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (179, 'bjE6644hHf', 'LEwmskemOg', 'harryowens55@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (180, 'GOhJFAHi4h', 'qdfDWck7c4', 'kaneita@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (181, '8HVizlIJEP', 'e9NPcLLOs4', 'jbai@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (182, '6oafico5Pv', 'DhNNAOIlQe', 'auwf@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (183, 'G0q0VVailT', 'c746M12eSJ', 'yuito1969@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (184, 'T06ERIzyhm', 'g8p1EWh6W4', 'yoshiday@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (185, 'u4q3ef8Ca5', '5oNu511Tch', 'hinasuzuki@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (186, '5rVygdjZiL', 'rE4mh2UzjG', 'sanchezb2@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (187, '3oc9vCPf0v', 'hUVHkAnxli', 'wilson1222@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (188, '6759LoT7g5', '2mzdKEp3hL', 'rebecca4@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (189, '5FIy9uzsIm', 'OecwUv52L2', 'jialushe1995@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (190, 'fXGGR1sY1U', 'kbESC8GpVi', 'longsharo1@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (191, 'BvqQ9ACnKL', 'N3FqDujPkv', 'tong46@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (192, '199uIzkR1H', 'y3vdTkRYwk', 'paksm@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (193, '8dqMAtmpZD', '1hq98tiXit', 'evaherrera@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (194, 'so2mx2gdcH', 'oM42fJNjhR', 'houzita9@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (195, 'MGb2XnBTyO', 'lAALeN27v4', 'fernapa6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (196, 'xxJnA3vqXh', 'qtREthrJPN', 'masuda56@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (197, 'abnZF2sHSu', 'SyfriyqKnQ', 'lintong@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (198, 'ObE1NlFn92', 'dAcMsncXkV', 'yangy@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (199, 'WtcoYLCn0r', '3C6Atfs4j7', 'yuningyu@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (200, 'Xur2zi4DDi', '5AvTZpmep1', 'jamie12@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (201, 'KGoqL0NFJM', '0bUb5IXdi7', 'kikuchi1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (202, 'iSnxH2x6Qj', '1xjObRJOxp', 'jialujia@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (203, 'JsNFH160Bu', 'uiw4ENMKOH', 'kikri@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (204, 'WyJVi2rawR', 'NVqLQc7KuC', 'tkaito@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (205, 'VciRtKXOPO', 'fEYjppmpk8', 'jy8@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (206, 'Y8E4BwLHZO', 'jidGZrDxIs', 'he10@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (207, 'GUCFa9dXWX', 'U7w2gFfxGU', 'eva83@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (208, 'XjN1ozYK3u', 'IaeU2Otp3B', 'chiairi@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (209, 'Y1cTGGZNu3', 'u6og47zdIL', 'nakanotakuya8@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (210, 'mVbRKozDFR', 'NbARr7X2Ct', 'zhiyuanxu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (211, 'bCRUTxipy4', 'nEJioln1h0', 'yuningong@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (212, 'yfCzXXUWfn', 'FkrSUNKZES', 'kenakayama@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (213, 'XheGOKpFE9', 'sCWoANnHeq', 'peng2008@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (214, 'Bx4uEOnpm4', 'pBjVEkBTyd', 'bernardgrif@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (215, '5liP7IPULj', 'ePwo9Y8Jud', 'gu1@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (216, 'P7pYYPTHOm', 'o98Y8mdLB4', 'xzhou@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (217, 't34fHIQgGt', 'grI2qP85D2', 'zhanglan@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (218, 'WhTClcr4nu', 'y3I7c8OOIJ', 'dkimb49@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (219, 'p4DEXL9ejg', 'E7cmoaFSj0', 'yuniluo@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (220, 'zO0w0nWt9j', 'VfCFXjnKIn', 'terryhe6@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (221, 'OXEiQVZ8Ey', 'tzYeXacRNr', 'gerald1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (222, 'lZsZmdl3y7', '9DmDpZXqiV', 'laf@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (223, 'FiafMiDVhr', 'LwrNRPMPZm', 'tinlok8@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (224, 'V6Ys7PPUOY', 'AvdHHrg4xW', 'ziyid@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (225, '2tyMWF9zCg', 'B6bcY9fKlZ', 'nayato10@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (226, 'J1F9k7HynW', 'PHqtKIHivY', 'ywailam705@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (227, 'fY4QuG4Jsn', '0dj1QaKn2F', 'harrison2005@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (228, '6dC0vUinWS', 'fuM5207TI4', 'shenr@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (229, '0M6sJSaCh4', 'f5f0jaBw2g', 'kwchin4@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (230, 'XPeMDfmvUc', 'oJDP1K75Bn', 'yang10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (231, 'xqbzsbqEuG', 'CHPAA1oiwW', 'smyu4@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (232, 'wLk7kIARdb', 'wk5p5tooTV', 'nomdaichi@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (233, 'c0aWuwObi5', '7U7NxgeSpc', 'panxiuying1996@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (234, 'nc7h746mP7', 'MuBAzMZwb2', 'refuj79@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (235, 'cSnfqSs3Nq', 'YZY824z9Hc', 'xiaolan1210@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (236, 'QAYgCXn2ls', 'emMQqRBY1c', 'zourui319@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (237, '7TknD49s8u', 'op3RcUFtpc', 'lam16@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (238, 'D2TVBtu1LS', '3ElKxTT0ZB', 'ftammy82@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (239, 'w4mt5BG1lH', '9chIW3MmDc', 'jwalker1@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (240, 'OYQBKEKCIA', 'VisKJuqfPy', 'xiuycheng1117@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (241, '36Uajzxj6c', 'S7AYDG5lXc', 'shihantan@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (242, 'QFHwDOZAzh', 'ym5ZfGh3Q2', 'jiwu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (243, 'CtZslNkHby', 'NpME55SyF0', 'maisato603@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (244, 'VcvBpgweXv', 'bDi15bihag', 'ta3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (245, 'OjNaA6P0Dg', 'JNuzJR3EsI', 'laiyants526@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (246, 'eyqObPDD7j', 'ZxMltW2rRj', 'tcooper@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (247, 'ehsgB1PstC', 'U955Ivkk9L', 'mario111@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (248, 'rqRRkMnEqp', 'cwlZ3CF8pu', 'kwokyinle911@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (249, 'WPehgHOGlP', 'VArj8hj92Q', 'daiziyi2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (250, 's9jnRvD2H0', 'lPauWvyX9T', 'khu@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (251, '6jfr9Odb83', '7rNoGpPVgJ', 'gulu6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (252, 'tgByoK7ilq', 'ki8J0i904X', 'tszhinwong@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (253, 'NmhHCooLBI', 'tqtaNryzhB', 'yuto76@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (254, 'QAiJd424i7', 'UYt4aNOLLu', 'janqi@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (255, '9lwpgLCo9R', 'nWeXTQ0Jig', 'sc1029@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (256, 'csaEcefSEF', 'P6uXzHytDC', 'zhennanl1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (257, 'lu3l9ts9VX', 'npWQHwNUBp', 'tszchingha@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (258, '2LdigUbCxT', 'LKDM4OmdmQ', 'wingkuenk@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (259, '3u5xt8PmBI', 'PNRwhViRQa', 'clarence10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (260, 'RsD0nusbx8', 'Ho0GEp9F56', 'smfong72@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (261, 'ym4nzbPBgf', 'BLrAHEq2xJ', 'ziyiz@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (262, 'WgMf3HvYBC', 'xpQZQGAEbS', 'sc10@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (263, '1gtZ8lHVKX', 'Br3Xev0gxL', 'ueno10@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (264, 'jS6KqS7uvv', '6HBsbZDyhC', 'zliang@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (265, '8taNHgQF3c', 'mAw8ZUQell', 'weiy228@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (266, 'DXnn8PyJdO', '7xu7akSqNd', 'barnesra6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (267, 'RKI7i1xgrL', 'iQvifE8qOO', 'hayaoi@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (268, '17Fr21fQYK', 'mdFeZILL1W', 'porterjonathan@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (269, 'UTcHADIrdB', 'ucY2Tm6TeG', 'miit@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (270, 'dgSawVBwns', 'TOczMGtwgk', 'jialun1019@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (271, 'wotAvNv59y', 'qcDRmHZXav', 'shing1014@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (272, 'FP9P0h7Ckd', 'qp2rcMYO62', 'fanj8@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (273, 'sb2qlHIAmB', 'b8JmRuEL5H', 'darobertson@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (274, 'Su2bLLBL5i', 'p3h2rVOYub', 'gren@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (275, '2wYVtm9ccu', 'sSQi444PMh', 'rin207@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (276, 'ABDNCEF0vc', 'zWJU46YX93', 'xiuliao@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (277, '7aon3wtAYK', 'pIukBUtUOp', 'ziyi220@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (278, 'TEJGbh97ca', 'yRWzQhCGHu', 'krebecca@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (279, 'Ys8gEtGshx', 'rokWW5AUg4', 'ma510@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (280, 'iJwsY7GcPN', 'DKyVsOUv6t', 'zhennantao@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (281, '2UNgjQlsKd', 'koT1lHXAUB', 'reed503@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (282, '4mXjuauvSx', 'CIJuvbfCqs', 'kazumam6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (283, 'cfspX6ca43', 'qABfmp2ppc', 'karyanti@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (284, 'nClLdlfwni', '8jPaam0jLD', 'brandonj@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (285, 'khadNNvTh1', 'nmofdIguLM', 'sarad523@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (286, 'rjPGMB56xQ', 'xB6ySOTvJL', 'ny2@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (287, 'uOq98bxJUx', 'k4H0yxg5l1', 'shetc@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (288, 'q10b0lZxGR', 'j8nYaoC67H', 'takada9@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (289, '4BpZlJFCpz', 'bYK1Awa4yH', 'airmaeda123@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (290, 'ZFoVaJFYRz', 'Ef3TKYcJRn', 'mendezellen@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (291, '96giyCT8dw', 'q1fUOwUcaV', 'kalinau@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (292, 'tmkwr9xWy6', 'nyT3w5wOfj', 'jamto@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (293, 'IYnlzxbEN7', 'MJ3oJ38aK9', 'nakamorisa6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (294, 'LfaWZsLEKr', 'i3fzn6MWg2', 'wanqi@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (295, 'IgOjOLxTLN', 'iZXjP9ZQQg', 'cwyin@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (296, 'z2BahhtdF6', 'uglQvXw1eI', 'rjoh@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (297, 'iUUOjuDdfm', 'vglAeUFdwh', 'ono5@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (298, 'Ixvn6XJH61', '9OFkEKhOJe', 'fong89@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (299, 'EqCiy8zi0D', 'G9pmVYkECK', 'cuijiehong7@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (300, 'JFBPH9xn08', 'cpJVlMcSOV', 'okamotoyota912@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (301, 'Ro1xoIa7LJ', 'g6kkzFYkn7', 'michaelgran@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (302, 'IJynbSaOL2', 'KjhpyT01OT', 'jonathancook@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (303, 'KO6Hd7KlgO', 'WS7qkgKzDw', 'robinr716@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (304, 'mBzw6A5HMl', 'oH65Vq0kKu', 'yuning1999@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (305, 'qT4YT2ride', 'tCBZrohHW3', 'dixoe@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (306, 'yVtIZnnLg8', 'CJzbyO4Icu', 'yipsm@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (307, 'fESCeokECK', 'nzcNRdAG3P', 'lf96@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (308, '9OWl4dX7uP', '1f5y94i91X', 'chengz1993@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (309, 'BWsCOwVkfr', 'Hp3boasFLS', 'ss1954@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (310, 'd8PZBQG7ho', 'tFfrwYXsEX', 'yls5@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (311, 'gmZBgU9035', 'd0iwrnxO5y', 'saiairi@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (312, 'nCa1Otm8G4', 'nsWG2H07Bo', 'zhwei@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (313, 'hnbv6rV88N', 'Fh6dNFezjO', 'kazuyam2@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (314, 'JRJWytcLPY', 'wFdH3dmbgW', 'waisanma@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (315, 'zVv2aT4mpl', 'l1QQu1HuDt', 'lu92@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (316, 'BZlrAHet07', 'uffcOnD1yk', 'hiutunghui526@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (317, 'jJYiVnQrja', 'hn1Bsl4Yxi', 'wod@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (318, 'ZpnadxBfRE', 'Nb5Mzve6pr', 'wanqi@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (319, 'IEBZTrrdEi', 'PdQ3r1HQyt', 'yul1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (320, 'XwfZuDf61s', 'uy3xwdCi0P', 'wan308@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (321, '9li7A1pktX', '006pYam926', 'daanqi@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (322, 'ZNHBKU1CC2', 'evsxmZdpy3', 'romepamela10@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (323, 'NZvfYu0WKo', 'kw5xzA7ZG6', 'kwokming6@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (324, 'ti8DwJiilb', 'B3iarCAhIH', 'tianlu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (325, 'UeiKBN8pMN', 'h8MyQQ9PS1', 'chiehlunh@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (326, 'lOuxXHMskT', 'aE20UuZWaw', 'liaoly@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (327, 'jQnIDbLZI0', 'IBlCtNnnuc', 'suziyi404@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (328, 'L0F2ZsnUzZ', 'eYjylddku7', 'ayano5@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (329, 'MTL0ZMruvr', 'Ut52uz5475', 'kafaifong@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (330, 'Flkni3XweY', 'mkZMGITrk0', 'yunxi101@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (331, 'aAnYzgoxc7', 'VKM1fqA8Ji', 'tsfuji@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (332, 'TBL4K09KFu', 'V8Y8RJpkZz', 'henry00@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (333, 'LKsom1SBnE', 'qDFZxTsHp4', 'borachel1@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (334, 'BHTwhoU466', 'Z4LvnJQUFB', 'yeow09@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (335, '7Wxa4QLkhM', 'BEzW6crRSH', 'tam10@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (336, 'TP8lgeNMd2', 'sOK9NZMMeK', 'nommits1229@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (337, 'KFP8jjbo57', 's4fMosURpo', 'yeung53@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (338, 'nskYQK9OYY', 'Z3vcUDncuH', 'masano@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (339, 'jZWLSs3Dhg', 'MRBOzszMgp', 'misasato@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (340, 'wDjG2064zC', 'b76MAWv6rE', 'siuwaikam5@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (341, 'KZQJXywd2R', 'wRdmaK19Zn', 'clataylo@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (342, '0910DCMGgx', 'Shh37vS52x', 'zhenru@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (343, '3Z4rfI8l43', 'SnXFQyl27D', 'edhoward507@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (344, '5b1r5E3PtS', '3MDOBqcvBh', 'yaoxiuying@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (345, 'swuK3z35Li', 'EYzyXt68oq', 'kwcheung@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (346, 'h9jguG7EqJ', 'W4XTbYMjVs', 'lahy@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (347, 'oiI7GpU7nR', 'nb3OjTiMfT', 'anqimao204@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (348, 'XQDo1f5w2r', '6khjL9ekWw', 'juanfreeman@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (349, 'Bup0Mp8rjS', 'WM2BG6Sm0x', 'yungsauma421@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (350, 'HCvh6UpOns', 'n80PaSCNsZ', 'thtong6@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (351, 'f1Tt5qmUsJ', 'AetZvEbQX6', 'louis2@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (352, '0G8KXBoske', 'tGtsDAsTNL', 'leungcw@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (353, '1Kl4ddIjkj', 'fDjihFLLYl', 'mo8@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (354, 'ocx8jLN9Pr', 'b0ROlvL7N3', 'clarapeter1224@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (355, 'Wg2JPUJCfR', 'brZWCxyIi1', 'thelmag@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (356, 'KMKP0UuyIV', 'rjsolgPJfL', 'kasumi208@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (357, 'typ02mQAKE', 'nILPFoZCA0', 'anqixu67@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (358, 'p9KHWUtORm', 'pwM9G8aLoQ', 'shintszhin@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (359, 'EVOF9IbKrI', 'cZtWpnYI98', 'ylmok@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (360, 'HKuuprAMrR', 's0qQnQF4Ol', 'htt04@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (361, 'gU0VywpUP3', 'uSWeAtmTo4', 'xianqi@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (362, 'aUxOjJHurf', 'ciD345tzFH', 'eddjohnson402@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (363, 'lbzXICCJQ4', 'iSiQT4Nik1', 'maj10@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (365, 'NdmVp2hzWR', 'zrAPBEzlBv', 'wft@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (366, 'ZNohEe90GO', 'VXW6mucnfC', 'ziyyuan@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (367, 'TxbgIAh38w', 'PLFgQ01qpD', 'alanf@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (368, 'wDL06I8LvH', 'BK5Mx48PWJ', 'tanakayam217@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (369, 'TxDlGqbKfN', 'ij01fhXnUx', 'rosmatthew612@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (370, '3JjV8AGegV', 'TmmtNYFsWh', 'jiehong1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (371, 'mQGrGw5h8Q', 'en5m6mQFQX', 'smib@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (372, 'YBVJoQ4J3A', 'qgbfn3kvbT', 'cylai@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (373, '2VzlYj89RI', 'vDcwzm8K1p', 'ryuchida@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (374, 'XRENhN4pvN', 'KuAu6ljQGz', 'kam912@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (375, 'dvOTgq3s8L', '9VsHLJRv21', 'mendezja@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (376, 'Wr20I9yjHF', 'O7GAZwFs3M', 'misakgo@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (377, 'AI4pPODIai', 'vz39NvlHYQ', 'jiangy@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (378, 'ODxC5QYr7K', 'LPonaRLwMt', 'yy3@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (379, 'HhbsIDp7jF', 'p3EBHaOvnn', 'zitao713@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (380, 'MSgRYQ4qP6', 'BDatfdWXpN', 'kelong93@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (381, 'QIf3ysMrmC', 'iqYmPJuQgZ', 'douglas80@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (382, 'WHvcZJ50Ay', 'O4dUvecLtd', 'murataren307@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (383, 'uvlLNPnU8I', 'yFiCSRrwII', 'sugmits@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (384, 'wLtQmg3UI1', '3ePpAJxMxG', 'momoka304@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (385, 'Wuujl0kwCC', 'epZtpG01tK', 'anqixiao97@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (386, 'SGfKE9Vsjn', '3ph01l65ar', 'ryanm47@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (387, 'nul1PHmQkn', 'a7SKb6Elnr', 'siu1979@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (388, 'TDeF9KgHmC', '5m0VjslkJb', 'mioharad@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (389, 'iDnw0tgCW0', 'GLHOy5CJCi', 'waisan205@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (390, 'TcvHpH2S7D', 'EFDjiTUH4B', 'zhaorui00@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (391, 'reScWRw3jI', 'lvmirbRUdh', 'daisukeoka@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (392, 't79tPDjzrC', 'eucmlWcX1z', 'ziyitao@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (393, 'I90jJCRQBM', 'Zc6imUJEvk', 'xiaoming9@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (394, '6lnzltgbZV', 'T3tKs8iKZQ', 'chad5@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (395, 'PpheinRxIo', 'nPIv1Lnjst', 'ricea78@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (396, 'dh4MJI2WHD', 'WWHTP94sl0', 'twailam@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (397, '56P7NItMQE', 'ZTI03B5mTf', 'takedahina@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (398, 'cApUzZYzCs', 'mDkDKDQG0w', 'theodhar@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (399, 'FIzq5V9uz8', '1qnbzQvunT', 'gu20@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (400, 'HB3l12cplw', 'C38CeBTCOt', 'ryu97@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (401, 'ihHmvnSq06', 'iSZxG19xK5', 'ednaw126@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (402, '6ndNzhgIVS', 'f335rEl5Ny', 'jiehongha208@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (403, 'K8VdfelYuq', 'UQ8XJPpaY3', 'zhang325@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (404, '9nhl1ImrLv', 't1PJB2XBGs', 'fang6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (405, '694m5re79J', 'fbIRMQ39af', 'kentafuk@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (406, '6236fuFRHG', 'wSP3nLFg88', 'sk4@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (407, 'X6X499icHT', 'TWYIbJB3pf', 'guojialun1124@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (408, 'vBGtoSnkqy', 'QYqQUkLtPn', 'chiuwait@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (409, 'eQ6aAcdeFM', 'l3OMQDwo1O', 'cxiuy@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (410, 'YIHv68KBB5', '1nEJWdD4Y7', 'nafukuda705@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (411, 'YqgLdaVZBc', 'IBMpzKZRpb', 'tlche@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (412, 'LzWUr5n8je', 'JktVX2yiH4', 'manm@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (413, 'VQnW4PV1Rs', 'ceT6VciNdY', 'lan1@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (414, 'otp8MgMk2R', 'I4qDt2W9d7', 'hiranohana@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (415, 'yVZezZ88pf', '1xcavM5vJx', 'lulu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (416, '6Pp74vaBc9', 'OyQw6rTdK0', 'sukyewa@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (417, 'YVFSluFgYr', 'HbXi8ZbLQS', 'simpsel6@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (418, 'zODxIuHYxs', '3B5KEBO2pl', 'donald10@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (419, 'PebfHHLnv9', 'H2bNdH6j9j', 'jiehongyan914@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (420, 'oYtRjRAJeT', 'dwUmbsKRSk', 'porter19@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (421, 'XcP9MpMr9I', 'lHZG4aUjFr', 'hiantonio@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (422, 'aNrpytfe3R', 'o0p4g4wZhe', 'wangxiuyi9@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (423, 'j0tQ6BekqE', 'EphbDDe3zf', 'hoyinfon208@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (424, 'VUdgUKPCa2', 'CY7Gpzr9mF', 'hsuantc809@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (425, 'UCzWSIby7b', 'Eo09LInnKS', 'arimurakaito@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (426, 'gj35OKB75r', 'PQzEBjlkN8', 'kongz@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (427, 'Wm7D0g6gGz', 'GMVxGJob5J', 'alfmor1211@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (428, 'T6t106i9WR', 'nJQ7dfPTRv', 'wingfla3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (429, 'JciVtf8JDB', 'Tg7kCAwyfX', 'miyamhikari903@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (430, 'mAF0RQb4XR', 'XO0nZ9tWc6', 'wailamh@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (431, 'ceEg1OvEuC', 'b96oVlQBFL', 'yuwf09@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (432, 'jRHMlZUFd7', 'O2cwrcXivs', 'leung7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (433, 'qy6FPNPYVA', 'V446xUrveU', 'pang101@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (434, 'i8Wgw4ECuY', 'bS85k7It09', 'saumache2@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (435, 'AIvMxnkFUx', '9hdr0dSoYX', 'lcy1006@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (436, 'NgZotzUfnt', 'diPdPOiHqE', 'siukwokming@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (437, 'kTd7ixtGDv', 'u3tBWaMIi3', 'kakeungcheung@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (438, 'BrSAp19LCm', '9jTn9mnEIn', 'wingfatyau4@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (439, 'o5hiRMWCvX', '8YWGkOsCZp', 'jiehongyan@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (440, 'KxsdBG6Zpn', '9yRkpI8IUI', 'kkoyama10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (441, 'le9ZEYpXOw', 'YNFDd8oRHa', 'wep1104@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (442, 'cFl4dzxtaY', 'dvXNmQMWsP', 'morjes@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (443, 'AnoLASxmGG', 'l3E09cOsL6', 'chunyts1227@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (444, 'G1Je3Q5j4g', '4bEESRqm9j', 'ishiiryota@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (445, 'BjMQrhrUVn', '4sphnCLhwJ', 'fu1208@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (446, '1F3zYieVuF', 'KcsjfTRGvA', 'nakamuraryota00@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (447, 'yNd2rnDh2h', '76KjScqrMj', 'tongsm13@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (448, 'YnFmaW3TN8', 'l1eAfKkGxD', 'murj@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (449, '0s2AuDUjOt', 'cuMphJbU4T', 'stephensa7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (450, 'M7PAq1CT6U', 'b2Q9F15jhM', 'xushiha220@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (451, 'Jzxe0erg5K', 'x9ZS53NKKa', 'schmidtdon@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (452, 'yaNUMLt7Kc', 'ZgekTqYgdS', 'miu9@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (453, 'hzIFY4umgv', 'Q2NPaFXRMk', 'nmunoz1112@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (454, 'oQiimljUd5', 'zBLEGcaTbN', 'carmen1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (455, 'UowdY8VyXl', 'Lwz58CZ8XA', 'kylewal@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (456, '0fxCyoGG1C', 'YRwJ7Pjp4E', 'lu415@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (457, 'L5U7Wv5nAv', 'kQ9M6HWB4F', 'shimizumisak9@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (458, 'LOAs7zpYw4', '7dNDV4zzm9', 'tongcm611@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (459, 'Eo9dha7UwX', 'FT1TcFF0po', 'reyes2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (460, '6xSYGIGWqp', 'ytorIO5iQJ', 'ayatomae64@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (461, 'Mhs0niJOBX', '5tp8Uc2dk9', 'yikeda@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (462, '7kxOO3uHqc', '9aTgRPRCpq', 'okamotominato@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (463, 'sNv2lMKjKP', 'OM1YOhysH3', 'mmitsuki00@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (464, 'WFkVvxItSJ', 'xQrS2NN8nc', 'noguchihikar@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (465, '1m6Uihx0gE', 'QTmN1u9L9I', 'miguh@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (466, 'oN9M06OUqn', 'xuR1iKQrQy', 'waiman2@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (467, 'aoXHWlRFqz', 'eQimEvz1wR', 'hada6@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (468, 'gvYBKFUg2T', 'kTGwvZcIjh', 'jiqin@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (469, 'dagEeIHRKp', 'nU6072vUsc', 'zhouyun@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (470, 'GA97VEOaXo', 'qqiVkG7ICZ', 'belandrea207@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (471, 'P0M4GMzRL7', 'uGzg59rCQh', 'hkazu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (472, 'v4kfRNjkl5', 'OMJdVoBlVw', 'bjam83@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (473, 'Lu0H79bH8q', 'ypWkWxEPRr', 'kaming6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (474, 'dmxOJ7BA4P', 'dLqAHsNZaX', 'kao@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (475, 'qRKIIZ4iTl', 'I4VDhLEdhh', 'ayanoikeda@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (476, 'X4limqME2C', 'BRTIeySgRi', 'xiaomt@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (477, 'lD4MTJTKVK', 'dopJsXnK5b', 'wongsm208@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (478, 'szdzuUa6eJ', 'oyiRU9rYig', 'loyl75@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (479, 'rxHB95dU2q', 'xfs40bS4jd', 'taws7@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (480, '34lmtCIpRa', 'xfaQWVBdnv', 'kasumiuen3@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (481, 'aChuU9Xv1s', 'HqlGuQKFNL', 'hiutunglai9@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (482, 'YZrqyUvRXL', 'yvTWMCIWGr', 'tongkm5@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (483, '07UMuPwcn5', '3lFbvIOyB4', 'han413@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (484, 'xuQx8rPdf0', 'IUZ2tfdKeg', 'xiaru5@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (485, 'ztzff7T7P8', 'WcMhAdRO38', 'fexiuy@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (486, '8P8ZGDT7Ty', 'a2BPM7wAI7', 'hikarsakamoto@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (487, 'oHcBTdCFat', 'lx5zLtM9Z8', 'lai812@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (488, 'xa2CI8ziVU', 'LihzYEppeb', 'taoxia@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (489, 'ku31V4eGcI', 'ZUYcPWcSx2', 'ishka4@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (490, 'THQOL7M6HQ', 'qL4VQQ2ZGD', 'hayato@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (491, 'cVTcMXo9JZ', 'h5nZBarOFv', 'xye5@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (492, 'C147zvpjbk', 'QFaS0a04H1', 'hallsamue506@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (493, 'sHQLmSNtJl', '7Wfi9fqUvG', 'peter1@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (494, 'BbY1zXox18', 'U8iTTU65bU', 'jackson2@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (495, 'AphKiActCQ', '1D4FoEnPnV', 'yamadamomoe@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (496, 'nY48dIlY3A', 'uSh0wM5RoD', 'xiuying730@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (497, 'Pxwt68mcoX', '1XGkyMrrkT', 'jiak@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (498, 'z6PM6pwoxb', 'mGgBHyzuOa', 'mguz919@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (499, '0ThV09XMxv', 'wLLFnjp5Mm', 'fryota723@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (500, '3hT176HbBN', 'NQw3d7HeaK', 'miusei79@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (501, 'Xoj0U8gai0', 'A9dTl23OcN', 'shihash@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (502, 'zpjJ8S3xRs', 'd2f2agrALK', 'choyeem@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (503, '3JZzD1y0y7', 'yUTCIv2HaQ', 'tamura510@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (504, 'by4D9STiJV', 'pgkHjxpHtO', 'zhou1127@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (505, 'hHrlYULzKq', 'qN9VgFYE4C', 'xia1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (506, '4O7n2SBmso', 'ByYNl8nel4', 'murakamiriku904@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (507, 'xEXnzY2RWP', 'AvoY5PncsL', 'mabe831@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (508, 'wu5g0sTMEj', 'EjBmmiCpm9', 'ky9@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (509, 'TWucNRfwrP', 'QRCD6vTaaz', 'huimeitse926@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (510, 'uyYD6UWce5', 'Spuexr2bmX', 'lok9@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (511, 'eVZnfs3ioA', '5im3U80IBH', 'shihansun8@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (512, 'VX7s0Za9NW', 'qVoO084FYN', 'matamura9@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (513, 'kA6LUj2nqS', 'P1HoUQ2Bj6', 'xiuyingfu1105@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (514, 'Dx7We7u4k4', 'UzvHkLTXCB', 'pak5@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (515, 'huRRjLH2wO', 'GWkU8WrR57', 'inoue7@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (516, 'aVJxeN9OFW', 'g4zIxwsLDd', 'takada10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (517, 'G68ugdan2B', 'KTtSVL5oHf', 'wingyeu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (518, '8rU0lKBIOY', 'NWnm6fWuFF', 'ye2@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (519, 'Mbu1dk3tSz', 'koKgG1U8F8', 'chingwan59@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (520, 'U91ACxkyq6', '9YAGbucPGm', 'tishii@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (521, 'FYDya0nn9t', '0vpq42PL2N', 'zhangzhennan@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (522, 'UP3dfYzV3y', 'lbWGcB0Koi', 'kikuchiyuto@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (523, 'dLP911Ns86', 'Jk1qFpQD3H', 'yamitsuki@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (524, '5AIAEABryd', 'WFNnU5MmxG', 'ikkiando@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (525, 'JMASJ6Lmm0', 'IWtPx8NgA7', 'xiangzh@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (526, 'H5sX1PIpX0', '2wIOxEDEis', 'komits725@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (527, 'Isnt2uy375', '4g0TcDZD0F', 'delli@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (528, 'bzfd8IInQ0', 'fJvstI76LW', 'tszchingm@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (529, 'SC3Rryt4R6', '8PyIWehUWa', 'huangyunxi@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (530, 'WQutlpln6e', 'JnnWT7t2hn', 'mio3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (531, 'umoGiyPZFP', 'xhz3Zt8uXq', 'guolan@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (532, 'HFVXKyvQQw', 'Q7GPJlpGV3', 'waimanya3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (533, 'mAvF6oJeUg', 'eYKiwA2TKw', 'hsuanth@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (534, 'STyT4qBNiD', 'XQFqJp92kx', 'coodo@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (535, '8etCq4VoQr', 'ejYIO3NfuP', 'szekwan605@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (536, 'LtyPtHNAvX', 'RKVXvMz9yM', 'kwwm5@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (537, 'GdX06fFLYM', 'MWA4h9mNiS', 'saik10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (538, 'fgWWDC18Gb', '4TKkCvBouu', 'thy65@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (539, 'epLvulhNHj', 'zHAYduzJI2', 'waimancho823@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (540, 'xDYX0WtkKR', 'tTidUPMYIk', 'qian208@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (541, 'gbVUgivNpX', '7T3TQM2LBo', 'zhsong@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (542, 'G3nNORM41e', 'rym18kYlYS', 'lsshe@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (543, 'hp0SMlQN9H', 'C4EQVr8pre', 'szeyu82@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (544, '4uJrvUuGhw', 'GWszKozhfE', 'aguilarpatrick@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (545, 'at6bbuLZ1t', '4GC72BZv1W', 'shaxiuying@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (546, 'IglfzjJuMY', 'dBMsaPmVlv', 'wanda1030@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (547, 'rfWLBK6xoB', 'OMpmosUSXo', 'mjialu@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (548, 'wrXOmqUuW5', 'OB9arqMlUQ', 'chriyoun@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (549, 'J0pw79hJFM', 'yJzKu7UQ0R', 'onomom@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (550, 'dGxMdhYeOI', 'PXHEAHOEsn', 'lilldunn69@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (551, 'XlZYFnQKID', 'tRrlLdCXgL', 'js326@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (552, '8RZ2W1TYGd', 'qBIeUf5Slm', 'yunxi2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (553, 'qJAsC1jM7T', 'yghWMvXstR', 'abever2014@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (554, 'hjuNfqFMZq', 'M7eKwxj8R2', 'fengz@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (555, 'jsVYHyad3F', 'iho2iLbnve', 'wei1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (556, 'ciMRI2v1Dk', 'S1qyXkrv5C', 'miyazakihazuki@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (557, 'tcjDHte8Yk', 'lXNW48LWAq', 'risu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (558, 'zaEa4FIBKM', 'YOfGL4dNpV', 'hazukimasuda@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (559, '0b5nIp0NvO', 'V0BKjJhswg', 'tcfu@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (560, 'rEGLGNfWTQ', '0bYOaGemo0', 'michealhay623@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (561, 'DcM27xSt4Z', 'Z2QYjhfXKg', 'myers702@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (562, 'ucW5HlZfZp', '2TzX7J041k', 'kucy@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (563, 'J2T769J0pz', 'hdCVEmV5xe', 'nakano16@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (564, 'OI97Gjj3Vt', '5d1NGml2ss', 'deng5@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (565, '3s387j8t6J', 'PGPLOH7cQ0', 'yunshen@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (566, 'SRIMxUFDNU', 'QBINx0KocA', 'liksunfu@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (567, 'vbfSeeJESb', 'SOOtBOYq4e', 'siuszeyu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (568, '06PlFHTHid', 'pRDStt2Glo', 'shixiuying@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (569, '16UKbDYDpz', 'EI1SsPu7V0', 'mui911@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (570, '8Q8PVXtcdx', '6YRoLB7FXL', 'lz1975@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (571, 'jKvmXuaf6y', 'UwLt6Rf7l4', 'perne@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (572, '84gts1IjZD', 'ZfVuBrykUA', 'joycthompson409@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (573, '6eF9YSlPxf', 'ljDO707QEg', 'dunnway2@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (574, 'lehHSlRGeN', 'SbMEJqZIs2', 'randyr@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (575, 'UNhxnNZ1Lp', 'nBvYtkuTrU', 'micherodriguez@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (576, 'lYajsoRaCs', '2ZlO1TqQ9F', 'yin4@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (577, '3uoASyeOo9', '6tCNEI1M4R', 'tanakayuit@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (578, 'ckiEc3seVU', 'WNN1rQKDaO', 'lu526@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (579, 'JneLfFbPyO', 'jO3gjBvF5t', 'rui91@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (580, 'na3llVoE4q', '5g9yP2QQGA', 'lee2@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (581, 'yvdbFBg79w', 'M2BGECGDg1', 'jiangzhen@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (582, 'gObcm53xvr', 'LHZtPQcfRC', 'chunyu5@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (583, 'o6N1rrZQD3', 'NL7u4o9P91', 'yung@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (584, 'PeWpanYJfH', 'q70V6gLkOU', 'lawl@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (586, 'ne8o29b8DP', 'zeg1HWPNCW', 'satohikaru@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (587, '019LzLlnlo', '1HM3wxiBCX', 'tyuna@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (588, 'Gs31YEQewg', 'p1HwX104zf', 'ku930@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (589, 'oPxSOO64iG', 'dUcNEv13Nd', 'walter1@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (590, 'qGptcP1w64', '2kWJyTemRk', 'kmto@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (591, 'QjB0QYCtYq', 'Kxe0ZHQWmS', 'shima15@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (592, 'iOFk4SZzQi', 'agWw7JFX5c', 'yaj1979@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (593, 'cFpKhlJ9Vk', 'lgTFAnJZbR', 'aprstewart4@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (594, 'ghKXZ9sEDe', 'e2ejctwwpZ', 'xiuyingqiu@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (595, 'ERPL1uA06Z', 'H2sYM9pvA2', 'kaitomiy1967@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (596, 'VqvuDbeOxt', 'figO4sMAFn', 'takahashi2@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (597, 'ROvjHZWIVQ', 'WsR9QPRvMi', 'yulingkwok7@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (598, 'QsPdZmsuds', '3tk9j4ICGh', 'tsubasatakada@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (599, 'yxfSmTxz3O', 'UN7y3zNz9I', 'liang1106@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (600, '6s8qncDCDB', 'QM0ouT9GhT', 'tankwokwing68@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (601, 'AzmicAKBPB', 'VpomulD0at', 'waiman8@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (602, 'PLkU0ULMZg', 'ywJvwZDdOF', 'lako223@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (603, 'YymhcF6V94', 'AZS33rff7L', 'kwokkuenche6@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (604, 'b2DfR6gE1G', 'QpooIJG1oU', 'lowi@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (605, 'rDK2uZTE8s', 'QUCrT6cDRY', 'kaling806@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (606, 'VUED8jixXb', '84rnA82l2H', 'janqi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (607, 'ELDUAUxUWH', 'D6NrUS41DR', 'tang1024@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (608, 'CJYQOnAaaO', 'POsat3wZI1', 'zjiehong@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (609, '4I9bI92SEP', 'v9ivl2ujFA', 'patridavis45@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (610, 'eeNqobnxVy', 'ZebdegbSO9', 'waiyeeko55@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (611, 'RIvE8tUcO9', 'fuK03f80X7', 'soxiuying3@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (612, 'xZ0P73oXBY', '5aTnGYx6Td', 'hiraya125@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (613, 'ukJ7OucRPg', 'eKAy14buF3', 'nchiehlun@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (614, 'BXCp5sTCgU', 'RCINaFq6xc', 'wlche@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (615, 'AzdeyDbPIj', '8zpGPomnE2', 'gt7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (616, '5VWo7otWqa', 'A5pCVVDNBz', 'jialun67@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (617, 'dsFVtv4qoH', 'v9tm3mFcv6', 'lan417@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (618, 'hQmerdPbWv', 'oILfdCuN9K', 'lokwokyin@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (619, 'm8xYivPWsS', 'HTSvAIdr7J', 'joscott1014@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (620, 'OTcRTbmWfE', 'rhlreeQqDh', 'swl@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (621, 'UPK8xAI6G3', 'j3oXjDLxov', 'hashimotosara2007@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (622, '2JpBiclz6x', '2CsMX9li6K', 'yokoyama1963@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (623, '54h57KIlp4', 'cMooZEuKo6', 'kaito70@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (624, 'Xr5FROwKnN', 'CwwSHUQ51M', 'murrbet704@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (625, 'nxf8ZCbgZ8', 'f6LJ5ztdyt', 'jiawu7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (626, 'fu1tU69tCc', 'YLq4DmO7Tr', 'weiy@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (627, 'eIUWoH3HF3', 'PkOGdiRnsj', 'misakiha3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (628, 'F4M4Y0VNC9', '7qzsLgGj5L', 'sar8@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (629, 'TQibJgggrS', 'oG8A6ksK35', 'marthay@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (630, 'l64V2ohxIS', 'VQJDPz6Dey', 'hanl@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (631, 'xB9jwOsyRl', '4ZhDeoO3Af', 'tm67@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (632, 'W6IHv4s3to', 'PRNmR3b4TS', 'jesusjimenez@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (633, 'wDPiE7EDmc', 'XVtbZzShYU', 'seikono729@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (634, 'tKAGsQ77Ug', 'vUqwtfEKZA', 'shzitao@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (635, 'TkL4KPYhcs', 'KUYRmyB4NA', 'satokazuma@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (636, '1qYkKZL1NN', 'HtOU6t7O4M', 'morris2005@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (637, '11k9uijAtv', 'hZkt1u23Gj', 'webba@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (638, '2tkZ4CqAJQ', 'aW8aNyqIUt', 'msakai64@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (639, 'xS1SLBRvtv', 'bWNCCDYnsg', 'ferguson1945@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (640, 'QnMQPwp0Xs', 'll3ksBC7BI', 'anthphil@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (641, 'f2S5BRJexl', '4a0BVbc942', 'yeuntc@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (642, 'aGAvpzD2xO', 'VH3n899bgz', 'taniguchimio@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (643, 'LZEAUaiCH3', '6PGOGJ01oF', 'hsuan524@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (644, 'QUge5rmsZu', 'IJ8CCfjsWO', 'kmlok918@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (645, 'kCggDicyVZ', 'lRBpaYTktx', 'jeffw@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (646, '5la61B8WF0', 'MvkdRJ6T9S', 'kows@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (647, 'XWGAgxzPAo', 'DS19IsEjvO', 'lsk@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (648, 'z92Lm46zpW', 'aufKWjLFIO', 'eitasas2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (649, '2dXlZW4MkU', 'UiqXdLQcQ3', 'ysuzuki@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (650, 'SqOrE3m0vP', '0pCSLU1I5t', 'moritatsu@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (651, '73JAaOf0O1', 'wlIWYz73Wn', 'liyuning@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (652, 'V3eVvEVMMG', 'fPgRXuexGR', 'tanaka84@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (653, 'mkkRiv5UE5', 'AsnwA2FXpT', 'kowailam@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (654, 'URLNcrMVWi', 'Kr7ww2NgIS', 'mokkk@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (655, '0gmFCcnbiT', 'qbUbSaSjbo', 'hitakada@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (656, 'bJsqy3Ld8Q', 'T1K0UtAqFh', 'zhang47@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (657, 'QysFvFDuOX', '5F4y2D9l7q', 'ueryota7@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (658, '4OgIwvZuTI', 'NzqEkUYMaC', 'ruizhu@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (659, 'SPSlTa3mhI', 'g52t1aExWM', 'huimei720@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (660, 'Dwvfi4sfYk', 'acAKFhoYbO', 'takishida@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (661, 'bgY0hPnDq8', 'LiXkx1EN2A', 'rsarah@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (662, 'vpAqgo4jW2', 'coWScHq2Bf', 'fuziyi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (663, 'dOx9c6DyOX', 'QYjobKU73a', 'yuanyunxi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (664, 'eJIYCPdbks', '2Ui5wjJ0TM', 'yangyu5@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (665, 'sd1gweNvx2', 'yD16WEPHNM', 'ashleyhoward8@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (666, 'O0CHlmOPJf', 'sZ8u3WKsRS', 'dunndiana1979@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (667, 'MOHJSgky4Y', 'yItqTf3gIl', 'sharongardn@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (668, 'DfxStGw3LM', 'UeWd25IAa4', 'yuningyu8@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (669, 'vpJRogMisf', 'JOzhjUmn4C', 'tangliksun8@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (670, 'sZoTOTECDf', 'Cgh4RJMbjW', 'melissaw@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (671, '0WoCLdO2p5', 'rw7KwPdTcv', 'weish2@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (672, 'hr7YBCv9Vc', 'Is58IlSKyp', 'seikokoyama2@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (673, '2cJC70ELoK', 'rTWW0OPzez', 'ryanba@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (674, 'I77hwr9HaO', 'SeCjnx4ZX4', 'nanamiyamamoto@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (675, 'xKYE9sfrfI', '9UckxtIjuM', 'yauwf10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (676, 'UYhpfNms6e', 'aFszaHyKTg', 'christine223@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (677, '5Vo072X1PV', 'AEQ0UKm3fv', 'imai9@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (678, 'u4HzAW4mCJ', 'tPdFUBdi4V', 'sua@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (679, 'JOaT6IUsES', '9xNPLTrp5O', 'sanodaisuke90@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (680, 'qbhuRnn9bO', 'qKkJYz4uO1', 'weixiuy@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (681, 'MRhWSJlDn3', '8M5hFGKdOI', 'tian2@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (682, 'Cl6C0x2FKu', '1RXoEen52o', 'zitac@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (683, 'cdxhH6L7aw', 'tdxkNsgrOm', 'jamesflo1219@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (684, 'fchpaapFaH', 'Ra9EWzCMxF', 'yaoshih9@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (685, 'Umi4dnSRJ4', 'EWxgaRIHCL', 'jigu44@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (686, '1qw79rG8Aw', 'gMp6ucHxHJ', 'sab08@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (687, 'IZw4NYwjUC', 'UffSEmDuHo', 'walker8@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (688, 'nxdMbj4VUQ', 'cZa8daaP8z', 'howard1971@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (689, 'jpEb2Da2D7', 'Z1ilSmXpoH', 'mw220@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (690, 'cu35DARTH7', 'l7NB5CG6L9', 'ishikawa2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (691, '2iJV5tOyoP', 'sE9NcEtJMF', 'clleung@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (692, 'Ibip6LSaH9', 'uzjOy18MRV', 'medinajuli1214@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (693, 'pYmjfNpwpM', 'mfhbXjEyDK', 'lillian5@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (694, 'w5TYPQcdKE', 'BOVR03p72z', 'charlotteflores2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (695, 'R0IWrMwVU9', 'kcjgrkuef6', 'yuling214@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (696, 'hx6SLCTL6O', 'TMr0Kp5zny', 'cypang2011@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (697, '0zP0MmkdGN', '5ogBaFwGWt', 'kamancha8@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (698, 'rhVG2WcCko', 'ReqUA1Lsrt', 'okadren1951@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (699, 'DKgiOgX1Pw', 'ORLNHZVvJT', 'hkm@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (700, 'TfngcIY2su', 'J6PyRGfZsh', 'roger88@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (701, 'ltWlOjmiof', 'xNPAeXpa8l', 'jialun62@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (702, 'FKZdfoyVON', 'S1KYc7dw4o', 'kwoszeyu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (703, 'NxXjhSooVC', 'KDhu9TvH4z', 'shacampbell@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (704, 'ctEC2JxXxv', 'PpBeiX8dII', 'ay06@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (705, 'SYLRPiwSOD', 'BTqgvTCPBh', 'tokm93@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (706, '9VQrzSdqZw', '9Da8aNLclP', 'daniels1992@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (707, 'rXpF0zj9Te', 'Knqt0OjCX1', 'kathdiaz@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (708, 'Z4dt5wPp4m', '7yIOg8yhR1', 'chingyip@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (709, 'RmNi9GJ7Sy', 'i3tEq67Ute', 'bjerry@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (710, 'bJi6lIA7fb', 'LTxd6ifeT2', 'judith6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (711, 'UlWFq2TGeM', 'LvnsGPacTA', 'yamtingfung2017@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (712, '0ISY6nVUgI', '2a5gOjup6n', 'tsf@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (713, 'YfDaDQJlyd', 'cO6hmWugHt', 'kong8@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (714, 'wHGVQch8Pj', '5pUX9tjU0t', 'nichmills@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (715, 'IOK5PTs8e0', 'BbEZihgFTL', 'fernandez316@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (716, 'Ml9yfNLLAs', 'ZjkR6jXUri', 'shizitao@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (717, 'ZOZLWjfIcG', 'Zj9MCZRW7V', 'jesusw413@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (718, 'nMY3IHGiJ3', 'JI8zcTckFh', 'benjar@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (719, '66C9YKgJE9', 'Y4mTpLDxuc', 'renamiyazaki225@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (720, 'GFHh22Gfu4', 'tAYQ59yX7t', 'manwailam1983@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (721, 'hN4DfOEzOL', 'ZahWUQTK7G', 'george7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (722, 'n6hPnmEamx', 'zg1KFhSN1W', 'shinoand7@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (723, 'ex7s1GH4d7', 'SCYgQc4aOg', 'rkeith@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (724, 'br0a0hIbqo', '7pf7AsdndP', 'hico80@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (725, 'x5mKLA2Tkd', 'hb0aXA0Z1g', 'mtanaka@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (726, 'JQxJOtFevp', 'HUV0zhKa7d', 'jethel8@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (727, 'ekqa4nGgvb', 'KeXn7QsKp5', 'monakaj@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (728, 'N5SfqnFyBy', 'ViDkGFI1ww', 'har@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (729, 'cBb0zinSQu', 'CVn9tZQIKJ', 'tongsy6@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (730, 'PIPM6E5nAj', 'l7bq1pPGKa', 'wilsonanita810@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (731, 'VFAU75ZQV7', 'sjvTJpK0Tz', 'rink@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (732, '1Qnyyw2oRl', '0TfV2bgw2H', 'yokoyr@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (733, 'Aj7wCG1FN8', 'UKwJDCNN9i', 'webbray4@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (734, '2hOl8fRlPV', 'LFcca0kW21', 'palmervic930@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (735, 'roIj0A4oYZ', 'm3RgdEPFNa', 'miuk1980@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (736, 'YHJtOdKNiq', 'WRDZUgZeKM', 'llchin@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (737, 'wdiRZKLDQ7', 'aTszWqtJ11', 'rgot@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (738, 'AiwYcjTRZo', 'qx9AHt8xB0', 'ylchin@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (739, '9pQlyfTreO', 'wjQe2k2Vba', 'shihan81@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (740, 'rCUWfb2C9d', '6Sh2CfCsVE', 'whitegla08@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (741, 'geP1pes13J', 'ltHEvzGVrZ', 'liaosw@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (742, 'YOvyZUSpi6', 'gmGwEUZxnm', 'marjd04@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (743, 'pSe5oabh3W', 'xXk7d9WVot', 'fergusonam@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (744, 'UsIqofL2P5', 'FSmJwZvWe8', 'murpbryan@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (745, 'GV6IUipHD1', 'pBNSSBxwoW', 'ryokoyama2@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (746, 'VAlgl6BUEu', 'faNrmgDeje', 'bakerdeb@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (747, 'Aft76NC0Ca', 'crbHEATM9F', 'kyyu1224@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (748, '09iDMxeVpQ', 'LTkqrDlMjl', 'parkj909@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (749, '4DEilhH3v5', 'jPRGq7k8cV', 'manusimpson@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (750, 'iCXQ2fWgRF', 'EgmEVaFH6D', 'chiyuenyau2008@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (751, 'XapMX9ARiZ', 'g4c6ZsVF87', 'nishimurah@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (752, 'OkaQl6OKEa', 'sThzOCSzO7', 'hzh@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (753, 'Xk82tLFHFg', 'FOnLs5l2By', 'cuil@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (754, 'V0lK5VROuk', 'NHe9BI29ev', 'wei7@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (755, 'j0Ar9W4rIe', 'N2MrXXn7Mf', 'joe1008@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (756, 'NUW4nrKrer', 'gaItwMfJUS', 'monakamori@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (757, 'qvBd3LnMrj', 'vw7cLNfvsB', 'zhennan5@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (758, 'jlZTIhXkbs', 'vU1GFveCvk', 'yuyan7@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (759, 'MJngd2qFUe', 'Cu24LNMxbf', 'lxu@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (760, 'C3O4RwqTI0', 'RiVCZxoD21', 'payne1@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (761, 'KTvxMVrIZQ', 'nB3AJlzOuY', 'tith@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (762, 'Y67ZHocSGG', 'ZFjJ0xwkZJ', 'hananakamura@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (763, 'hXw5Djt6SN', 'FHjJWFc410', 'tam8@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (764, 'yd4r1vdkaG', 'iOZQT3aTIN', 'xiaoming622@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (765, 'ywvPLzhvMA', 'gaQT8qIOaP', 'zhz2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (766, 'mKotL3GDEA', 'Uhb3mIwZP2', 'panlu@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (767, 'JNPpLUoQw4', 'erkfVq2Peh', 'tlleu@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (768, 'tOcum4HsL6', 'ZdnKCbiVoS', 'shws@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (769, 'MzKDrwStcH', 'ijAnGl0WJx', 'yren7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (770, 'TTr364wIWB', 'hFwh81DHbo', 'itsuki1125@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (771, '6Kbnuh4B2G', 'HbHKWPSrpl', 'ishii1@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (772, '91KDSXoEDd', 'UBl0Vuygti', 'lz4@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (773, 'qpmkLKdHqT', 'TP0MAYgIGI', 'ogawahana@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (774, 'GmnhtzN6DP', 'Rc5xCh2tsC', 'ma707@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (775, 'r3SHlWJpeU', 'H77IZhJkyF', 'llu108@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (776, 'utUytNRA0S', 'tfifb95lcR', 'qziyi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (777, 'e8LYUOdZhb', 'F0Nxquhchy', 'sycheng@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (778, 'jMb3aPT2U2', 'xPcUlRWrhN', 'anqitao@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (779, 'qTPERRUeIK', '5nTEWq331L', 'guzmanj3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (780, 'y0yCmotu6L', 's2Sy11c9iH', 'leetinlok1943@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (781, '65DbH4FTML', 'UjEFa1WJVW', 'hkwokyin117@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (782, 'EHkK6uutGu', 'ga8BuuKPcN', 'bradleyrobertson@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (783, '9MdF2z2P9S', 'boPDsJ7p6C', 'miokud306@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (784, 'PzZr6vtH4O', '2YciwZytnV', 'fan1231@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (785, '4zxsrnEZ8u', 'EUsWfg2WTh', 'koowaiyee211@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (786, 'DsX9hNoUfv', '1UrXLRcDFN', 'mshsuan@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (787, '3C8gwelS5A', 'V5hFTqnwSU', 'kazumaic@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (788, '6eklAzAndP', 'TehSrypcip', 'sakai10@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (789, '7CPGTYR7P9', 'M222lJgR0s', 'lu4@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (790, 'wjwRR9uOkV', 'iZoI5P6uC2', 'lx58@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (791, 'rCjJuZoKdL', 'N1KHmbgAjG', 'daisy@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (792, 'PBNErwCXyZ', 'YBfgen6EfJ', 'nakayama8@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (793, 'Rh4D7379fP', 'hVQeh1XAx1', 'hikarinakamori@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (794, 'frrH3dNQjg', 'K0zgAvNNOA', 'tszhinkwong@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (795, 'xC49r6dwVU', 'fAxBFzMvua', 'sakura1107@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (796, 'vnnMxSluPs', 'yA5hOHrpr4', 'sarasas@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (797, '9za1Wcg7qT', 'EgGpVWOEYu', 'wfy@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (798, 'olzmlyaVEj', 'FK8Qll9AD1', 'tranjudy@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (799, 'Y0px6BB7ak', '4iXlAXUSg6', 'hinanoguchi920@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (800, 'rGunCPXAQE', 'RLRk62zCEF', 'tanla@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (801, 'p9M731lVKo', 'YWJH7iwL0U', 'joanne1109@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (802, 'hiQAk9Byng', '3yt1KoNFoi', 'wangy10@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (803, 'aAQx4WCNse', 'eaUpZ0BzTZ', 'xiong1954@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (804, 'g2Y9aIa6EA', 'MZwqKadYK0', 'liaofa@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (805, 'hFc6fu3NiX', '2nFB7jeyIW', 'ac86@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (806, '8XjeGrdgqi', 'hecrPf56eJ', 'leung44@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (807, '6kJzO6IEjg', 'Vt3ub7aDPS', 'thompsone806@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (808, '50559sPDZ9', 'LhcajrG1gq', 'chea@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (809, '4K9TO9wwqv', 'EkNajt9eED', 'gzhiyuan60@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (810, 'yFV2ZtSDtS', 'RWtFA8giF1', 'ramoska@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (811, '5YLMwQlK0E', 'chAkQ7jW2o', 'dom@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (812, 'XHbPe8jmT7', 'hqGC0H8cHD', 'ritaboyd@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (813, 'yMVWdIqjhY', 'j5Ocr6CBgH', 'shihan6@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (814, 'IYvPv70nVb', 'EzOKgJun3q', 'lulei@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (815, 'N1sI9nHJdV', 'piFIGr6GeI', 'ssakur@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (816, '0FfpxybhLe', 'iy9HraL6YI', 'wingsze90@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (817, 'ktV6ONlolN', 'OC9VTu9lCX', 'yoshidayama77@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (818, 'n6jBL22vew', 'DTCCkyK5PD', 'yulings721@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (819, 'boclh3vDHw', 'pN0BGmEKG8', 'wuziyi54@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (820, '2E8wz98Jdy', '7HKFV9zBGn', 'aykane@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (821, 'XkllIQ4dhk', 'n15iQsNwAd', 'shhik@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (822, 'L2dzP8Vyvc', 'ofa9HZz5wF', 'ebar@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (823, 'CSkfS0uEQz', 'pt3qsf00Is', 'jimenezba@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (824, 'QPbPopaVsf', '1Jx32eiVUH', 'htsit1@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (825, 'G8F7wsuK9m', 'k8m8NVJlBS', 'mjialun@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (826, 'K5Q8chmL1k', 'qIRdHeowfZ', 'freemrona@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (827, 'Tf24lg3wuA', 'qHAock9Jwu', 'yuning1@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (828, 'rh3r9t60rR', 'AXmhxkpHHL', 'yao43@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (829, 'jyr2cq3jNR', 'WraNb8tyTh', 'xiaomingzo4@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (830, 'D3aGM6EVjT', 'rZc6wyNm6U', 'bryantcarl@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (831, 'udfQgl9ckx', 'cqF88AI7Gg', 'coall@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (832, '8mEBv3mNCE', 'VwzbNB2nsY', 'kotakwah@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (833, 'wzEZPBJWcJ', 'gVWXEscWmw', 'sukyeetao4@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (834, 'G2783u5bww', 'l3haVQYxau', 'wang6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (835, 'BmMNS2s72z', 'dWf7v6q8Ao', 'wyyin@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (836, 'GHmnMwoXQQ', 'Q2qgSVKfNh', 'xuzhennan@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (837, 'UETZmYmP85', 'wGbEp4xs4i', 'turnerli9@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (838, 'Gwy3DMLEsS', 'wBEqzs3CPy', 'waimankong220@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (839, 'oHc6UwBCIX', 'NDrfT2z2LM', 'ts03@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (840, 'dFnjH63ogk', 'QPdmZFd2UZ', 'sifat5@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (841, 'cATQvFiAbH', '17BkVxrv56', 'pasze@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (842, '0XQ8lGXnGo', 'XJo9LditOw', 'juliehunter1031@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (843, '9PwcNnppky', 'BSc1dl3hxl', 'vasquez1124@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (844, 'JFX4v9IwxL', 'oPBGiwQHcT', 'kuchiehlun@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (845, 'KsBwgwBhpR', 'xd8J8UmfMb', 'teresaowen@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (846, 'SlsqLsXkWx', '36RtpxAm74', 'sakamotoy@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (847, '9n3RuyWPX1', '6sa76Xoax1', 'llha1122@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (848, 'pJLKCcFNhQ', 'PyD2EFnVK6', 'yunxqian@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (849, '6sR0UdoQUE', 'QtGI0R6kAP', 'kuly48@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (850, 'by5l5tjP9j', 'Gglpie2ERn', 'kato60@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (851, 'W6r5X1IM5e', 'AhSytXj9yG', 'kikuchihana@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (852, 'JZoraQxLH0', 'TbfDNQnPyw', 'liuzhiyuan2017@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (853, '1oFkDaQAyd', 'QJTI7nkWWR', 'jane41@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (854, 'FI5agVvjLB', 'L6fIsv6lJz', 'comarie@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (855, 'oNkhndw3mL', 'AIX5gpPy4v', 'choyeechow@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (856, 'QzmBHcUDz8', 'cWL1dlSyv9', 'tingfungkao@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (857, 'FrZpHeCrbE', 'eFYg2s9XTt', 'zhiyuanf@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (858, 'W3ew4NwFyq', 'c6UheZv3hA', 'lauhende@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (859, '0zshJ760CW', 'mPJmgSY2OW', 'kwhui@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (860, '0n6fomEksS', 'gZZHzFLMAV', 'hhi@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (861, 'PDORPPq6RO', 'v2cznwrQZg', 'tholeroy1971@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (862, '70R3DMCgG5', 'dg5hkCyJrk', 'lujiang73@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (863, 'vlStpXrfHY', '65Vk8azOLR', 'lam928@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (864, 'IneOc49Zd2', 'kmEB7xx7wV', 'woods7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (865, 'CLbVCaB9HL', 'ZfUVwTg60w', 'roberern415@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (866, 'GWftnQNPo2', 'f20SMbwe37', 'miyuito@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (867, 'VpdUFnril7', 'ZZU0Lmi1ri', 'miyamoto41@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (868, 'baFQaTwDoF', '2wB7IwMN3h', 'yy824@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (869, 'FvTeJlFpvj', 'rzA53r6sth', 'yunxizhang4@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (870, 'h1LPxCVleZ', 'b9CgcKCfOL', 'hsuayuling@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (871, 'hc0d03s4dl', '60mOLMepgZ', 'houj@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (872, '4z128QtMwq', 'UKnmMDRjjS', 'kuon5@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (873, 'DhwZmVdqHv', 'SIWijIthlR', 'dianat@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (874, 'gAGkuRweD1', 'riz0pCSwtb', 'imaitsubasa@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (875, 'MfFTU1dEBC', '4vh2RkjiTR', 'siuwaisan112@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (876, 'JV7531HWhI', 'Bj5uwhdszu', 'yhi@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (877, 'Q7OZAprTFa', 'LPCYn4P0oG', 'millern@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (878, 'yOjKrOq4SP', 'SJqBdOVTRx', 'kwokwingy@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (879, '1wdMCsycRn', 'pZ1sRkIfUH', 'eveschm7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (880, 'RkOLQoXG5Y', 'DEeQOIXIr3', 'aguilarjeremy805@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (881, 'd8nX44Gf64', '7zLhw4XC3X', 'sakurrin1970@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (882, '7aE59VwGQo', 'KHuyfYhcWO', 'muryota7@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (883, 'TCdg1em68j', 'qTor8ntrWL', 'aokimai@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (884, 'np6hNLtZXH', 'zhLjjfl0tr', 'matsudahi@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (885, 'HULlEa1Uss', 'nXkHmvFnDF', 'mingch227@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (886, 'nPtBTgC2Qe', 'HcY3RZiKC1', 'daisuke2@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (887, 'j4kdI3JMRh', 'vsMywt5Igc', 'phillwrig@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (888, 'w5NsRbbLFb', 'v4GmOX25Y2', 'jialuny@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (889, 'kzcx1OWCvJ', '3UX7GbRFKb', 'wingfat86@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (890, 'f5IqS2zHoU', 'VAvhzgifBa', 'yao6@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (891, 'O1pA5jFldD', '73CwZeMOvA', 'ak1023@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (892, 'qDTN22j8Jo', 'Vmd6fZtDHu', 'iwasakaito2@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (893, 'xVGT6rO6iI', 'fKGyf0BqFF', 'chz@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (894, 'xhTmdxBQRE', '0U6xeVbpYP', 'kimura7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (895, 'g5bxFpBPeO', 'e91N6l1c4H', 'wrighart@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (896, 'C0nqIJD4V2', 'SaosCQcFP3', 'twc58@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (897, 't0k6h3KuEa', 'DtiLGhFsuN', 'lilll@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (898, '7xiSxLLd1L', 'JUWROmahHb', 'lan1@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (899, 'KUZnM72oO1', 'mCMRGEm2FL', 'tintszching908@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (900, 'FpAAssNnxD', 'NCLHvGBuek', 'hsho@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (901, 'SzMVC94vKf', 'vuimG1FLzv', 'shihanl@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (902, 'J2ePiFtMCL', 'UyNfyzq7tS', 'michael4@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (903, 'zJVJqO8wb0', 'QaAtkGJUkl', 'kalinghan@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (904, 'alYbeBYXLm', 'D374tGfA76', 'duziy908@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (905, 'h9hWYGHw6t', 'xwMiQKIWRH', 'zitao1@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (906, 'gsuGPZ1IJU', 'Y94RChVotE', 'cmis@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (907, 'uB4V0LpbZ6', 'rfTdF2wBdt', 'ziyi6@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (908, '8RQejK74JX', 'htEOrKEp87', 'kwm@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (909, 'etUrgsTVtZ', 'W52UgeR5Hj', 'roses96@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (910, 'nWeGUunyBP', 'Bb9oE1h3Px', 'bryan503@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (911, 'gwOz7DFqjD', 'jl0nnTazjx', 'miyaik7@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (912, 'mcq5eFS0YJ', 'JkmI5knoxs', 'wingfat5@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (913, 'mcTr6aW53E', 'Fy5BCB68pI', 'ziyy5@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (914, '7NfY6GoRgK', 'ByuXJxDY7R', 'nakans9@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (915, 'MOrBWYu1u9', 'TfH3bYuwVr', 'sullita@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (916, 'FCLAmi5FJt', 'MONSn3R7qh', 'johnrobert101@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (917, 'drnP6ild8A', 'Ny0eHcJBfy', 'ayatokato@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (918, 'WslEvnU6BW', 'QcwnewCn5F', 'tinwing3@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (919, 'n9ClEqGOdh', '6vZ1LZOGQE', 'kyyue@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (920, 'lSKDuvIK28', 'ctNCtadMA0', 'lamkf67@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (921, 'DALdzGwmVo', 'ZYFBc2LDFP', 'tckon@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (922, '5igG4cPIWp', '6TbhzCXia1', 'russell82@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (923, 'Eij31JVSe2', 'HRqTbdKhBo', 'tsubasaabe65@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (924, 'EZ2oj0deL9', 'HqKASm9540', 'ramis808@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (925, 'waNiWPnxFg', '0UeQ8o1yFH', 'patelhenry@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (926, '1AfNLTNBzT', 'yXesJr5M5k', 'ngonkay@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (927, 'TRnqSfpNCE', 'fo8zkqeRDK', 'shel@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (928, 'LEEuDbTD8y', 'umddtxhyUl', 'hanakojima@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (929, 'wH6CyIg7OZ', '1U7AyOhuQ5', 'tifjones@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (930, 'A8UqiScm3R', 'DTMdq3zdCQ', 'weixiuy515@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (931, 'qMlSzzRSze', 'lEITQMco7w', 'rii126@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (932, 'X8vR79sKFD', 'Aj0SGWuhBt', 'shihaxiao@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (933, 'E5idlHHcBO', 'CsrVaqmcST', 'sd623@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (934, 'sUnizRvdzJ', 'ymuen5lmwA', 'sm1949@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (935, '4kZN7hHCWa', 'CbhyItcmyZ', 'siuwai42@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (936, 'bAznQhYieq', 'XW8ZBsombp', 'chuyunfat@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (937, '47DPyIZSUx', 'zIyU5hPZ2q', 'okmo@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (938, 'jGJc2BbDkc', 'EFxr0poG3z', 'hyuling@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (939, 'AMDgSPYspg', 'eKshut7gIO', 'lcy@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (940, 'L3Yyi5i5fz', 'E8FE1obUc8', 'koaki@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (941, 'J6RdlA4xnZ', 'krjeW8fKdw', 'wychan@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (942, 'Y8u4IGxbNb', 'OhOekpk91Q', 'daita@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (943, 'W8kr8pozC3', 'eCnRoa7HgY', 'fukudare@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (944, 'J3mbXPdz7J', 'VZxhm7yUge', 'zhangz@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (945, '6c6ON8xLhs', 'QbtDwrGXUr', 'gary831@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (946, 'G5pbHQ1gwL', '6ny4CjNsxm', 'hikoyam@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (947, 'PzBLACVzOX', '3lyECrK5FV', 'bakc@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (948, '69n6AGApTm', 'JqAW0eBs0Y', 'konosakura1998@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (949, 'P8mr74OVPF', 'REhEPwwPjn', 'nanami8@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (950, 'PImwmgpr7M', 'jq8qM9j28m', 'yungtc98@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (951, '9LeuS7bQhj', 'lsB7c7vJN7', 'kim215@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (952, 'N9Vd2exnkG', 'NsRoOfvUBb', 'dj709@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (953, 'Yb1K7PmXDE', 'aqwnMi2ShN', 'ayatomiyaz3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (954, 'UpfGk9ExFD', 'H1Ibbmv2S1', 'tongkaman@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (955, 'eQ8Lf6NwCw', 'Wu89IldBIV', 'kaocy@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (956, 'FRsZbkk5xZ', 'iEEAvtZs9R', 'nghy@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (957, 'lnJBVir26O', '92ZKZ2noyr', 'siu119@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (958, 'bfCrZhOvdL', 'ekREjhn9eb', 'anqi529@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (959, 'vqJE25jcZq', 'voUqkvsdH6', 'kakeung1117@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (960, '47nz8UCwfc', 'sl5xfAGyiX', 'kam1203@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (961, 'Yh17vJJwmH', 'KkqBwRo9Xu', 'pang4@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (962, '3BgLyZRPuF', 'PWimicrmGX', 'nicoleflores@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (963, '4VQ4fkETGQ', 'nz3C7lt4O9', 'chda@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (964, '1m2KVRvpyv', 'M6ViRy7KA5', 'ando827@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (965, 'uj9HDGvYQI', '1HGt54V1WS', 'fhazuki@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (966, 'KtyfyluD76', 'SG7WxPF3Tk', 'swchu54@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (967, '47uvWxV7iA', 'vDZgTS9vT0', 'airiy@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (968, 'FKQjnfiEXL', 'oPdOKsK82t', 'ziyide7@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (969, 'E8wwTZXzSP', 'oTfSKvQ3em', 'yamwingsuen@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (970, 'R86GfbmuJV', 'TGlMkkJTws', 'satoda@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (971, 'glq1ll2NK6', 'KtNDs1GKZp', 'colarry@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (972, 'jp90UnV3Xl', 'zAHxqhPgP1', 'sanchezirene@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (973, 'iEWF5vmeqZ', '6La5GkFnGc', 'clarkmarie@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (974, 'gthjeXSrBw', 'a0vWMmEDIx', 'zhxiaoming4@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (975, 'wFldmiGrzO', 'kSTGQarAc4', 'qiananqi9@hotmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (976, 'vcVrAz0v5S', 'OOgT1CbohW', 'mk9@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (977, 't13KVwXTtG', '0qhQ1zWpdD', 'xiongs3@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (978, 'r6ftBZSX0u', 'Q0BDAm4X2w', 'yintw1115@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (979, 'RgETOrGc8R', 'ufzUsKnSkd', 'uedah@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (980, 'QMxVuuA1PG', 'THLwGjnaCQ', 'yunxiq6@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (981, 'QvurO0esC6', 'hx2HYrtKVH', 'yamamoto1@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (982, 'HNRMqvXWNb', 'bxYIYsBnqV', 'lingling10@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (983, 'zyC7BvOTD0', 'pM2fDO6IfE', 'twf@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (984, 'hSkunxyz2E', 'Ampa2vmACq', 'hina2@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (985, 'b0g7fDkpER', 'nBuulJhliw', 'akikimura302@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (986, '6ulmHZBmvp', 'niqk08t6DL', 'xiaoming5@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (987, 'QptTpH6YBG', 'YapWsR4rvz', 'kasumi813@icloud.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (988, 'QsWSv4k28R', 'xOhbEv3AlW', 'ruixiong@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (989, 'NRUPHfaxq6', 'SHBip6iLNF', 'fujiitsubasa@outlook.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (991, 'JgAm1TbhoN', 'QKJ7OnBWWm', 'tokaling1231@mail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (992, 'xNJdPcNRJY', '9nzO6ggaUQ', 'longrui@yahoo.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (993, 'NjqE3aOCuD', 'l0XjIgQ2wE', 'fusumwing1988@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (994, 'OvRda1arHP', 'RZVImrCiYU', 'phylliski@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (1006, 'Deni', '000', 'denidani33@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (1007, 'Dani', '111', 'Dani@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (1008, 'Adam', '777', 'adam@gmail.com', 'Teknik Informatika');
INSERT INTO `tbl_mahasiswa` VALUES (1009, 'Wudi', '999', 'wudi@gmail.com', 'Teknik Mesin');
INSERT INTO `tbl_mahasiswa` VALUES (1010, 'Xiau', '888', 'xiau@gmai.com', 'Teknik Planologi');
INSERT INTO `tbl_mahasiswa` VALUES (1014, 'Xiau-Y', '666', 'xiau@gmai.com', 'Teknik Planologi');
INSERT INTO `tbl_mahasiswa` VALUES (1015, 'A2', '333', 'xiau@gmai.com', 'Teknik Planologi');
INSERT INTO `tbl_mahasiswa` VALUES (1053, 'A1 - QQ', '666', 'xiau@gmai.com', 'Teknik Planologi');

-- ----------------------------
-- Table structure for upload_files
-- ----------------------------
DROP TABLE IF EXISTS `upload_files`;
CREATE TABLE `upload_files`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `base_url` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `module_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `relation_field` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `relation_value` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `updated_at` timestamp(6) NULL DEFAULT NULL,
  `keterangan` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of upload_files
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
