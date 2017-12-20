With Kubeflow being an extension to Kubernetes, the Kubeflow components need to be deployed to Kubeflow. The components are in the Github repository which has been cloned for you.

You can see the components with `ls -lha kubeflow/components/`{{execute}}

To Deploy the components to Kubernetes, run the command `kubectl apply -f kubeflow/components/ -R`{{execute}}

Once deployed, you will notice additional pods and services running to handle Kubeflow and TensorFlow workloads. This is viewable via:

`kubectl get all`{{execute}}
