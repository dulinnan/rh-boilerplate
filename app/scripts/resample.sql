INSERT INTO category (category_title, category_description)
VALUES
('apparel', 'Clothing, for example capes, masks, belts, boots, gloves etc'),
('equipment', 'Rings of power, hammers from the gods, grappling hooks, lassos of truth, and such like'),
('vehicles', 'Various forms of transportation, such as surf boards, tanks, jetpacks, etc'),
('property', 'For examples: planets, orbiting space stations, ice palaces at the North Pole.'),
('other', 'Other oddities.')
;


INSERT INTO listing (
listing_title,
listing_categoryid,
listing_description,
listing_reserveprice,
listing_startingprice,
listing_creationdate,
listing_startingdate,
listing_endingdate,
listing_userid)
VALUES
('Five (5) infinity stones','5','The Infinity Stones are six immensely powerful objects tied to different aspects of the universe, created by the Cosmic Entities.','100000', '90000','1970-01-01','1970-01-02','2049-12-31','10'),
('One (1) Green Arrow' ,'2','One mystic arrow from the armoury of The Green Arrow' ,'1000','1000', '2018-04-24', '2018-04-24', '2018-05-30' ,'8'),
('Thor''s Hammer' ,'2', 'Thor\’s hammer is more than just a weapon. It occupies a central role in rituals of consecration and hallowing.','45000','40000','2018-04-30','2018-05-01','2018-05-24','10'),
('Captain America''s shield ','2','Captain America''s shield is virtually indestructible under normal conditions. It is made out of vibranium.','125000','65000','2018-01-01','2018-01-02','2018-12-31','6'),
('Power Armour' ,'2','Used by a certain Mr Anthony Edward Stark.','200000' ,'100000', '2018-01-01', '2018-01-02', '2018-12-31' ,'5'),
('Batsuit','1','Grey body suit, the chest emblazoned with a stylized black bat, and blue-black accessories.','150000','100000','2018-03-01','2018-03-02','2018-05-15','3'),
('Fortress of Solitude' ,'4','A place of solace and occasional headquarters for Superman.','100000000','50000000','2018-05-24','2018-05-25','2018-05-30','2'),
('Batcave','4','The secret headquarters of the superhero Batman.' ,'0','0','2018-05-24','2018-05-25','2018-05-30','3'),
('Helicarrier','3','A flying aircraft carrier used by The Avengers.' ,'50000000','30000000','2018-05-24','2018-05-30','2018-06-30','5'),
('The Elizabeth Arkham Asylum','4','A psychiatric hospital for the Gotham City area, housing those who are criminally insane.','100','0','2018-05-24','2018-05-30','2018-06-30','3'),
('Groot''s Plant Pot ','4','A plant pot for Groot to live in. Compost is extra.','100000000','100000000','2018-05-01','2018-05-02','2018-06-30','11'),
('Dr Manhatten branded cushion ','5','Part of the Dr Manhatten soft furnishing range. Infinite in size. No sofa is too large or too small.','50000','50000','2000-01-01','2000-01-02','2030-06-30','7'),
('Batman''s 3pc BBQ set','5','Blacken your sausages when you cook with Batman...','199900','159900','2018-04-01','2018-05-01','2018-06-01','3'),
('Superhero sticker collection ','5','An almost complete set of stickers for the Pannini Superhero 2018 Collection. Missing the Invisible Man.','179900','100000','2018-04-01','2018-05-01','2018-06-01','4'),
('Harley Quinn Mallet','2','A mallet. For malleting with.','299900','299900','2018-04-01','2018-05-10','2018-05-28','10'),
('One (1) Ring of Power','1','One ring to rule them all, apparently. Found in Middle Earth. By a Hobbit. As if that would happen.','12500000','12000000','2000-01-01','2000-01-02','2999-12-31','10'),
('One (1) Portafort','4','One Portafort, for instant defence.','7500000','6000000','2018-04-01','2018-04-02','2019-02-28','11'),
('Intrinsic Field Subtractor ','2','Pre-owned. Good condition. A few scratches.','50000000','40000000','2018-04-01','2018-04-02','2019-02-28','7'),
('Downtime dice','5','Let the good times roll. Helps the overworked and underappreciated superhero to relax. Limited availability.','100','100','2018-05-23','2018-05-24','2019-02-28','11'),
('Avengers Fidget Spinner','5','For those bored superheroes with no supervillains to fight. Available with classic or glow-in-the-dark center.','99900','89900','2018-05-23','2018-05-24','2019-02-28','4')
;

INSERT INTO bid (
  bid_userid,
  bid_listingid,
  bid_amount,
  bid_datetime)
values
('1','1','90000','2018-01-01 00:01:00'),
('9','1','100000','2018-02-28 11:00:00'),
('7','1','110000','2018-02-29 12:00:00'),
('9','1','120000','2018-04-24 10:00:00'),
('7','1','130000','2018-04-25 10:30:00'),
('10','3','41000','2018-05-02 10:30:00'),
('8','4','65500','2018-01-02 11:00:00'),
('5','4','66000','2018-01-02 11:30:00'),
('10','5','101000','2018-04-02 11:30:00'),
('4','6','100000','2018-04-02 09:30:00'),
('7','7','50000000','2018-05-25 09:30:00'),
('1','8','100','2018-05-25 11:30:00'),
('11','1','140000','2018-05-25 11:30:00'),
('7','11','100001000','2018-05-25 11:30:00')

;