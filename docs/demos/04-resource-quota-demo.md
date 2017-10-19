# Resource Quota Demo Workflow

These steps are to be executed from the boostrap node itself!

## 1. Execute the application service and deployment

```
$ kubectl apply -f examples/resource-quotas/service.yaml
$ kubectl apply -f examples/resource-quotas/deployment.yaml
```

## 2. Locate the pods

```
$ kubectl get pods -o wide
```

You should now see:

```
NAME                                   READY     STATUS    RESTARTS   AGE       IP               NODE
resource-quota-demo-4067652524-01jh5   1/1       Running   0          41s       172.16.235.216   worker1
resource-quota-demo-4067652524-72xxh   1/1       Running   0          41s       172.16.235.217   worker1
resource-quota-demo-4067652524-wnhgn   1/1       Running   0          41s       172.16.235.218   worker1
```

## 3. Obtain the name of the deployment

```
$ kubectl get deployments
```

```
NAME                  DESIRED   CURRENT   UP-TO-DATE   AVAILABLE   AGE
resource-quota-demo   3         3         3            3           1m
```

## 4. Scale the deployment to something silly

```
$ kubectl scale deployment resource-quota-demo --replicas=5
```

## 5. Check the number of pods in the Kubernetes Dashboard

Obtain the Master node IP address from the terraform output

Now browse to `https://<master ip>:6443/ui`. E.g. `https://178.62.115.83:6443/ui`

The username and password are as follows:

Username: admin
Password: DeSletankiwom5784

Now click on `pods` from the left hand navigation menu.

You should see three healthy pods (with green ticks next to them)

However you should see 2 displaying the following:

```
No nodes are available that match all of the predicates: Insufficient cpu (1), NodeUnschedulable (2).
```

## 6. Check the status of the deployment

We can also see the information by describing the deployment using:

```
$ kubectl describe deployment resource-quota-demo
```

You will see the section: `Replicas: 5 desired | 5 updated | 5 total | 3 available | 2 unavailable`

## 7. Scale down the replica count

```
$ kubectl scale deployment resource-quota-demo --replicas=3
```

## 8. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/resource-quotas/service.yaml
$ kubectl delete -f examples/resource-quotas/deployment.yaml
```