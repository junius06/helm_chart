# Helm Chart Overview #

```
This is just a practice code.
```


----

### Get Repository Info ###

* See [helm repository](https://helm.sh/docs/helm/helm_repo/) for command documentation.

### Install Chart ###

```
helm search my_helm_chart
helm install [RELEASE_NAME] my_helm_chart/staging
```

* See [helm install](https://helm.sh/ko/docs/helm/helm_install/) for command documentation.

### Uninstall Chart ###

```
helm uninstall [RELEASE_NAME] my_helm_chart/staging
```

* See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation.

### Upgrading Chart ###

```
helm upgrade [RELEASE_NAME] my_helm_chart/staging --install
```

* See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation.

### Configuration ###

```
helm show values my_helm_chart/staging
```

* See Customizing the Chart Before Installing. To See all configurable options with detailed comments, visit the chart's values.yaml, or run these configuration commands.