BEGIN;
INSERT INTO `category` VALUES (1, 'G1', 'Modern home offering good quality accommodation,  spacious indoor and living areas, private facilities (either on suite bathroom or separate guest bathroom and toilet)');
INSERT INTO `category` VALUES (2, 'G2', 'Slightly older home (over 10 years) offering comfortable guest accommodation, guest (shared) bathroom and toilet facilities G2 historic home');
INSERT INTO `category` VALUES (3, 'G3', 'Standard comfortable home, shared bathroom and toilet facilities ');
COMMIT;

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

BEGIN;
INSERT INTO `listing` VALUES (660, 1, 'RH506', 'Clevedon', 2, '(25km) Country stay, sheep, deer and cattle. Situated at Clevedon south of city in rural area.  Host interests: Game hunting, fishing, photography, travel, reading, cooking.  Please note:  2 night stay minimum', '1 Queen - Guest bathroom  1 Twin - En suite bathroom  Maxiumum guests: 4', 'Premium rates apply, 2 night stay minimum applies', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (661, 1, 'RH515', 'Huntly', 3, '(20 mins, 45 min Hamilton, 60 min Auckland) Farm stay, dairy, handy to state highway 1.  Hosts interests: Motor sport, gym, travel, gardening, family.', '1 Queen - Private guest bathroom.  1 Twin - Private guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (662, 2, 'RH513', 'Te Awamutu', 3, '(21km, Waitomo Caves, 40km) Farm stay, alpacas, calf rearing, sheep  Hosts interests: Classic cars, wood work, engineering, rock and roll dancing and reading.', '2 Twin - separate shared guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (663, 2, 'RH534', 'Te Awamutu', 3, 'Country stay, at one of New Zealand\'s hidden trout fishing streams that flows through the property. <br  /> Hosts interests include river fishing, music', '1 Queen - Shared guest bathrooms.  2 King single - Shared guest bathrooms.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (664, 1, 'RH535', 'Te Awamutu', 3, '(3km, Waitomo Caves 20 min drive) Farm stay, cows and calves, maize cropping also horses. <br/> Host interests: Sports, rugby, harness racing, show jumping, gardening, hunting, travel.', '1 Queen - Private bathroom.  1 Queen/Twin - Shared guest bathroom.  1 Twin - Guest bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (665, 1, 'RH522', 'Matamata', 3, '(4 km) Farm stay, few sheep and cattle. Close to state highway 27, handy to horse studs and dairy farms,  Near to Hobbition Movie set used in the filming of the Lord of Rings.  Host interests: Horse racing, trucking.', '1 Queen/Single - Shared guest bathroom.  1 Double/Single - Shared guest bathroom.  1 Twin - Shared guest bathroom.  Maximum guests: 8', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (666, 1, 'RH523', 'Cambridge', 3, '(5 km) Farm stay, sheep, beef cattle & dairy support. Handy to state highway 1, near Lake Karapiro. Excellant views over a wide area.  Host interests: Fishing, boating, gardening, family and woodwork.', '1 Queen - Shared guest bathrooms.  1 Double - Shared guest bathrooms.  1 Twin - Shared guest bathrooms.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (667, 1, 'RH528', 'Cambridge', 3, '(12km) Farm stay, organic dairy, handy to State Highway 1.  Host interests: Family, skiing, outdoors, gardening.', '2 Twin - Guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (668, 2, 'RH516', 'Matamata', 3, '(8km) Farm stay, sheep, cattle, calves and maize cropping. Near to Hobbition Movie set used in the filming of the Lord of Rings.  Host interests: Gardening, horse racing and family.', '1 King (converts to twin) - Shared guest bathrooms.  1 Queen - Shared guest bathrooms.  2 Twin - Shared guest bathrooms.  Maximum guests: 8', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (669, 2, 'RH520', 'Katikati', 4, '(Tauranga 35 km) Farm stay, sheep and cattle, handy to kiwi fruit orchards, close state highway 2, 35 kms from Tauranga. Magnificent views on edge of the harbour.  Hosts interests: Music, literature, the arts, golf, gardening.', '1 Queen/Single - Shared guest bathroom.  1 Twin - Shared guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (670, 2, 'RH549', 'Rotorua', 4, '(10 km) Farm stay, cattle and sheep. Close to Lake Rotorua. Handy to state highway 5.  Hosts interests: Horse racing and breeding, biking, golf, travel, tennis, walking Please note: minimum 4 adults per night booking', '1 Queen - Shared guest bathrooms.  1 Twin -  Shared guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (671, 1, 'RH551', 'Rotorua Bed & Breakfast', 4, '(5/10 min of city centre)  home stay. Host interests: rugby, gardening, travel. Handy to all major geothermal, Maori culture attractions.', '1 Queen - separate guest bathroom.  1 Twin - seprate guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (672, 1, 'RH544', 'Napier', 5, '(20 km) Farm stay, rolling to steep hill country, cattle, sheep, and forestry, also growing olives, avocados, limes and pip fruits.  Host interests: Holistic health, environment, gardening, wine and food and reading.', '1 Super king - En suite bathroom.  Maximum guests: 2', 'Eco build home on solar power', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (673, 2, 'RH548', 'Whanganui', 6, '(Whanganui  15 min drive, Waverley 12km) Farm stay, sheep, cattle and pigs. Extensive garden covers 4 acres with a lake. Host interests: Conservation, gardening, antiques.', '1 Queen - En suite bathroom.  2 Twin - Shared guest bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (674, 2, 'RH555', 'Fielding', 6, '(16 km) Farm stay, sheep, deer, grazing dairy cows. Handy to state highway 1.  Host interests: Flying, sailing and gardening.', '1 Queen -  En suite bathroom.  2 Double (single available) - Shared guest bathroom.  Maximum guests: 7', 'Elegant country home, extensive garden', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (675, 2, 'RH557', 'Masterton', 8, '(3 km) Country stay, sheep, handy to state highway 2 and town centre. Host interests: Restoring antiques, clock, farm machinery and gardening.', '1 King - En suite bathroom.   2 Queen - Shared guest bathrooms.  1 Double - Shared guest bathrooms.  1 Twin - Shared guest bathrooms.  Maximum guests: 10', 'built 1880', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (676, 1, 'RH172', 'Wakefield', 10, '(Nelson city 30 min) Country home stay, set among extensive native bush, just off state highway 6.  Host interests: Chair & frame maker, pottery, art, golf, music, travel.', '1 Queen - Shared guest bathroom.  1 Double - Shared guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (677, 1, 'RH018', 'Blenheim', 11, '(7 km, Picton ferry 15 min) Country stay, vineyard growing Sauvignon Blanc grapes, also grazing sheep during winter months. Centre of national award winning vineyards.  Host interests: Rugby, most sport, competitive ploughing, gardening, music, travel.', '2 Double - Shared guest bathroom.  1 Twin - Shared guest bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (678, 1, 'RH034', 'Hokitika', 12, '(5 min) Country stay, situated Kaniere, over looking Hokitika River, native bush walks.  Host interests: Rugby, current affairs, gardening, cooking and travel.', '1 queen - En suite bathroom.  1 twin - Guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (679, 1, 'RH023', 'Rangiora', 13, '(6 km, Christchurch 30 km) Farm stay, sheep and dairy.  Host interests: Rugby, sport, movies, reading and travel.', '1 Super king - Seperate guest bathrooms.  1 Double - Seperate guest bathrooms.  1 Double - Seperate guest bathrooms. 1 Single - Seperate guest bathrooms.  Maximum guests: 7', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (680, 1, 'RH211', 'Christchurch', 13, 'Eco friendly home stay 10/15 mins walk from the central city in leafy up market Merivale, short walk from the Avon river, Hagley park and Botanic gardens.  Hosts Interests: Tramping, travel, photography, garden, bridge, skiing.', 'Two Queen.  One Twin.  All rooms share separate guest bathroom.  Maximum guests: 6', '2 level home', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (681, 1, 'RH246', 'Christchurch', 13, '(5 min to airport, 10 min to central city) Home stay in upmarket Fendalton.  Host interests: Outdoors, fishing, hiking, garden.', '1 Double - Shared guest bathroom.  1 Twin - Shared guest bathroom.  Maximum guests: 4', '2 level home', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (682, 1, 'RH072', 'Sheffield', 13, '(5km, 45min west of Christchurch city) Farm stay, sheep, handy to state highway 73 to Arthurs Pass. Host interests: rugby, fishing, dog trialing, garden.', '1 King - En suite bathroom.  1 Twin - Shared bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (683, 2, 'RH170', 'Akaroa', 13, '(20 min) Farm stay, with sheep and cattle situated picturesque Okains Bay. Local sandy beach, Maori and Colonial history.  Host interests: Scuba diving, conservation, sport, wood turning, bridge and gardening.   Premium rates apply to this property listing.', '1 Queen/Single - En suite bathroom.  1 Queen/Single - Private guest bathroom.  1 Queen - Shared bathroom.  Maximum guests: 8', 'Villa - Premium rates apply to this property.', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (684, 1, 'RH017', 'Mt Somers', 13, '(45 min inland from Ashburton) Farm stay, rolling hill country sheep, beef cattle and deer.  Hosts interests: Golf, politics, history, art, culture, cooking, food and wine.', '2 Queen - Shared guest bathroom.  1 twin - Shared guest bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (685, 1, 'RH157', 'Ashburton', 13, '(7 km) Farm stay, grazing sheep, alpacas, with access to other local farms including dairy.  Host interests: Golf, skiing, weaving, arts and crafts, gardening, travel.', '1 Queen plus single - Shared guest bathrooms.      3 Twin - Shared guest bathrooms.  Maximum guests: 9', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (686, 1, 'RH039', 'Ashburton', 13, '(16 km) Farm stay, handy to State Highway 1, sheep, beef cattle, goats, free range hens  Hosts interests: music, reading, gardening.', '1 Queen - Seperate guest bathroom.  2 Twin - Seperate guest bathroom  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (687, 1, 'RH035', 'Geraldine', 14, '(13 km) farm stay, sheep and cattle, handy highway 79 the main route between Geraldine and Fairlie, local attractions including Barkers Fruit Processors, cheese factory, vineyard, all close by  Host interests: Sport, water skiing, boating, reading, music, gardening, cooking.', '1 Super king - seperate shared bathroom.  1 Queen - seperate shared bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (688, 1, 'RH092', 'Pleasant Point', 14, '(Timaru 15 min) Country home stay, olive grove and small beef rearing operation with access to local sheep & dairy farms. Handy state highways 1 & 8. Panoramic mountain views, Maori Rock Art.  Host interests: Rugby, gardening, reading, travel.', '1 King (converts to twin) - Shared guest bathroom.  2 Queen - Shared guest bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (689, 2, 'RH037', 'Fairlie', 14, '(25km) Country stay, sheep and lambs, deer, pigs, free range hens  Hosts interests: Gardening, travel, photography and catering.', '4 Queen - En suite bathrooms.  2 Twin - En suite bathrooms.  1 Single - En suite bathroom.  Maximum guests: 13', 'large spacious  historic 2 level villa/homestead', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (690, 1, 'RH038', 'Fairlie', 14, '(5 mins) Farm stay, rolling country sheep, deer and cattle.  Host interests: Boating, fishing, sport (especially rugby), gardening, tramping and family.', '1 Double - Shared guest bathroom.  1 Twin - Shared guest bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (691, 2, 'RH133', 'Kurow', 15, '(15 km, 60 km inland from Oamaru) Farm stay, rolling hill country merino sheep and beef cattle, handy state highway 83, Local wineries, fishing rivers (guide available), and nearby hydro lakes. Horse trekking and tramping on farm. Host interests: Sport, music, gardening, reading, travel, family.', '1 Queen - En suite bathroom.  2 Double - Shared guest bathroom.  2 Twin - Shared guest bathroom.  Maximum guests: 10', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (692, 1, 'RH033', 'Oamaru', 15, '(6km) Country stay with sheep, beef cattle, calves and alpaca. Handy to historic town attractions.  Hosts interests: Gardening, cooking/preserving, wood working, bush walking.', '2 King (both convert to twin/2 singles) - Seperate shared bathroom.  1 Queen - Seperate shared bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (693, 2, 'RH011', 'Cromwell', 16, '(10 km) High country farm Merino sheep and cattle farm stay, handy state highway 6 and Lake Dunstan, local vineyards.  Host interests: Squash, tennis, rugby, cooking, card and board games.', '1 King - Seperate guest bathrooms.  1 Queen - Seperate guest bathrooms.  1 Twin - Seperate guest bathrooms.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (694, 1, 'RH181', 'Queenstown B and B', 16, '(2 km) Home stay over looking Lake Wakatipu, with spectacular mountain views. Host interests: Retired sheep farmers, sport, travel, Lions Club, floral art.  Premium rates apply to this property.', '2 Queen - En suite barhrooms  Maximum guests: 4', 'Premium rates apply to this property', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (695, 1, 'RH182', 'Queenstown B and B', 16, 'Country stay, situated Lake Hayes, handy airport and Arrowtown, spectacular lake and mountain views.  Host interests: Gardening, boating, fishing, reading, embroidery and family. Premium rates apply to this property', '1 Queen- Seperate shared bathrooms.  1 Super King - Seperate shared bathrooms.  1 Twin - Seperate shared bathrooms.  Maximum guests: 6', 'Premium rates apply to this property.', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (696, 2, 'RH050', 'Gore', 17, '(6 km) Farm stay, rolling to steep country, sheep and beef cattle, also horses.  Host interests: Hunting, skiing, reading, travel, family.', '2 Queen - Seperate shared bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (697, 1, 'RH061', 'Gore', 17, '(17km) Country farm stay, sheep, beef cattle and dairy cows.   Host interests: Sheep genetics, sport, nursing, cooking, church.', '1 Queen - Seperate shared bathroom. 1 Twin - Seperate shared bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (698, 2, 'RH009', 'Oxford', 13, '(6 km) Country stay rolling country sheep, cattle, alapcas, pigs, chickens & ducks.   Handy to inland scenic Highway 72, native bush walks, fishing rivers, golf courses.    Host interests: garden, cheese making, fishing & hunting.', '1 King - En suite bathroom.  1 Queen - En suite bathroom.  1 Double - Shared guest bathroom. Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (699, 1, 'RH043', 'Sheffield', 13, '(5 min, Darfield 15 km, Christchurch 50 min) Country stay with a few sheep, with access to local deer, dairy farms handy state highway 73.   Outstanding views of the nearby Southern Alps mountain range, handy golf course, fishing rivers and high country lakes. Host interests: rugby, politics, art, tennis, golf and travel.', '1 Double - Seperate guest bathroom.  1 Twin - Seperate guest bathroom.  1 Single - Seperate guest bathroom.  Maximum guests: 5', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (700, 1, 'RH119', 'Dunedin', 15, '(12 km) Country stay on edge of city, sheep and hens.  Hosts interests: tramping, orienteering, cycling and culture exchange.', '1 Queen - Seperate guest bathroom.  Maximum guests: 2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (701, 1, 'RH177', 'Motueka', 10, '(15 km) Farm stay, sheep, beef cattle, also growing calla lilies.  Host interests: rugby, fishing, reading, movies, sport.', '2 Double rooms - Shared bathrooms.  Maximum guests: 4', 'self contained unit', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (702, 1, 'RH518', 'Matamata', 3, '(10 km)  Country home stay grazing cattle, free range hens. Access also available to view local sheep and dairy farms. Handy to Hobbiton movie set . Host interests: Computers, gardening, outdoors.', '2 Queen - Seperate guest bathroom.  2 twin - Shared guest bathroom.  Maximum guests: 8', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (703, 1, 'RH532', 'Whakatane', 4, '(30km) Country stay surrounded by sheep, deer, beef cattle farms.   Situated close to unspoiled Mimiha beach - swimming, sea fishing, Maori history.  Host intrests: sport, rugby, country music, musical theatre, gardening, cooking, travel.', '1 Queen - En suite bathroom.  1 King (converts to twin) - En suite bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (704, 1, 'RH73', 'Glentunnel', 13, '(45 min west of Christchurch) country stay, sheep, free range hens. Glentunnel is a small historic village.  Host intrests: sport,golf, hunting, tramping, gardening, reading.', '1 Queen - En suite bathroom.  1 Superking (converts to twin) - En suite bathroom.  Additional single bed available <br/> Maximum guests: 5', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (705, 2, 'RH93', 'Fairlie', 14, '(10km) Farm stay, rolling country sheep, cattle and crops. Excellent mountain views  Host interests: Machinery, tractors, gardening, interior design, scrap booking, community activities.', '1 Queen - Seperate guest bathroom.  2 Twin - Seperate guest bathroom.  1 single - separate guest bathroom. <br/> Maximum guests: 7 <br > Also self contained cottage  2 queen-separate shared guest bathroom <br> 1 twin-separate shared quest bathroom <br> Maximum guests: 6', 'Former school house, fully renovated', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (706, 1, 'Rh121', 'Mosgiel', 15, '(4km) Country home stay, sheep.  Host intrests: Former Sheeep and cattle farmers, classic cars (mini), vintage car club members, fishing, gardening, all sports.', '2 Queen - Seperate shared bathroom.  1 Twin -  Seperate shared bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (707, 1, 'RH168', 'Dovedale', 10, '(50km South west) Farm stay, rolling country sheep, cattle and horses. Handy to Motueka river, trout fishing and wineries.  Host Intrests: Game hunting, fishing, cycling, martial arts, wood working, carpentry, proforming arts.  Languages spoken: German, French, Maori.', '1 King (converts to twin beds) En suite bathroom.  1 Twin - Seperate shared bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (708, 1, 'RH536', 'Ohaupo', 3, '(Hamilton 15 km) Country stay with cattle and free range hens. Handy to Waitomo Caves  Host Intrests: Gardening, Painting.', '1 Queen - Seperate shared bathroom.  1 Twin -  Seperate shared bathroom.  Maximum guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (709, 2, 'RH111', 'Ashburton', 13, '(7km) Farm stay with Deer.  Host Interests: Gardening, salmon fishing, golf, tramping.', 'Two Twin - Separate shared guest bathroom.  One Triple - Seperate shared guest bathroom.', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (710, 2, 'RH538', 'Oparau', 3, '(60 km via state highway 31 from Waitomo caves,  39 km west ofTe Awamutu) Rolling hill country farm stay with sheep and cattle. Close to the hot water beach.  Host Interests: Gardening, interior decorating, care giver.', '1 queen and 1 single bed - Separate shared guest only bathroom  1 super king, can be twin - Separate shared guest bathroom  Maximum number of guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (711, 2, 'RH543', 'Martinborough', 8, '(3km, Masterton 40km) Flat to rolling hill country farm stay with sheep and cattle station. Handy to award winning vine yards.  Hosts Interests: Tennis, Squash, Skiing, Boating, Art, Food and Wine, Interior design, Gardening, Reading, Travel.', '2 Queen - Separate guest bathroom.  1 King/twin- Separate guest bathroom.  Maximum Guests: 6 Note: minimum 4 guests any one booking', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (712, 1, 'RH24', 'Aylesbury', 13, '(30 mins drive west of Christchurch via state highway 73) Farm stay with highland cattle, miniature horses, surrounded by sheep farms. <br > Hosts interests: Aviation, sport, golf, extensive garden.', '2 Queen - En suit bathroom . <br > 1 double - Shared bathroom. <br > Maximum guests: 6', 'Premium Rates Apply', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (713, 3, 'RH550', 'Mangakino', 4, '(Taupo 36km) Dairy farm stay rolling to steep contour, Situated north west of Taupo, handy to state highway 30. <br/ > Hosts Interests: Game hunting, Fishing, Equestrian (show jumping & hunting), Travel.', '1 Queen - Shared bathroom <br/ > Maximum Guests: 2', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (714, 1, 'RH510', 'Warkworth B & B', 2, '(3 Min) Country home stay, situated on the edge of the historic township, with sheep and cows as neighbours and views over the local estuary. Handy to cafe\'s, vineyards, potteries, antique and craft shops. ', '1 Queen - En Suite Bathroom  1 Twin - En Suite Bathroom  Maximum Guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (715, 2, 'RH568', 'Rotorua', 4, 'Home stay with views high up overlooking the lake and city, NZ\'s only natural geyser.  Hosts Interests: Golf, current affairs, writing, antiques, theater and the arts.', '1 Queen - Separate guest bathroom.  1 Twin - Separate guest bathroom.  Maximum Guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (716, 2, 'RH116', 'Lawrence', 15, '(20 min) Farm stay with rolling country. Sheep and beef cattle. 1.5hr drive from Dunedin on central route to Queenstown and Wanaka. Situated handy to Clutha Gold cycling trail.  Hosts Interests: Sport, garden, music and church.', '1 King Plus 1 Single - En suite bathroom.  1 Queen - Separate guest bathroom.  Maximum Guests: 4', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (717, 1, 'RH 51', 'Te Awamutu', 3, '(15 min from and handy to state highway 3 and Waitomo caves) Country stay with sheep, gypsy cob horses and calves  Hosts Interests: Farm machinery, Cars, Rugby, Horse racing', '1 King Bed with King Single - Shared separate guest bathroom.  1 King Single - Shared separate guest bathroom.  1 Queen - Shared separate guest bathroom.  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (718, 1, 'RH12', 'Fairlie', 14, '(3 km) handy to state highway 8, country stay, rolling hill country with sheep, cattle and alpacas.  Hosts Interests: game hunting, fishing, photography, travel', '3 Queen - Separate guest only bathrooms  Maximum guests: 6', 'extensive mountain views', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (719, 1, 'RH90', 'Ashburton', 13, '(Close in) Country home stay, set among extensive garden with access to local sheep farm.  Hosts Interests: Salmon fishing, flower arranging, embroidery, gardening, booking.', '1 Queen - En suite bathroom.  2 Twin - Guest only share bathroom  Maximum guests: 6', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (720, 1, 'RH20', 'Fairlie', 14, '(13 km) farm stay, large sheep, beef cattle and cropping property.  Host Interests: community activities, travel, photography, gardening, motor and watersports', '3 queen (Two beds that convert to twin).  All rooms share separate guest only bathroom,  Maximum guests: 6', 'mountain & lake views', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (721, 1, 'RH546', 'Palmerston North', 6, 'Farm stay with beef cattle, sheep, free range hens. ,  Hosts interests: Sport, travel, photography, edible plants, tramping.', '1 Queen  1 Single  Guest Bathroom  Maximum guests: 3', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (722, 1, 'RH537', 'Pirongia', 3, '(Te Awamutu 12km) Country stay, some sheep, free range hens. Hosts Interests: Veterinarian, cycling, baking, knitting.', 'Room One: 2 King Singles.  Room Two: 3 King Singles  Maximum guests: 5', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (723, 2, 'RH519', 'Matamata', 3, 'Country stay, surrounded by dairy and sheep farms.  Hosts interests: Architecture, gardening, boating, making preserves from own garden produce.', '2 Rooms - Both with queen bed and single.  Separate guest bathroom.  Maximum guests: 6', 'Converted former school house.', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (724, 1, 'RH13', 'Fairlie', 14, '(20 km) farm stay, rolling country sheep and cattle  Hosts Interests: Community work, garden, family cooking', '5 Rooms.  4 Super king/twin and queen rooms with en suite.  Maximum Guests: 8 plus', NULL, NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (725, 1, 'RH02', 'Ashburton', 13, 'Country home stay with sheep.  Hosts interests: Sport, vintage machinery, classic cars, craft work, gardening, reading.', '3 Rooms.  1 Large family room with 1 king, 1 single, with bathroom.  1 King - Shared guest bathroom.  1 Queen - Shared guest bathroom.', 'Extensive garden', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (726, 1, 'RH08', 'Staveley', 13, 'Country home stay near the base of the Canterbury plains. Mountain views surrounded by farms.  Hosts interests: Crop and industry, nursing, rugby, golf, fishing, gardening, reading.', '1 Queen - Shared guest bathroom.  1 Twin - Shared guest bathroom.', 'Extensive garden and mountain views.', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (727, 2, 'RH25', 'Fairlie', 14, '(5 km) Farm stay, flat to rolling hill country. sheep, cattle and deer  Hosts: Gardening, reading, movies.', '2 Rooms.  2 Queen.  1 Single.  All rooms share guest only bathroom and separate toilet.  Maximum guests: 5', 'Extensive garden and mountain views.', NULL, NULL, NULL, NULL);
INSERT INTO `listing` VALUES (728, 1, 'RH508', 'Hamilton', 3, 'Country home stay, beef cattle and horses (not for riding) chickens, guinea pigs, rabbits.  Hosts Interests: Fishing, boating, equestrian events.', '5 Guest Rooms.  2 Queen.  2 Queen - 1 Single.  1 Double - 1 Single.  All rooms share guest only bathroom and separate toilets.', 'Extensive garden, Swimming pool.', NULL, NULL, NULL, NULL);
COMMIT;