Distributed MNIST Model

`cat ~/example.yaml`{{execute}}

[dist_mnist.py](https://github.com/kubeflow/pytorch-operator/blob/9605eb6783e3549654082ea4b18a9cb0391e8548/examples/dist-mnist/dist_mnist.py)

`kubectl create -f ~/example.yaml`{{execute}} 

`kubectl get pods -l pytorch_job_name=distributed-mnist`{{execute}}