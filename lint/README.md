# Linters

## TODO

- should we rely on `GITHUB_WORKSPACE` env variable?

## YAML: yamllint

- Repository: https://github.com/adrienverge/yamllint
- GitHub Action: https://github.com/marketplace/actions/yaml-lint
- Configuration: [yamllint.yml](yamllint.yml)

## XML: xmllint

- Checker: [xmllint](http://xmlsoft.org/xmllint.html).
- File extensions: `xml`, `html`, `launch`, `urdf`,  `xacro`, `sdf`, `aiml`.

**Limitations**: xmllint does not correctly parse all ROS files. For instance, nodelet plugins XML contain non-standard "<" and ">" characters from C++ code templates. This might be solved by using a ROS specific XML schema: [See the discussion](https://github.com/ros/ros_comm/issues/455).

**Example**
```bash
# build
cd <uchile_ci>
docker build -t uchile_ci/xmllint ./lint/xml/

# run
cdb pkgs
docker run -it --rm -e GITHUB_WORKSPACE=/src -v `pwd`:/src uchile_ci/xmllint
```
