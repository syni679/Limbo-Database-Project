#Create and populate a database for limbo
#Authors: Kai Wong, Wendy Ni, Jae Kyoung Lee (LJ)
#Version 0.0.01 alpha   09/30/2016

#Drop database if limbo already exists
DROP DATABASE IF EXISTS limbo_db;
CREATE DATABASE limbo_db;
USE limbo_db;

#Creates users table
CREATE TABLE IF NOT EXISTS users (
	user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	first_name TEXT NOT NULL,
	last_name TEXT NOT NULL,
	email VARCHAR(40) UNIQUE NOT NULL,
	pass TEXT NOT NULL,
	reg_date DATETIME NOT NULL
);

#Populate users table with one user (admin)
INSERT INTO users (first_name, email, pass)
	VALUES ("admin", "jae.lee2@marist.edu" , "gaze11e"),
		   ("Jon", "jon.snow@got.com" , "W1nt3r"),
		   ("Snow", "snow.jon@got.com" , "1sc0m1ng");
	
#Create stuff table
CREATE TABLE IF NOT EXISTS stuff (
	id INT PRIMARY KEY AUTO_INCREMENT,
	location_id INT NOT NULL,
	description TEXT NOT NULL,
	found_date DATETIME NOT NULL,
	create_date DATETIME NOT NULL,
	update_date DATETIME NOT NULL,
	room TEXT,
	owner_name TEXT,
	finder_name TEXT,
	status SET('found', 'lost', 'claimed') NOT NULL
);

#Create locations table
CREATE TABLE IF NOT EXISTS locations (
	id INT PRIMARY KEY AUTO_INCREMENT,
	create_date DATETIME NOT NULL,
	update_date DATETIME NOT NULL,
	name TEXT NOT NULL
);

#Populate locations table with all buildings on campus
INSERT INTO locations (create_date, update_date, name)
	VALUES  (NOW(), NOW(), "Byrne House"),
			(NOW(), NOW(), "Cannavino Library"),
			(NOW(), NOW(), "Champagnat Hall"),
			(NOW(), NOW(), "Chapel"),
			(NOW(), NOW(), "Cornell Boathouse"),
			(NOW(), NOW(), "Donnelly Hall"),
			(NOW(), NOW(), "Dyson Center"),
			(NOW(), NOW(), "Fern Tor"),
			(NOW(), NOW(), "Fontaine Hall"),
			(NOW(), NOW(), "Foy Townhouses"),
			(NOW(), NOW(), "Lower Fulton Street Townhouses"),
			(NOW(), NOW(), "Upper Fulton Street Townhouses"),
			(NOW(), NOW(), "Greystone Hall"),
			(NOW(), NOW(), "Hancock Center"),
			(NOW(), NOW(), "Kieran Gatehouse"),
			(NOW(), NOW(), "Kirk House"),
			(NOW(), NOW(), "Leo Hall"),
			(NOW(), NOW(), "Longview Park"),
			(NOW(), NOW(), "Lowell Thomas Communication Center"),
			(NOW(), NOW(), "Lower Townhouses"),
			(NOW(), NOW(), "Upper Townhouses"),
			(NOW(), NOW(), "Marian Hall"),
			(NOW(), NOW(), "Marist Boathouse"),
			(NOW(), NOW(), "McCann Center"),
			(NOW(), NOW(), "Mid-Rise Hall"),
			(NOW(), NOW(), "North Campus Housing Complex"),
			(NOW(), NOW(), "St. Ann's Hermitage"),
			(NOW(), NOW(), "St. Peter's"),
			(NOW(), NOW(), "Science and Allied Health Building"),
			(NOW(), NOW(), "Sheahan Hall"),
			(NOW(), NOW(), "Steel Plant Studios and Gallery"),
			(NOW(), NOW(), "Murray Student Center/Music Building"),
			(NOW(), NOW(), "Lower West Cedar Townhouses"),
			(NOW(), NOW(), "Upper West Cedar Townhouse");
			#'YYYY-MM-DD'
			
INSERT INTO stuff(location_id, description, found_date, create_date, update_date, room, owner_name, finder_name, status)
	VALUES (5, "Black shiny Ray-Ban sunglasses", '2016-03-25', NOW() , NOW(), "236", "", "Snoopy", "Lost")
	VALUES (6, "Red Chanel leather bag", '2016-02-14', NOW() , NOW(), "319", "", "Lucy", "Lost")
	VALUES (10, "Rose Gold iPhone 6 Plus with clear case", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (12, "Kinky Boots plastic cup", '2014-01-25', NOW() , NOW(), "N/A", "", "Zika", "Lost")
	VALUES (16, "Black Lenovo Yoga laptop", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (17, "White Galaxy Notes 7", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (11, "Pink JBL wireless headset", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (7, "Brown Chanel leather bag", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (1, "Yellow long umbrella", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (3, "Green slippers", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (6, "Grey pencil", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	VALUES (7, "Orange nail polish", '2016-03-25', NOW() , NOW(), "N/A", "Charlie", "Cool Joe", "Found")
	
