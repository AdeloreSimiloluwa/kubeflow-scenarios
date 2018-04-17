The final Component is the [model server](https://www.tensorflow.org/serving/). Once trained, the model can be used to perform predictions for the new data when it's published. By using Kubeflow, it's possible to access the server by deploying jobs to the Kubernetes infrastructure.

### Image Classification

In this example, we use the pre-trained [Inception V3](https://github.com/tensorflow/models/tree/master/research/inception) model. It's the architecture trained on [ImageNet](http://www.image-net.org/) dataset. The ML task is image classification while the model server and its clients being handled by Kubernetes.

To use the published model, you need to set up the client. This can be achieved the same way as other jobs. The YAML file for deploying the client is `cat model-client-job.yaml`{{execute}}. To deploy it use the following command:

`kubectl apply -f model-client-job.yaml`{{execute}}

To see the status of the __model-client-job__ run:

`kubectl get pods -a`{{execute}}

The command below will output the classification results for the [Katacoda logo](https://katacoda.com/kubeflow/scenarios/deploying-kubeflow/assets/katacoda.jpg).

`kubectl logs $(kubectl get pods -a | grep Completed | tail -n1 |  tr -s ' ' | cut -d ' ' -f 1)`{{execute}}

More information on serving models via Kubernetes can be found at https://github.com/google/kubeflow/tree/master/components/k8s-model-server
