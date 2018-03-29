﻿CREATE TABLE Administrator (admin_id int IDENTITY NOT NULL, name char(25) NULL, login char(25) NULL, password char(25) NULL, PRIMARY KEY (admin_id));
CREATE TABLE Car (car_id int IDENTITY NOT NULL, brand char(30) NULL, cost int NULL, car_kit int NULL, stock int NOT NULL, Administratoradmin_id int NOT NULL, PRIMARY KEY (car_id));
CREATE TABLE [Car-kit] (carkit_id int IDENTITY NOT NULL, kit_name char(30) NULL, cost int NULL, [date] datetime NOT NULL, supplier int NOT NULL, PRIMARY KEY (carkit_id));
CREATE TABLE Detail (detail_id int IDENTITY NOT NULL, detail_name char(25) NULL, type char(25) NULL, [Car-kitcarkit_id] int NOT NULL, PRIMARY KEY (detail_id));
CREATE TABLE [Order] (order_id int NOT NULL UNIQUE, Administratoradmin_id int NOT NULL, Suppliersupplier_id int NOT NULL, order_date datetime NOT NULL, order_status char(1) NULL, PRIMARY KEY (order_id, Administratoradmin_id, Suppliersupplier_id));
CREATE TABLE Stock (stock_id int IDENTITY NOT NULL, capacity int NULL, supplier int NOT NULL, PRIMARY KEY (stock_id));
CREATE TABLE Stock_Detail (Stockstock_id int NOT NULL, Detaildetail_id int NOT NULL, PRIMARY KEY (Stockstock_id, Detaildetail_id));
CREATE TABLE Supplier (supplier_id int IDENTITY NOT NULL, name char(25) NULL, Stockstock_id int NOT NULL, PRIMARY KEY (supplier_id));
ALTER TABLE Car ADD CONSTRAINT FKCar555395 FOREIGN KEY (car_kit) REFERENCES [Car-kit] (carkit_id);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder736825 FOREIGN KEY (Administratoradmin_id) REFERENCES Administrator (admin_id);
ALTER TABLE [Order] ADD CONSTRAINT FKOrder214627 FOREIGN KEY (Suppliersupplier_id) REFERENCES Supplier (supplier_id);
ALTER TABLE Detail ADD CONSTRAINT FKDetail89255 FOREIGN KEY ([Car-kitcarkit_id]) REFERENCES [Car-kit] (carkit_id);
ALTER TABLE Car ADD CONSTRAINT FKCar123072 FOREIGN KEY (Administratoradmin_id) REFERENCES Administrator (admin_id);
ALTER TABLE [Car-kit] ADD CONSTRAINT [FKCar-kit458011] FOREIGN KEY (supplier) REFERENCES Supplier (supplier_id);
ALTER TABLE Stock ADD CONSTRAINT FKStock768971 FOREIGN KEY (supplier) REFERENCES Supplier (supplier_id);
ALTER TABLE Stock_Detail ADD CONSTRAINT FKStock_Deta797654 FOREIGN KEY (Stockstock_id) REFERENCES Stock (stock_id);
ALTER TABLE Stock_Detail ADD CONSTRAINT FKStock_Deta803463 FOREIGN KEY (Detaildetail_id) REFERENCES Detail (detail_id);
ALTER TABLE Supplier ADD CONSTRAINT FKSupplier401518 FOREIGN KEY (Stockstock_id) REFERENCES Stock (stock_id);
ALTER TABLE Car ADD CONSTRAINT FKCar541897 FOREIGN KEY (stock) REFERENCES Stock (stock_id);