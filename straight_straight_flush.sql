drop database IF EXISTS poker_19200996;

/*================================================ LAB 1 =============================================================================*/

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

/*lab 2*/

create table poker_hands( player_id int, game_id char(5), R1 char(3), 
R2 char(3), R3 char(3), R4 char(3), R5 char(3), 
primary key (player_id, game_id),
foreign key (R1) references card_deck (card_name),
foreign key (R2) references card_deck (card_name),
foreign key (R3) references card_deck (card_name),
foreign key (R4) references card_deck (card_name),
foreign key (R5) references card_deck (card_name));

/*-------------------------------- unorderded values inserted ------------------------------------------------------------------------*/

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(12789,'17MET','QH','3D','QS','3C', '3H'),
(12789,'23WSA','7H','10H','KH','3H', '1H'),
(90734,'82SAT','4D','4S','7C','4C', '3H'),
(84643,'78GUV','9H','5C','5H','7C', '2S'),
(56347,'65YOB','JH','QH','8C','8S', '8D');

/*---------------------------------- orderded values inserted ---------------------------------------------------------------------*/

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(86347,'55YOB','JH','5H','4C','3S', '1D'),
(66347,'45YOB','10H','8H','8C','8S', '8D'),
(56377,'35YOB','JH','9H','5C','4S', '3D'),
(56387,'25YOB','KH','QH','JC','7S', '6D'),
(96347,'15YOB','5H','4H','3C','2S', '1D');

/* Assumption: R1 is the highest and R5 is the lowest. Using decending order.
order: K Q J 10 9 8 7 6 5 4 3 2 A */

/*----------------------------------------- retreving the ordered poker_hands ------------------------------------------------------------------*/
select player_id, game_id, R1, R2, R3, R4, R5
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where (a.face_value >= b.face_value and b.face_value >= c.face_value
and c.face_value >= d.face_value and d.face_value >= e.face_value) OR
(a.face_value <= b.face_value and b.face_value <= c.face_value
and c.face_value <= d.face_value and d.face_value <= e.face_value);

/*------------------------------------------ deleting the unordered poker hands -----------------------------------------------------------*/
-- SET SQL_SAFE_UPDATES=0;

-- delete  ph from poker_hands ph
-- inner join card_deck a on ph.R1 = a.card_name
-- inner join card_deck b on ph.R2 = b.card_name
-- inner join card_deck c on ph.R3 = c.card_name
-- inner join card_deck d on ph.R4 = d.card_name
-- inner join card_deck e on ph.R5 = e.card_name
-- where NOT ((a.face_value >= b.face_value and b.face_value >= c.face_value
-- and c.face_value >= d.face_value and d.face_value >= e.face_value) OR
-- (a.face_value <= b.face_value and b.face_value <= c.face_value
-- and c.face_value <= d.face_value and d.face_value <= e.face_value));

select * from poker_hands;

/*================================================ LAB 3 =============================================================================*/

/*----------------------------------------- task 1 : inserting values for royal flush ------------------------------------------------*/

insert into poker_hands (player_id, game_id, R1, R2, R3, R4, R5) 
values(66348,'45GOB','1S','KS','JS','QS', '10S'), -- Royal Flush
(66349,'45TOB','1S','1S','1S','1S', '4S'),
(66350,'45FOB','1S','KD','JS','QS', '10S'), -- Royal Flush
(66351,'45AOB','2S','KD','JS','QS', '9S'),
(66352,'45BOB','2S','KS','JS','QS', '9S'),
(66353,'45COB','1D','KD','JD','QD', '10D'); -- Royal Flush

/*------------------------------------------ task 2 : retreving the royal flush hands ---------------------------------------------*/

select player_id, game_id, R1, R2, R3, R4, R5
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where (a.suit = b.suit and b.suit = c.suit and c.suit = d.suit and d.suit = e.suit) 
and ((a.face_value+b.face_value+c.face_value+d.face_value+e.face_value) = 47) 
and ((a.face = 'A') or (b.face = 'A') or (c.face = 'A') or (d.face = 'A') or (e.face = 'A'));

/*------------------------------------------ task 3 : inserting full hands, pairs and three of a kind -------------------------------*/

insert into POKER_HANDS  values (12797,'25MET','10H','10D','1H','1D','1S'), -- FULL HOUSE  
(12798,'26MET','QD','2S','2D','QH','2C'), -- FULL HOUSE
(12799,'27MET','4H','4C','4S','JH','1C'), -- THREE OF A KIND
(12800,'27MET','10C','JS','10S','1S','10H'),-- THREE OF A KIND
(12801,'27MET','1S','1H','10S','KS','QS'), -- PAIR
(66354,'45DOB','1S','KD','KH','KS', '1H'), -- FULL HOUSE
(66355,'45EOB','1H','1S','1C','2S', '4S'), -- THREE OF A KIND
(66356,'45GOB','1S','QS','1H','1D', '10S'), -- THREE OF A KIND
(66357,'45HOB','2S','KD','JS','QS', 'QH'), -- PAIR
(66358,'45IOB','2S','2D','JS','QS', '9S'), -- PAIR
(66359,'45JOB','4D','4S','5D','4C', '5C'), -- FULL HOUSE
(12802,'27MET','10S','7S','6H','7H','8S'); -- PAIR 

