ssh root@host01 "set -o xtrace && mkdir kubeflow && git clone https://github.com/katacoda/kubeflow-ksonnet.git kubeflow && sed -i 's/\$HOST_IP/[[HOST_IP]]/g' kubeflow/katacoda.yaml && sed -i 's/\$HOST2_IP/[[HOST2_IP]]/g' kubeflow/katacoda.yaml"
ssh root@[[HOST2_IP]] "docker pull katacoda/issue-summarization:0.1-zuowang"
ssh root@[[HOST2_IP]] "docker pull gcr.io/kubeflow-images-staging/issue-summarization-ui:latest"
