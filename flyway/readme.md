- Install Flyway on the Jenkins machine

- Install the Flyway Plugin

- Configure the Flyway binary on Jenkins tool config

## Installing Flyway

``wget https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/6.0.8/flyway-commandline-6.0.8-linux-x64.tar.gz ``

``tar xvzf flyway-commandline-6.0.8-linux-x64.tar.gz && sudo ln -s `pwd`/flyway-6.0.8/flyway /usr/local/bin``

## Setup Configuration

``vi /flyway-6.0.8/conf/flyway.conf``

update the following lines:

``flyway.url=mysql://127.0.0.1:3306/demo``

``flyway.user=root``

``flyway.password=``

``flyway.sqlMigrationPrefix=V``

Where the migrations will be placed:

``flyway.location=flyway/sql``

## DB setup

Install mysql-server;

Create demo db;

## Flyway config

``flyway -baselineVersion=1.0.0 baseline``

Check config:

``flyway info``

## create sql to test

~~~~
vi sql/V_1_0_1_create_table.sql
create table Person (
        LastName varchar(255),
        FirstName varchar(255)
);
~~~~
