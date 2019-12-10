DROP TABLE if EXISTS categories cascade;
DROP TABLE if EXISTS stories cascade;
DROP TABLE if EXISTS chapters cascade;
DROP TABLE if EXISTS dependencies cascade;
DROP TABLE if EXISTS authors cascade;
DROP TABLE if EXISTS readers;

CREATE TABLE categories (
    category_id integer primary key not null,
    category_name varchar(50) not null
);

CREATE TABLE stories (
    story_id integer primary key not null,
    story_title varchar(50) not null,
    category_id integer references categories(category_id),
    story_photo text
);
CREATE TABLE chapters (
    chapter_id integer primary key not null,
    story_id integer references stories(story_id) not null,
    chapter_title varchar(50) not null,
    chapter_content text not null
);
CREATE TABLE dependencies (
    dependency_id integer primary key not null,
    chapter_id integer references chapters(chapter_id) not null,
    content text not null,
    photo text,
    video text,
    audio text
);
CREATE TABLE authors (
    author_id integer primary key not null,
    author_name varchar(50) not null,
    author_contact varchar(50),
    story_id integer references stories(story_id) not null,
    author_address varchar(50),
    author_about text,
    author_photo text,
    author_email varchar(50) not null,
    author_password text not null
);
CREATE TABLE readers (
    reader_id integer primary key not null,
    reader_name varchar(50),
    reader_email varchar(50) not null,
    reader_password varchar(50) not null,
    current_story integer references stories(story_id) not null,
    hapter_id integer references chapters(chapter_id)
);
