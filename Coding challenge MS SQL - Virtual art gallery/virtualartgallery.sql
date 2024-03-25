create database Virtual_Art_Gallery
use Virtual_Art_Gallery

create table Artist (
ArtistID int primary key,
Name varchar(200),
Biography varchar(500),
BirthDate date,
Nationality varchar(100),
Website varchar(500),
ContactInformation varchar(500));

create table Artwork(
ArtworkID int primary key,
ArtistID int,
Title varchar(200),
Description varchar(500),
CreationDate date,
Medium varchar(100),
Imageurl varchar(500),
Foreign key(ArtistID) references Artist(ArtistID));

create table User_table(
UserID int primary key,
Username varchar(50),
Password varchar(50),
Email varchar(200),
Firstname varchar(100),
Lastname varchar(100),
Dateofbirth date,
Profilepicture varchar(500)
);

create table User_Favorite_Artwork (
UserID int,
ArtworkID int,
foreign key (UserID) references user_table(userid),
foreign key (ArtworkID) references artwork(artworkid)
);

create table Gallery (
GalleryID int primary key,
Name varchar(255),
Description text,
Location varchar(255),
Curator int,
Openinghours varchar(255),
foreign key (curator) references artist(artistid));

create table artwork_gallery (
ArtworkID int,
GalleryID int,
foreign key (artworkid) references artwork(artworkid),
foreign key (galleryid) references gallery(galleryid));

