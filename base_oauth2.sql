/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : base_oauth2

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 14/02/2019 18:20:39
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for oauth_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens`  (
  `access_token` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expires` timestamp(0) NOT NULL,
  `scope` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`access_token`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_access_tokens
-- ----------------------------
INSERT INTO `oauth_access_tokens` VALUES ('bbe03d31ee6bdb04be6e95e2599178390a7fe71e', 'xxkj', NULL, '2019-02-14 16:27:10', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0cf01fd3f34df73328485e617588160a5d95cd85', 'xxkj', NULL, '2019-02-14 16:39:17', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('bd3f7479eb68fe777c8c34ab09646dd558ec6ad6', 'xxkj', NULL, '2019-02-14 16:40:14', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('4bb3b38a09e9bfba261d6606e2e860a2441f268c', 'xxkj', NULL, '2019-02-14 16:42:33', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('5cfcb447e7c9f84fe02ed3650271f78a66cd0c40', 'xxkj', NULL, '2019-02-14 16:42:51', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('7177f1f2efda6e2175134d6a63696ad7a5716b7a', 'xxkj', NULL, '2019-02-14 16:43:08', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('2873b6b6f23e730f2ba48dd8c8b2fd0608f05df3', 'xxkj', NULL, '2019-02-14 16:43:40', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('563b893e48b2c47acf323a62379e5bfc412e0407', 'xxkj', NULL, '2019-02-14 16:44:08', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('ca2942309329cf31cbdcc704ae2a6bf0a9202305', 'xxkj', NULL, '2019-02-14 16:47:40', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('f5f2c6263e59d2d216630b483df435c77ca2f08c', 'xxkj', NULL, '2019-02-14 16:48:29', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('71575f7f1966fc47dbd9549ae9c781a5279b1153', 'xxkj', NULL, '2019-02-14 16:48:43', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('cb81eed39da31db8e4e82b6c3a4a8aa68b01a2cf', 'xxkj', NULL, '2019-02-14 16:49:19', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('af03ffdf1422fe8d2154563e2421b76dea39c408', 'xxkj', NULL, '2019-02-14 16:49:55', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('46c4eb86fe2b3a6d5072f57794010379fe90d6f4', 'xxkj', NULL, '2019-02-14 16:54:43', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('f9b58047e7dd51111672b1a93dbcfdf3b5c5f8db', 'xxkj', NULL, '2019-02-14 16:55:00', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('3ceba8aed833d9a292581405304b21e4925769d1', 'xxkj', NULL, '2019-02-14 16:55:30', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('a18c717570eca3a0a63bb794de34aad345e9f004', 'xxkj', NULL, '2019-02-14 16:55:41', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('181d71d8881a1f429e38b84689176b5f73abc37f', 'xxkj', NULL, '2019-02-14 16:57:15', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('f3f01ba9c1375ec782d7dc9cb0c607fe1baffbba', 'xxkj', NULL, '2019-02-14 17:01:02', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('08eb6d851e8f90a2a8c771898f76abf99da8e07d', 'xxkj', NULL, '2019-02-14 17:01:29', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0bf44565164295ec9acd3d1c1862e13a0c392e61', 'xxkj', NULL, '2019-02-14 17:03:33', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('668b63805a86f414fb7d83dcde9aea493baf6cce', 'xxkj', NULL, '2019-02-14 17:04:20', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0151138d0606ff835309f60a13b69d727a875496', 'xxkj', NULL, '2019-02-14 17:04:57', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('03c53a47358d0f62c6eb4e238383afc197b092da', 'xxkj', NULL, '2019-02-14 17:05:22', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('9697c24156d3fd08a959ab82aac0ce0891cb7d6b', 'xxkj', NULL, '2019-02-14 17:05:39', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('f156579ec956651397bf54d74f4ce802e8f1e62c', 'xxkj', NULL, '2019-02-14 17:06:25', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('ae557069a60b0593b7f43d13af69ee24ff809651', 'xxkj', NULL, '2019-02-14 17:08:55', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0c187b83be5faf50c8a62e53bca5859b0b993962', 'xxkj', NULL, '2019-02-14 17:09:33', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0981a0541924e9831026ac0186557ac25749ccad', 'xxkj', NULL, '2019-02-14 17:11:47', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('b244b64a38e2876596d2521ef61a8128fbfe5462', 'xxkj', NULL, '2019-02-14 17:15:45', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('5f25b68fa79379c4c1004072c35c8b48e430b62f', 'xxkj', NULL, '2019-02-14 17:16:17', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('a478ff3a04fe2c34c2425936ac9bc8fd2eb05575', 'xxkj', NULL, '2019-02-14 17:19:20', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('c094adceb5dbf32368ecd4c7f5c86984792605f3', 'xxkj', NULL, '2019-02-14 17:19:35', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('279e649ef8c7dcb4c7da1466f86b23fe11fc751b', 'xxkj', NULL, '2019-02-14 17:20:09', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('a973b5f4bd378273059733a0bf9b9805de5780fa', 'xxkj', NULL, '2019-02-14 17:20:52', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('f02fae6154cef1d35e25a903568b8a3b9c0ca819', 'xxkj', NULL, '2019-02-14 17:20:54', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('111588c79d1774106f2c88dd40dd67a670cc6fbb', 'xxkj', NULL, '2019-02-14 17:20:55', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('4203b4ab3563f02859e0d9ff9e6eaef84e13abca', 'xxkj', NULL, '2019-02-14 17:20:57', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0b1b7cd90488a251f70e7dfe0a5e858dc77cbca9', 'xxkj', NULL, '2019-02-14 17:20:59', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('7d7eb5ff7c1923f25b06f1eb463d4fcff1d6f6a6', 'xxkj', NULL, '2019-02-14 17:21:03', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('fe5fec95d60b71c0e1fea8e3266a3ee699f193e5', 'xxkj', NULL, '2019-02-14 17:21:28', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('27bc939076207b2ee306ebf7f6c9e412b5d8bafe', 'xxkj', NULL, '2019-02-14 17:22:43', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('dd254c72215e3fcf28ce6305b79eb2330b0691a2', 'xxkj', NULL, '2019-02-14 17:22:48', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('1484de4d1f6361fc76a9047bb7a2c247237ef47f', 'xxkj', NULL, '2019-02-14 17:23:48', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('9ee17b03f45d456dcd34e7ccefca394a3af53d70', 'xxkj', NULL, '2019-02-14 17:24:03', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('44170d330085ba62ab9147226e7e1935a31f35b6', 'xxkj', NULL, '2019-02-14 17:24:40', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('eab06748f28629248ed18fe805cd17e80cee57ad', 'xxkj', NULL, '2019-02-14 17:25:38', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('77a5415aa17fd99a123412a3d070776a4e596713', 'xxkj', NULL, '2019-02-14 17:28:22', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('b04c107bb021d4ae3fc1bb201d212af85f3d0975', 'xxkj', NULL, '2019-02-14 17:30:01', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('05e6af2c4b59a9de824fd05323b01dc80e09c4ae', 'xxkj', NULL, '2019-02-14 18:50:53', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('4e18c1d09f7bd680b05b6507a5225562ed784139', 'xxkj', NULL, '2019-02-14 19:04:50', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('0884c15d48c60636d295b8c48f887ea49b18e03d', 'xxkj', NULL, '2019-02-14 19:18:06', NULL);
INSERT INTO `oauth_access_tokens` VALUES ('842f6cb71e49ecfc4696e7bda0e6842793a7731e', 'xxkj', NULL, '2019-02-14 19:18:23', NULL);

-- ----------------------------
-- Table structure for oauth_authorization_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_authorization_codes`;
CREATE TABLE `oauth_authorization_codes`  (
  `authorization_code` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expires` timestamp(0) NOT NULL,
  `scope` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `id_token` varchar(1000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`authorization_code`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_authorization_codes
-- ----------------------------
INSERT INTO `oauth_authorization_codes` VALUES ('6d4953fe1739a5feb649afcfb881ff4d821bf7c5', 'xxkj', NULL, NULL, '2019-02-14 15:12:29', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('7249e18848b2976376eb97766752f89d0d580714', 'xxkj', NULL, NULL, '2019-02-14 15:10:56', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('f21418a266a4acef720c9f985d2d39e4ae075f45', 'xxkj', NULL, NULL, '2019-02-14 15:08:48', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('8c083dc09d8f7c5a45861a8554b67e37d2b808f8', 'xxkj', NULL, NULL, '2019-02-14 15:10:31', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('eae0fb047032f60ba90427504224ac560b15bfbc', 'xxkj', NULL, NULL, '2019-02-14 15:12:38', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('c3d594f26c6972a7479fc72d03cf68826bb274f4', 'xxkj', NULL, NULL, '2019-02-14 15:13:10', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('197333283389fc26952445c9985d428adf3405d5', 'xxkj', NULL, NULL, '2019-02-14 15:26:38', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('9179394e4cb84f690ac3854c92cb7170725935e1', 'xxkj', NULL, NULL, '2019-02-14 15:26:52', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('dd87377bdc4ff3d2624ba3ccc2eb06ab2fb522fa', 'xxkj', NULL, NULL, '2019-02-14 16:10:40', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('27d4b398fcfe2067f1ebdd6bfee2e4cf2e3375c1', 'xxkj', NULL, NULL, '2019-02-14 16:11:03', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('27eb055408732e29d1b4b027cb7c7022071ae195', 'xxkj', NULL, NULL, '2019-02-14 16:17:08', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('b8e8d0a7c3518119d85e6d3953521175f21940cd', 'xxkj', NULL, NULL, '2019-02-14 16:17:49', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('99c8240bd90b2adf3ffde250a4df1445e679f132', 'xxkj', NULL, NULL, '2019-02-14 16:18:28', NULL, NULL);
INSERT INTO `oauth_authorization_codes` VALUES ('dfb11852a4f1ba5379b3f3bb76e7f182e10e1a6b', 'xxkj', NULL, NULL, '2019-02-14 16:19:10', NULL, NULL);

-- ----------------------------
-- Table structure for oauth_clients
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients`  (
  `client_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_secret` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `redirect_uri` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `grant_types` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `scope` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `user_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`client_id`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_clients
-- ----------------------------
INSERT INTO `oauth_clients` VALUES ('xxkj', 'xxkjpass', 'http://test.fastadmin.com/', 'authorization_code', NULL, NULL);
INSERT INTO `oauth_clients` VALUES ('testclient', 'testpass', 'http://fake/', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for oauth_jwt
-- ----------------------------
DROP TABLE IF EXISTS `oauth_jwt`;
CREATE TABLE `oauth_jwt`  (
  `client_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `subject` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `public_key` varchar(2000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_refresh_tokens
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens`  (
  `refresh_token` varchar(40) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `client_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_id` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `expires` timestamp(0) NOT NULL,
  `scope` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  PRIMARY KEY (`refresh_token`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of oauth_refresh_tokens
-- ----------------------------
INSERT INTO `oauth_refresh_tokens` VALUES ('8225a26cc30a01292197bd315b7282efa9ae62c8', 'xxkj', NULL, '2019-02-28 15:27:10', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('28d260cff277928cf8c793045d78d5f0d5b3b11a', 'xxkj', NULL, '2019-02-28 15:39:17', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('639cd46d0f13712f8697545c731e023c2146f4b9', 'xxkj', NULL, '2019-02-28 15:40:14', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('324a79af49b18d135133d21b1deae071bc5c5425', 'xxkj', NULL, '2019-02-28 15:42:33', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('2f15f7e6451a741eaac4cacb6fe6c6e5cbf41912', 'xxkj', NULL, '2019-02-28 15:42:51', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('5d664fdc4ecc5035629fe645873cb20614445c70', 'xxkj', NULL, '2019-02-28 15:43:08', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('8e77dfac81012d1e4a731da64d8f30ec2b91f04b', 'xxkj', NULL, '2019-02-28 15:43:40', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('42982f074107db1963e6edac8f3609fa18690fb5', 'xxkj', NULL, '2019-02-28 15:44:08', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('d84d7b225132e84a741114605934c510180e7551', 'xxkj', NULL, '2019-02-28 15:47:40', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('3d2ecab6c0b34c1f2a4105dadd6de64746880ad6', 'xxkj', NULL, '2019-02-28 15:48:29', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('bc11c2a7f519c3351bedbd584a2f4a654d1b4186', 'xxkj', NULL, '2019-02-28 15:48:43', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('a7981344a221a2fdab37efff801d2ce9f4d201d6', 'xxkj', NULL, '2019-02-28 15:49:19', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('9d6a801b11a48c0db15e8bdb925d4c31b1486241', 'xxkj', NULL, '2019-02-28 15:49:55', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('44c7387c907e48d0a634ee4685e57b8f72958947', 'xxkj', NULL, '2019-02-28 15:54:43', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('1651510611b37981f34577486681a4226d7de34d', 'xxkj', NULL, '2019-02-28 15:55:00', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('21a52632d0a1a68dd9b5f852974facb452dd49dd', 'xxkj', NULL, '2019-02-28 15:55:30', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('2e53adc712140a7db3f67bb4c6bf4ea827e4718f', 'xxkj', NULL, '2019-02-28 15:55:41', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('3f1add452da6e7642123b95922aa95140bb0f0b1', 'xxkj', NULL, '2019-02-28 15:57:15', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('ce7f1d4d9c2efeb05661c3bc8cf801ad2dd9bfb1', 'xxkj', NULL, '2019-02-28 16:01:02', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('ad3521bb26677f87bc7f9847c61f1dc59a37b993', 'xxkj', NULL, '2019-02-28 16:01:29', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('ec3c0e5396ee5a29762de3eb8c7867ac7c327262', 'xxkj', NULL, '2019-02-28 16:03:33', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('f7bf789f2a03c34f210d0e8f904c2e586e3e0884', 'xxkj', NULL, '2019-02-28 16:04:20', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('a585065059caebf476897f7d067dccf78fa5d377', 'xxkj', NULL, '2019-02-28 16:04:57', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('429005c6be3012adc808a41629378ac7d6fb2a00', 'xxkj', NULL, '2019-02-28 16:05:22', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('acfe5b88ad067ae0f42fe03ba950889c4f7b722d', 'xxkj', NULL, '2019-02-28 16:05:39', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('936625b49bab2992653629e13e652575d7a9938e', 'xxkj', NULL, '2019-02-28 16:06:25', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('f80427d5b520e15059371b81991952736e5d7559', 'xxkj', NULL, '2019-02-28 16:08:55', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('8bbc24453db6a4d2fd7dab6ff956fd0b9efaa6b2', 'xxkj', NULL, '2019-02-28 16:09:33', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('062adc9c8b27d4bb9d2b519a70d13473f8f5b3a2', 'xxkj', NULL, '2019-02-28 16:11:47', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('b902365c88386beb8182cc326e96d973d33fd189', 'xxkj', NULL, '2019-02-28 16:15:45', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('bfde2cf715d8764721022749074dd2dc076b5158', 'xxkj', NULL, '2019-02-28 16:16:17', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('8f3dadef35e0e9bf4a1ef49a6433a2efd3fd5519', 'xxkj', NULL, '2019-02-28 16:19:20', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('b1ef8ef5087765191a856d0ffa092721199e3d8b', 'xxkj', NULL, '2019-02-28 16:19:35', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('fc40c276585f99a8224a5dbb73ee9a011e8d5957', 'xxkj', NULL, '2019-02-28 16:20:09', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('02b58c498a2624d6f916471180e183de653bc44f', 'xxkj', NULL, '2019-02-28 16:20:52', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('0e45f7c7fc34be5692d480316296069b53165c8d', 'xxkj', NULL, '2019-02-28 16:20:54', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('e8dd1e0a94d07baa6ba0543f367a77d11b12db1d', 'xxkj', NULL, '2019-02-28 16:20:55', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('86f0ed82bc1af6ff42ddab70bb3e5e2a3881cb50', 'xxkj', NULL, '2019-02-28 16:20:57', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('d1390725e7090b54dbee3637efae9efbc8e7f150', 'xxkj', NULL, '2019-02-28 16:20:59', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('def7d2ca3c484b3b3e92150753cb246b25412b14', 'xxkj', NULL, '2019-02-28 16:21:03', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('f54740a428b2474a6ee2b68513ef11c9113a78bd', 'xxkj', NULL, '2019-02-28 16:21:28', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('a314f1776c8526d7fc7e616f2eac7fae3e6ee275', 'xxkj', NULL, '2019-02-28 16:22:43', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('90bc327fc5350df42c5fbce90b8fb251146cfe78', 'xxkj', NULL, '2019-02-28 16:22:48', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('49a815ee6d6057093075642d4b177649038119e2', 'xxkj', NULL, '2019-02-28 16:23:48', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('15f010696e86da929434cb0160b60199fad63f8e', 'xxkj', NULL, '2019-02-28 16:24:03', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('0ecdd6d991d6ae0f9a096f55705954296fbcc222', 'xxkj', NULL, '2019-02-28 16:24:40', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('a5d0634558426aee327212fe963d32e41ef65143', 'xxkj', NULL, '2019-02-28 16:25:38', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('837fca70119da7123d2ab47a057d718781813fda', 'xxkj', NULL, '2019-02-28 16:28:22', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('418dc0519f730b74538eedfa798cb458880a62a9', 'xxkj', NULL, '2019-02-28 16:30:01', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('330933f0c7b68f4b1ea97daa85330d6a25c21351', 'xxkj', NULL, '2019-02-28 17:50:53', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('f6619f2516e5976a8fd13fca6f27a2d3ac111484', 'xxkj', NULL, '2019-02-28 18:04:50', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('a892b38eb32c4580da7a61a283be47b486ecaf35', 'xxkj', NULL, '2019-02-28 18:18:06', NULL);
INSERT INTO `oauth_refresh_tokens` VALUES ('66a334fa7fada43964ac3a9fe64120e77714f39b', 'xxkj', NULL, '2019-02-28 18:18:24', NULL);

-- ----------------------------
-- Table structure for oauth_scopes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_scopes`;
CREATE TABLE `oauth_scopes`  (
  `scope` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `is_default` tinyint(1) NULL DEFAULT NULL,
  PRIMARY KEY (`scope`) USING BTREE
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for oauth_users
-- ----------------------------
DROP TABLE IF EXISTS `oauth_users`;
CREATE TABLE `oauth_users`  (
  `username` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `password` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `first_name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `last_name` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email` varchar(80) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL,
  `email_verified` tinyint(1) NULL DEFAULT NULL,
  `scope` varchar(4000) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL
) ENGINE = MyISAM CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
