The status of Tensorflow jobs can be viewed via `kubectl get job`{{execute}}. Once the Tensorflow job has been completed, the master be marked as successful. Keep running the job command to see when it's completed.

The master is responsible for coordinating the execution and aggregating the results. Once completed, the workload will complete. Under the covers, the completed workloads can be listed using `kubectl get pods -a | grep Completed`{{execute}}

In this example, the results are outputted to STDOUT, viewable using `kubectl logs`.

The command below will output the results: `kubectl logs $(kubectl get pods -a | grep Completed | tr -s ' ' | cut -d ' ' -f 1)`{{execute}}

You will see the results from the execution of the workload on the master, worker and parameter servers.
