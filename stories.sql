DROP TABLE if EXISTS categories cascade;
DROP TABLE if EXISTS stories cascade;
DROP TABLE if EXISTS chapters cascade;
DROP TABLE if EXISTS dependencies cascade;
DROP TABLE if EXISTS choices cascade;
DROP TABLE if EXISTS authors cascade;
DROP TABLE if EXISTS readers cascade;
DROP TABLE if EXISTS session_info;

CREATE TABLE categories (
    category_id integer primary key not null,
    category_name varchar(50) not null
);

CREATE TABLE authors (
    author_id integer primary key not null,
    author_name varchar(50) not null,
    author_contact varchar(50),
    author_address varchar(50),
    author_about text,
    author_photo text,
    author_email varchar(50) not null
);

CREATE TABLE stories (
    story_id integer primary key not null,
    story_title varchar(50) not null,
    story_description text,
    category_id integer references categories(category_id),
    author_id integer references authors(author_id),
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
    story_id integer references stories(story_id),
    from_chapter_id integer references chapters(chapter_id) not null,
    to_chapter_id integer references chapters(chapter_id) not null  
);

CREATE TABLE choices (
    choice_id integer primary key not null,
    chapter_id integer references chapters(chapter_id) not null,
    story_id integer references stories(story_id) not null,
    details text not null,
    photo text,
    video text,
    audio text
);

CREATE TABLE readers (
    reader_id integer primary key not null,
    reader_name varchar(50),
    reader_email varchar(50) not null
);

CREATE TABLE session_info (
    reader_id integer references readers(reader_id) not null,
    current_story integer references stories(story_id) not null,
    chapter_id integer references chapters(chapter_id) not null
);

insert into categories("category_id", "category_name") values(701, 'History');
insert into categories("category_id", "category_name") values(702, 'Fiction');
insert into categories("category_id", "category_name") values(703, 'Romance');
insert into categories("category_id", "category_name") values(704, 'Adventure');

insert into authors("author_id", "author_name", "author_email") values(501, 'Yaa Nuamah', 'edna@email.com');
insert into authors("author_id", "author_name", "author_email") values(502, 'Isaac Agyen', 'edna@email.com');

insert into stories("story_id", "story_title", "story_description", "category_id", "story_photo", "author_id") values(101, 'My choice', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 703, 'www.photo.com', 501);
insert into stories("story_id", "story_title", "story_description", "category_id", "story_photo", "author_id") values(102, 'Destiny', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 703, 'www.photo.com', 501);
insert into stories("story_id", "story_title", "story_description", "category_id", "story_photo", "author_id") values(103, 'Strength', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 703, 'www.photo.com', 502);
insert into stories("story_id", "story_title", "story_description", "category_id", "story_photo", "author_id") values(104, 'The Arms', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat', 703, 'www.photo.com', 502);

insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(201, 101, 'There', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');
insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(202, 101, 'Lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');
insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(203, 102, 'Strike', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');
insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(204, 102, 'Forbid', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');

insert into dependencies("dependency_id", "story_id", "from_chapter_id", "to_chapter_id") values(401, 101, 201, 202);
insert into dependencies("dependency_id", "story_id", "from_chapter_id", "to_chapter_id") values(402, 101, 203, 204);

insert into choices("choice_id", "chapter_id", "details", "story_id") values(801, 202, 'next dependency', 101);

insert into readers("reader_id", "reader_name", "reader_email") values(601, 'Shadrack Ankomahene', 'shad@gmail.com');
insert into readers("reader_id", "reader_name", "reader_email") values(602, 'Sam Bartels', 'sam@me.io');

insert into session_info("reader_id", "current_story", "chapter_id") values(601, 101, 201);