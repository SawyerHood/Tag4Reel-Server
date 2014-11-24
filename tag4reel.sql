drop database if exists tag4reel;
create database tag4reel;
use tag4reel;

create table angler (
	angler_id int not null auto_increment,
	first_name varchar(30) not null,
	last_name varchar(30) not null,
	email varchar(30) not null,
	salt varchar(100) not null,
	hash varchar(128) not null,
	account_type varchar(10) not null,
	primary key (angler_id),
	unique (email)
);



create table session (
	session_token varchar(30) not null,
	angler_id integer not null,
	session_start date not null,
	primary key (session_token),
	foreign key (angler_id) references angler (angler_id)
);



create table species (
	species_id integer not null auto_increment,
	name varchar(30) not null,
	salt boolean not null,
	fresh boolean not null,
	slot_size float,
	primary key(species_id)

);

create table fish (
	tag_id varchar(20) not null,
	species_id integer not null,
	tag_type varchar(20),
	primary key (tag_id),
    foreign key (species_id) references species (species_id)
);

create table catch (
	catch_id integer not null auto_increment,
            angler_id integer not null,
	tag_id varchar(20) not null,
	weather varchar(30),
	date_catch date not null,
	longitude double not null,
	latitude double not null,
	bait_used varchar(30),
	rigging varchar(30),
	name_location varchar(30), 
            size float,
	primary key (catch_id),
	foreign key (tag_id) references fish (tag_id),
    foreign key (angler_id) references angler (angler_id)
);



/*
* Fixtures 
*/

