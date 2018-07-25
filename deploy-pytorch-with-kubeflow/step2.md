`kubectl get crd`{{execute}}

```
ks pkg install kubeflow/pytorch-job
ks generate pytorch-operator pytorch-operator
```

```
cd kubeflow_ks_app
ks apply default -c pytorch-operator
```{{execute}}

You should see the additional crd.

`kubectl get crd`{{execute}}