With Kubeflow being an extension to Kubernetes, all the components need to be deployed to the platform. 

The team have provided a installation script which uses Ksonnet to deploy Kubeflow to an existing Kubernetes cluster.

Kubeflow uses Ksonnet to deploy the required components. Install Ksonnet 0.11 with the command below:
```
curl -L https://github.com/ksonnet/ksonnet/releases/download/v0.11.0/ks_0.11.0_linux_amd64.tar.gz | tar xvz && mv ks_0.11.0_linux_amd64/ks /usr/local/bin/ks && rm -rf ks_0.11.0_linux_amd64/
```{{execute}}

Ksonnet requires a valid Github token. The following can be used within Katacoda. Run the command to set the required environment variable.

`export GITHUB_TOKEN=99510f2ccf40e496d1e97dbec9f31cb16770b884`{{execute}}

Once installed, you can run the installation script:

```
export KUBEFLOW_VERSION=0.2.2
curl https://raw.githubusercontent.com/kubeflow/kubeflow/v${KUBEFLOW_VERSION}/scripts/deploy.sh | bash
```{{execute}}

You should see the Kubeflow pods starting.

`kubectl get pods`{{execute}}

