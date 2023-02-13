SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS `init_db_test`;
CREATE TABLE `init_db_test`  (
                                 `id` int NOT NULL,
                                 `text` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

INSERT INTO `init_db_test` VALUES (1, 'Initialize database successfully!');

SET FOREIGN_KEY_CHECKS = 1;
