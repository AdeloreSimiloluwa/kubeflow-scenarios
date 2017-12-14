In the final step...

`kubectl get job`{{execute}}

`kubectl get pods --all-namespaces  -a | grep Completed`{{execute}}

`kubectl logs $(kubectl get pods --all-namespaces  -a | grep Completed | tr -s ' ' | cut -d ' ' -f 2)`{{execute}}
