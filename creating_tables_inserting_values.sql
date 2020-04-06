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