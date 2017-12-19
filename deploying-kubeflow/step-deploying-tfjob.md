View an example of the TFJob by running `cat example.yaml`{{execute}}

The TFJob can be deployed by running `kubectl apply -f example.yaml`{{execute}}

The job is made up of one master, one worker and two parameter servers.The workload is defined in the Docker Image __gcr.io/tf-on-k8s-dogfood/tf_sample:dc944ff__.

The next step will explain the Job and how to access the results.

### Job Deployment Replica Types

__Master__: A job must have one and only one master. The master will coordinate training operations execution between workers.

__Worker__: A job can have 0 to N workers. Each worker process runs the same model, providing parameters for processing to a Parameter Server.

__PS__: A job can have 0 to N parameter servers. Parameter server enables you to scale your model across multiple machines.

More information can be found at https://www.tensorflow.org/deploy/distributed
