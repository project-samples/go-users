create table users(
	id character varying(40) not null primary key,
	username character varying(120),
	email character varying(120),
	phone character varying(45),
	gender char(1),	
	displayname character varying(500),
	givenName character varying(100),
	familyName character varying(100),
	middleName character varying(100),

	alternativeemail character varying(255),
	alternativephone character varying(45),
	imageurl character varying(255),
	coverurl character varying(255),
	title character varying(255),
	nationality character varying(255),
	address character varying(255),
	bio character varying(255),
	website character varying(255),
	occupation character varying(255),
	company character varying(255),
	location character varying(255),
	maxpasswordage integer,
	dateofbirth timestamp with time zone,
	settings jsonb,
	links jsonb,
	gallery jsonb[],
	skills jsonb[],
	achievements jsonb[],
	works jsonb[],
	companies jsonb[],
	educations jsonb[],
	interests character varying[],
	lookingfor character varying[],
	status char(1),
	createdby character varying(40) not null,
	createdat timestamp with time zone,
	updatedby character varying(40) not null,
	updatedat timestamp with time zone,
	social jsonb,
	version integer
);

insert into users(id,username,email,createdby,updatedby) values('AWvaYDttM','vinhtq2020','vinhtq2020@gmail.com','AWvaYDttM','AWvaYDttM');

create table passwords (
	id character varying(40) not null primary key,
	password character varying(255),
	successtime timestamp with time zone,
	failtime timestamp with time zone,
	failcount integer,
	lockeduntiltime timestamp with time zone,
	history character varying[]
);
create table history (
	id character varying(40) not null primary key,
	history character varying[]
);
create table userinfo (
  id character varying(40) not null primary key,
  followercount bigint default 0,
  followingcount bigint default 0,
  rate1 int default 0
);
create table userfollowing (
  id character varying(40) not null ,
  following character varying(40) not null 
);
create table userfollower (
  id character varying(40) not null ,
  follower character varying(40) not null 
);
create table signupcodes (
	id character varying(40) not null primary key,
	code character varying(500) not null,
	expiredat timestamp with time zone not null
);
create table authencodes (
	id character varying(40) not null primary key,
	code character varying(500) not null,
	expiredat timestamp with time zone not null
);
create table passwordcodes (
	id character varying(40) not null primary key,
	code character varying(500) not null,
	expiredat timestamp with time zone not null
);

create table skills(
	skill varchar(120) not null,
	primary key (skill)
);

create table interests(
	interest varchar(120) not null,
	primary key (interest)
);
create table searchs (
	item varchar(120) not null,
	primary key (item)
);
create table filmdirectors(
	director varchar(120) not null primary key
);
create table filmcasts(
	actor varchar(120) not null primary key
);
create table filmproductions(
	production varchar(120) not null primary key
);
create table countries(
	country varchar(120)not null primary key
);
insert into skills(skill) values('java');
insert into skills(skill) values('javascripts');
insert into skills(skill) values('c++');
insert into skills(skill) values('c#');
insert into skills(skill) values('c');
insert into skills(skill) values('python');
insert into skills(skill) values('ruby');
insert into skills(skill) values('rust');
insert into skills(skill) values('reactjs');
insert into skills(skill) values('angular');
insert into skills(skill) values('vue');
insert into skills(skill) values('express');
insert into skills(skill) values('codeigniter');
insert into skills(skill) values('react native');
insert into skills(skill) values('flutter');

insert into interests(interest) values('game');
insert into interests(interest) values('movie');
insert into interests(interest) values('coding');
insert into interests(interest) values('football');
insert into interests(interest) values('basketball');
insert into interests(interest) values('books');
insert into interests(interest) values('money');
insert into interests(interest) values('manga');
insert into interests(interest) values('badminton');
insert into interests(interest) values('esport');
insert into interests(interest) values('food');

insert into searchs(item) values('friend');
insert into searchs(item) values('room mate');
insert into searchs(item) values('basketball team');

