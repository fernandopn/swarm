```
% kubectl get all -A
NAMESPACE     NAME                                             READY   STATUS    RESTARTS   AGE
k3os-system   pod/system-upgrade-controller-6c9f84cb79-pxscd   1/1     Running   0          4m34s
kube-system   pod/coredns-854c77959c-nkcxg                     1/1     Running   0          4m34s
kube-system   pod/metrics-server-86cbb8457f-ctl7j              1/1     Running   0          4m34s

NAMESPACE     NAME                     TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)                  AGE
default       service/kubernetes       ClusterIP   10.43.0.1       <none>        443/TCP                  4m56s
kube-system   service/kube-dns         ClusterIP   10.43.0.10      <none>        53/UDP,53/TCP,9153/TCP   4m50s
kube-system   service/metrics-server   ClusterIP   10.43.162.131   <none>        443/TCP                  4m49s

NAMESPACE     NAME                                        READY   UP-TO-DATE   AVAILABLE   AGE
k3os-system   deployment.apps/system-upgrade-controller   1/1     1            1           4m46s
kube-system   deployment.apps/coredns                     1/1     1            1           4m51s
kube-system   deployment.apps/metrics-server              1/1     1            1           4m49s

NAMESPACE     NAME                                                   DESIRED   CURRENT   READY   AGE
k3os-system   replicaset.apps/system-upgrade-controller-6c9f84cb79   1         1         1       4m35s
kube-system   replicaset.apps/coredns-854c77959c                     1         1         1       4m35s
kube-system   replicaset.apps/metrics-server-86cbb8457f              1         1         1       4m35s
```

```
% kubectl get crd   
NAME                              CREATED AT
addons.k3s.cattle.io              2021-08-22T11:29:59Z
helmcharts.helm.cattle.io         2021-08-22T11:29:59Z
helmchartconfigs.helm.cattle.io   2021-08-22T11:29:59Z
plans.upgrade.cattle.io           2021-08-22T11:30:50Z
```
