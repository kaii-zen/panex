### Prerequisites

- Docker

on macOS, I've been using [OrbStack](https://orbstack.dev/), which is a free-for-personal-use Docker Desktop replacement
that offers some [advantages/conveniences](https://docs.orbstack.dev/#why-orbstack) for M* Mac users.

## Usage

### Bring up the environment
```shell
$ ./start.sh
```
Point a browser to http://localhost:9980 and observe the table:
![1.png](screenshots%2F1.png)

### Modify the data
```shell
$ ./modify.sh
```
Observe the table again to confirm that it remains unchanged.

### Redeploy
```shell
$ ./deploy.sh
```

Observe the changes to the table:
![2.png](screenshots%2F2.png)

### Nuke the environment
```shell
$ ./stop.sh
```

## Please describe how you would add the following to the above system:

### Git
In addition to revision control, Git can be used to trigger CI/CD pipelines.  For example, a push to a `develop` branch can trigger
a build and test pipeline, while a push to the ~~master~~ `main` branch can trigger a deployment pipeline.
This is of course, contrived; and, as an application grows in complexity, more elaborate schemes are required, depending on the specifics.

### Jenkins
Aside from the obvious use of Jenkins as a CI/CD server that builds, tests and deploys; it can also be used to facilitate other
useful tasks, such as:
- Infrastructure provisioning, for example, of a new staging environment upon creation of a new release branch
- Scheduled jobs, such as backups, or periodic database maintenance, in case our big table deteriorates.
- Monitoring and alerting, in case deploys fail, or the application becomes unresponsive.
Jenkins is an ancient beast that does way more than it should; but it does all that so might as well use it.

### Local Docker repository
A local docker registry (I'm assuming something like [Harbor](https://goharbor.io/) or [nexus](https://www.sonatype.com/nexus/repository-oss?)) deployed
on-prem would typically only be useful for on-prem deployments, which may be useful for things like testing/reviewing PRs and such.

### CI \ CD
In terms of CI, other than the usual things, I would want to make sure that:
- data migrations (whenever introduced) can be applied forward and backwards on a replica (preferably anonymized) of the production database.
- the application works with the post migration (anonymized) prod version of the database, and, if possible, with the pre-migration version of the database as well, as that would "unlock" blue/green deployments, which are fun.

In terms of CD, if we ignore the statefulness of the exercise app and assume a traditional db-backed web application,
and in the spirit of blue/green deployments, I'd like to be able to treat the database and the application as separate entities,
which does require migrations to be backwards compatible.
This allows deploying the migrations first, even before the actual code that uses the new schema has been written.
