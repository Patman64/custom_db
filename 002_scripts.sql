-- 002_scripts.sql

-- Database: scripts
-- Tables affected: level_npc_items, level_npc_players
-- Description: table structures and data for the leveling NPC
-- Authors: Wolfy
-- Date: July 7th, 2011, July 29th, 2011 (r2), September 2nd, 2011 (r3), September 7th, 2011 (r4)
-- Changelog:
--  - r2: drop primary key from level_npc_players, change items to level 30 items, do not drop level_npc_players at each execution
--  - r3: additional options for the leveling NPC
--  - r4: new items for level 50

DROP TABLE IF EXISTS `level_npc_items`;
CREATE TABLE `level_npc_items` (
  `class` tinyint(3) NOT NULL,
  `itemId` mediumint(8) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

INSERT INTO level_npc_items VALUES
-- Warriors
(1,14849),
(1,12034),
(1,13066),
(1,14801),
(1,13067),
(1,8311),
(1,14846),
(1,10798),
(1,14850),
(1,14857),
(1,17713),
(1,12002),
(1,17766),
(1,13014),
(1,10838),
(1,1203),
(1,15291),
-- Paladins (non-holy)
(2,14849),
(2,12034),
(2,13066),
(2,14801),
(2,13067),
(2,8311),
(2,14846),
(2,10798),
(2,14850),
(2,14857),
(2,17713),
(2,12002),
(2,17766),
(2,13014),
(2,10835),
-- Hunters
(3,17767),
(3,12044),
(3,15628),
(3,14673),
(3,10784),
(3,17714),
(3,14802),
(3,14793),
(3,14786),
(3,8130),
(3,17713),
(3,12014),
(3,13059),
(3,13022),
-- Rogues
(4,9479),
(4,12044),
(4,17749),
(4,14673),
(4,17742),
(4,14672),
(4,8260),
(4,14674),
(4,8262),
(4,8256),
(4,17713),
(4,12014),
(4,12531),
(4,13035),
(4,15291),
-- Priests
(5,17715),
(5,17707),
(5,17732),
(5,14450),
(5,17050),
(5,14448),
(5,8249),
(5,14454),
(5,10807),
(5,14290),
(5,11990),
(5,11990),
(5,10844),
(5,17745),
-- Shamans (non-enhancement)
(7,13128),
(7,17707),
(7,8272),
(7,14450),
(7,10784),
(7,17714),
(7,8128),
(7,8268),
(7,8185),
(7,14794),
(7,11990),
(7,11990),
(7,17710),
(7,17718),
-- Mages
(8,17715),
(8,17707),
(8,17732),
(8,14450),
(8,17050),
(8,14448),
(8,8249),
(8,14454),
(8,10807),
(8,14290),
(8,11990),
(8,11990),
(8,10844),
(8,17745),
-- Warlocks
(9,17715),
(9,17707),
(9,17732),
(9,14450),
(9,17050),
(9,14448),
(9,8249),
(9,14454),
(9,10807),
(9,14290),
(9,11990),
(9,11990),
(9,10844),
(9,17745),
-- Druids (feral)
(10,9479),
(10,12044),
(10,17749),
(10,14673),
(10,17742),
(10,14672),
(10,8260),
(10,14674),
(10,8262),
(10,17728),
(10,17713),
(10,12014),
(10,13046),
-- Druids (non-feral)
(11,8261),
(11,17707),
(11,8263),
(11,14450),
(11,8349),
(11,15092),
(11,14666),
(11,8255),
(11,10842),
(11,13111),
(11,11990),
(11,11990),
(11,17710),
(11,17737),
-- Paladins (holy)
(12,13128),
(12,17707),
(12,11632),
(12,14450),
(12,14904),
(12,17714),
(12,8128),
(12,8268),
(12,8185),
(12,14794),
(12,11990),
(12,11990),
(12,17055),
(12,17718),
-- Shamans (enhancement)
(13,17767),
(13,12034),
(13,15628),
(13,14801),
(13,10784),
(13,17714),
(13,14802),
(13,14793),
(13,14786),
(13,8130),
(13,17713),
(13,12002),
(13,17766);

CREATE TABLE IF NOT EXISTS `level_npc_players` (
  `guid` int(11) NOT NULL COMMENT 'The player''s GUID'
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COMMENT='This table stores all players who have used the leveling NPC';

REPLACE INTO `gossip_texts` (`entry`, `content_default`, `content_loc1`, `content_loc2`, `content_loc3`, `content_loc4`, `content_loc5`, `content_loc6`, `content_loc7`, `content_loc8`, `comment`) VALUES
(-3999001, 'Sure, count me in!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_LEVEL'),
(-3999002, 'Sure, and I want to be feral!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_DRUID_FERAL'),
(-3999003, 'Yes, but I don''t want to be feral!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_DRUID_RESTO'),
(-3999004, 'Certainly, Gary.', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_TELEPORT'),
(-3999005, 'Sure, and I want to be holy specialized!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_PALA_HOLY'),
(-3999006, 'Yes, but I don''t want to be holy!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_PALA_NO_HOLY'),
(-3999007, 'Sure, and I want to be enhancement specialized!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_SHAM_ENH'),
(-3999008, 'Yes, but I don''t want to be enhancement!', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'npc_leveling OPTION_SHAM_NO_ENH');