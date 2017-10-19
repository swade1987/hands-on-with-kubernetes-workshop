# Ingress Demo Workflow

These steps are to be executed from the boostrap node itself!

## 1. Execute the application service, deployment & ingress defintions

```
$ kubectl apply -f examples/ingress
```

## 2. Browse via the NodePort

```
$ kubectl get svc
```

You should see the following:

```
NAME                   CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
k8s-workshop-ingress   172.17.150.221   <nodes>       80:32691/TCP   7s
kubernetes             172.17.0.1       <none>        443/TCP        1h
```

Obtain the worker node IP address from the terraform output

Now from your browser browse to `http://<worker ip>:nodePort`

In our instance it would be `http://<worker ip>:32691`

Note: Port `32691` is shown as being the NodePort used after we executed `kubectl get services` above.

You should now see "version 1.0" displayed on the webpage.

## 3. Obtain the Ingress IP address

Obtain the ingress node IP address from the terraform output

## 4. Setup your hostfile

Execute the following *from your local machine*:

```
$ nano \etc\hosts
```

Add the following line to the file

```
<ingress node ip> k8sworkshop.com
```

An example would be:

```
178.62.114.175 k8sworkshop.com
```

## 5. Now browse via the domain name

Now browse to [http://k8sworkshop.com](http://k8sworkshop.com)

You should see the same content as when browsing via the node port

## 6. Delete the demo

Finally execute the following command to tidy away the demo:

```
$ kubectl delete -f examples/ingress
```