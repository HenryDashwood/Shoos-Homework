DROP TABLE preoders;
DROP TABLE preorders;

CREATE TABLE preorders ( 
  id serial4 primary key,
  first_name varchar(255),
  last_name varchar(255),
  size int2,
  quantity int2
);