After deploying Kubeflow, the next step is to train the model.

Depending on the size of the dataset, training models with Kubeflow can take some hours. The steps below will describe how to start training the model, but you will not be expected to wait for it to finish. Instead, the next step in the scenario will use a pre-trained model.

## Clone Project

The project is available at https://github.com/kubeflow/examples/tree/master/github_issue_summarization. This contains the Ksonnet templates to describe how to train and serve the model.

Clone the repository using `git clone https://github.com/kubeflow/examples.git; cd examples/github_issue_summarization/notebooks/ks-app`{{execute}}

Once cloned, create an environment for the application.
```
ks env add tfjob --namespace ${NAMESPACE}
```{{execute}}

Once an environment has been delayed, the next step is to configure the TFJob to launch the trained model. The Tensorflow code has been packaged as a Docker Image called _gcr.io/agwl-kubeflow/tf-job-issue-summarization_. You can view the code at https://github.com/kubeflow/examples/blob/master/github_issue_summarization/notebooks/IssueSummarization.py.

A GCP Credential is also created. This allows the Tensorflow job to download the required dataset (_github-issues.zip_) and a place to persist the trained model (_output_model.h5_).

```
GCPTOKEN=test
kubectl --namespace=${NAMESPACE} create secret generic gcp-credentials --from-literal=$GCPTOKEN
ks param set tfjob namespace ${NAMESPACE} --env=tfjob
ks param set tfjob image "gcr.io/agwl-kubeflow/tf-job-issue-summarization:notraining" --env=tfjob
```{{execute}}

# Sample Size for training
`ks param set tfjob sample_size 100000 --env=tfjob`{{execute}}

# Set the input and output GCS Bucket locations
```
ks param set tfjob input_data_gcs_bucket "kubeflow-examples" --env=tfjob
ks param set tfjob input_data_gcs_path "github-issue-summarization-data/github-issues.zip" --env=tfjob
ks param set tfjob output_model_gcs_bucket "kubeflow-examples" --env=tfjob
ks param set tfjob output_model_gcs_path "github-issue-summarization-data/output_model.h5" --env=tfjob
```{{execute}}

Once the parameters have been defined, the job can be deployed with the following command. This will allow the Ksonnet template to the target Kubernetes cluster.

```
ks apply tfjob -c tfjob
```{{execute}}

You can view the status of the deployment with:

```
kubectl get pods -n=${NAMESPACE} -ltf_job_name=tf-job-issue-summarization
```{{execute}}

After it has started, the logs can be accessed via:

```
kubectl logs -f $(kubectl get pods -n=${NAMESPACE} -ltf_job_name=tf-job-issue-summarization -o=jsonpath='{.items[0].metadata.name}')
```{{execute}}

As the training will take a long time to complete, it's recommended to move on to the next step and use a pre-trained model.
