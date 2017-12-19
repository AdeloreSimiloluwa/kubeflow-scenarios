TfJob provides a Kubernetes custom resource that makes it easy to run distributed or non-distributed TensorFlow jobs on Kubernetes. The TFJob controller takes a YAML specification for a master, parameter servers, and workers to help run distributed Tensorflow.

## Purpose

TFJob is a Kubernetes custom resource designed for running distributed or non-distributed TensorFlow jobs on Kubernetes. A Custom Resource Definition (CRD) provides the ability to create and manage TF Jobs in the same fashion as built-in Kubernetes resources.

Once deployed, the CRD can configure the TensorFlow job based on the environment, allowing users to focus on machine learning instead of infrastructure.

## Example of Tenorflow Workflow
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
