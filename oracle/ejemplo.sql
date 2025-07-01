
CREATE TABLE play_styles(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(30)
);

ALTER TABLE play_styles ADD (
  CONSTRAINT play_styles_pk PRIMARY KEY (ID));

CREATE SEQUENCE play_styles_seq START WITH 1;

CREATE OR REPLACE TRIGGER play_styles_pk 
BEFORE INSERT ON play_styles 
FOR EACH ROW

BEGIN
  SELECT play_styles_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- sexs


CREATE TABLE sexs(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(7)
);

ALTER TABLE sexs ADD (
  CONSTRAINT sexs_pk PRIMARY KEY (ID));

CREATE SEQUENCE sexs_seq START WITH 1;

CREATE OR REPLACE TRIGGER sexs_pk 
BEFORE INSERT ON sexs 
FOR EACH ROW

BEGIN
  SELECT sexs_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- nations


CREATE TABLE nations(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(40)
);

ALTER TABLE nations ADD (
  CONSTRAINT nations_pk PRIMARY KEY (ID));

CREATE SEQUENCE nations_seq START WITH 1;

CREATE OR REPLACE TRIGGER nations_pk 
BEFORE INSERT ON nations 
FOR EACH ROW

BEGIN
  SELECT nations_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- positions

CREATE TABLE positions(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(7)
);

ALTER TABLE positions ADD (
  CONSTRAINT positions_pk PRIMARY KEY (ID));

CREATE SEQUENCE positions_seq START WITH 1;

CREATE OR REPLACE TRIGGER positions_pk 
BEFORE INSERT ON positions 
FOR EACH ROW

BEGIN
  SELECT positions_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- foots


CREATE TABLE foots(
	id NUMBER(7) PRIMARY KEY,
	name VARCHAR2(10)
);

ALTER TABLE foots ADD (
  CONSTRAINT foots_pk PRIMARY KEY (ID));

CREATE SEQUENCE foots_seq START WITH 1;

CREATE OR REPLACE TRIGGER foots_pk 
BEFORE INSERT ON foots 
FOR EACH ROW

BEGIN
  SELECT foots_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- leagues

CREATE TABLE leagues(
  id NUMBER(7) PRIMARY KEY,
  name VARCHAR2(30) NOT NULL,
  nation_id NUMBER(7),
  FOREIGN KEY (nation_id) REFERENCES nations
);

ALTER TABLE leagues ADD (
  CONSTRAINT leagues_pk PRIMARY KEY (ID));

CREATE SEQUENCE leagues_seq START WITH 1;

CREATE OR REPLACE TRIGGER leagues_pk 
BEFORE INSERT ON leagues 
FOR EACH ROW

BEGIN
  SELECT leagues_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- teams

CREATE TABLE teams(
  id NUMBER(7) PRIMARY KEY,
  name VARCHAR2(40) NOT NULL,
  league_id NUMBER(7),
  FOREIGN KEY (league_id) REFERENCES leagues
);

ALTER TABLE teams ADD (
  CONSTRAINT teams_pk PRIMARY KEY (ID));

CREATE SEQUENCE teams_seq START WITH 1;

CREATE OR REPLACE TRIGGER teams_pk 
BEFORE INSERT ON teams 
FOR EACH ROW

BEGIN
  SELECT teams_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- players

CREATE TABLE players(
  id NUMBER(7) PRIMARY KEY,
  name VARCHAR2(60),
  rank NUMBER(7),
  weak_foot NUMBER(7),
  skill_moves NUMBER(7),
  heigth NUMBER(7),
  weight NUMBER(7),
  age NUMBER(7),
  url VARCHAR(120),
  foot_id NUMBER(7) NOT NULL,
  sex_id NUMBER(7) NOT NULL,
  position_id NUMBER(7) NOT NULL,
  nation_id	NUMBER(7) NOT NULL,
  team_id NUMBER(7),
  FOREIGN KEY (foot_id) REFERENCES foots (id),
  FOREIGN KEY (sex_id) REFERENCES sexs (id),
  FOREIGN KEY (position_id) REFERENCES positions (id),
  FOREIGN KEY (nation_id) REFERENCES nations (id),
  FOREIGN KEY (team_id) REFERENCES teams (id)
);

ALTER TABLE players ADD (
  CONSTRAINT players_pk PRIMARY KEY (ID));

CREATE SEQUENCE players_seq START WITH 1;

CREATE OR REPLACE TRIGGER players_pk 
BEFORE INSERT ON players 
FOR EACH ROW

BEGIN
  SELECT players_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- common_details

CREATE TABLE common_details(
  id NUMBER(7) PRIMARY KEY,
  overall NUMBER(7),
  velocity NUMBER(7),
  shooting NUMBER(7),
  passing NUMBER(7),
  dribbling NUMBER(7),
  defending NUMBER(7),
  physicality NUMBER(7),
  player_id	NUMBER(7) NOT NULL,
  FOREIGN KEY (player_id) REFERENCES players (id)
);

ALTER TABLE common_details ADD (
  CONSTRAINT common_details_pk PRIMARY KEY (ID));

CREATE SEQUENCE common_details_seq START WITH 1;

CREATE OR REPLACE TRIGGER common_details_pk 
BEFORE INSERT ON common_details 
FOR EACH ROW

BEGIN
  SELECT common_details_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- goalkeeper_details

CREATE TABLE goalkeeper_details(
  id NUMBER(7) PRIMARY KEY,
  diving NUMBER(7),
  handling NUMBER(7),
  kicking NUMBER(7),
  positioning NUMBER(7),
  reflexes NUMBER(7),
  player_id	NUMBER(7) NOT NULL,
  FOREIGN KEY (player_id) REFERENCES players (id)
);

ALTER TABLE goalkeeper_details ADD (
  CONSTRAINT goalkeeper_details_pk PRIMARY KEY (ID));

CREATE SEQUENCE goalkeeper_details_seq START WITH 1;

CREATE OR REPLACE TRIGGER goalkeeper_details_pk 
BEFORE INSERT ON goalkeeper_details 
FOR EACH ROW

BEGIN
  SELECT goalkeeper_details_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- players_play_styles

CREATE TABLE players_play_styles(
  id NUMBER(7) PRIMARY KEY,
  play_style_id	NUMBER(7) NOT NULL,
  player_id	NUMBER(7) NOT NULL,
  FOREIGN KEY (play_style_id) REFERENCES play_styles (id),
  FOREIGN KEY (player_id) REFERENCES players (id)
);

ALTER TABLE players_play_styles ADD (
  CONSTRAINT players_play_styles_pk PRIMARY KEY (ID));

CREATE SEQUENCE players_play_styles_seq START WITH 1;

CREATE OR REPLACE TRIGGER players_play_styles_pk 
BEFORE INSERT ON players_play_styles 
FOR EACH ROW

BEGIN
  SELECT players_play_styles_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- players_positions

CREATE TABLE players_positions(
  id NUMBER(7) PRIMARY KEY,
  position_id	NUMBER(7) NOT NULL,
  player_id	NUMBER(7) NOT NULL,
  FOREIGN KEY (position_id) REFERENCES positions (id),
  FOREIGN KEY (player_id) REFERENCES players (id)
);

ALTER TABLE players_positions ADD (
  CONSTRAINT players_positions_pk PRIMARY KEY (ID));

CREATE SEQUENCE players_positions_seq START WITH 1;

CREATE OR REPLACE TRIGGER players_positions_pk 
BEFORE INSERT ON players_positions 
FOR EACH ROW

BEGIN
  SELECT players_positions_seq.NEXTVAL
  INTO   :new.id
  FROM   dual;
END;
/

-- data
