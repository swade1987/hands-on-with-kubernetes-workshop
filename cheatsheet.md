Open three terminal's all connected to the bootstrap node.


## Terminal 1

```
$ cd hands-on-kubernetes-workshop
$ kubectl apply -f demo-app
$ kubectl get services
$ kubectl describe service hello-world
```

Now execute the following command and leave it running ...

NOTE: Copy the `worker1` ip address and the NodePort of the `hello-world` service before running the command!

```
$ watch curl http://<worker ip>:<service NodePort>
```

## Terminal 2

Execute the following command and leave it running ...

```
$ watch kubectl get pods
```

## Terminal 3

```
$ cd hands-on-kubernetes-workshop
$ nano demo-app/hello-world-deployment.yaml
```

Change the replica count to five, save and then execute: `kubectl apply -f demo-app`

Change the environment variable called `Name` from `World` to `Chicago` save and then execute: `kubectl apply -f demo-app`

Now execute `kubectl delete pod <pod name>` watch the second terminal you will see another pod get created automatically.
