- Install Flyway on the Jenkins machine

- Install the Flyway Plugin

- Configure the Flyway binary on Jenkins tool config

## Installing Flyway

``wget https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/6.0.8/flyway-commandline-6.0.8-linux-x64.tar.gz ``

``tar xvzf flyway-commandline-6.0.8-linux-x64.tar.gz && sudo ln -s `pwd`/flyway-6.0.8/flyway /usr/local/bin``

## Configuration

``vi /flyway-6.0.8/conf/flyway.conf``

update the following lines:

``flyway.url=mysql://127.0.0.1:3306/demo``

``flyway.user=root``

``flyway.password=``

Where the migrations will be placed:

``flyway.location=flyway/sql``

## DB setup

Install mysql-server;

Create demo db;

