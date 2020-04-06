drop database IF EXISTS poker_19200996;

/*================================================ LAB 1 =============================================================================*/

create database poker_19200996;

use poker_19200996;

/*===================================================================================================================================*/

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
values
(12789,'17MET','QH','3D','QS','3C', '3H'),
(90734,'17MET','4D','4S','7C','4C', '3H'),
(56347,'17MET','JH','5H','8C','8S', '8D'),
(90734,'23WSA','7H','10H','KH','3H', '1H'),
(84643,'23WSA','9H','5C','5H','7C', '2S');

/*===============================================================================================================================*/

CREATE TABLE STAKES (
    PLAYER_ID INT NOT NULL,
    GAME_ID VARCHAR(5) NOT NULL,
    STAKE INT,
    BANK INT,
    INCOME INT,
    PRIMARY KEY (PLAYER_ID,GAME_ID)
);

insert into STAKES  values
-- GAME 1
('12789','17MET','5','65','-30'),
('90734','17MET','7','165','10'),
('56347','17MET','10','54','20'),
-- GAME 2
('90734','23WSA','25','28','10'),
('84643','23WSA','16','74','-10');

/*======================================================================================================================*/
CREATE TABLE checking_poker_hands (game_id char(5), player int, duplicate_player int, card char(3)) select game_id, player, duplicate_player, card from
((select ph.game_id as game_id, ph.player_id as player, temp_ph.player_id as duplicate_player, ph.R1 as card from poker_hands ph , (select game_id,player_id,R1,R2,R3,R4,R5 from poker_hands) temp_ph where
ph.R1 in (temp_ph.R1,temp_ph.R2,temp_ph.R3,temp_ph.R4,temp_ph.R5) and temp_ph.game_id = ph.game_id and temp_ph.player_id <> ph.player_id)
UNION ALL 
(select ph.game_id as game_id, ph.player_id as player, temp_ph.player_id as duplicate_player, ph.R2 as card from poker_hands ph , (select game_id,player_id,R1,R2,R3,R4,R5 from poker_hands) temp_ph where
ph.R2 in (temp_ph.R1,temp_ph.R2,temp_ph.R3,temp_ph.R4,temp_ph.R5) and temp_ph.game_id = ph.game_id and temp_ph.player_id <> ph.player_id)
UNION ALL
(select ph.game_id as game_id, ph.player_id as player, temp_ph.player_id as duplicate_player, ph.R3 as card from poker_hands ph , (select game_id,player_id,R1,R2,R3,R4,R5 from poker_hands) temp_ph where
ph.R3 in (temp_ph.R1,temp_ph.R2,temp_ph.R3,temp_ph.R4,temp_ph.R5) and temp_ph.game_id = ph.game_id and temp_ph.player_id <> ph.player_id)
UNION ALL 
(select ph.game_id as game_id, ph.player_id as player, temp_ph.player_id as duplicate_player, ph.R4 as card from poker_hands ph , (select game_id,player_id,R1,R2,R3,R4,R5 from poker_hands) temp_ph where
ph.R4 in (temp_ph.R1,temp_ph.R2,temp_ph.R3,temp_ph.R4,temp_ph.R5) and temp_ph.game_id = ph.game_id and temp_ph.player_id <> ph.player_id)
UNION ALL
(select ph.game_id as game_id, ph.player_id as player, temp_ph.player_id as duplicate_player, ph.R5 as card from poker_hands ph , (select game_id,player_id,R1,R2,R3,R4,R5 from poker_hands) temp_ph where
ph.R5 in (temp_ph.R1,temp_ph.R2,temp_ph.R3,temp_ph.R4,temp_ph.R5) and temp_ph.game_id = ph.game_id and temp_ph.player_id <> ph.player_id)) Temp;


select * from checking_poker_hands;

SELECT game_id,player FROM (
SELECT t.game_id,t.player,s.stake,s.income,ROW_NUMBER() 
OVER (PARTITION BY game_id ORDER BY s.stake DESC,s.income DESC) row_num
FROM checking_poker_hands t
JOIN STAKES s on t.player = s.player_id AND t.game_id = s.game_id ) a
WHERE row_num = 1;

drop table checking_poker_hands;
