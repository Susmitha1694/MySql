drop database IF EXISTS poker_19200996;

create database poker_19200996;

use poker_19200996;

create table card_deck( card_name char(3),
face char(3), type char(3), suit char(1),
face_value int, primary key (card_name));

/*----------------------------------- inserting values card_deck ---------------------------------------------------------------------*/

insert into card_deck(card_name,face,type,suit,face_value)
values ('1H','no','A','H','1'),
('2H','no','2','H','2'),
('3H','no','3','H','3'),
('4H','no','4','H','4'),
('5H','no','5','H','5'),
('6H','no','6','H','6'),
('7H','no','7','H','7'),
('8H','no','8','H','8'),
('9H','no','9','H','9'),
('10H','no','10','H','10'),
('JH','yes','J','H','11'),
('QH','yes','Q','H','12'),
('KH','yes','K','H','13'),
('1D','no','A','D','1'),
('2D','no','2','D','2'),
('3D','no','3','D','3'),
('4D','no','4','D','4'),
('5D','no','5','D','5'),
('6D','no','6','D','6'),
('7D','no','7','D','7'),
('8D','no','8','D','8'),
('9D','no','9','D','9'),
('10D','no','10','D','10'),
('JD','yes','J','D','11'),
('QD','yes','Q','D','12'),
('KD','yes','K','D','13'),
('1C','no','A','C','1'),
('2C','no','2','C','2'),
('3C','no','3','C','3'),
('4C','no','4','C','4'),
('5C','no','5','C','5'),
('6C','no','6','C','6'),
('7C','no','7','C','7'),
('8C','no','8','C','8'),
('9C','no','9','C','9'),
('10C','no','10','C',10),
('JC','yes','J','C','11'),
('QC','yes','Q','C','12'),
('KC','yes','K','C','13'),
('1S','no','A','S','1'),
('2S','no','2','S','2'),
('3S','no','3','S','3'),
('4S','no','4','S','4'),
('5S','no','5','S','5'),
('6S','no','6','S','6'),
('7S','no','7','S','7'),
('8S','no','8','S','8'),
('9S','no','9','S','9'),
('10S','no','10','S','10'),
('JS','yes','J','S',11),
('QS','yes','Q','S','12'),
('KS','yes','K','S','13');

/*-----------------------------------------------------------------------------------------------------------------------*/
create table poker_hands( player_id int, game_id char(5), R1 char(3), 
R2 char(3), R3 char(3), R4 char(3), R5 char(3),
primary key (player_id, game_id),
foreign key (R1) references card_deck (card_name),
foreign key (R2) references card_deck (card_name),
foreign key (R3) references card_deck (card_name),
foreign key (R4) references card_deck (card_name),
foreign key (R5) references card_deck (card_name));

/*-----------------------------------------------------------------------------------------------------------------------*/

ALTER TABLE poker_hands
ADD hand_type ENUM('straight_flush','four_of_a_kinds','full_houses','flushes','straights','three_of_a_kinds','two_pairs','pairs');
/*-------------------------------------------------------------------------------------------*/

insert into poker_hands (player_id, game_id, R1, R2, R3, R4, R5) 
values(66354,'45KOA','5S','4D','3H','2S', '1H'), -- Straight
(66355,'45KOB','10H','9S','8C','7S', '6S'), -- Straight
(66354,'45KOC','9H','8H','7H','6H', '5H'), -- Straight Flush
(66355,'45KOD','7D','6D','5D','4D', '3D'), -- Straight Flush
(66354,'45KOE','QD','QH','2D','2S','2C'), -- FULL HOUSE
(66355,'45KOF','KD','KH','KS', '1H','1S'), -- FULL HOUSE
(66354,'45KOG','4H','4C','4S','JH','1C'), -- THREE OF A KIND
(66355,'45KOH','JS','10C','10S','10H','1S'),-- THREE OF A KIND
(66357,'45KOI','KD','QS', 'QH','JS','2S'), -- PAIR
(66358,'45KOJ','QS','JS','9S','2S','2D'), -- PAIR
(66357,'45KOK','KD','QS', 'QH','JS','JS'), -- TWO PAIR
(66358,'45KOL','QS','QS','9S','2S','2D'), -- TWO PAIR
(66357,'45KOM','9H','7H','5H','3H', '2H'), -- Flush
(66359,'45KON','7D','5D','4D','3D', '1D'), -- Flush
(66358,'45KOO','4H','4C','4S','4H','1C'), -- FOUR OF A KIND
(66359,'45KOP','10S','10C','10S','10H','1S');-- FOUR OF A KIND

