create database product_manager;

create table supplier(
supplierId bigint not null auto_increment,
supplierName varchar(50) not null,
description varchar(100) null,
address varchar(50) null,
constraint pk_supplier primary key(supplierId)
);
create table category(
categoryId bigint not null auto_increment,
categoryName varchar(50) not null,
description varchar(100) null,
constraint pk_category primary key(categoryId)
);
create table product(
productId bigint not null auto_increment,
productName varchar(50) not null,
price double not null,
image varchar(100) not null,
description varchar(100) null,
categoryId bigint not null,
supplierId bigint not null,
constraint pk_product primary key(productId),
constraint fk_category foreign key(categoryId) references category(categoryId),
constraint fk_supplier foreign key(supplierId) references supplier(supplierId)
);
create table customer(
customerId bigint not null auto_increment,
customerName varchar(50) not null,
address varchar(100) not null,
phone varchar(15) not null,
email varchar(50) null,
birthOfDate date null,
constraint pk_customer primary key(customerId)
);
create table orders(
orderId bigint not null auto_increment,
customerId bigint not null,
dateOfPurchase date,
constraint pk_orders primary key(orderId),
constraint fk_customer foreign key(customerId) references customer(customerId)
);

create table orderdetail(
orderdetailId bigint not null,
orderId bigint not null,
productId bigint not null,
quantity double,
constraint pk_orderdetail primary key(orderdetailId),
constraint fk_order foreign key(orderId) references orders(orderId),
constraint fk_product foreign key(productId) references product(productId)
);
/* Bảng category */
select * from category;
insert into category(categoryId,categoryName,description)
values(1,'nước ngọt','thuộc về nước giải khát');
insert into category(categoryId,categoryName,description)
values(2,'cà phê','nước giải khát');
insert into category(categoryId,categoryName,description)
values(3,'nước tăng lực','nước giải khát');
insert into category(categoryId,categoryName,description)
values(4,'trà xanh','trà');
insert into category(categoryId,categoryName,description)
values(5,'kem','kem');
insert into category(categoryId,categoryName,description)
values(6,'bánh ngọt','bánh ngọt');
insert into category(categoryId,categoryName,description)
values(7,'nước lọc','nươc lọc đóng chai');

/* Bảng suppliser*/

insert into supplier(supplierId,supplierName,description,address)
values(1,'number one','nhà cung cấp number one','cầu giấy,hà nôi');
insert into supplier(supplierId,supplierName,description,address)
values(2,'highlands coffee','nhà cung cấp highlands cà phê','trung hòa, hà nội');
insert into supplier(supplierId,supplierName,description,address)
values(3,'pepsi','nhà cung cấp pepsi','khu đô thị bắc từ liêm,hà nội');
insert into supplier(supplierId,supplierName,description,address)
values(4,'coca cola','nhà cung cấp coca cola','khu đô thị nam từ liêm, hà nội');
insert into supplier(supplierId,supplierName,description,address)
values(5,'bò húc','nhà cung cấp nước tăng lực bò húc','cầu diễn, bắc từ liêm hà nội');
insert into supplier(supplierId,supplierName,description,address)
values(6,'trà xanh','Nhà cung cấp trà','thanh xuân,hà nội');

/*Bảng product */
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(1,' lon nước ngọt fanta',12000.0,'anh1','nước giải khát fanta',1,3);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(2,'lon nước ngọt coca',12000.0,'anh2','nước giải khát coca cola',1,4);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(3,'chai nước ngọt fanta',10000.0,'anh3','nước giải khát fanta',1,3);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(4,'lon highlands coffee',10000.0,'anh4','lon nước ngọt higlands coffee',2,2);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(5,'lon  bỉrth coffee',13000.0,'anh5','lon nước cà phê birth',2,3);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(6,'lon nước ngọt number one',10000.0,'anh6','nước tăng lực number one',3,1);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(7,'lon nước tinh khiết number one',10000.0,'anh7','nước giải khát fanta',1,3);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(8,'lon nước tăng lực bò húc',13000.0,'anh8','nước tăng lực bò húc',3,5);
insert into product(productId,productName,price,image,description,categoryId,supplierId)
values(9,'chai nước trà xanh C2',9000.0,'anh9','trà xanh c2',4,6);

/*Customer*/
insert into customer(customerId,customerName,address,phone,email,birthOfDate)
values(1,'Bách','hà nội','0932382332','bach@gmail.com','1997-06-06');
insert into customer(customerId,customerName,address,phone,email,birthOfDate)
values(2,'Công','hà đông','0932388942','cong@gmail.com','1994-06-08');
insert into customer(customerId,customerName,address,phone,email,birthOfDate)
values(3,'nghĩa','hà nam','0932345382','nghia@gmail.com','1994-06-08');
insert into customer(customerId,customerName,address,phone,email,birthOfDate)
values(4,'long','tuyên quang','0938427438','long@gmail.com','1993-08-09');
insert into customer(customerId,customerName,address,phone,email,birthOfDate)
values(5,'quyết','hà giang','093842748','quyet@gmail.com','1998-08-09');

/*bảng  Orders*/

insert into orders(orderId,customerId,dateOfPurchase)
values(1,1,'2019-12-1');
insert into orders(orderId,customerId,dateOfPurchase)
values(2,2,'2019-12-2');
insert into orders(orderId,customerId,dateOfPurchase)
values(3,1,'2019-12-3');
insert into orders(orderId,customerId,dateOfPurchase)
values(4,3,'2019-12-4');
insert into orders(orderId,customerId,dateOfPurchase)
values(5,4,'2019-12-5');
insert into orders(orderId,customerId,dateOfPurchase)
values(6,3,'2019-12-2');

insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(1,1,1,1);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(2,1,2,2);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(3,1,3,1);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(4,1,4,2);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(5,1,5,1);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(6,2,1,2);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(7,2,2,1);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(8,2,7,2);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(9,3,5,1);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(10,3,6,2);
insert into orderdetail(orderdetailId,orderId,productId,quantity)
values(11,4,1,3);


select * from category;
select * from customer;
select * from orderdetail;
select * from orders;
select * from product;
select * from supplier;

  


