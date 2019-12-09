drop table if exists stories;
drop table if exists chapters;
drop table if exists dependencies;
drop table if exists authors;
drop table if exists readers;

create table stories(story_id integer primary key not null, story_title varchar(50) not null, story_photo varchar(50));
create table chapters(chapter_id integer primary not null, story_id integer references stories(story_id) not null, chapter_title varchar(50) not null, chapter_content text not null);
create table dependencies(dependency_id integer primary key not null, chapter_id integer references chapters(chapter_id) not null, content text not null, photo varchar(50), video varchar(50), audio varchar(50));
create table authors(author_id integer primary key not null, author_name varchar(50) not null, author_contact varchar(50), story_id integer references stories(story_id) not null, author_address varchar(50), author_about text, author_photo varchar(50), author_email varchar(50) not null, author_password varchar(50) not null);
create table readers(reader_id integer primary key not null, readder_name varchar(50), reader_email varchar(50) not null, reader_password varchar(50) not null, current_story varchar(50), chapter_id integer references chapters(chapter_id));