With Kubeflow being an extension to Kubernetes, all the components need to be deployed to the platform. They are available in the [Github repository](https://github.com/google/kubeflow) which has already been cloned for you to the `kubeflow/components/` directory.

You can see the list of the components with:

`ls -lha kubeflow/components/`{{execute}}

To deploy them to Kubernetes, run the command:

`kubectl apply -f kubeflow/components/ -R`{{execute}}

Once deployed, you will notice additional pods and services running to handle Kubeflow and TensorFlow workloads:

`kubectl get all`{{execute}}
