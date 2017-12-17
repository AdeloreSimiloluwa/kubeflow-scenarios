The final Component is the model server. The model server is an example of a trained dataset, in this case, taken from the TensorFlow inception example.

By using Kubeflow, it's possible to access the trained model by deploying jobs to the Kubernetes infrastructure.

### Classifying Image

The following image is designed to return a classification of an image on disk based on our trained model being served by Kubernetes. The model is based on the ImageNet dataset.

The YAML for deploying the client is `cat model-client-job.yaml`{{execute}} and deployed in the same way as other jobs via `kubectl apply -f model-client-job.yaml`{{execute}}

The command below will output the results: `kubectl logs $(kubectl get pods --all-namespaces  -a | grep Completed | head -n1 |  tr -s ' ' | cut -d ' ' -f 2)`{{execute}}

The results should be the classification of the [Katacoda logo](https://katacoda.com/kubeflow/scenarios/deploying-kubeflow/assets/katacoda.jpg).

More information on trained models can be found at https://github.com/google/kubeflow/tree/master/components/k8s-model-server
