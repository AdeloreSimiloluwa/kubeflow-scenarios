The first key component of Kubeflow is the ability to deploy TensorFlow that has been packaged as a Docker Image.

In the next step, we'll deploy our first TensorFlow workload that performs a matrix multiplication across the workers and parameter servers defined.

The main code-snippet for the execution is:

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

The complete example can be viewed at https://github.com/tensorflow/k8s/tree/master/examples/tf_sample