/*----------------------------------------updating a full house-------------------------------------------------------*/
SET SQL_SAFE_UPDATES = 0;

UPDATE POKER_HANDS as ph inner join (SELECT p.Player_id, p.Game_id,p.R1,p.R2,p.R3,p.R4,p.R5 FROM poker_hands p , 
(SELECT player_id,game_id, group_concat(CAST(COUNT_OF_CARD_TYPE AS CHAR(10))) FLAG FROM 
(SELECT player_id,game_id,FACE_VALUE, COUNT(*) COUNT_OF_CARD_TYPE
FROM 
(SELECT player_id,game_id, R1 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R1 = card_deck.card_name
UNION ALL 
SELECT player_id,game_id, R2 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R2 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R3 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R3 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R4 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R4 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R5 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R5 = card_deck.card_name) UNPIVOTED_TABLE
GROUP BY player_id,game_id,FACE_VALUE) Temp1 GROUP BY player_id,game_id HAVING FLAG  IN ( '2,3','3,2'))Temp2  
WHERE Temp2.player_id = p.player_id and Temp2.game_id=p.game_id) as TEMP 
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='full_houses' ;

/*---------------------------------updating straight flush---------------------------------------------------------------------------------*/
UPDATE POKER_HANDS as ph inner join (select poker_hands.player_id, poker_hands.game_id
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where (a.face_value-b.face_value = 1) and (b.face_value-c.face_value = 1) and
(c.face_value-d.face_value = 1) and (d.face_value-e.face_value = 1) and 
(a.suit = b.suit and b.suit = c.suit and c.suit = d.suit and d.suit = e.suit)) as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='straight_flush';

/*---------------------------------------updating straights------------------------------------------------------------------------------------*/
UPDATE POKER_HANDS as ph inner join (select poker_hands.player_id, poker_hands.game_id
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where (a.face_value-b.face_value = 1) and (b.face_value-c.face_value = 1) and
(c.face_value-d.face_value = 1) and (d.face_value-e.face_value = 1 or a.face_value-e.face_value=12) and 
not(a.suit = b.suit and b.suit = c.suit and c.suit = d.suit and d.suit = e.suit)) as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='straights';

/*----------------------------------------updating flushes------------------------------------------------------------*/

UPDATE POKER_HANDS as ph inner join (select poker_hands.player_id, poker_hands.game_id
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where not((a.face_value-b.face_value = 1) and (b.face_value-c.face_value = 1) and
(c.face_value-d.face_value = 1) and (d.face_value-e.face_value = 1)) and 
(a.suit = b.suit and b.suit = c.suit and c.suit = d.suit and d.suit = e.suit))as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='flushes';

/*-----------------------------------------Four of a kind------------------------------------------------------------------------*/

UPDATE POKER_HANDS as ph inner join (SELECT p.Player_id, p.Game_id,p.R1,p.R2,p.R3,p.R4,p.R5 FROM poker_hands p , 
(SELECT player_id,game_id, group_concat(CAST(COUNT_OF_CARD_TYPE AS CHAR(10))) FLAG FROM 
(SELECT player_id,game_id,FACE_VALUE, COUNT(*) COUNT_OF_CARD_TYPE
FROM 
(SELECT player_id,game_id, R1 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R1 = card_deck.card_name
UNION ALL 
SELECT player_id,game_id, R2 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R2 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R3 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R3 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R4 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R4 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R5 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R5 = card_deck.card_name) UNPIVOTED_TABLE
GROUP BY player_id,game_id,FACE_VALUE) Temp1 GROUP BY player_id,game_id HAVING FLAG  IN ( '4,1','1,4'))Temp2  
WHERE Temp2.player_id = p.player_id and Temp2.game_id=p.game_id) as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='four_of_a_kinds';

