Docker SonarQube

[![Build Status](https://travis-ci.org/UKHomeOffice/docker-sonarqube.svg?branch=master)](https://travis-ci.org/UKHomeOffice/docker-sonarqube)

This is a [Sonar Qube](http://www.sonarqube.org/) Docker container.

## Getting Started

These instructions will get the container running.

There is a H2 Database included in Sonar Qube, which you may choose to use, however it is not 
suitable for production

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

You'll also need a database you can connect to.

### Usage

#### Container params

If the arguments passed to the container begin with `-` for example `-something` All those arguments
will be passed to Sonar Qube.

```bash
docker run quay.io/ukhomeofficedigital/sonarqube:v0.2.0 -something
```

Likewise, no arguments will also start Sonar Qube.

```bash
docker run quay.io/ukhomeofficedigital/sonarqube:v0.2.0
```

Otherwise it'll run what you passed in. So for example `bash` would run bash

```bash
docker run quay.io/ukhomeofficedigital/sonarqube:v0.2.0 bash
```

#### Exposed Ports

* `9000` Web Interface

#### Volumes

* `/opt/sonarqube/extensions` - Installed Extensions

## Built With

* SonarQube 7.9.2

## Contributing

Feel free to submit pull requests and issues. If it's a particualy large PR, you may wish to discuss
it in an issue first.

Please note that this project is released with a [Contributor Code of Conduct](code_of_conduct.md). 
By participating in this project you agree to abide by its terms.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the 
[tags on this repository](https://github.com/UKHomeOffice/docker-sonarqube/tags). 

## Authors

* **Billie Thompson** - *Initial work* - [PurpleBooth](https://github.com/PurpleBooth)

See also the list of [contributors](https://github.com/UKHomeOffice/docker-sonarqube/contributors) 
who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

## Acknowledgments

* Lots of this code comes from the official 
  [Sonar Qube Docker image](https://github.com/SonarSource/docker-sonarqube).
