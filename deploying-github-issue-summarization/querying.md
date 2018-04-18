```
cd ~/my-kubeflow/examples/github_issue_summarization/notebooks/ks-app
ks env add frontendenv --namespace ${NAMESPACE}
ks apply frontendenv -c ui
```{{execute}}

`kubectl patch deployment -n kubeflow issue-summarization-ui -p \
  '{"spec":{"template":{"spec":{"containers":[{"name": "issue-summarization-ui", "env": [{"name": "GITHUB_TOKEN", "value": "99510f2ccf40e496d1e97dbec9f31cb16770b884"}]}]}}}}'`{{execute}}

`kubectl get pods -n ${NAMESPACE}`{{execute}}

https://[[HOST_SUBDOMAIN]]-30080-[[KATACODA_HOST]].environments.katacoda.com/issue-summarization/

http://gh-demo.kubeflow.org/
