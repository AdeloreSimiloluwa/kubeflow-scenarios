With Kubeflow being an extension to Kubernetes, all the components need to be deployed to the platform. They are available in the [Github repository](https://github.com/google/kubeflow).

# Create a namespace for kubeflow deployment
```
NAMESPACE=kubeflow
kubectl create namespace ${NAMESPACE}
```{{execute}}

# Initialize a ksonnet app. Set the namespace for it's default environment.
```
APP_NAME=my-kubeflow
ks init ${APP_NAME}
cd ${APP_NAME}
ks env set default --namespace ${NAMESPACE}
```{{execute}}

# Install Kubeflow components
```
ks registry add kubeflow /root/kubeflow/kubeflow
ks pkg install kubeflow/core
ks pkg install kubeflow/tf-serving
ks pkg install kubeflow/tf-job
```{{execute}}

# Create templates for core components
`ks generate kubeflow-core kubeflow-core`{{execute}}

# Deploy Kubeflow
`ks apply default -c kubeflow-core`{{execute}}

# Create Persistence Volume and Services for Katacoda
This is only required when deploying Kubeflow to Katacoda.

`kubectl apply -f ~/kubeflow/katacoda.yaml -n ${NAMESPACE}`{{execute}}

# View Status
`kubectl get pods -n ${NAMESPACE}`{{execute}}
