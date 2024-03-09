CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    Stock_Qty INT,
);

CREATE TABLE Customer (
    Cust_ID VARCHAR(10) PRIMARY KEY,
    First_NAME VARCHAR(255) NOT NULL,
	Last_NAME VARCHAR(255) NOT NULL,
    Phone_No VARCHAR(10),
	Dept_Name VARCHAR(50),
	
);

CREATE TABLE Customer_Phoneno (
    Cust_ID VARCHAR(10),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
    Phone_No VARCHAR(10),
);

CREATE TABLE Student (
    Cust_ID VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
	Course_Name VARCHAR(50),
);

CREATE TABLE Faculty (
    Cust_ID VARCHAR(10) PRIMARY KEY,
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
	Position VARCHAR(50),
);

CREATE TABLE Payment_Record (
    Record_ID VARCHAR(10) PRIMARY KEY,
    Total_Amount INT,
	Transaction_Date DATE NOT NULL,
	Transaction_Time TIME NOT NULL,
	Pay_Status VARCHAR(50)
);

CREATE TABLE Payment (
    Pay_ID VARCHAR(10) PRIMARY KEY,
    Record_ID VARCHAR(10),
    FOREIGN KEY (Record_ID) REFERENCES Payment_Record(Record_ID),
);

CREATE TABLE Item (
    Item_ID VARCHAR(10) PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Price decimal(10,2) NOT NULL,
    Type VARCHAR(255),
    Description VARCHAR(50),
	InventoryID INT,
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
	Cust_ID VARCHAR(10),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
	
);

CREATE TABLE Added_To (
    Item_ID VARCHAR(10),
	FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID),
    InventoryID INT,
    FOREIGN KEY (InventoryID) REFERENCES Inventory(InventoryID),
	Date DATE NOT NULL,
);

CREATE TABLE Makes (
    Item_ID VARCHAR(10),
	FOREIGN KEY (Item_ID) REFERENCES Item(Item_ID),
	Cust_ID VARCHAR(10),
    FOREIGN KEY (Cust_ID) REFERENCES Customer(Cust_ID),
	Pay_ID VARCHAR(10),
    FOREIGN KEY (Pay_ID) REFERENCES Payment(Pay_ID),
);

SELECT * From Inventory
SELECT * From Item
SELECT * From Customer;
SELECT * From Customer_Phoneno;
SELECT * From Student
SELECT * From Faculty
SELECT * From Payment
SELECT * From Payment_Record
SELECT * From Added_To
SELECT * From Makes;