insert into filmdirectors(director) values('Steven Spielberg');
insert into filmdirectors(director) values('Quentin Tarantino');
insert into filmdirectors(director) values('christopher Nolan');
insert into filmdirectors(director) values('Peter Jackson');
insert into filmdirectors(director) values('Martin Scorsese');

insert into filmcasts(actor) values ('Will Smith');
insert into filmcasts(actor) values ('Leonardo DiCaprio');
insert into filmcasts(actor) values ('Tom Hanks');
insert into filmcasts(actor) values ('Samuel L. Jackson');
insert into filmcasts(actor) values ('Robert Downey Jr.');
insert into filmcasts(actor) values ('Johnny Deep');
insert into filmcasts(actor) values ('Benedict Cumberbatch');

insert into filmproductions(production)values('Walt Disney Studios');
insert into filmproductions(production)values('Warner Bros.');
insert into filmproductions(production)values('Universal Pictures');
insert into filmproductions(production)values('Paramount Pictures');
insert into filmproductions(production)values('Lionsgate Films');

insert into countries(country)values('Vietnam');
insert into countries(country)values('United State');
insert into countries(country)values('England');
insert into countries(country)values('Chinese');
insert into countries(country)values('Australia');
--rate user-------------------------------------------
CREATE TABLE userrateinfo(
  id varchar(255),
  rate numeric DEFAULT 0,
  rate1 integer DEFAULT 0,
  rate2 integer DEFAULT 0,
  rate3 integer DEFAULT 0,
  rate4 integer DEFAULT 0,
  rate5 integer DEFAULT 0,
  rate6 integer DEFAULT 0,
  rate7 integer DEFAULT 0,
  rate8 integer DEFAULT 0,
  rate9 integer DEFAULT 0,
  rate10 integer DEFAULT 0,
  count integer,
  score numeric,
  primary key(id)
);
CREATE TABLE userrate(
  id varchar(255),
  author varchar(255),
  rate integer,
  time timestamp,
  review text,
  usefulcount integer default 0,
  replycount integer default 0,
  histories jsonb[],
  primary key(id, author)
);
CREATE TABLE userratereaction(
	id varchar(255),
	author varchar(255),
	userid varchar(255),
	time timestamp,
	reaction smallint,
	primary key(id, author, userid)
);
CREATE TABLE userratecomment(
  commentId varchar(255),
  id varchar(255),
  author varchar(255),
  userid varchar(255),
  comment text,
  time timestamp,
  updatedat timestamp,
  histories jsonb[],
  primary key(commentid)
);
--userreaction-----------------------------------------------
create table userreaction (
  id varchar(255),
  author varchar(255),
	userid varchar(255),
  reaction smallint,
  time timestamp,
  primary key(id, author, userid)
);
create table userinfomation(
  id varchar(255),
  appreciate bigint default 0,
  respect bigint default 0,
  admire bigint default 0,
  reactioncount bigint default 0,
  primary key(id)
);

  -------------------------------------------------------------
  ---------------------------FILM---------------------------
  create table film(
  id character varying(40) primary key,
  title character varying(300) not null,
  description character varying(300),
  imageurl character varying(300),
  trailerurl character varying(300),
  categories character varying[],
  directors character varying[],
  casts character varying[],
  productions character varying[],
  countries character varying[],
  language character varying(300),
  writer character varying[],
  gallery jsonb[],
  coverurl character varying(300),
  status char(1) not null,
  createdby character varying(40),
  createdat timestamp,
  updatedby character varying(40),
  updatedat timestamp
);

INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00001','The Shawshank Redemption','https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_.jpg','https://www.imdb.com/video/vi3877612057?playlistId=tt0111161&ref_=tt_pr_ov_vi','{drama}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00002','Thor: Love and Thunder','https://genk.mediacdn.vn/139269124445442048/2022/4/19/2-16503255592162067496114.jpg','https://www.youtube.com/watch?v=tgB1wUcmbbw','{drama,crime}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00003','Top Gun: Maverick','https://www.cgv.vn/media/catalog/product/cache/3/image/c5f0a1eff4c394a251036189ccddaacd/t/o/top_gun_maverick_-_poster_28.03_1_.jpg','https://www.youtube.com/watch?v=yM389FbhlRQ','{action,drama}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00004','The Batman','https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/p/o/poster_batman-1.jpg','https://youtu.be/761uRaAoW00','{action,crime,drama}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00005','The Sadness','https://phimnhua.com/wp-content/uploads/2022/04/phimnhua_1650248826.jpg','https://www.youtube.com/watch?v=axjme4v-xRo','{horror}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00006','Doctor Strange in the Multiverse of Madness','https://m.media-amazon.com/images/M/MV5BMDFkYTc0MGEtZmNhMC00ZDIzLWFmNTEtODM1ZmRlYWMwMWFmXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UY67_CR0,0,45,67_AL_.jpg','https://www.imdb.com/video/vi3877612057?playlistId=tt0111161&ref_=tt_pr_ov_vi','{action,adventure,fantasy}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00007','Fantastic Beasts: The Secrets of Dumbledore','https://i.bloganchoi.com/bloganchoi.com/wp-content/uploads/2022/04/review-phim-sinh-vat-huyen-bi-3-fantastic-beasts-3-2-696x1031.jpg?fit=700%2C20000&quality=95&ssl=1','https://youtu.be/Y9dr2zw-TXQ','{family,adventure,fantasy}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00008','The Adam Project','http://photos.q00gle.com/storage/files/images-2021/images-movies/09/622b6789e7084.jpg','https://youtu.be/IE8HIsIrq4o','{action,comedy,adventure}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00009','Spider-Man: No Way Home','https://gamek.mediacdn.vn/133514250583805952/2021/11/17/photo-1-1637118381839432740223.jpg','https://www.youtube.com/watch?v=OB3g37GTALc','{action,adventure,fantasy}','A');
INSERT INTO film (id,title,imageurl,trailerurl,categories,status) VALUES ('00010','Dune','https://www.cgv.vn/media/catalog/product/cache/1/image/c5f0a1eff4c394a251036189ccddaacd/d/u/dune-poster-1.jpg','https://youtu.be/8g18jFHCLXk','{action,adventure,drama}','A');

CREATE TABLE filmrateinfo(
  id varchar(255),
  rate numeric DEFAULT 0,
  rate1 integer DEFAULT 0,
  rate2 integer DEFAULT 0,
  rate3 integer DEFAULT 0,
  rate4 integer DEFAULT 0,
  rate5 integer DEFAULT 0,
  rate6 integer DEFAULT 0,
  rate7 integer DEFAULT 0,
  rate8 integer DEFAULT 0,
  rate9 integer DEFAULT 0,
  rate10 integer DEFAULT 0,
  count integer,
  score numeric,
  primary key(id)
);

create table filmcategory(
  categoryid character varying(40) primary key,
  categoryname character varying(300) not null,
  status char(1) not null,
  createdby character varying(40),
  createdat timestamp,
  updatedby character varying(40),
  updatedat timestamp
);

