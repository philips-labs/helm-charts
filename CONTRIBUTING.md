# CONTRIBUTING

:tada: Thanks for your interest in contributing to this project. In this document we outline a few guidelines to ease the way your contributions flow into this project.

## Commit style

Ensure you have clear and concise commits, written in the present tense. See [Kubernetes commit message guidelines](https://www.kubernetes.dev/docs/guide/pull-requests/#commit-message-guidelines) for a more detailed explanation of our approach.

```diff
+ git commit -m "Bump spire appVersion 1.4.4"
- git commit -m "Bumped spire appVersion 1.4.4"
```

## PRs

Stick with one feature/chart per branch. This allows us to make small controlled releases of the charts and makes it easy for us to review PRs.

Ensure your branch is rebased on top of main before issuing your PR. This to keep a clean Git history and to ensure your changes are working with the latest main branch changes.

```bash
git checkout main
git pull
git checkout «your-branch»
git rebase main
```

## Generating documentation

Any changes to Chart.yaml or values.yaml require an update of the README.md. This update can easily be generated using [helm-docs][].

```shell
helm-docs -g charts/«chart-name» -t .github/README.md.tmpl
```

Or use the little convenience script.

```shell
.github/helm-docs.sh
```

[helm-docs]: https://github.com/norwoodj/helm-docs "Generate documentation for your Helm chart."
