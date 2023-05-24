CREATE TABLE Student (
	id SERIAL PRIMARY KEY NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(30) NOT NULL,
	date_of_birth date NOT NULL,
	enrolled_date date NOT NULL,
	gender nchar(1) NOT NULL,
	national_id_number varchar(50) NOT NULL,
	student_card_number varchar(50) NOT NULL
);

CREATE TABLE Teacher (
	id SERIAL PRIMARY KEY NOT NULL,
	first_name varchar(20) NOT NULL,
	last_name varchar(30) NOT NULL,
	date_of_birth date NOT NULL,
	academic_rank varchar(20) NOT NULL,
	hire_date date NOT NULL
);

CREATE TABLE Course (
	id SERIAL PRIMARY KEY NOT NULL,
	name varchar(50) NOT NULL,
	credit integer NOT NULL,
	academic_year smallint NOT NULL,
	semester smallint NOT NULL
);

CREATE TABLE Grade (
	id SERIAL PRIMARY KEY NOT NULL,
	student_id integer REFERENCES Student(id) NOT NULL,
	course_id integer REFERENCES Course(id) NOT NULL,
	teacher_id integer REFERENCES Teacher(id) NOT NULL,
	grade smallint NOT NULL,
	comment varchar(100) NOT NULL,
	created_date date NOT NULL
);

CREATE TABLE Achievement_Type (
	id SERIAL PRIMARY KEY NOT NULL,
	name varchar(20) NOT NULL,
	description varchar(50) NOT NULL,
	participation_rate varchar(10) NOT NULL
);

CREATE TABLE Grade_Details (
	id SERIAL PRIMARY KEY NOT NULL,
	grade_id integer REFERENCES Grade (id) NOT NULL,
	achievement_type_id integer REFERENCES Achievement_Type (id) NOT NULL,
	achievement_points integer NOT NULL,
	achievement_max_points integer NOT NULL,
	achievement_date date NOT NULL
)
