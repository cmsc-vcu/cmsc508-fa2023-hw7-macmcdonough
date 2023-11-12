# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills; 
DROP TABLE IF EXISTS peopleskills; 
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

CREATE TABLE skills (
    id int NOT NULL, 
    name VARCHAR(255) NOT NULL, 
    description VARCHAR(255) NOT NULL, 
    tag VARCHAR(255) NOT NULL, 
    url varchar(4096) DEFAULT NULL, 
    time_commitment INT DEFAULT NULL, 
    PRIMARY KEY (id)
); 

# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment)
    VALUES 
    (1, 'Magic', 'Basic spells and supernatural insight.', 'Skill 1', 'https://example.com/magic', 60),
    (2, 'Stunt Mastery', 'Performing fearless stunts that defy gravity and common sense.', 'Skill 2', 'https://example.com/stunt_mastery', 80),
    (3, 'Tracking', 'Expert at hunting.', 'Skill 3', 'https://example.com/undead_tracking', 70),
    (4, 'Master of Disguise', 'Blending seamlessly into any crowd, becoming the ultimate shadow.', 'Skill 4', 'https://example.com/master_of_disguise', 90),
    (5,'Napping', 'Strategic naps to reenergize', 'Skill 5', 'https://example.com/napping', 50),
    (6,'Green Thumb', 'Ability to nuture and grow plants', 'Skill 6', 'https://example.com/plants', 100),
    (7,'Public Speaking', 'Can speak to large groups of people without getting nervous', 'Skill 7', 'https://example.com/speaking', 60),
    (8,'Honey Making', 'Spreading joy and honey.', 'Skill 8', 'https://example.com/bee_knighting', 80)
    ;

# Section 4
# Create people(id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

CREATE TABLE people (
    id int NOT NULL,
    first_name varchar(255) DEFAULT NULL,
    last_name varchar(255) NOT NULL,
    email varchar(255) DEFAULT NULL,
    linkedin_url varchar(4096) DEFAULT NULL,
    headshot_url varchar(4096) DEFAULT NULL,
    discord_handle varchar(4096) DEFAULT NULL,
    brief_bio varchar(255) DEFAULT NULL,
    date_joined DATE NOT NULL,
    PRIMARY KEY (id)
);

# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

INSERT INTO people (id,last_name, first_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
    VALUES 
    (1,'Person 1', 'Van Helsing', 'vanhelsing.person3@example.com', 'https://www.linkedin.com/in/vanhelsingperson3', NULL, 'vanhelsing_person3#9101', 'Vampire hunter with a flair for hunting the undead in style.', '2023-01-03'),
    (2,'Person 2', 'Angel', 'angel.person1@example.com', 'https://www.linkedin.com/in/angelperson1', 'https://example.com/angel_person1.jpg', 'angel_person1#1234', '100 year-old Vampire', '2023-01-01'),
    (3,'Person 3', 'Sparkle Stardust', 'sparklestardust.person10@example.com', 'https://www.linkedin.com/in/sparklestardustperson10', NULL, 'sparklestardust_person10#1122', 'Fairy with a magical touch', '2023-01-10'), 
    (4,'Person 4', 'Sir Bumblebee', NULL, 'https://www.linkedin.com/in/sirbumblebeeperson8', 'https://example.com/sirbumblebee_person8.jpg', 'sirbumblebee_person8#9900', 'Knighted bee with a mission to spread honey and joy.', '2023-01-08'),
    (5,'Person 5', 'Madam Giggles', 'madamgiggles.person7@example.com', 'https://www.linkedin.com/in/madamgigglesperson7', 'https://example.com/madamgiggles_person7.jpg', 'madamgiggles_person7#7788', NULL, '2023-01-07'),
    (6,'Person 6', 'Maverick', 'maverick.person2@example.com', 'https://www.linkedin.com/in/daredevilperson2', 'https://example.com/daredevil_person2.jpg', 'daredevil_person2#5678', 'Fearless stunt performer', '2023-01-02'),
    (7,'Person 7', 'Captain Whiskers', 'whiskers.person5@example.com', NULL, 'https://example.com/whiskers_person5.jpg', 'whiskers_person5#3344', 'Adventurous feline explorer plotting world domination, one nap at a time.', '2023-01-05'),
    (8,'Person 8', 'Moonflower', 'moonflower.person6@example.com', 'https://www.linkedin.com/in/moonflowerperson6', 'https://example.com/moonflower_person6.jpg', 'moonflower_person6#5566', NULL, '2023-01-06'),
    (9,'Person 9', 'Jazz Hands', 'jazzhands.person9@example.com', 'https://www.linkedin.com/in/jazzhandsperson9', 'https://example.com/jazzhands_person9.jpg', 'jazzhands_person9#1122', 'Entertainer with a penchant for jazz and sequins.', '2023-01-09'),
    (10,'Person 10', 'Waldo', 'waldo.person4@example.com', 'https://www.linkedin.com/in/waldo', 'https://example.com/waldo_person4.jpg', 'waldo_person#1122', 'Master of disguise who can blend into any crowd without a trace.', '2023-01-04')
    ;

# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
    id int NOT NULL AUTO_INCREMENT,
    skills_id int NOT NULL,
    people_id int NOT NULL,
    date_acquired DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (skills_id) REFERENCES skills(id) ON DELETE CASCADE,
    FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE
);


# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
INSERT INTO peopleskills (skills_id, people_id, date_acquired) 
    VALUES 
    -- Person 1
    (1, 1, '2023-01-11'),
    (3, 1, '2023-01-12'),
    (6, 1, '2023-01-13'),

    -- Person 2
    (3, 2, '2023-01-14'),
    (4, 2, '2023-01-15'),
    (5, 2, '2023-01-16'),

    -- Person 3
    (1, 3, '2023-01-17'),
    (5, 3, '2023-01-18'),

    -- Person 4 (no skills)

    -- Person 5
    (3, 5, '2023-01-19'),
    (6, 5, '2023-01-20'),

    -- Person 6
    (2, 6, '2023-01-21'),
    (3, 6, '2023-01-22'),
    (4, 6, '2023-01-23'),

    -- Person 7
    (3, 7, '2023-01-24'),
    (5, 7, '2023-01-25'),
    (6, 7, '2023-01-26'),

    -- Person 8
    (1, 8, '2023-01-27'),
    (3, 8, '2023-01-28'),
    (5, 8, '2023-01-29'),
    (6, 8, '2023-01-30'),

    -- Person 9
    (2, 9, '2023-01-31'),
    (5, 9, '2023-02-01'),
    (6, 9, '2023-02-02'),

    -- Person 10
    (1, 10, '2023-02-03'),
    (4, 10, '2023-02-04'),
    (5, 10, '2023-02-05')
;


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
    id int NOT NULL,
    name VARCHAR(255) NOT NULL,
    sort_priority int NOT NULL,
    PRIMARY KEY (id)
);

# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles (id, name, sort_priority)
    VALUES 
    (1,'Designer',10),
    (2,'Developer',20),
    (3,'Recruit',30),
    (4,'Team Lead',40),
    (5,'Boss',50),
    (6,'Mentor',60)
;

# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int AUTO_INCREMENT,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned DATE NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (people_id) REFERENCES people(id) ON DELETE CASCADE, 
    FOREIGN KEY (role_id) REFERENCES roles(id) ON DELETE CASCADE
); 

# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles (people_id, role_id, date_assigned)
    VALUES 
    (1, 2, '2023-02-06'),  -- Person 1 is Developer

    (2, 5, '2023-02-07'),  -- Person 2 is Boss
    (2, 6, '2023-02-08'),  -- Person 2 is Mentor

    (3, 2, '2023-02-09'),  -- Person 3 is Developer
    (3, 4, '2023-02-10'),  -- Person 3 is Team Lead

    (4, 3, '2023-02-11'),  -- Person 4 is Recruit

    (5, 3, '2023-02-12'),  -- Person 5 is Recruit

    (6, 2, '2023-02-13'),  -- Person 6 is Developer
    (6, 1, '2023-02-14'),  -- Person 6 is Designer

    (7, 1, '2023-02-15'),  -- Person 7 is Designer

    (8, 1, '2023-02-16'),  -- Person 8 is Designer
    (8, 4, '2023-02-17'),  -- Person 8 is Team Lead

    (9, 2, '2023-02-18'),  -- Person 9 is Developer

    (10, 2, '2023-02-19'),  -- Person 10 is Developer
    (10, 1, '2023-02-20');  -- Person 10 is Designer
; 