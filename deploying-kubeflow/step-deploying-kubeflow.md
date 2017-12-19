`ls -lha kubeflow/components/`{{execute}}

Deploy the components to Kubernetes with `kubectl apply -f kubeflow/components/ -R`{{execute}}



### Deployed Components

Once deployed, you will notice additional pods and services running to handle Kubeflow and Tensorflow workloads. This is viewable via:

`kubectl get all`{{execute}}
