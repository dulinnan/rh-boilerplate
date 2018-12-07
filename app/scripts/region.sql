/*
 Navicat Premium Data Transfer

 Source Server         : rh-db
 Source Server Type    : MySQL
 Source Server Version : 50640
 Source Host           : rh-holidays-db.cvaigtzmlayy.ap-northeast-1.rds.amazonaws.com:3306
 Source Schema         : rh

 Target Server Type    : MySQL
 Target Server Version : 50640
 File Encoding         : 65001

 Date: 01/12/2018 18:52:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for region
-- ----------------------------
DROP TABLE IF EXISTS `region`;
CREATE TABLE `region` (
  `region_id` int(10) NOT NULL AUTO_INCREMENT,
  `region_title` varchar(50) NOT NULL,
  `region_description` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`region_id`),
  UNIQUE KEY `region_id` (`region_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of region
-- ----------------------------
BEGIN;
INSERT INTO `region` VALUES (1, 'Northland', 'A region described as the \'winterless north\', with a sub-tropical climate.  Home to the beautiful Bay of Islands, transparent clear blue waters, deep fishing, majestic kauri forests, genuine Maori culture, historic sites and museums.');
INSERT INTO `region` VALUES (2, 'Auckland', 'The City of Sails, nested around the beautiful Hauraki Gulf. Auckland is the international gateway to New Zealand\'s North Island, and the country\'s largest city. ');
INSERT INTO `region` VALUES (3, 'Waikato/Waitomo', 'Lush, fertile green pastures and some of New Zealand\'s richest farmlands, the Waikato is home to a large thoroughbred industry and Waitomo glow worm caves. University city of Hamilton and the tree lined streets, antique and craft shops of Cambridge.');
INSERT INTO `region` VALUES (4, 'Bay of Plenty', 'Famous for its Kiwifruit and citrus orchards, idyllic climate, endless white sandy beaches, surf, game fishing, sun and plenty to do. Main lifestyle city, Tauranga. Rotorua, known as a city full of surprises, with lakes, trout fishing, thermal activity, hot springs and Maori culture.');
INSERT INTO `region` VALUES (5, 'Hawkes Bay', 'In Hawkes Bay the sparkling Pacific Ocean forms a stunning back drop to internationally renowned vineyards that produce award winning wine. Absorb the splendor of Art Deco city Napierand the Spanish Mission buildings that make the region one of the most unique architectural centres in the world.');
INSERT INTO `region` VALUES (6, 'Manawatu', 'Highlights of the River Region include the Wanganui River, flowing from one of New Zealand\'s highest volcanoes, Mount Tongariro, through the spectacular Wanganui National Park,to the coast of the Tasman Sea. The River Region features magnificent gardens, golf, brown and rainbow trout fly fishing and host of other outdoor experiences.');
INSERT INTO `region` VALUES (7, 'Taranaki', 'Upcoming');
INSERT INTO `region` VALUES (8, 'Wairarapa', 'Just one and a half hour\'s drive from the capital city of Wellington. This region is home to established sheep farms, historic homesteads, award winning vineyards of Martinborough, the Golden Shears annual shearing event held in Masterton and the noted Mount Bruce National Wildlife centre.');
INSERT INTO `region` VALUES (9, 'Wellington', 'The harbour capital of New Zealand is a City of character and surprises. The magnificent harbour is surrounded by a natural amphitheatre of tree covered hillsides and edged with picturesque bays. Discover New Zealand\'s past, present and future at Te Papa, the magnificent museum of New Zealand that is superbly located on Wellingtons\' waterfront.');
INSERT INTO `region` VALUES (10, 'Nelson', 'Sunny Nelson, centre of beautiful sandy beaches, art and craft industries, vineyards, orchards, the legendary Abel Tasman National Park, natural springs, green lipped mussel, scallops and an ever expanding horticulture scene.');
INSERT INTO `region` VALUES (11, 'Marlborough', 'A region of much diversification, home for many of New Zealand\'s award vineyards, cherry orchards, fishing, tranquil water ways of the Marlborough Sounds and water sport contrast sharply with the Kaikoura Mountain range and rocky coastline, home of mouth watering crayfish. Seal colony, whale watching, and friendly dolphins.');
INSERT INTO `region` VALUES (12, 'West Coast', 'The wild west of New Zealand! Untamed scenery, beautiful native bush, tranquil lakes, Fox and Franz Josef glaciers, and rugged coast line beaches. Greenstone, paua and panning for gold. ');
INSERT INTO `region` VALUES (13, 'Canterbury', 'The Region that is fresh each day, offering a variety of experiences, famous for its succulent lamb, incredible contrasts, wide open spaces, hot air ballooning, high mountains, braided fishing rivers and high country lakes. Home to New Zealands most comprehensive listing of quality graded host properties. ');
INSERT INTO `region` VALUES (14, 'Aorangi/Mackenzie', 'Gateway to the unique McKenzie Country and Mt Cook Region. Geraldine and Fairlie are the ideal stop over points between Christchurch and Queenstown.');
INSERT INTO `region` VALUES (15, 'Otago', 'Steeped in New Zealand gold mining history. Apricots, apples, dramatic landscapes, jet boating, skiing, mountains and lakes. Historic Scottish university city of Dunedin. Albatross colony, Larnach Castle, Taieri Gorge train. Experience genuine Southern hospitality.');
INSERT INTO `region` VALUES (16, 'Central Otago', 'The Southern lakes region offers an unsurpassed range of possibilities. The popular resort towns of Wanaka, Cromwell and Queenstown, picturesque lake and mountain scenery, and a host of outdoor activities and experiences await the visitor. ');
INSERT INTO `region` VALUES (17, 'Southland', 'Southland- Spirit of a nation, rugged, natural, unspoiled, untouched green contrasting landscapes all describe what this region is all about. Southland is home to New Zealand\'s capital of country and western music, Gore, and the country\'s most southern city, Invercargill. Invercargill was the home of Burt Munro, the Worlds Fastest Indian, and is the home of the famous Bluff Oysters.');
INSERT INTO `region` VALUES (18, 'Fiordland', 'Known for it\'s wilderness and incredible beauty, Fiordland is home to New Zealand\'s largest National Park, magnificent Milford and Doubtful Sounds, bush clad mountains, unspoiled scenery, lakes and native birds including the cheeky kea.');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
