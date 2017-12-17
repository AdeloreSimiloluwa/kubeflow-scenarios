The Tensorflow workload performs a matrix multiplication across the workers and parameter servers defined.

<pre class="file">
for job_name in cluster_spec.keys():
  for i in range(len(cluster_spec[job_name])):
    d = "/job:{0}/task:{1}".format(job_name, i)
    with tf.device(d):
      a = tf.constant(range(width * height), shape=[height, width])
      b = tf.constant(range(width * height), shape=[height, width])
      c = tf.multiply(a, b)
      results.append(c)
</pre>

### Viewing Results

The status of Tensorflow jobs can be viewed via `kubectl get job`{{execute}}. Once the Tensorflow job has been completed, the master be marked as successful. Keep running the job command to see when it's completed.

The master is responsible for coordinating the execution and aggregating the results. Once completed, the workload will complete. Under the covers, the completed workloads can be listed using `kubectl get pods -a | grep Completed`{{execute}}

In this example, the results are outputted to STDOUT, viewable using `kubectl logs`.

The command below will output the results: `kubectl logs $(kubectl get pods -a | grep Completed | tr -s ' ' | cut -d ' ' -f 1)`{{execute}}

You will see the results from the execution of the workload on the master, worker and parameter servers.

## Purpose

TFJob is a Kubernetes custom resource designed for running distributed or non-distributed TensorFlow jobs on Kubernetes. A Custom Resource Definition (CRD) provides the ability to create and manage TF Jobs in the same fashion as built-in Kubernetes resources.

Once deployed, the CRD can configure the TensorFlow job based on the environment, allowing users to focus on machine learning instead of infrastructure.
