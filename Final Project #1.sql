CREATE DATABASE `banks_portal`;

use `banks_portal`;

create table accounts (
accountId int not null unique auto_increment primary key,
ownerName varchar(45) not null,
owner_ssn int not null,
balance decimal (10,2) default 0.00,
account_status varchar(45)
);

create table transactions (
transactionId int not null unique auto_increment primary key,
accountId int not null,
transactionType varchar (45) not null,
transactionAmount decimal (10,2) not null
);

insert into accounts
values(1, 'Maria Jozef', 123456789, 10000.00, 'active'),
(2, 'Linda Jones', 987654321, 2600.00, 'inactive'),
(3, 'John McGrail', 222222222, 100.50, 'active'),
(4, 'Patty Luna', 111111111, 509.75, 'inactive');

insert into transactions
values(01, 1, 'deposit', 650.98),
(02, 3, 'withdraw', 899.87),
(03, 3, 'deposit', 350.00);

delimiter //
create procedure amountTransactions(IN accountID int) select* from transactions;
    
delimiter //
create procedure deposit(IN accountID int, IN transactionsAmount decimal)
BEGIN
insert into transactions(transactionId, accountId, transactionType, transactionAmount) values (accountID, transactionAmount);
update accounts
SET
accountid=accountid where amount=transactionsAmount;
END //

delimiter // 
create procedure withdraw(IN accountID int, IN transactionsAmount decimal)
BEGIN
insert into transactions(transactionId, accountId, transactionType, transactionAmount) values (accountID, transactionAmount);
update accounts
SET
accountid=accountid where amount=transactionsAmount;
END //

