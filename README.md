# Jenkins Master Node Docker setup

```bash
$ docker build -t jenkins .
```

### Running the container

```bash
$ docker run -d -p 8080:8080 -p 50000:50000 --env-file=./env.file --name jenkins jenkins
```

You have to modify the env.file file with the following parameters:

 - __JENKINS_URL__: is the external URL of your jenkins (ex. "http://localhost:8080/")
 - __JENKINS_ADMIN__: is the Jenkins administrator
 - __JENKINS_PASSWORD__: is the password of the Jenkins administrator

### Running slaves

If you would like to start one (or several) Jenkins slaves.

```bash
$docker build -f DockerfileSlave -t jenkins-slave .
$docker run -d -v /var/run/docker.sock:/var/run/docker.sock --rm --name jenkins-slave jenkins-slave -url <master-url> <secret> <host>
```

 - __master-url__: is the URL of your jenkins
 - __ secret__: is the agent secret
 - __host__: is the agent name

Add `-v /srv:/srv --privileged` on the target's slave

### Plugins
You may update the `plugins.txt` which what need, please be sure to update the Configuration as code plugin configuration file: `jenkins.yaml`