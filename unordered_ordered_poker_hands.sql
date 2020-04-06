drop database IF EXISTS poker_19200996;

/*Lab 1*/

create database poker_19200996;

use poker_19200996;

create table card_deck( card_name char(3),
face char(3), type char(3), suit char(1),
face_value int, primary key (card_name));

/*inserting hearts*/

insert into card_deck(card_name,type,face,suit,face_value)
values ('1H','no','A','H','1');

insert into card_deck(card_name,type,face,suit,face_value)
values ('2H','no','2','H','2');

insert into card_deck(card_name,type,face,suit,face_value)
values ('3H','no','3','H','3');

insert into card_deck(card_name,type,face,suit,face_value)
values ('4H','no','4','H','4');

insert into card_deck(card_name,type,face,suit,face_value)
values ('5H','no','5','H','5');

insert into card_deck(card_name,type,face,suit,face_value)
values ('6H','no','6','H','6');

insert into card_deck(card_name,type,face,suit,face_value)
values ('7H','no','7','H','7');

insert into card_deck(card_name,type,face,suit,face_value)
values ('8H','no','8','H','8');

insert into card_deck(card_name,type,face,suit,face_value)
values ('9H','no','9','H','9');

insert into card_deck(card_name,type,face,suit,face_value)
values ('10H','no','10','H','10');

insert into card_deck(card_name,type,face,suit,face_value)
values ('JH','yes','J','H','11');

insert into card_deck(card_name,type,face,suit,face_value)
values ('QH','yes','Q','H','12');

insert into card_deck(card_name,type,face,suit,face_value)
values ('KH','yes','K','H','13');

/*inserting Diamonds*/

insert into card_deck(card_name,type,face,suit,face_value)
values ('1D','no','A','D','1');

insert into card_deck(card_name,type,face,suit,face_value)
values ('2D','no','2','D','2');

insert into card_deck(card_name,type,face,suit,face_value)
values ('3D','no','3','D','3');

insert into card_deck(card_name,type,face,suit,face_value)
values ('4D','no','4','D','4');

insert into card_deck(card_name,type,face,suit,face_value)
values ('5D','no','5','D','5');

insert into card_deck(card_name,type,face,suit,face_value)
values ('6D','no','6','D','6');

insert into card_deck(card_name,type,face,suit,face_value)
values ('7D','no','7','D','7');

insert into card_deck(card_name,type,face,suit,face_value)
values ('8D','no','8','D','8');

insert into card_deck(card_name,type,face,suit,face_value)
values ('9D','no','9','D','9');

insert into card_deck(card_name,type,face,suit,face_value)
values ('10D','no','10','D','10');

insert into card_deck(card_name,type,face,suit,face_value)
values ('JD','yes','J','D','11');

insert into card_deck(card_name,type,face,suit,face_value)
values ('QD','yes','Q','D','12');

insert into card_deck(card_name,type,face,suit,face_value)
values ('KD','yes','K','D','13');

/*inserting Clubs*/

insert into card_deck(card_name,type,face,suit,face_value)
values ('1C','no','A','C','1');

insert into card_deck(card_name,type,face,suit,face_value)
values ('2C','no','2','C','2');

insert into card_deck(card_name,type,face,suit,face_value)
values ('3C','no','3','C','3');

insert into card_deck(card_name,type,face,suit,face_value)
values ('4C','no','4','C','4');

insert into card_deck(card_name,type,face,suit,face_value)
values ('5C','no','5','C','5');

insert into card_deck(card_name,type,face,suit,face_value)
values ('6C','no','6','C','6');

insert into card_deck(card_name,type,face,suit,face_value)
values ('7C','no','7','C','7');

insert into card_deck(card_name,type,face,suit,face_value)
values ('8C','no','8','C','8');

insert into card_deck(card_name,type,face,suit,face_value)
values ('9C','no','9','C','9');

