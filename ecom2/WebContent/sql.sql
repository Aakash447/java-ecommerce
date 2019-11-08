create database ecom;

create table register(
email varchar(40),
password varchar(40),
passwordRepeat varchar(40)
) ;

create table brands(
bid varchar(5),
bname varchar(40),
);

create table categories(
cid varchar(5),
cname varchar(40),
);

create table catbrand(
cid varchar(5),
bid varchar(5)
);

create table cart(
pid varchar(5),
pname  varchar(40),
imagename varchar(50),
pprice int(6)
);








