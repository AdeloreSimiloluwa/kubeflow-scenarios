Training should run for about 10 epochs and takes 5-10 minutes on a cpu cluster. Logs can be inspected to see its training progress.

```
PODNAME=$(kubectl get pods -l pytorch_job_name=distributed-mnist,task_index=0 -o name)
kubectl logs ${PODNAME}
```{{execute}}


<pre class="file">
Downloading http://yann.lecun.com/exdb/mnist/train-images-idx3-ubyte.gz
Downloading http://yann.lecun.com/exdb/mnist/train-labels-idx1-ubyte.gz
Downloading http://yann.lecun.com/exdb/mnist/t10k-images-idx3-ubyte.gz
Downloading http://yann.lecun.com/exdb/mnist/t10k-labels-idx1-ubyte.gz
Processing...
Done!
Rank  0 , epoch  0 :  1.2745472780232237
Rank  0 , epoch  1 :  0.5743547164872765
</pre>

`ssh -t root@[[HOST2_IP]] htop`{{execute}}

`kubectl get -o yaml pytorchjobs distributed-mnist`{{execute}}

`kubectl get -o json pytorchjobs distributed-mnist  | jq .status`{{execute}}

`kubectl get -o json pytorchjobs distributed-mnist  | jq .status.state`{{execute}}