insert into card_deck(card_name,type,face,suit,face_value)
values ('10C','no','10','C','10');

insert into card_deck(card_name,type,face,suit,face_value)
values ('JC','yes','J','C','11');

insert into card_deck(card_name,type,face,suit,face_value)
values ('QC','yes','Q','C','12');

insert into card_deck(card_name,type,face,suit,face_value)
values ('KC','yes','K','C','13');

/*inserting spades*/

insert into card_deck(card_name,type,face,suit,face_value)
values ('1S','no','A','S','1');

insert into card_deck(card_name,type,face,suit,face_value)
values ('2S','no','2','S','2');

insert into card_deck(card_name,type,face,suit,face_value)
values ('3S','no','3','S','3');

insert into card_deck(card_name,type,face,suit,face_value)
values ('4S','no','4','S','4');

insert into card_deck(card_name,type,face,suit,face_value)
values ('5S','no','5','S','5');

insert into card_deck(card_name,type,face,suit,face_value)
values ('6S','no','6','S','6');

insert into card_deck(card_name,type,face,suit,face_value)
values ('7S','no','7','S','7');

insert into card_deck(card_name,type,face,suit,face_value)
values ('8S','no','8','S','8');

insert into card_deck(card_name,type,face,suit,face_value)
values ('9S','no','9','S','9');

insert into card_deck(card_name,type,face,suit,face_value)
values ('10S','no','10','S','10');

insert into card_deck(card_name,type,face,suit,face_value)
values ('JS','yes','J','S','11');

insert into card_deck(card_name,type,face,suit,face_value)
values ('QS','yes','Q','S','12');

insert into card_deck(card_name,type,face,suit,face_value)
values ('KS','yes','K','S','13');

/*lab 2*/

create table poker_hands( player_id int, game_id char(5), R1 char(3), 
R2 char(3), R3 char(3), R4 char(3), R5 char(3), 
primary key (player_id, game_id),
foreign key (R1) references card_deck (card_name),
foreign key (R2) references card_deck (card_name),
foreign key (R3) references card_deck (card_name),
foreign key (R4) references card_deck (card_name),
foreign key (R5) references card_deck (card_name));

/* unorderded values inserted */

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(12789,'17MET','QH','3D','QS','3C', '3H');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(12789,'23WSA','7H','10H','KH','3H', '1H');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(90734,'82SAT','4D','4S','7C','4C', '3H');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(84643,'78GUV','9H','5C','5H','7C', '2S');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(56347,'65YOB','JH','QH','8C','8S', '8D');

/* orderded values inserted */

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(86347,'55YOB','JH','5H','4C','3S', '1D');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(66347,'45YOB','10H','8H','8C','8S', '8D');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(56377,'35YOB','JH','9H','5C','4S', '3D');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(56387,'25YOB','KH','QH','JC','7S', '6D');

insert into poker_hands(player_id, game_id, R1, R2, R3, R4, R5) 
values(96347,'15YOB','5H','4H','3C','2S', '1D');

/* Assumption: R1 is the highest and R5 is the lowest. Using decending order.
order: K Q J 10 9 8 7 6 5 4 3 2 A */

/*retreving the ordered poker_hands*/
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

/*deleting the unordered poker hands*/
SET SQL_SAFE_UPDATES=0;

delete  ph from poker_hands ph
inner join card_deck a on ph.R1 = a.card_name
inner join card_deck b on ph.R2 = b.card_name
inner join card_deck c on ph.R3 = c.card_name
inner join card_deck d on ph.R4 = d.card_name
inner join card_deck e on ph.R5 = e.card_name
where NOT ((a.face_value >= b.face_value and b.face_value >= c.face_value
and c.face_value >= d.face_value and d.face_value >= e.face_value) OR
(a.face_value <= b.face_value and b.face_value <= c.face_value
and c.face_value <= d.face_value and d.face_value <= e.face_value));

select * from poker_hands;

