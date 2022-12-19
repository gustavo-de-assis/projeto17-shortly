CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" varchar(30) NOT NULL,
	"email" varchar(30) NOT NULL,
	"password" TEXT NOT NULL,
	"visitCount" integer
);



CREATE TABLE "urls" (
	"id" serial PRIMARY KEY,
	"url" TEXT NOT NULL,
	"shortUrl" TEXT NOT NULL
);



CREATE TABLE "shortened_urls" (
	"id" serial PRIMARY KEY,
	"userId" integer NOT NULL REFERENCES "users"("id"),
	"urlId" integer NOT NULL REFERENCES "urls"("id"),
	"visitCount" integer NOT NULL
);


CREATE TABLE "sessions" (
	"id" serial NOT NULL,
	"userId" serial NOT NULL REFERENCES "users"("id"),
	"token" TEXT NOT NULL UNIQUE
);