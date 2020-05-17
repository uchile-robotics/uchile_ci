# Linters

## TODO

- should we rely on `GITHUB_WORKSPACE` env variable?.

## YAML: yamllint

- Repository: https://github.com/adrienverge/yamllint
- GitHub Action: https://github.com/marketplace/actions/yaml-lint
- Configuration: [yamllint.yml](yamllint.yml)

## XML: xmllint

- Checker: [xmllint](http://xmlsoft.org/xmllint.html).
- File extensions: `xml`, `html`, `launch`, `urdf`,  `xacro`, `sdf`, `aiml`.
- GitHub Action: https://github.com/marketplace/actions/xml-lint


- See Also:
  - ROS launch schema
	- issue: https://github.com/ros/ros_comm/issues/455
	- gist: https://gist.github.com/nalt/dfa2abc9d2e3ae4feb82ca5608090387

### Example
```bash
# build
cd <uchile_ci>
docker build -t uchile_ci/xmllint ./lint/xml/

# run
cdb pkgs
docker run -it --rm -e GITHUB_WORKSPACE=/src -v `pwd`:/src uchile_ci/xmllint
```
