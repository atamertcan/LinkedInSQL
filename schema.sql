-- Users
-- The heart of LinkedIn’s platform is its people.
-- Your database should be able to represent the following information about LinkedIn’s users:
--     * Their first and last name
--     * Their username
--     * Their password

CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Schools and Universities
-- LinkedIn also allows for official school or university accounts, such as that for Harvard,
-- so alumni (i.e., those who’ve attended) can identify their affiliation.
-- Ensure that LinkedIn’s database can store the following information about each school:
--     * The name of the school
--     * The type of school (e.g., “Elementary School”, “Middle School”, “High School”, “Lower School”, “Upper School”, “College”, “University”, etc.)
--     * The school’s location
--     * The year in which the school was founded

CREATE TABLE "schools_and_universities" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

-- Companies
-- LinkedIn allows companies to create their own pages, like the one for LinkedIn itself,
-- so employees can identify their past or current employment with the company.
-- Ensure that LinkedIn’s database can store the following information for each company:
--     * The name of the company
--     * The company’s industry (e.g., “Education”, “Technology, “Finance”, etc.)
--     * The company’s location

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

-- Connections with People
-- LinkedIn’s database should be able to represent mutual (reciprocal, two-way) connections between users.
-- No need to worry about one-way connections, such as user A “following” user B without user B “following” user A.


CREATE TABLE "connections_with_people" (
    "id" INTEGER,
    "user1_id" INTEGER,
    "user2_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user1_id") REFERENCES "users"("id"),
    FOREIGN KEY ("user2_id") REFERENCES "users"("id"),
    UNIQUE ("user1_id", "user2_id"),
    CHECK ("user1_id" != "user2_id")

);

-- Connections with Schools
-- A user should be able to create an affiliation with a given school.
-- And similarly, that school should be able to find its alumni.
-- Additionally, allow a user to define:
--     * The start date of their affiliation (i.e., when they started to attend the school)
--     * The end date of their affiliation (i.e., when they graduated), if applicable
--     * The type of degree earned/pursued (e.g., “BA”, “MA”, “PhD”, etc.)

CREATE TABLE "connections_with_schools" (
    "id" INTEGER,
    "user_id" INTEGER,
    "school_id" INTEGER,
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC NOT NULL,
    "degree" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools_and_universities"("id")

);

-- Connections with Companies
-- A user should be able to create an affiliation with a given company.
-- And similarly, a company should be able to find its current and past employees.
-- Additionally, allow a user to define:
--     * The start date of their affiliation (i.e., the date they began work with the company)
--     * The end date of their affiliation (i.e., when left the company), if applicable
--     * The title they held while affiliated with the company

CREATE TABLE "connections_with_companies" (
    "id" INTEGER,
    "user_id" INTEGER,
    "company_id" INTEGER
    "start_date" NUMERIC NOT NULL,
    "end_date" NUMERIC,
    "title" TEXT NOT NULL,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("user_id") REFERENCES "users"("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies"("id")

);
