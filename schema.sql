CREATE TABLE "users" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools_and_universities" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

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
