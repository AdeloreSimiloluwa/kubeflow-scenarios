Given a Kubernetes cluster, the first task is to deploy the Kubeflow components that are designed to make it easier to deploy Machine Learning workloads by taking advantage of the Kubernetes features and platform.

The Kubeflow components can be downloaded from the Github repository at https://github.com/google/kubeflow

### Kubeflow Components

Kubeflow has three core components.

__TF Job Operator and Controller__: Extension to Kubernetes to simplify deployment of distributed Tensorflow workloads. By using an Operator, Kubeflow is capable of automatically configuring the master, worker and parameterized server configuration. Workloads can be deployed with a TFJob.

__TF Hub__: Running instance of JupyterHub, enabling you to deploy Jupyter Notebook instances quickly.

__Model Server__: Example of deploying a trained Tensorflow model for clients to access.

These three models will be used to deploy different workloads in the following steps.
