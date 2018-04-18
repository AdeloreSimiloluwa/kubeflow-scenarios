`git clone https://github.com/kubeflow/examples.git`{{execute}}

`cd examples/github_issue_summarization`{{execute}}

```
GCPTOKEN=test
cd notebooks/ks-app
ks env add tfjob --namespace ${NAMESPACE}
```{{execute}}

```
kubectl --namespace=${NAMESPACE} create secret generic gcp-credentials --from-literal=$GCPTOKEN
ks param set tfjob namespace ${NAMESPACE} --env=tfjob
ks param set tfjob image "gcr.io/agwl-kubeflow/tf-job-issue-summarization:dontdeploy" --env=tfjob
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

```
ks apply tfjob -c tfjob
```{{execute}}

```
kubectl get pods -n=${NAMESPACE} -ltf_job_name=tf-job-issue-summarization
```{{execute}}

```
kubectl logs -f $(kubectl get pods -n=${NAMESPACE} -ltf_job_name=tf-job-issue-summarization -o=jsonpath='{.items[0].metadata.name}')
```{{execute}}

https://storage.googleapis.com/kubeflow-examples/


https://github.com/kubeflow/examples/blob/master/github_issue_summarization/notebooks/IssueSummarization.py


https://github.com/google/seq2seq/blob/master/docs/inference.md
