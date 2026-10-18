#!/bin/bash

echo "Creating Kubernetes Pod..."

# Create Pod
kubectl run mypod --image=nginx

# Wait for Pod
sleep 5

# Check Pod Status
kubectl get pods

# Describe Pod
kubectl describe pod mypod

# Check Pod Logs
kubectl logs mypod

# Delete Pod
kubectl delete pod mypod

echo "Kubernetes Pod Task Completed!"
