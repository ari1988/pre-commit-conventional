# pre-commit-conventional-commits

This is a very basic pre-commit hook to ensure your commit messages conform to [Conventional Commits](https://www.conventionalcommits.org/)

To enable this for your repo, install [pre-commit](https://pre-commit.com/#install) and run `pre-commit install --hook-type commit-msg`. You'll want to ensure that your `.pre-commit-config.yaml` is set to the stage `commit-msg` as shown in the below example:

```yaml
repos:
  - repo: https://github.com/ari1988/pre-commit-conventional
    rev: 1860e61
    hooks:
      - id: conventional-commit-check
        stages: [commit-msg]
        args: []

```