INSERT INTO filmcategory (categoryid,categoryname,status) VALUES('adventure','adventure','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('animated','animated','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('comedy','comedy','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('drama','drama','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('horror','horror','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('crime','crime','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('fantasy','fantasy','A');
INSERT INTO filmcategory (categoryid,categoryname,status) VALUES ('family','family','A');

CREATE TABLE filmrate(
  id varchar(255),
  author varchar(255),
  rate integer,
  time timestamp,
  review text,
  usefulcount integer default 0,
  replycount integer default 0,
  histories jsonb[],
  primary key(id, author)
);

CREATE TABLE filmratereaction(
	id varchar(255),
	author varchar(255),
	userid varchar(255),
	time timestamp,
	reaction smallint,
	primary key(id, author, userid)
);

CREATE TABLE filmratecomment(
  commentId varchar(255),
  id varchar(255),
  author varchar(255),
  userid varchar(255),
  comment text,
  time timestamp,
  updatedat timestamp,
  histories jsonb[],
  primary key(commentid)
);

create table category(
  categoryid character varying(40) primary key,
  categoryname character varying(300) not null,
  status char(1) not null,
  createdby character varying(40),
  createdat timestamp,
  updatedby character varying(40),
  updatedat timestamp
);

insert into category (categoryid,categoryname,status) values ('action','action','A');
insert into category (categoryid,categoryname,status) values ('comedy','comedy','A');
insert into category (categoryid,categoryname,status) values ('camera','camera','A');
insert into category (categoryid,categoryname,status) values ('mobiphone','mobiphone','A');
insert into category (categoryid,categoryname,status) values ('technological','technological','A');
insert into category (categoryid,categoryname,status) values ('apple','apple','A');
insert into category (categoryid,categoryname,status) values ('laptop','laptop','A');


create table brand (
  brand character varying(255) primary key
);

insert into brand (brand) values('Sony');
insert into brand (brand) values ('Samsung');
insert into brand (brand) values ('Canon');
insert into brand (brand) values ('Nikon');
insert into brand (brand) values ('Olypus');
insert into brand (brand) values ('Xiaomi');
insert into brand (brand) values ('Apple');
insert into brand (brand) values ('Disney');


create table itemresponse(
  id character varying(40) not null,
  author character varying(40) not null,
  description text,
  time timestamp,
  usefulcount integer default 0,
  replycount integer default 0,
  histories jsonb[],
  primary key (id, author)
);

insert into itemresponse (id,author,description,time) values ('01','77c35c38c3554ea6906730dbcfeca0f2', 'Good', '2022-07-22');
insert into itemresponse (id,author,description,time) values ('02','77c35c38c3554ea6906730dbcfeca0f2', 'Not Bad', '2022-07-22');
insert into itemresponse (id,author,description,time) values ('03','77c35c38c3554ea6906730dbcfeca0f2', 'Wow', '2022-07-22');
insert into itemresponse (id,author,description,time) values ('04','77c35c38c3554ea6906730dbcfeca0f2', 'Bad', '2022-07-22');
insert into itemresponse (id,author,description,time) values ('05','77c35c38c3554ea6906730dbcfeca0f2', 'I hate this', '2022-07-22');


create table itemcomment (
  id character varying(40) not null,
  author character varying(40) not null,
  userId character varying(40) not null,
  comment text,
  time timestamp,
  updatedat timestamp,
  histories jsonb[],
  primary key (id)
);

insert into itemcomment (id,author,userId,comment,time) values ('01','02','77c35c38c3554ea6906730dbcfeca0f2', 'Good', '2022-07-22');
insert into itemcomment (id,author,userId,comment,time) values ('02','06','77c35c38c3554ea6906730dbcfeca0f2', 'Not Bad', '2022-07-22');
insert into itemcomment (id,author,userId,comment,time) values ('03','05','77c35c38c3554ea6906730dbcfeca0f2', 'abc', '2022-07-22');
insert into itemcomment (id,author,userId,comment,time) values ('04','07','77c35c38c3554ea6906730dbcfeca0f2', 'Bad', '2022-07-22');
insert into itemcomment (id,author,userId,comment,time) values ('05','11','77c35c38c3554ea6906730dbcfeca0f2', '123', '2022-07-22');

CREATE TABLE iteminfo(
  id varchar(255),
  viewCount integer DEFAULT 0,
  primary key(id)
);

create table itemresponsereaction(
	id varchar(255),
	author varchar(255),
	userid varchar(255),
	time timestamp,
	reaction smallint,
	primary key(id, author, userid)
);


----------------COMPANY------------------- 
create table company
(
    id character varying(40) not null primary key,
    name character varying(120),
    description character varying(1000),
    address character varying(255) not null,
    size integer,
    status char(1) not null,
    establishedAt timestamp with time zone,
    categories character varying[],
    imageurl character varying(300),
    coverurl character varying(300),
    gallery character varying[]
);
insert into company (id, name,address, description, size, status, establishedAt, categories, imageurl) values ('id1','Softwave company',' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 'This is description', 500,'A', '2022-07-21','{Categories1, Categories2}','https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg');
insert into company (id, name,address, description, size,status, establishedAt, categories, imageurl) values ('id2','Softwave company', ' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh','This is description', 500,'A', '2022-07-21','{Categories1, Categories2}','https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg');
insert into company (id, name,address, description, size,status, establishedAt, categories, imageurl) values ('id3','Softwave company',' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 'This is description', 500,'A', '2022-07-21','{Categories1, Categories2}','https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg');
insert into company (id, name,address, description, size,status, establishedAt, categories, imageurl) values ('id4','Softwave company',' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 'This is description', 500,'I', '2022-07-21','{Categories1, Categories2}','https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg');
insert into company (id, name,address, description, size,status, establishedAt, categories, imageurl) values ('id5','Softwave company',' Hùng Vương Plaza 126 Hùng Vương Quận 5 Tp. Hồ Chí Minh', 'This is description', 500,'I', '2022-07-21','{Categories1, Categories2}','https://maisonoffice.vn/wp-content/uploads/2021/09/toa-nha-hung-vuong-plaza.jpg');

create table companycategory(
  categoryid character varying(40) primary key,
  categoryname character varying(300) not null,
  status char(1) not null,
  createdby character varying(40),
  createdat timestamp,
  updatedby character varying(40),
  updatedat timestamp
);

insert into companycategory (categoryid,categoryname,status) VALUES ('Entertainment','Entertainment','A');
insert into companycategory (categoryid,categoryname,status) VALUES ('Financial business','Financial business','A');
insert into companycategory (categoryid,categoryname,status) VALUES ('Industrial production','Industrial production','A');
insert into companycategory (categoryid,categoryname,status) VALUES ('Real estate business','Real estate business','A');
insert into companycategory (categoryid,categoryname,status) VALUES ('Business services','Business services','A');

create table companyratefullinfo(
  id character varying(40) primary key,
  rate numeric DEFAULT 0,
  rate1 integer DEFAULT 0,
  rate2 integer DEFAULT 0,
  rate3 integer DEFAULT 0,
  rate4 integer DEFAULT 0,
  rate5 integer DEFAULT 0,
  count integer,
  score numeric
);

CREATE TABLE cinema (
  id varchar(40),
  name varchar(255) NOT NULL,
  address varchar(255) NOT NULL,
  parent varchar(40),
  status CHAR(1) NOT NULL,
  latitude  numeric,
  longitude numeric,
  imageURL text,
  createdby varchar(40),
  createdat timestamp,
  updatedby varchar(40),
  updatedat timestamp,
  gallery jsonb[],
  coverUrl text,
  primary key(id)
);

create table savedItem(
  id int primary key,
  items character varying[],
  createdby character varying(40),
  createdat timestamp,
  updatedby character varying(40),
  updatedat timestamp
);

create table companyrate(
  id varchar(255),
  author varchar(255),
  rate integer,
  time timestamp,
  review text,
  usefulcount integer default 0,
  replycount integer default 0,
  histories jsonb[],
  primary key(id, author)
);


-------------------item----------------

-- drop table item
create table item(
  id varchar(40),
  title varchar(120),
  author varchar(140),
  status varchar(1),
  description varchar(1500),
  price numeric,
  imageurl varchar(300),
  brand varchar(120),
  publishedat timestamp,
  expiredat timestamp,
  category character varying[],
  gallery jsonb[],
  primary key(id)
);

insert into item (id, title, status, price, imageurl, brand, publishedat, expiredat, description, category,gallery) values ('01', 'Movie tickets', 'A', 100000, 'https://i.etsystatic.com/31051854/r/il/951542/3882447990/il_570xN.3882447990_8so4.jpg', 'Disney', '2022-07-19', '2022-08-25', 'Thor movie ticket', '{comedy,action}',array['{"type":"image", "url":"https://i.etsystatic.com/31051854/r/il/951542/3882447990/il_570xN.3882447990_8so4.jpg","source":""}']::json[]);
insert into item (id, title, status, price, imageurl, brand, publishedat, expiredat, description, category,gallery) values ('02', 'Iphone 13', 'A', 20000000, 'https://lebaostore.com/wp-content/uploads/2022/02/iphone-13-pro-family-hero.png', 'Apple', '2022-07-19', '2025-07-19', 'Iphone 13 from Apple', '{mobiphone,technological,apple}',array['{"type":"image", "url":"https://lebaostore.com/wp-content/uploads/2022/02/iphone-13-pro-family-hero.png","source":""}']::json[]);
insert into item (id, title, status, price, imageurl, brand, publishedat, expiredat, description, category,gallery) values ('03', 'Camera', 'A', 100000000, 'https://acmartbd.com/wp-content/uploads/2015/03/Samsung-wb1100f.jpg','Samsung', '2022-07-19', '2025-07-19', 'Camera from Samsung', '{camera,technological}',array['{"type":"image", "url":"https://acmartbd.com/wp-content/uploads/2015/03/Samsung-wb1100f.jpg","source":""}']::json[]);
insert into item (id, title, status, price, imageurl, brand, publishedat, expiredat, description, category,gallery) values ('04', 'Movie tickets', 'A', 100000, 'https://i.pinimg.com/originals/2d/ac/e7/2dace73219e9f26ffb39b3bfbb98c41b.jpg','Disney', '2022-07-19', '2022-08-25', 'Minion mooive ticket', '{comedy,action}',array['{"type":"image", "url":"https://i.pinimg.com/originals/2d/ac/e7/2dace73219e9f26ffb39b3bfbb98c41b.jpg","source":""}']::json[]);
insert into item (id, title, status, price, imageurl, brand, publishedat, expiredat, description, category,gallery) values ('05', 'Macbook', 'A', 25000000, 'https://www.maccenter.vn/App_images/MacBookPro-14-SpaceGray.jpg','Apple', '2022-07-19', '2025-07-19', 'Macbook from Apple', '{laptop,technological,apple}',array['{"type":"image", "url":"https://www.maccenter.vn/App_images/MacBookPro-14-SpaceGray.jpg","source":""}']::json[]);

create table itemcategory(
  categoryid character varying(40) primary key,
  categoryname character varying(300) not null,
  status char(1) not null,
  createdby character varying(40),
  createdat timestamp,
  updatedby character varying(40),
  updatedat timestamp
);
------------- locations ----------------
create table location (
  id character varying(40) primary key,
  name character varying(300) not null,
  type character varying(40),
  description character varying(1000),
  status char(1) not null,
  geo jsonb,
  latitude numeric(20,16),
  longitude numeric(20,16),
  imageURL character varying(1500),
  customURL character varying(1500),
  createdBy character varying(1500),
  createdAt timestamp,
  updatedBy character varying(1500),
  version int,
  info jsonb
);


insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d146cbffbdf2b1d30742262',	
	'Highland Coffee',
	'coffee',
	'Highland Coffee',
	'A',
	106.62435293197633,
	10.852848365357607,
	'https://thumbs.dreamstime.com/z/highlands-coffee-shop-vung-tau-vietnam-jan-facade-vietnamese-chain-producer-distributor-86167986.jpg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);
insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d1d7a18c5e4f320a86ca6b1',	
	'Trung Nguyen Coffee',
	'coffee',
	'Trung Nguyen Coffee',
	'A',
	106.631039,
	10.855858,
	'https://cdn2.shopify.com/s/files/1/0065/6759/1999/files/dia-chi-trung-nguyen-legend-cafe-tai-vincom-ha-nam_grande.jpg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);
insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d1d7a66c5e4f320a86ca6b2',	
	'Highland Coffee',
	'coffee',
	'Highland Coffee',
	'A',
	106.630691,
	10.855842,
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/image/5d1d7a66c5e4f320a86ca6b2_IFc9Db9DT_c.jpg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);
insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d1d7a85c5e4f320a86ca6b3',	
	'Starbucks Coffee',
	'coffee',
	'Starbucks Coffee',
	'A',
	106.631495,
	10.854809,
	'https://ichef.bbci.co.uk/news/976/cpsprodpb/17185/production/_118879549_gettyimages-1308703596.jpg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);
insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d1d7b79c5e4f320a86ca6b4',	
	'King Coffee',
	'coffee',
	'King Coffee',
	'A',
	106.624183,
	10.855761,
	'https://www.asia-bars.com/wp-content/uploads/2015/11/cong-caphe-1.jpg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);
insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d1efb3796988a127077547c',	
	'Sumo BBQ Restaurant',
	'restaurant',
	'farthest',
	'A',
	106.624169,
	10.855769,
	'https://135525-391882-2-raikfcquaxqncofqfm.stackpathdns.com/wp-content/uploads/2021/04/Summo-BBQ-1280x960.jpeg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);
insert into location (id, name, type, description, status, latitude, longitude, imageURL, customURL) values (
	'5d562ad357568217d0d9a2d5',	
	'CGV',
	'cinema',
	'CGV cinema',
	'A',
	106.6316112323025,
	10.85486116109013,
	'https://rapchieuphim.com/photos/9/rap-cgv-su-van-hanh/rap-CGV-Su-van-hanh-8__2_.jpg',
	'https://storage.googleapis.com/go-firestore-rest-api.appspot.com/cover/5d146cbffbdf2b1d30742262_TL4wqjvnz_4K-Art-Wallpapers.jpg'
);

create table locationinfo (
  id character varying(40) primary key,
  rate numeric DEFAULT 0,
  rate1 integer DEFAULT 0,
  rate2 integer DEFAULT 0,
  rate3 integer DEFAULT 0,
  rate4 integer DEFAULT 0,
  rate5 integer DEFAULT 0,
  count integer DEFAULT 0,
  score numeric DEFAULT 0
);


-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d146cbffbdf2b1d30742262',3.1811023622047245,22,32,15,17,41,123);
-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d1d7a18c5e4f320a86ca6b1',3.4,1,1,0,1,2,2);
-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d1d7a66c5e4f320a86ca6b2',3.857142857142857,1,0,0,4,2,4);
-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d1d7a85c5e4f320a86ca6b3',0,0,0,0,0,0,0);
-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d1d7b79c5e4f320a86ca6b4',0,0,0,0,0,0,0);
-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d1efb3796988a127077547c',0,0,0,0,0,0,0);
-- insert into locationinfo (id, rate, rate1, rate2, rate3, rate4, rate5, score) values ('5d562ad357568217d0d9a2d5',0,0,0,0,0,0,0);

create table locationrate (
  id character varying(40) not null,
  author character varying(40) not null,
  rate integer not null,
  rateTime timestamp without time zone,
  review text,
  usefulcount integer default 0,
  replycount integer default 0,
  primary key (id, author)
);

insert into locationrate (id, author, rate, rateTime, review) values ('5d146cbffbdf2b1d30742262','77c35c38c3554ea6906730dbcfeca0f2',1,'2021-10-01','Bad');
insert into locationrate (id, author, rate, rateTime, review) values ('5d1d7a18c5e4f320a86ca6b1','77c35c38c3554ea6906730dbcfeca0f2',3,'2021-10-01','Poor');
insert into locationrate (id, author, rate, rateTime, review) values ('5d1d7b79c5e4f320a86ca6b4','77c35c38c3554ea6906730dbcfeca0f2',5,'2021-10-01','Excellent');
insert into locationrate (id, author, rate, rateTime, review) values ('5d1efb3796988a127077547c','77c35c38c3554ea6906730dbcfeca0f2',1,'2021-10-01','Poor');
insert into locationrate (id, author, rate, rateTime, review) values ('5d562ad357568217d0d9a2d5','77c35c38c3554ea6906730dbcfeca0f2',4,'2021-10-01','Good');

create table locationinfomation (
  id character varying(40) not null primary key,
  followercount bigint,
  followingcount bigint
);
create table locationfollowing (
  id character varying(40) not null ,
  following character varying(40) not null 
);
create table locationfollower (
  id character varying(40) not null ,
  follower character varying(40) not null 
);
CREATE TABLE locationratereaction (
	id character varying(40),
	author character varying(40),
	userid character varying(40),
	time timestamp,
	reaction smallint,
	primary key(id, author, userid)
);

create table savedlocation(
  id varchar(40) primary key,
  items character varying[]
);

-- room
create table room(
  id varchar(255)  primary key,
  title varchar(255),
  description varchar(1000),
  price integer,
  offer character varying[],
  location varchar(255),
  host varchar(255),
  guest integer,
  bedrooms integer,
  bed integer,
  bathrooms integer,
  highlight character varying[],
  status CHAR(1) ,
  region varchar(255),
  category character varying[],
  typeof character varying[],
  property varchar(255),
  language character varying[],
  imageUrl jsonb[]
);

insert into room ( id,title,description,price,offer,location,host,guest,bedrooms,bed,bathrooms,highlight,status,region,category,typeof,property,language,imageUrl) 
values (
  '01',
  'KHU NGHỈ DƯỠNG PIUGUS',
  'Piugus resort tọa lạc tại một hòn đảo nhỏ tư nhân tại Anambas. Toàn bộ biệt thự được xây dựng từ gỗ tự nhiên.',
  '500',
  '{Máy giặt,Sân hoặc ban công,Điều hòa nhiệt độ,Bữa sáng,Cho phép ở dài hạn,Cho phép hút thuốc}',
  'Anambas, Kepulauan Riau, Indonesia',
  'Herry',
  5,
  1,
  2,
  1,
  '{Self check-in,Great location,Dive right in}',
  'A',
  'Viet Nam',
  '{Beach, Tiny Home, Islands}',
  '{Toàn bộ nhà, Phòng riêng, Phòng chung}',
  'Nhà',
  '{Tiếng Anh, Tiếng Việt}',
  '{"{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_3VZT2SW8b\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_oSipzWeYi\", \"type\": \"image\"}","{\"url\": \"https://storage.googleapis.com/go-firestore-rest-api.appspot.com/gallery/JSg3tgoY0_EF7bCPZry\", \"type\": \"image\"}"}'
  );

create table locationcomment(
  commentId character varying(40) not null,
  id character varying(40) not null,
  author character varying(40) not null,
  userId character varying(40) not null,
  comment text,
  time timestamp,
  updatedat timestamp,
  histories jsonb[],
  primary key (commentId)
);

create table  articlecommentthread(
  commentId varchar(40) primary key,
  id varchar(40),
  author varchar(255),
  comment text,
  -- parent varchar(255),
  -- replycount int default 0,
  time timestamp with time zone,
  updatedat timestamp with time zone,
  histories jsonb[]
);

create table articlecomment(
  commentId varchar(40) primary key,
  commentThreadId varchar(40),
  id varchar(40),
  author varchar(255),
  userid varchar(255),
  comment text,
  parent varchar(255),
  time timestamp with time zone,
  updatedat timestamp with time zone,
  histories jsonb[]
);

create table articlecommentthreadinfo(
commentId varchar(40) primary key,
replycount int default 0,
usefulcount int default 0
);