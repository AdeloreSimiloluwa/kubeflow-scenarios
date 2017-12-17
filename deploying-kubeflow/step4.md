https://[[HOST2_SUBDOMAIN]]-80-[[KATACODA_HOST]].environments.katacoda.com

`gcr.io/kubeflow/tensorflow-notebook-cpu:v1`{{copy}}


<img src="/kubeflow/assets/jupyterhub-create-notebook.png" alt="Create New Jupyter Notebook">

<pre class="file" data-target="clipboard">
from __future__ import print_function

import tensorflow as tf

hello = tf.constant('Hello TensorFlow!')
s = tf.Session()
print(s.run(hello))
</pre>

