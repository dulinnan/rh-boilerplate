INSERT INTO category (category_title, category_description)
VALUES
('apparel', 'Clothing, for example capes, masks, belts, boots, gloves etc'),
('equipment', 'Rings of power, hammers from the gods, grappling hooks, lassos of truth, and such like'),
('vehicles', 'Various forms of transportation, such as surf boards, tanks, jetpacks, etc'),
('property', 'For examples: planets, orbiting space stations, ice palaces at the North Pole.'),
('other', 'Other oddities.')
;


INSERT INTO auction (
auction_title,
auction_categoryid,
auction_description,
auction_reserveprice,
auction_startingprice,
auction_creationdate,
auction_startingdate,
auction_endingdate,
auction_userid)
VALUES
('Super cape', '1', 'One slightly used cape', '1000', '1', '2018-02-14 00:00:00', '2018-02-15 00:00:00', '2018-03-14 00:00:00', '2'),
('Broken pyramid', '4', 'One very broken pyramid. No longer wanted. Buyer collect', '100000000', '100', '2018-02-14 00:00:00', '2018-02-15 00:00:00', '2018-02-28 00:00:00', '9'),
('One boot', '1', 'One boot. Lost the other in a battle with the Joker', '1000', '50', '2018-02-14 00:00:00', '2018-02-15 00:00:00', '2018-03-14 00:00:00', '3'),
('Intrinsic Field Subtractor', '5', 'Hard to write about, but basically it changed me. A lot. ', '10000', '100', '2018-02-14 00:00:00', '2018-02-15 00:00:00', '2018-06-30 00:00:00', '7'),
('A cache of vibranium', '5', 'A cache of vibranium stolen from Wakanda. ', '50000000', '1000000', '2018-02-14 00:00:00', '2018-02-15 00:00:00', '2018-06-30 00:00:00', '10')
;

INSERT INTO bid (
  bid_userid,
  bid_auctionid,
  bid_amount,
  bid_datetime)
values
('1', '1', '1000', '2018-02-20 00:01:00'),
('9', '3', '10000', '2018-02-20 00:10:00'),
('7', '3', '15000', '2018-02-20 00:20:00'),
('9', '3', '20000', '2018-02-20 00:30:00'),
('9', '3', '25000', '2018-02-20 00:40:00'),
('7', '3', '35000', '2018-02-20 00:50:00'),
('9', '3', '40000', '2018-02-20 01:00:00'),
('7', '4', '100000', '2018-02-20 01:00:00')
;
