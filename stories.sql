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
    chapter_id integer references chapters(chapter_id)
);

insert into categories("category_id", "category_name" ) values(701, "History");
insert into categories("category_id", "category_name" ) values(702, "Fiction");
insert into categories("category_id", "category_name" ) values(703, "Romance");
insert into categories("category_id", "category_name" ) values(704, "Adventure");

insert into stories("story_id", "story_title", "story_category", "story_photo") values(101, 'My choice', 703, 'www.photo.com');
insert into stories("story_id", "story_title", "story_category", "story_photo") values(102, 'Destiny', 702, 'www.photo.com');
insert into stories("story_id", "story_title", "story_category", "story_photo") values(103, 'Strength', 701, 'www.photo.com');
insert into stories("story_id", "story_title", "story_category", "story_photo") values(104, 'The Arms', 704, 'www.photo.com');

insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(201, 101, 'There', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');
insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(202, 101, 'Lorem', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');
insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(203, 102, 'Strike', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');
insert into chapters("chapter_id", "story_id", "chapter_title", "chapter_content") values(204, 102, 'Forbid', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat');

insert into dependencies("dependency_id", "chapter_id", "content") values(401, 201, 'Go to chapter 2');
insert into dependencies("dependency_id", "chapter_id", "content") values(402, 201, 'Go to chapter 1');
insert into dependencies("dependency_id", "chapter_id", "content") values(403, 203, 'Go to chapter 02');
insert into dependencies("dependency_id", "chapter_id", "content") values(404, 203, 'Go to chapter 01');

insert into authors("author_id", "author_name", "story_id", "author_email", "author_password") values(501, 'Yaa Nuamah', 101, 'edna@email.com', '12435fgd');
insert into authors("author_id", "author_name", "story_id", "author_email", "author_password") values(502, 'Isaac Agyen', 102, 'edna@email.com', '53f35fgd');

insert into readers("reader_id", "reader_name", "reader_email", "reader_password", "chapter_id") values(601, 'Shadrack Ankomahene', 'shad@gmail.com', '1234gfv', 201);
insert into readers("reader_id", "reader_name", "reader_email", "reader_password", "chapter_id") values(602, 'Sam Bartels', 'sam@gmail.com', '1234gfv', 203);