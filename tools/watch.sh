#!/bin/bash

# watch "
#     kubectl get po -o wide; echo;
#     kubectl get pvc -o wide; echo;
#     kubectl get pv -o wide; echo;
#     kubectl get svc -o wide; echo;
#     "

NAMESPACE=$1

if [[ -z "$NAMESPACE" ]]; then
    watch "
        kubectl get no --all-namespaces -o wide | sort; echo;
        kubectl get helmreleases --all-namespaces -o wide | sort; echo;
        kubectl get deployments --all-namespaces | sort; echo;
        "
else
    watch "
        kubectl get po -n $NAMESPACE -o wide | sort; echo;
        kubectl get svc -n $NAMESPACE -o wide | sort; echo;
        kubectl get ingress -n $NAMESPACE -o wide | sort; echo;
        kubectl get helmrelease -n $NAMESPACE -o wide | sort; echo;
        kubectl get pvc -n $NAMESPACE -o wide | sort; echo;
        kubectl get secret -n $NAMESPACE -o wide | sort; echo;
        "
fi
