CREATE TABLE if not exists `member`(
                            `id` long PRIMARY KEY AUTO_INCREMENT,
                            `memberName` varchar(255),
                            `car_id` long,
                            `create_at` timestamp,
                            `update_at` timestamp
);
CREATE TABLE if not exists `car`(
                                       `id` long PRIMARY KEY AUTO_INCREMENT,
                                       `carName` varchar(255),
                                       `create_at` timestamp,
                                       `update_at` timestamp
);


insert into `member` (`memberName`) VALUES ( '홍길동');
insert into `member` (`memberName`) VALUES ( '이길동');
insert into `member` (`memberName`) VALUES ( '최길동');

insert into `car` (`carName`) VALUES ( '아방');
insert into `car` (`carName`) VALUES ( '소나타');
insert into `car` (`carName`) VALUES ( '그랜저');

ALTER TABLE `member` ADD FOREIGN KEY (`car_id`) REFERENCES `car` (`id`);