/*---------------------------------------------- task 4 : retreving full hands ------------------------------------------------------*/
SELECT p.Player_id, p.Game_id,p.R1,p.R2,p.R3,p.R4,p.R5 FROM poker_hands p , 
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
WHERE Temp2.player_id = p.player_id and Temp2.game_id=p.game_id;

/*================================================ LAB 4 =============================================================================*/

/* Insering Stright, Royal Flush and Stright Flush into poker hands tabel */

insert into poker_hands (player_id, game_id, R1, R2, R3, R4, R5) 
values(66354,'45KOB','1S','5D','3H','4S', '2H'), -- Straight
(66355,'45LOB','8H','10S','6C','9S', '7S'), -- Straight
(66356,'45MOB','QS','10S','8H','9D', 'JS'), -- Straight
(66357,'45NOB','9H','6H','8H','5H', '7H'), -- Straight Flush
(66358,'45OOB','KS','1S','JS','QS', '10S'), -- Royal Flush
(66359,'45POB','3D','4D','5D','6D', '7D'), -- Straight Flush
(56788,'35QOB','KS','1H','JS','QD', '10S'); -- Straight 

/* ------------------------------- TASK 1: Series of update statemnts to sort the hands --------------------------------------------------*/

SET SQL_SAFE_UPDATES=0;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R1
inner join card_deck b on b.card_name = pk.R2
set pk.R1 = pk.R2, pk.R2 = a.card_name 
WHERE a.face_value < b.face_value;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R2
inner join card_deck b on b.card_name = pk.R3
set pk.R2 = pk.R3, pk.R3 = a.card_name 
WHERE a.face_value < b.face_value;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R3
inner join card_deck b on b.card_name = pk.R4
set pk.R3 = pk.R4, pk.R4 = a.card_name 
WHERE a.face_value < b.face_value;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R4
inner join card_deck b on b.card_name = pk.R5
set pk.R4 = pk.R5, pk.R5 = a.card_name 
WHERE a.face_value < b.face_value;

/*----------------------------------------------------------------------------*/

update poker_hands pk
inner join card_deck a on a.card_name = pk.R1
inner join card_deck b on b.card_name = pk.R2
set pk.R1 = pk.R2, pk.R2 = a.card_name 
WHERE a.face_value < b.face_value;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R2
inner join card_deck b on b.card_name = pk.R3
set pk.R2 = pk.R3, pk.R3 = a.card_name 
WHERE a.face_value < b.face_value;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R3
inner join card_deck b on b.card_name = pk.R4
set pk.R3 = pk.R4, pk.R4 = a.card_name 
WHERE a.face_value < b.face_value;

/*--------------------------------------------------------------------------*/

update poker_hands pk
inner join card_deck a on a.card_name = pk.R1
inner join card_deck b on b.card_name = pk.R2
set pk.R1 = pk.R2, pk.R2 = a.card_name 
WHERE a.face_value < b.face_value;

update poker_hands pk
inner join card_deck a on a.card_name = pk.R2
inner join card_deck b on b.card_name = pk.R3
set pk.R2 = pk.R3, pk.R3 = a.card_name 
WHERE a.face_value < b.face_value;

/*-------------------------------------------------------------------------*/

update poker_hands pk
inner join card_deck a on a.card_name = pk.R1
inner join card_deck b on b.card_name = pk.R2
set pk.R1 = pk.R2, pk.R2 = a.card_name 
WHERE a.face_value < b.face_value;

/*-------------------------------------- TASK 2: retreive straight -----------------------------------------------------*/

select R5 as Card_1, R4 as Card_2, R3 as Card_3, R2 as Card_4, R1 as Card_5
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where (a.face_value-b.face_value = 1) and (b.face_value-c.face_value = 1) and
(c.face_value-d.face_value = 1) and (d.face_value-e.face_value = 1 or a.face_value-e.face_value=12) and 
not(a.suit = b.suit and b.suit = c.suit and c.suit = d.suit and d.suit = e.suit);

/*---------------------------------------- TASK 3: retreive straight flush ---------------------------------------------------------------*/

select R5 as Card_1, R4 as Card_2, R3 as Card_3, R2 as Card_4, R1 as Card_5
from poker_hands
inner join card_deck a on poker_hands.R1 = a.card_name
inner join card_deck b on poker_hands.R2 = b.card_name
inner join card_deck c on poker_hands.R3 = c.card_name
inner join card_deck d on poker_hands.R4 = d.card_name
inner join card_deck e on poker_hands.R5 = e.card_name
where (a.face_value-b.face_value = 1) and (b.face_value-c.face_value = 1) and
(c.face_value-d.face_value = 1) and (d.face_value-e.face_value = 1) and 
(a.suit = b.suit and b.suit = c.suit and c.suit = d.suit and d.suit = e.suit);