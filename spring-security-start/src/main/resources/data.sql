insert into user(id,email,password,firstname,lastname,role) values (10,'jan@cgi.com','password','Jan','Jansen','ROLE_USER');
insert into user(id,email,password,firstname,lastname,role) values (11,'klaas@cgi.com','password','Klaas','Klaassen','ROLE_ADMIN');

insert into message(id,created,to_id,summary,text) values (100,'2016-11-22 10:00:00',10,'Hoi Jan','Dit bericht is voor Jan.');
insert into message(id,created,to_id,summary,text) values (110,'2016-11-22 10:00:00',11,'Hoi Klaas','Dit bericht is voor Klaas.');
