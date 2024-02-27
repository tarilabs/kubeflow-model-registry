-- sandbox.Artifact definition

CREATE TABLE `Artifact` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `uri` text COLLATE utf8mb4_unicode_ci,
  `state` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time_since_epoch` bigint NOT NULL DEFAULT '0',
  `last_update_time_since_epoch` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_id` (`external_id`),
  UNIQUE KEY `UniqueArtifactTypeName` (`type_id`,`name`),
  KEY `idx_artifact_uri` (`uri`(255)),
  KEY `idx_artifact_create_time_since_epoch` (`create_time_since_epoch`),
  KEY `idx_artifact_last_update_time_since_epoch` (`last_update_time_since_epoch`),
  KEY `idx_artifact_external_id` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.ArtifactProperty definition

CREATE TABLE `ArtifactProperty` (
  `artifact_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_custom_property` tinyint(1) NOT NULL,
  `int_value` int DEFAULT NULL,
  `double_value` double DEFAULT NULL,
  `string_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `byte_value` mediumblob,
  `proto_value` mediumblob,
  `bool_value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`artifact_id`,`name`,`is_custom_property`),
  KEY `idx_artifact_property_int` (`name`,`is_custom_property`,`int_value`),
  KEY `idx_artifact_property_double` (`name`,`is_custom_property`,`double_value`),
  KEY `idx_artifact_property_string` (`name`,`is_custom_property`,`string_value`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.Association definition

CREATE TABLE `Association` (
  `id` int NOT NULL AUTO_INCREMENT,
  `context_id` int NOT NULL,
  `execution_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context_id` (`context_id`,`execution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.Attribution definition

CREATE TABLE `Attribution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `context_id` int NOT NULL,
  `artifact_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `context_id` (`context_id`,`artifact_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.Context definition

CREATE TABLE `Context` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time_since_epoch` bigint NOT NULL DEFAULT '0',
  `last_update_time_since_epoch` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `type_id` (`type_id`,`name`),
  UNIQUE KEY `external_id` (`external_id`),
  KEY `idx_context_create_time_since_epoch` (`create_time_since_epoch`),
  KEY `idx_context_last_update_time_since_epoch` (`last_update_time_since_epoch`),
  KEY `idx_context_external_id` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.ContextProperty definition

CREATE TABLE `ContextProperty` (
  `context_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_custom_property` tinyint(1) NOT NULL,
  `int_value` int DEFAULT NULL,
  `double_value` double DEFAULT NULL,
  `string_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `byte_value` mediumblob,
  `proto_value` mediumblob,
  `bool_value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`context_id`,`name`,`is_custom_property`),
  KEY `idx_context_property_int` (`name`,`is_custom_property`,`int_value`),
  KEY `idx_context_property_double` (`name`,`is_custom_property`,`double_value`),
  KEY `idx_context_property_string` (`name`,`is_custom_property`,`string_value`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.Event definition

CREATE TABLE `Event` (
  `id` int NOT NULL AUTO_INCREMENT,
  `artifact_id` int NOT NULL,
  `execution_id` int NOT NULL,
  `type` int NOT NULL,
  `milliseconds_since_epoch` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UniqueEvent` (`artifact_id`,`execution_id`,`type`),
  KEY `idx_event_execution_id` (`execution_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.EventPath definition

CREATE TABLE `EventPath` (
  `event_id` int NOT NULL,
  `is_index_step` tinyint(1) NOT NULL,
  `step_index` int DEFAULT NULL,
  `step_key` text COLLATE utf8mb4_unicode_ci,
  KEY `idx_eventpath_event_id` (`event_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.Execution definition

CREATE TABLE `Execution` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type_id` int NOT NULL,
  `last_known_state` int DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `create_time_since_epoch` bigint NOT NULL DEFAULT '0',
  `last_update_time_since_epoch` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_id` (`external_id`),
  UNIQUE KEY `UniqueExecutionTypeName` (`type_id`,`name`),
  KEY `idx_execution_create_time_since_epoch` (`create_time_since_epoch`),
  KEY `idx_execution_last_update_time_since_epoch` (`last_update_time_since_epoch`),
  KEY `idx_execution_external_id` (`external_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.ExecutionProperty definition

CREATE TABLE `ExecutionProperty` (
  `execution_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_custom_property` tinyint(1) NOT NULL,
  `int_value` int DEFAULT NULL,
  `double_value` double DEFAULT NULL,
  `string_value` mediumtext COLLATE utf8mb4_unicode_ci,
  `byte_value` mediumblob,
  `proto_value` mediumblob,
  `bool_value` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`execution_id`,`name`,`is_custom_property`),
  KEY `idx_execution_property_int` (`name`,`is_custom_property`,`int_value`),
  KEY `idx_execution_property_double` (`name`,`is_custom_property`,`double_value`),
  KEY `idx_execution_property_string` (`name`,`is_custom_property`,`string_value`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.MLMDEnv definition

CREATE TABLE `MLMDEnv` (
  `schema_version` int NOT NULL,
  PRIMARY KEY (`schema_version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.ParentContext definition

CREATE TABLE `ParentContext` (
  `context_id` int NOT NULL,
  `parent_context_id` int NOT NULL,
  PRIMARY KEY (`context_id`,`parent_context_id`),
  KEY `idx_parentcontext_parent_context_id` (`parent_context_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.ParentType definition

CREATE TABLE `ParentType` (
  `type_id` int NOT NULL,
  `parent_type_id` int NOT NULL,
  PRIMARY KEY (`type_id`,`parent_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.`Type` definition

CREATE TABLE `Type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_kind` tinyint(1) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `input_type` text COLLATE utf8mb4_unicode_ci,
  `output_type` text COLLATE utf8mb4_unicode_ci,
  `external_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `external_id` (`external_id`),
  KEY `idx_type_name` (`name`),
  KEY `idx_type_external_id` (`external_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- sandbox.TypeProperty definition

CREATE TABLE `TypeProperty` (
  `type_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `data_type` int DEFAULT NULL,
  PRIMARY KEY (`type_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
