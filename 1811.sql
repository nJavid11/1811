CREATE DATABASE Movie 

USE Movie

CREATE TABLE Movies(
Id int identity PRIMARY KEY,
Name nvarchar(50)
)

CREATE TABLE Genres(
Id int identity PRIMARY KEY,
Name nvarchar(50) CHECK(LEN(NAME)>2)
)


CREATE TABLE Actors(
Id int identity PRIMARY KEY,
Name nvarchar(50),
Surname nvarchar(50),
Age int 
)

CREATE TABLE ActorMovies(
Id int identity PRIMARY KEY,
MovieId int CONSTRAINT FK_ActorMovies_MovieId FOREIGN KEY(MovieId) REFERENCES Movies(Id),
ActorId int CONSTRAINT FK_ActorMovies_ActorId FOREIGN KEY(ActorId) REFERENCES Actors(Id)
)

ALTER TABLE Movies
ADD GenreId int FOREIGN KEY (GenreId) REFERENCES Genres(Id)

ALTER TABLE Movies
drop column GenreId

ALTER TABLE Actors
DROP COLUMN Age

ALTER TABLE Actors
ADD Age int

alter table Actors drop constraint [CK__Actors__Age__5AEE82B9];

ALTER TABLE Movies
ADD durationMin int

INSERT INTO Movies
VALUES
('Breaking Bad',1),
('Dark',2),
('Prison break',3),
('Inception',2),
('Locke',1),
('Strangers Things',2)

TRUNCATE TABLE Movies

FK_ActorMovies_MovieId

alter table Movies drop constraint[FK__Movies__GenreId__5BE2A6F2];

alter table ActorMovies drop constraint[FK_ActorMovies_MovieId];

alter table Movies
drop column '[DurationMin]'

alter table ActorMovies
add MovieId int CONSTRAINT FK_ActorMovies_MovieId FOREIGN KEY(MovieId) REFERENCES Movies(Id) --++



INSERT INTO Genres
VALUES
('Drama'),
('Science-fiction'),
('Action'),
('Inception'),
('Locke'),
('Strangers Things')

INSERT INTO Genres
VALUES
('Drama'),
('Science-fiction'),
('Action'),
('Inception'),
('Locke'),
('Strangers Things')

INSERT INTO Actors
VALUES
('Hesen','Hesenov',22),
('Ramiz','Eliyev',45),
('Vuqar','Hesenov',34),
('Azer','Eliyev',56),
('Hafiz','Muradov',41),
('Arif', 'Haciyev',21)




USE Movie;  
GO  
EXEC sp_helpconstraint 'Movies';  

DELETE FROM Genres WHERE Id in(6,5,4)



Select * from Actors

Select * from Movies




Update Movies
set DurationMin=90
where id=1

Update Movies
set DurationMin=120
where id=2

Update Movies
set DurationMin=80
where id=3

Update Movies
set DurationMin=220
where id=4

Update Movies
set DurationMin=150
where id=5

Update Movies
set DurationMin=100
where id=6

Select * from ActorMovies

Select * from Genres

Select * from Genres

INSERT INTO ActorMovies
VALUES
(3,1),
(4,1),
(5,3),
(6,4),
(7,3),
(8,6)


Join Movies on GenreId=Genres.Id

--1st query
Select *,(Select count(id) from Movies where GenreId=Genres.Id)as MCount from Genres

--2nd query
SELECT * FROM Actors
WHERE Age>(select AVG(Age) from Actors)

--3rd
SELECT Actors.Name,Actors.Surname,Actors.Age, Movies.Name FROM ActorMovies
JOIN Actors on ActorId=Actors.Id
Join Movies on MovieId=Movies.Id

--4th
SELECT * FROM Actors
WHERE EXISTS (SELECT * FROM ActorMovies WHERE ActorMovies.ActorId = Actors.Id)