/*----------------------------------------------Three of a kind-----------------------------------------------------------------------------*/

UPDATE POKER_HANDS as ph inner join (SELECT p.Player_id, p.Game_id,p.R1,p.R2,p.R3,p.R4,p.R5 FROM poker_hands p , 
(SELECT player_id,game_id, group_concat(CAST(COUNT_OF_CARD_TYPE AS CHAR(10))) FLAG FROM 
(SELECT player_id,game_id,FACE_VALUE, COUNT(*) COUNT_OF_CARD_TYPE
FROM 
(SELECT player_id,game_id, R1 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R1 = card_deck.card_name
UNION ALL 
SELECT player_id,game_id, R2 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R2 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R3 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R3 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R4 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R4 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R5 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R5 = card_deck.card_name) UNPIVOTED_TABLE
GROUP BY player_id,game_id,FACE_VALUE) Temp1 GROUP BY player_id,game_id HAVING FLAG  IN ( '3,1,1','1,1,3','1,3,1'))Temp2  
WHERE Temp2.player_id = p.player_id and Temp2.game_id=p.game_id)as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='three_of_a_kinds';

/*-----------------------------------------------------TWO PAIRS-----------------------------------------------------------------------*/

UPDATE POKER_HANDS as ph inner join (SELECT p.Player_id, p.Game_id,p.R1,p.R2,p.R3,p.R4,p.R5 FROM poker_hands p , 
(SELECT player_id,game_id, group_concat(CAST(COUNT_OF_CARD_TYPE AS CHAR(10))) FLAG FROM 
(SELECT player_id,game_id,FACE_VALUE, COUNT(*) COUNT_OF_CARD_TYPE
FROM 
(SELECT player_id,game_id, R1 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R1 = card_deck.card_name
UNION ALL 
SELECT player_id,game_id, R2 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R2 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R3 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R3 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R4 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R4 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R5 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R5 = card_deck.card_name) UNPIVOTED_TABLE
GROUP BY player_id,game_id,FACE_VALUE) Temp1 GROUP BY player_id,game_id HAVING FLAG  IN ( '2,2,1','2,1,2','1,2,2'))Temp2  
WHERE Temp2.player_id = p.player_id and Temp2.game_id=p.game_id)as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='two_pairs';

/*------------------------------------------------pairs----------------------------------------------------------------*/

UPDATE POKER_HANDS as ph inner join (SELECT p.Player_id, p.Game_id,p.R1,p.R2,p.R3,p.R4,p.R5 FROM poker_hands p , 
(SELECT player_id,game_id, group_concat(CAST(COUNT_OF_CARD_TYPE AS CHAR(10))) FLAG FROM 
(SELECT player_id,game_id,FACE_VALUE, COUNT(*) COUNT_OF_CARD_TYPE
FROM 
(SELECT player_id,game_id, R1 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R1 = card_deck.card_name
UNION ALL 
SELECT player_id,game_id, R2 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R2 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R3 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R3 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R4 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R4 = card_deck.card_name
UNION ALL
SELECT player_id,game_id, R5 CARD_TYPE, FACE_VALUE FROM poker_hands inner join card_deck on poker_hands.R5 = card_deck.card_name) UNPIVOTED_TABLE
GROUP BY player_id,game_id,FACE_VALUE) Temp1 GROUP BY player_id,game_id HAVING FLAG  IN ( '2,1,1,1','1,2,1,1','1,1,2,1','1,1,1,2'))Temp2  
WHERE Temp2.player_id = p.player_id and Temp2.game_id=p.game_id)as TEMP
on temp.player_id = ph.player_id and temp.game_id = ph.game_id
SET HAND_TYPE='pairs';

/*-------------------------------------------------ordering the --------------------------------------------------------------------------------------*/

select * from poker_hands 
order by field(hand_type, 'straight_flush',
'four_of_a_kinds','full_houses','flushes','straights',
'three_of_a_kinds','two_pairs','pairs');











