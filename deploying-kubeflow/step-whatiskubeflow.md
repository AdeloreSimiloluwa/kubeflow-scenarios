The Kubeflow project is dedicated to making Machine Learning on Kubernetes easy, portable and scalable. Our goal is not to recreate other services, but to provide a straightforward way for spinning up best of breed OSS solutions. Kubernetes is an open-source system for automating deployment, scaling, and management of containerized applications.

Because Kubeflow relies on Kubernetes, it runs wherever Kubernetes runs such as bare-metal servers, or cloud providers such as Google.

Details of the project can be found at https://github.com/google/kubeflow

### Kubeflow Components

Kubeflow has three core components.

__TF Job Operator and Controller__: Extension to Kubernetes to simplify deployment of distributed Tensorflow workloads. By using an Operator, Kubeflow is capable of automatically configuring the master, worker and parameterized server configuration. Workloads can be deployed with a TFJob.

__TF Hub__: Running instance of JupyterHub, enabling you to deploy Jupyter Notebook instances quickly.

__Model Server__: Example of deploying a trained Tensorflow model for clients to access.

These three models will be used to deploy different workloads in the following steps.
