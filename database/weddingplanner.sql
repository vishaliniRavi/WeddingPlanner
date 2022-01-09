--User details
CREATE TABLE user_details
(user_id INT DEFAULT user_seq_id.NEXTVAL,
user_role varchar2(20) DEFAULT 'customer',
user_name VARCHAR2(30) NOT NULL,
mobile_number NUMBER NOT NULL,UNIQUE(mobile_number),
city VARCHAR2(100) NOT NULL,
email_id VARCHAR2(50)  NOT NULL,UNIQUE(email_id) ,
password VARCHAR2(20) NOT NULL,
user_Wallet NUMBER DEFAULT '500000',
CONSTRAINT PK_user_details PRIMARY KEY(user_id) );
insert into user_details(user_role,user_name,mobile_number,city,email_id,password,user_Wallet)values('admin','karthika',9626834983,'chennai','karthika@gmail.com','Karthika@123',0);
select * from user_details;
update user_details set user_Wallet=500000 where user_id=3032;
delete from user_details where user_id=3054;
CREATE SEQUENCE user_seq_id INCREMENT BY 1 START WITH 3031;
drop sequence user_seq_id;
alter table  bookdetails add bookimages varchar2(5000);
select * from venuedetails WHERE  venue_name='vishali mahal';
select * from venue_details WHERE  venue_name='vishali mahal';


---venue details
CREATE TABLE venue_details
(venue_id INT DEFAULT venue_seq_id.NEXTVAL ,
venue_name VARCHAR2(50) NOT NULL,
venue_area VARCHAR2(100) NOT NULL,
venue_city varchar2(50) NOT NULL,
Venue_type VARCHAR2(100) NOT NULL,
venue_vendor_name VARCHAR2(50) NOT NULL,
contact_number NUMBER NOT NULL,
venue_package NUMBER(10,2) NOT NULL,
check_availability VARCHAR2(10) NOT NULL, 
CONSTRAINT PK_venue_details PRIMARY KEY(venue_id));
CREATE SEQUENCE venue_seq_id INCREMENT BY 1 START WITH 1011; 
SELECT
    *
FROM venue_details;
commit;
update venue_details set venue_name='Riya Venue' where venue_id=1015;
alter table  venue_details add venue_images varchar2(500);
update venue_details set venue_images='https://bluebaymahabs.com/images/beach_wedding_stage_chennai.jpg' where venue_id=1071;
drop sequence venue_seq_id;
insert into venue_details (venue_name,venue_address,venue_city,venue_type,venue_vendor_name,contact_number,venue_package)values('Blue Bay Beach Resort','Avadi','chennai',
'Banquet Halls','priya',9876543210,80000.00);
alter table venue_details rename column venue_address to venue_area;
--service details
CREATE TABLE Service_details
(service_id INT DEFAULT service_seq_id.NEXTVAL,
service_name VARCHAR2(50) NOT NULL,
service_package NUMBER(10,2) NOT NULL,
ratings INT  DEFAULT '0',
CONSTRAINT PK_service_details PRIMARY KEY(service_id));
alter table  service_details add service_images varchar2(500);
CREATE SEQUENCE service_seq_id INCREMENT BY 1 START WITH 2021;
select * from service_details; 
alter table service_details drop column ratings;
update service_details set service_images='https://thumbs.dreamstime.com/b/wedding-stage-decoration-hall-party-188164657.jpg' where service_id=2081;
alter table venue_details rename column venue_address to venue_area;
alter table venue_details drop column function_time;
insert into service_details (service_name,service_package)values('photography',50000);
insert into service_details (service_name,service_package)values('Decoration',60000);

select * from service_details;
select * from venue_details where venue_package<150000;
--booking venue
CREATE TABLE booking_venues
(venue_booking_id INT DEFAULT bookvenue_seq_id.NEXTVAL,
user_id INT NOT NULL,
venue_id INT NOT NULL,
venue_name VARCHAR2(50) NOT NULL,
no_of_guest INT NOT NULL,
function_time VARCHAR2(30) NOT NULL,
booking_date timestamp default current_timestamp,
event_date DATE NOT NULL,
venue_package NUMBER(10,2) NOT NULL,
CONSTRAINT PK_booking_venues PRIMARY KEY(venue_booking_id),
CONSTRAINT FK_booking_venues_user_details FOREIGN KEY (user_id) REFERENCES user_details(user_id),
CONSTRAINT FK_booking_venues_venue_details FOREIGN KEY (venue_id) REFERENCES venue_details(venue_id));
alter table booking_venues drop column function_time;

CREATE SEQUENCE bookvenue_seq_id INCREMENT BY 1 START WITH 4041;
select event_date from booking_venues where event_date='21-1-22';
select * from booking_venues;
delete from booking_venues where venue_id=1011;
--booking services

CREATE TABLE booking_services
(service_booking_id INT DEFAULT bookservice_seq_id.NEXTVAL,
user_id INT NOT NULL,
service_id INT NOT NULL,
service_name varchar2(50) NOT NULL,
booking_date DATE default SYSDATE,
event_date DATE NOT NULL,
service_package NUMBER(10,2) NOT NULL,
CONSTRAINT PK_booking_services PRIMARY KEY(service_booking_id),
CONSTRAINT FK_booking_services_user_details FOREIGN KEY (user_id) REFERENCES user_details(user_id),
CONSTRAINT FK_booking_services_service_details FOREIGN KEY (service_id) REFERENCES service_details(service_id));
select * from booking_services;
CREATE SEQUENCE bookservice_seq_id INCREMENT BY 1 START WITH 5051; 
drop table booking_services;
drop sequence bookservice_seq_id;

CREATE TABLE booking_details
(user_id int NOT NULL,
total_package number(10,2) NOT NULL,
constraint user1 FOREIGN KEY(user_id) REFERENCES user_details(user_id) );

select * from booking_details;



CREATE TABLE rating_details(user_id int NOT NULL,
service_name varchar2(30) NOT NULL,
rating INT NOT NULL,
CONSTRAINT FK_user FOREIGN KEY(user_id) REFERENCES user_details(user_id));
select * from rating_details;


create table payment(payment_id int default pay_seq.nextval,
user_id int,
card_no int,
card_holder_name varchar2(200),
expiry_date varchar2(10),
amount_paid int, 
constraint pay_user foreign key(user_id) references user_details(user_id));

drop table rating_details;
create sequence pay_seq  increment by 1 start with 111;
--drop sequence bookservice_seq_id;
--drop table user_details;
--drop table venue_details;
--drop table Service_details;
--drop table booking_venues;
--drop table booking_services;

select * from user_details;
select * from booking_services;