create schema music;

alter table sales.user rename music.user;
alter table sales.songs rename music.songs;

create table user
(
	UserID INTEGER PRIMARY KEY NOT NULL,
	FirstName VARCHAR(256) NOT NULL,
	LastName VARCHAR(256) NOT Null,
	Birthplace VARCHAR(256) NOT NULL,
	CreatedAt DATETIME NOT NULL,
	UpdatedAt DATETIME NULL);

create table Songs
(
	FavoriteID INTEGER PRIMARY KEY NOT NULL,
    UserID INTEGER NOT NULL,
    ArtistID INTEGER,
    AlbumID INTEGER,
    SongID INTEGER,
    GenreID INTEGER,
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME NULL
);

INSERT INTO User
(	UserID,
	FirstName,
	LastName,
    Birthplace,
    CreatedAt)
Values
('000100','Wesley', 'Chambers', 'Orlando, Florida', CURRENT_DATE);

INSERT INTO User
(	UserID,
FirstName,
LastName,
Birthplace,
CreatedAt)
Values(
'000101', 'Michael', 'Jordan', 'Brooklyn, New York', CURRENT_TIMESTAMP);

INSERT INTO Songs
( FavoriteID, UserID, ArtistID, SongID, CreatedAt)
Values( '002001', '000100', '300', '501', current_timestamp);

INSERT INTO SONGS
(FavoriteID, UserID, ArtistID, SongID, CreatedAt)
Values('002002', '000105', '305', '1000', current_date);

INSERT INTO SONGS
(FavoriteID, UserID, ArtistID, SongID, CreatedAt)
Values('002003', '000107', '308', '1010', current_date);

select*from Songs;

select*from user;
select UserID, FirstName, LastName
from user;

select*from user WHERE length(FirstName)=7;

select*from User WHERE LastName IN ('Chambers', 'Brown' , 'Bloomberg', 'Katie');

select*from User WHERE FirstName='Wesley' AND LastName='Chambers';
select*from User WHERE FirstName='Wesley' OR LastName='Jordan';

select*from User WHERE UserID>100 or (UpdatedAt IS NULL AND FirstName='Florentine');
select*from User WHERE FirstName LIKE '%ley';
SELECT *FROM User WHERE FirstName LIKE '%esl%';
SELECT*FROM User WHERE FirstName LIKE '%sle%' OR LastName LIKE 'Jor%';

select*from User WHERE UserID>99 and UserID<101;

update user
set FirstName='Kate',
	LastName='Great',
    Birthplace='Seoul, S. Korea',
    UpdatedAt=current_timestamp
where userid=100;

select*from user;

Begin transaction;
Update User Set FirstName='Hey change my name back';
Select*from User;
Rollback;

Update User set LastName='Han', CreatedAt=current_timestamp where userid='100';
Update User set FirstName='James', CreatedAt=current_timestamp where userid='105';

Delete from User
where Userid>100;

select*from user;

select userid from user;
select userid, firstname from user;

select* from songs
where UserID%2=1 and ArtistID>305;

insert into user
(	UserID,
	FirstName,
	LastName,
    Birthplace,
    CreatedAt)
Values ('000105', 'Jason', 'McMurphy', 'Georgia', current_timestamp);


Start transaction;
Delete from User where userid='105';
Select*from User;
Rollback;


SET SQL_SAFE_UPDATES = 0;

Start Transaction;
Delete from Songs where SongID>1000;
select*from songs;
Rollback;

