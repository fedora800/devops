apiVersion: v1
kind: Service
metadata:
  name: svc-basic-flask-app
  namespace: ns-demo-project1
spec:
  selector:
    pl-app: busybox
    pl-env: prod
    pl-tier: frontend
  type: LoadBalancer
  ports:
    - protocol: TCP
      port: 80
      targetPort: 80
