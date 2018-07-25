`kubectl get crd`{{execute}}

`ks pkg install kubeflow/pytorch-job`

```
cd kubeflow_ks_app
ks generate pytorch-operator pytorch-operator
ks apply default -c pytorch-operator
```{{execute}}

You should see the additional crd.

`kubectl get crd`{{execute}}