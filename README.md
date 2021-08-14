# BasisGradeChangeMailExtension

This is a tool, which allows to parse Basis, a campus managment system for updates to your grades.

## Installation

```bash
pipenv install 
```

## Configuration

The entire configuration has to be in a file called config.py. An example is provided in config_example.py. The GradeTableNum is the index of the field of study in that element (0 if you only have one).

## Install using Docker

**Build docker image**
```bash
docker build -t basis-grade-change .
```

**Running the docker image**
```bash
docker run -d basis-grade-change
```

**Look into the logs**
```bash
docker logs -f <whatever-name-your-container-has>
```