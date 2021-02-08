# This project is archived and migrated to Parsons Bitbucket

# docker-cfn-lint
This is a docker image that simply encapsulates [cfn-lint](https://github.com/aws-cloudformation/cfn-python-lint) in a docker image.

## Usage

### Simple - when scanning a single file
```shell
cat cloudformation.template | docker run --rm -i solidyn/cfn-lint -
```

This sends the template content through docker, and cfn-lint reads it from stdin. Easy. This can also be put in a CI pipeline to not have to deal with Python environments and packages in those cases.

### Complex - when scanning multiple files
```shell
docker run --rm -v $(pwd):/app solidyn/cfn-lint /app/clouformation.template /app/cf2.template
```

This bind mounts your current working directory into `/app` inside the container. Then, you can have cfn-lint scan any files you want, as well as pass other options to cfn-lint if you require them.

Bottom line, is the entrypoint of this container is `/usr/local/bin/cfn-lint`, so you can treat it like an executable in how you invoke it.

### Examples of other uses
In your .bash_profile:
```shell
alias cfn-lint='docker run -rm -it solidyn/cfn-lint'
```

In a `bin` directory on your path:
file `cfn-lint`
```shell
#!/usr/bin/env bash
docker run --rm -it -v $(PWD):/app solidyn/cfn-lint "$@"
```

Then, make it executable with `chmod +x cfn-lint`