insert into species (name, salt, fresh, slot_size) values ("Trout", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Tuna", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Salmon", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Grouper", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Bass", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Snook", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Red Snapper", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Red Drum", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Cobia", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Bluefish", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Swordfish", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Sailfish", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Striped Mullet", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Blackfin Snapper", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Yellowtail Snapper", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Silk Snapper", true, false, NULL);
insert into species (name, salt, fresh, slot_size) values ("Black Crapple", false, true, NULL);
insert into species (name, salt, fresh, slot_size) values ("Largemouth Bass", false, true, NULL);
insert into species (name, salt, fresh, slot_size) values ("Striped Bass", false, true, NULL);
insert into species (name, salt, fresh, slot_size) values ("Florida Gar", false, true, NULL);
insert into species (name, salt, fresh, slot_size) values ("White Bass", false, true, NULL);
insert into species (name, salt, fresh, slot_size) values ("Spotted Bass", false, true, NULL);
insert into species (name, salt, fresh, slot_size) values ("White Catfish", false, true, NULL);


insert into angler values ( null, 'Alejandro', 'Rodriguez', 'arod@emailspot.com', 'salt', '854fa85e40a01964d36e41252bca4b2c85724bcba4e73177d958c2f6c55b61a5' , 'research'); #pw: 7xBBdgH#
insert into angler values ( null , 'Billy' , 'Borat' , 'bborat@emailspot.com' , 'pepper' , '7b5231bbdbd3762d2570fca9abfc75fcdec11e4780b3c4f6808900af2487b4de' , 'recreation' ); #pw: ffFgd1!
insert into angler values ( null , 'Christy' , 'Augilarious' , 'aguilar@femail.com' , 'pizza' , 'd4a291219fe248dad6b5bf79ac73210db54a715a1e5710f21a00dd12f44b77da' , 'research' ); #pw: brAb$42
insert into angler values ( null , 'William' , 'Mickey' , 'wmick@emailspot.com' , 'popcorn' , 'fc424c14090019e2c94573487b29db4734f4ce27487efa3021989369def1397b' , 'recreation' ); #pw: g2xt8%d
insert into angler values ( null , 'Freddy' , 'Jupiter' , 'fjupiter@emailspot.com' , 'lazy' , 'fdc4e3eeaca5382da664d3a39a17287423bdb3734221ca1c135bf1dd288cc0ec' , 'research' ); #pw: m4n75p#
insert into angler values ( null , 'George' , 'Reagan' , 'greagan@emailspot.com' , 'snake' , '2bfb0aaa8e5a645cc99a18471046d760a215683ffdb038dc109ee394f0021b33' , 'recreation' ); #pw: !!rd2fgr
insert into angler values ( null , 'Pierre' , 'Ramon' , 'pramon@emailspot.com' , 'warmer' , '202365a6b1b7b5b05f99c06bab9d82dff3ea85f3a1869f3959b71ded6c45eb92' , 'research' ); #pw: 43bash@r
insert into angler values ( null , 'Annie' , 'Ruption' , 'aruption@emailspot.com' , 'moist' , 'e6de433d7e6ed7bfc969dfb93695537d2b4fb479807ffe312972171b5b30def8' , 'recreation' ); #pw: 8@#iq5u
insert into angler values ( null , 'Brandom' , 'Milo' , 'bmilo@emailspot.com' , 'sloppy' , '13ad646b62415eaf18c003b45a770fdfce7adc773a69f4d0e93cf0873e2acd7f' , 'research' ); #pw: p6*fg1v
insert into angler values ( null , 'Jordan' , 'West' , 'jwest@supermail.com' , 'whack' , 'df674276f3233a13882026150107399f8be9bde2b596698578f5bd3b9960b20f' , 'recreation' ); #pw: @jx87wD
insert into angler values ( null , 'Richard' , 'Quirky' , 'rqu1rkee@gmail.com' , 'floppy' , '016f76b9c8cbfa7bd726239f983e82452bd28dfbb21ab9820ff91a53c8ddcf02' , 'research' ); #pw: RQ111Qee
insert into angler values ( null , 'Justin' , 'AllenIverson' , 'ALLIverson@yahoo.com' , 'ribbit' , '2f73dcd3b742622ae6341db92d3317af954c707a2903b639f92d72bcbd8ed827' , 'recreation' ); #pw: JPEG32ALL1!
insert into angler values ( null , 'Tom' , 'Petty' , 'Petty4Reel@hotmail.com' , 'thanks' , '4dfa64a2a54208631e9b5882bd30a885b4acf957efe6dbdc330e6ce73fb2bde7' , 'recreation' ); #pw: LPX!!23
insert into angler values ( null , 'JP' , 'YumYum' , 'JP@outlook.com' , 'resign' , 'b10b84e4d45c77425c8dfb291888f075ad3c94603411f7b24f388a46168889c7' , 'recreation' ); #pw: JYum!#*
insert into angler values ( null , 'Lemon' , 'Squeezy' , 'lemonsAllDay@lemons.com' , 'thwart' , '2957c42faa37d2815f38c04f90aa350f0fa6da052f8b512e7ba0cadf471a1b46' , 'recreation' ); #pw: LemonSqueezy!


insert into fish (tag_id, species_id) values ('123456', 1);
insert into fish (tag_id, species_id) values ('654321', 5);
insert into fish (tag_id, species_id) values ('124356', 6);
insert into fish (tag_id, species_id) values ('135799', 3);
insert into fish (tag_id, species_id) values ('223366', 17);
insert into fish (tag_id, species_id) values ('112358', 15);
insert into fish (tag_id, species_id) values ('162538', 12);
insert into fish (tag_id, species_id) values ('851462', 20);
insert into fish (tag_id, species_id) values ('999998', 13);
insert into fish (tag_id, species_id) values ('745213', 1);
insert into fish (tag_id, species_id) values ('656521', 2);
insert into fish (tag_id, species_id) values ('324956', 3);
insert into fish (tag_id, species_id) values ('133411', 7);
insert into fish (tag_id, species_id) values ('981721', 8);

/* catchID, anglerID, tagID, weather, date, latitude, longitude, bait used, rigging, name location, size of catch*/
/*Dates are in the format YYYY-MM-DD */

insert into catch values (null, 5, '123456', 'hot', '2014-12-21', 0.0, 0.0, null, null,  'Mosquito Lagoon', 35);
insert into catch values (null, 3, '654321', 'clear', '2013-01-01', 41.0, 81.0, null, null,  'Lake Lanier',  21);
insert into catch values (null, 12, '124356', 'overcast', '2014-08-20', 0.0, 0.0, null, null,  'Lake Tahoe',  23.25);
insert into catch values (null, 8, '135799', 'overcast', '2013-09-13', 0.0, 0.0, null, null,  'Gulf of Mexico',  42);
insert into catch values (null, 1, '223366', 'cloudy', '2014-04-27', 0.0, 0.0, null, null,  'Gulf of Mexico',  25.25);
insert into catch values (null, 14, '112358', 'rainy', '2014-02-18', 0.0, 0.0, null, null,  'Indian River',  55);
insert into catch values (null, 10, '851462', 'hot', '2013-01-07', 0.0, 0.0, null, null,  'Amazon River',  19);
insert into catch values (null, 2, '999998', 'rainy', '2013-09-02', 0.0, 0.0, null, null,  'Lake George',  20);
insert into catch values (null, 11, '654321', 'overcast', '2014-02-28', 0.0, 0.0, null, null,   'Lake Lanier',  23);
insert into catch values (null, 6, '745213', 'rainy', '2014-04-30', 0.0, 0.0, null, null,  'Islamorado',  44.75);
insert into catch values (null, 9, '656521','overcast', '2013-12-12', 0.0, 0.0, null, null,  'Big Pine',  26);
insert into catch values (null, 4, '324956', 'clear', '2014-11-25', 0.0, 0.0, null, null,  'Seattle',  67);
insert into catch values (null, 7, '133411', 'hot', '2013-09-18', 0.0, 0.0, null, null,  'Destin',  41);
insert into catch values (null, 13, '981721', 'snow', '2014-02-03', 0.0, 0.0, null, null,  'Ontario',  18);

#Catch queries
#Select all catches for a certain angler
select * from catch
    where angler_id = (select angler_id from angler
        where email =  'fjupiter@emailspot.com');

#This selects all catches within a certain location. ((40,42),(80,82))
select * from catch
    where latitude > 40 AND
        latitude < 42 AND 
        longitude > 80 AND
        longitude < 82;

#select all catches where the fish is a tuna
select *
    from catch
    where tag_id in
        (select tag_id 
        from fish 
        inner join species
        on fish.species_id = species.species_id
            where species.name = 'Tuna');

#Set the weather for catch #2 to overcast.
update catch 
	set weather='overcast'
	where catch_id=2;


#set a catch date to 2014-12-23 where id = 1
update catch
set date_catch = '2014-12-23'
where catch_id=1;

#set catch location to small pine for catch id = 9.
update catch
set name_location = 'small pine'
where catch_id = 9;


#Angler queries

#select angler name based on their email
select first_name, last_name
   from angler
   where email = 'aguilar@femail.com';

# updates angler 5 from recreation to a research account
update angler
set account_type = 'research'
where angler_id = 5;

# updates last name of angler 1
update angler
	set last_name = 'Ulando'
	where angler_id = 1;

# updates last name of angler 10
update angler
set last_name = 'Peterson'
where angler_id = 10;

# updates angler 7 from research to a recreation account
update angler
set account_type = 'Recreation'
where angler_id = 7;


 

 #Species Queries
update species
set slot_size = '18.5'
where species_id = '6';

update species
	set slot_size = '12'
	where species_id = '2';

#Select all species where the name of the species starts with 'Red'.
select *
	from species 
	where name like 'Red%';


