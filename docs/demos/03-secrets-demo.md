# Secrets Demo Workflow

These steps are to be executed from the boostrap node itself!

## 1. Deploy the Kubernetes secret

```
$ kubectl apply -f examples/secrets/app-secret.yaml
```

## 2. Deploy the pod reference the secret

```
$ kubectl apply -f examples/secrets/pod-with-secret.yaml
```

## 3. Locate the pod

```
$ kubectl get pods -o wide
```

You should now see

```
NAME              READY     STATUS    RESTARTS   AGE       IP               NODE
secret-test-pod   1/1       Running   0          13s       172.16.235.215   worker1
```

## 4. Obtain the logs from the pod

```
$ kubectl logs secret-test-pod
```

You should now see:

```
hello steven your password is randompassword
hello steven your password is randompassword
hello steven your password is randompassword
hello steven your password is randompassword
```

## 5. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/secrets/app-secret.yaml
$ kubectl delete -f examples/secrets/pod-with-secret.yaml
```