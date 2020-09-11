## Requirements

1. Java8
2. maven (if you don't have maven, you can use the docker image)

# How to run the project

### From terminal
1. create config.properties file in the main module (for this project it is already created)
2. execute command: mvn clean test
3. generate test report: mvn:allure:report

### From intelij idea
1. create config.properties file in the main module (for this project it is already created)
2. in run/debug configuration, set glue with value: steps 
3. now you can run the tests from ide

## Available Scripts

run tests:  `mvn test` / `mvn clean test` 

run tag:  `mvn test -Dcucumber.options="--tags @tagname"`

generate test report: `mvn allure:report`

clean project: `mvn clean`

# Docker:

## Run the docker:

1. prepare file `config.properties` (for this project it is already created)
2. run command:`docker-compose up` in Docker folder
3. run container: `docker exec -ti java8 sh`
4. run tests `mvn clean test`

## Makefile

MAKEFILE in Docker supports the following commands:

	1. make install          - First instalation"
	2. make build            - Build(update) containers"
	3. make build-pull       - Stops, Downloads and builds dockers containers"
	4. make run              - Runs docker"
	5. make kill             - Kills containers "
	6. make run-bg           - Runs docker in background"
	7. make sh-java8         - Access to container java8"
	
How to use: $ docker/make {command}