curl -sfL https://get.k3s.io | sh -s - server --disable traefik



metallb values

```yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: first-pool
  namespace: metallb-system
spec:
  addresses:
  - 10.211.55.200-10.211.55.240
```

helm repo add metallb https://metallb.github.io/metallb
helm install metallb metallb/metallb

helm install metallb metallb/metallb -f values.yaml
