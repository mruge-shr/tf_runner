# TF Runner

This Helm Chart deploys a Job and associated files to execute a one time (or routine cronjob) Job.

## Build the tf container.

The container that executes is packaged with the code that must be executed.  This ensures that the terraform modules can be initialized before execution.

`docker build -t tftest -f Containers/tfdata.Dockerfile Containers/`

remember, if on minikube: `eval $(minikube -p minikube docker-env)` to let docker build inside the kube cluster


## Deploy the Chart

helm upgrade --install tftest tf-runner/ --set image.repository=tftest --set image.tag=latest

After its deployed, run `kubectl logs $(kubectl get pods -o name | grep tftest)

Hopefully you will see something similar to the following

```

Terraform used the selected providers to generate the following execution
plan. Resource actions are indicated with the following symbols:
  + create

Terraform will perform the following actions:

  # null_resource.invisdible will be created
  + resource "null_resource" "invisdible" {
      + id = (known after apply)
    }

Plan: 1 to add, 0 to change, 0 to destroy.
null_resource.invisdible: Creating...
null_resource.invisdible: Creation complete after 0s [id=3273911726977562895]

Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

```