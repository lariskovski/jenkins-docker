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
vi sql/V1_0_1__create_table.sql 
create table Person (
        LastName varchar(255),
        FirstName varchar(255)
);
~~~~

~~~~
vi sql/V1_0_2__insert_into_table.sql 
insert into Person(LastName,FirstName) values ("larissa","porto");
~~~~

## Migrations

Note that in the flyway info, the change is gonna be pending:

~~~~
root@8fae48260730:/flyway-6.0.8/sql# flyway info
Flyway Community Edition 6.0.8 by Redgate
Database: jdbc:mysql://127.0.0.1:3306/demo (MySQL 5.7)
Schema version: 1.0.0
+-----------+---------+-----------------------+----------+---------------------+----------+
| Category  | Version | Description           | Type     | Installed On        | State    |
+-----------+---------+-----------------------+----------+---------------------+----------+
|           | 1.0.0   | << Flyway Baseline >> | BASELINE | 2019-11-25 20:57:33 | Baseline |
| Versioned | 1.0.1   | create table          | SQL      | 2019-11-25 21:17:05 | Success  |
| Versioned | 1.0.2   | insert into table     | SQL      |                     | Pending  |
+-----------+---------+-----------------------+----------+---------------------+----------+
~~~~

To apply the migrations:

``flyway migrate``

Or some specific verison:

``flyway -target=1.0.2 migrate``

# Configuring Jenkins

## move the flyway folder to /var/lib/jenkins

mv flyway/ var/jenkins_home/plugins/

## jenkins config

![free-style](/images/free-style.png)

~~~~
Started by user admin
Running as SYSTEM
Building in workspace /var/jenkins_home/workspace/flywa-free-style
$ var/jenkins_home/plugins/flyway-6.0.8/flyway -user=root ******** -url=jdbc:mysql://127.0.0.1:3306/teste -locations=filesystem:/var/jenkins_home/workspace/flywa-free-style/ migrate
Flyway Community Edition 6.0.8 by Redgate
Database: jdbc:mysql://127.0.0.1:3306/teste (MySQL 5.7)
Successfully validated 4 migrations (execution time 00:00.046s)
Creating Schema History table `teste`.`flyway_schema_history` ...
Current version of schema `teste`: << Empty Schema >>
Migrating schema `teste` to version 1.0.1 - create table
Migrating schema `teste` to version 1.0.2 - insert into table
Migrating schema `teste` to version 1.0.3 - sql test
Migrating schema `teste` to version 1.0.4 - sql test dois
Successfully applied 4 migrations to schema `teste` (execution time 00:00.253s)
Finished: SUCCESS
~~~~
