With Kubeflow being an extension to Kubernetes, all the components need to be deployed to the platform. They are available in the [Github repository](https://github.com/kubeflow/kubeflow).

## Deploy Ksonnet

```
curl -L https://github.com/ksonnet/ksonnet/releases/download/v0.11.0/ks_0.11.0_linux_amd64.tar.gz | tar xvz && mv ks_0.11.0_linux_amd64/ks /usr/local/bin/ks && rm -rf ks_0.11.0_linux_amd64/
```{{execute}}

## Create a namespace for Kubeflow deployment
The namespace defines a virtual cluster for the Kubeflow components to run from without interfering with other workloads on the system.

```
NAMESPACE=kubeflow
kubectl create namespace ${NAMESPACE}
```{{execute}}

## Initialize a Ksonnet app. Set the namespace for its default environment.
Kuberflow uses Ksonnet, a CLI-supported framework that streamlines writing and deployment of Kubernetes configurations to multiple clusters. This allows you to configure your Tensorflow Job for different clusters based on your training requirements, such as requiring GPU functionality.

```
APP_NAME=my-kubeflow
ks init ${APP_NAME}
cd ${APP_NAME}
ks env set default --namespace ${NAMESPACE}
```{{execute}}

## Install Kubeflow components

Kubeflow and Ksonnet together allow you to deploy the components required to run your workflow. In this case, it's recommended to install the core Kubeflow infrastructure, the ability to train models with TFJob and serve trained models using TF Serving.

When deploying onto your cluster, use the upstream `github.com/kubeflow/kubeflow/tree/master/kubeflow` registry and your own personal GITHUB_TOKEN as described in the [documentation](https://github.com/kubeflow/kubeflow/blob/master/user_guide.md#403-api-rate-limit-exceeded-error).

```
export GITHUB_TOKEN=99510f2ccf40e496d1e97dbec9f31cb16770b884

ks registry add kubeflow github.com/katacoda/kubeflow-ksonnet/tree/master/kubeflow
ks pkg install kubeflow/argo
ks pkg install kubeflow/core
ks pkg install kubeflow/seldon
ks pkg install kubeflow/tf-serving
```{{execute}}

## Create templates for core components
Once the packages are defined, a template is required to be generated.

`ks generate kubeflow-core kubeflow-core --namespace=${NAMESPACE}`{{execute}}

## Deploy Kubeflow
This template is deployed using `ks apply`.

`ks apply default -c kubeflow-core`{{execute}}

## Create Persistence Volume and Services for Katacoda
To ensure Kubeflow runs successfully on Katacoda, deploy the following extensions.

`kubectl apply -f ~/kubeflow/katacoda.yaml -n ${NAMESPACE}`{{execute}}

## View Status
The core Kubeflow components have been deployed. View the status of the deployment with `kubectl get pods -n ${NAMESPACE}`{{execute}}
