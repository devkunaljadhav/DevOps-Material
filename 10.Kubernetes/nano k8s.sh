#!/bin/bash

# Create Deployment
kubectl create deployment myapp --image=nginx

# Scale Deployment
kubectl scale deployment myapp --replicas=3

# Expose Deployment
kubectl expose deployment myapp \
  --type=NodePort \
  --port=80

# Check Deployment
kubectl get deployments

# Check Pods
kubectl get pods

# Check Services
kubectl get services

echo "Kubernetes Deployment Completed!"
