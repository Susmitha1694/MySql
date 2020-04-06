drop database IF EXISTS poker_19200996;

create database poker_19200996;

use poker_19200996;

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
('22345','33GAM','5','65','-30'),
('22346','33GAM','7','165','-10'),
('22347','33GAM','10','54','27'),
('22348','33GAM','2','112','13'),
-- GAME 2
('22345','33GAN','25','28','-5'),
('22346','33GAN','16','74','-10'),
('22347','33GAN','1','22','0'),
('22348','33GAN','2','11','15'),
-- GAME 3
('22346','33GAO','23','55','-23'),
('22347','33GAO','18','7','6'),
('22348','33GAO','12','36','10'),
('22349','33GAO','12','36','7'),
-- GAME 4
('22346','33GAP','23','55','-23'),
('22347','33GAP','18','7','17'),
('22348','33GAP','12','36','-10'),
('22349','33GAP','12','36','-7'),
('22345','33GAP','23','55','23'),
-- GAME 5
('22347','33GAQ','18','7','7'),
('22348','33GAQ','12','36','10'),
('22349','33GAQ','12','36','-17');

/* TASK 1 - total pot per game */
SELECT GAME_ID,SUM(STAKE) as POT FROM STAKES GROUP BY GAME_ID;
 
/* TASK 2 - total outlay per player */
SELECT PLAYER_ID,SUM(STAKE) as OUTLAY FROM STAKES GROUP BY PLAYER_ID;
 
/* TASK 3 - winning/losses per player across all games */
SELECT PLAYER_ID,SUM(income) as WinLoss FROM STAKES GROUP BY PLAYER_ID;

/* TASK 4 - Show all profits and losses per game are zero */
SELECT GAME_ID,SUM(income) as zeroSumGame FROM STAKES GROUP BY GAME_ID;

/* TASK 5a - Profit/loss per player across all the games*/
SELECT PLAYER_ID,SUM(income) as ProfitLoss FROM STAKES GROUP BY PLAYER_ID;

/* TASK 5b - Profit/loss per player per game*/
SELECT PLAYER_ID,GAME_ID,SUM(income) as ProfitLoss FROM STAKES GROUP BY PLAYER_ID,GAME_ID;

/* TASK 6 - Player with most over all profit and least overall profit*/
(SELECT TEMP1.PLAYER_ID,MAX(TEMP1.income_sum) as MaxMinOverall 
FROM (SELECT PLAYER_ID,SUM(income) as income_sum FROM STAKES GROUP BY PLAYER_ID ORDER BY income_sum DESC) TEMP1)
UNION ALL  
(SELECT TEMP2.PLAYER_ID,MIN(TEMP2.income_sum) as MaxMinOverall 
FROM (SELECT PLAYER_ID,SUM(income) as income_sum FROM STAKES GROUP BY PLAYER_ID ORDER BY income_sum ASC) TEMP2);
