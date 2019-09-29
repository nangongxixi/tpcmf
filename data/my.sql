CREATE TABLE `dj_notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `role_id` tinyint(2) DEFAULT NULL COMMENT '操作人角色ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人名称',
  `type` tinyint(255) DEFAULT NULL COMMENT '操作类型（详见配置）',
  `info_id` int(11) DEFAULT NULL COMMENT '信息ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  `is_read` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '是否阅读（1已读2未读）',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`),
  KEY `c_month` (`c_month`),
  KEY `c_year` (`c_year`),
  KEY `c_day` (`c_day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='消息通知';


CREATE TABLE `dj_record_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `role_id` tinyint(2) DEFAULT NULL COMMENT '操作人角色ID',
  `nickname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '操作人名称',
  `type` tinyint(255) DEFAULT NULL COMMENT '操作类型（详见配置）',
  `info_id` int(11) DEFAULT NULL COMMENT '信息ID',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '备注',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`),
  KEY `c_month` (`c_month`),
  KEY `c_year` (`c_year`),
  KEY `c_day` (`c_day`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='鼎健操作日志表';


CREATE TABLE `dj_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL COMMENT '操作人ID',
  `user_type` tinyint(2) DEFAULT NULL COMMENT '发送者身份（1客服，2客户）',
  `from_uid` int(11) DEFAULT NULL COMMENT '发送人UID',
  `content` text COLLATE utf8mb4_general_ci COMMENT '操作人角色ID',
  `type` tinyint(2) NOT NULL COMMENT '类型:1文字，2文件',
  `file_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL COMMENT '信息ID',
  `is_read` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '2' COMMENT '是否阅读（1已读2未读）',
  `c_month` int(11) DEFAULT NULL COMMENT '月份',
  `c_year` int(11) DEFAULT NULL COMMENT '年份',
  `c_day` date DEFAULT NULL COMMENT '年月日',
  `c_week` int(11) DEFAULT NULL COMMENT '一年的第几周',
  `create_time` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `uid` (`uid`) USING BTREE,
  KEY `type` (`type`),
  KEY `c_month` (`c_month`),
  KEY `c_day` (`c_day`),
  KEY `user_type` (`user_type`),
  KEY `from_uid` (`from_uid`)
) ENGINE=MyISAM AUTO_INCREMENT=52 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci ROW_FORMAT=DYNAMIC COMMENT='聊天记录';
