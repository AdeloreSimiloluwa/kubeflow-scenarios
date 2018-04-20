The API defines us with the ability to take a Github issue and have a summary created.

This can also be accessed via the Web Application. The example below will deploy the web UI.

```
cd ~/my-kubeflow/examples/github_issue_summarization/notebooks/ks-app
ks env add frontendenv --namespace ${NAMESPACE}
ks apply frontendenv -c ui
```{{execute}}

Once deployed, update the configuration to include a Github Token so the application can utilise the Github API.

`kubectl patch deployment -n kubeflow issue-summarization-ui -p \
  '{"spec":{"template":{"spec":{"containers":[{"name": "issue-summarization-ui", "env": [{"name": "GITHUB_TOKEN", "value": "99510f2ccf40e496d1e97dbec9f31cb16770b884"}]}]}}}}'`{{execute}}

Once deployed you can access the UI at https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/issue-summarization/

A live demo that has been trained against a more extensive dataset is available at http://gh-demo.kubeflow.org/. Notice how the quality improves as more data is used for the training.
