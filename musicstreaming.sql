CREATE DATABASE music_streaming;

CREATE TABLE users(
    user_id nvarchar(20) PRIMARY KEY,
    user_name nvarchar(max),
    user_lastname nvarchar(max),
    user_password nvarchar(max),
    email nvarchar(max),
    profilephotopath varchar(255),
);


CREATE TABLE artist(
    artist_id int PRIMARY KEY,
    artist_name nvarchar(max),
);


CREATE TABLE genres(
    genre_id int PRIMARY KEY,
    genre_name nvarchar,
);



CREATE TABLE album(
    album_id int PRIMARY KEY,
    album_name nvarchar(max),
    album_duration time,
    artist_id int FOREIGN KEY REFERENCES artist(artist_id),
    num_of_songs int,
    release date,
    genre_id int FOREIGN KEY REFERENCES genres(genre_id)
);


CREATE TABLE song(
    song_id int PRIMARY KEY,
    song_name nvarchar(max),
    artist_id int FOREIGN KEY REFERENCES artist(artist_id),
    album_id int FOREIGN KEY REFERENCES album (album_id),
    genre_id int FOREIGN KEY REFERENCES genres(genre_id),
    duration time,
);



CREATE TABLE likedsongs(
    liked BINARY(1) PRIMARY KEY,
    user_id nvarchar(20) FOREIGN KEY REFERENCES users(user_id),
    song_id int FOREIGN KEY REFERENCES song(song_id),
)


CREATE TABLE playlist(
    playlist_id int PRIMARY KEY,
    playlist_name nvarchar(max),
    user_id nvarchar(20) FOREIGN KEY REFERENCES users(user_id),
    download BINARY(1),
    privated BINARY(1),
    song_id int FOREIGN KEY REFERENCES song(song_id), 

)


