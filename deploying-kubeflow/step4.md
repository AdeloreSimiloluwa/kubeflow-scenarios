The second key component of Kubeflow is the ability to run Jupyter Notebooks via JupyterHub.

The Hub is deployed onto the Kubernetes cluster. Via Katacoda, the URL for the Hub is https://[[HOST_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com. On your cluster, find the Load Balancer IP address using `kubectl get svc`{{execute}}

The JupyterHub has a login form. Enter the username __test__ and password: __test__.

To deploy a notebook, start a new server. For an example, use the Docker Image `gcr.io/kubeflow/tensorflow-notebook-cpu:v1`{{copy}}

Click **Spawn**

This will Spawn a new Kubernetes Pod for managing the server. View this using `kubectl get pods`{{execute}}

### Create New Jupyter Notebook

Notebooks can now be accessed via the Pod. To create a new Jupyter notebook, select the New dropdown, and select the Python 3 kernel as shown below.

<img src="/kubeflow/scenarios/deploying-kubeflow/assets/jupyterhub-create-notebook.png" alt="Create New Jupyter Notebook">

It's not possible to create code snippets via Jupyter. For example, in the first cell paste in the following code:

<pre class="file" data-target="clipboard">
from __future__ import print_function

import tensorflow as tf

hello = tf.constant('Hello TensorFlow!')
s = tf.Session()
print(s.run(hello))
</pre>

This can now be executed by running the Cell.

<img src="/kubeflow/scenarios/deploying-kubeflow/assets/jupyterhub-run-notebook.png" alt="Run Jupyter Notebook">
