# App Stack Helm Chart

A Helm chart for deploying a full application stack with database, cache, backend and frontend components.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+

## Installing the Chart

To install the chart with the release name `my-app`:

```bash
# For development environment
helm install my-app ./helm-chart -f helm-chart/values-dev.yaml

# For production environment
helm install my-app ./helm-chart -f helm-chart/values-prod.yaml

# For staging environment (uses default values)
helm install my-app ./helm-chart
```

## Uninstalling the Chart

To uninstall the `my-app` deployment:

```bash
helm uninstall my-app
```

## Configuration

The following table lists the configurable parameters of the app-stack chart and their default values.

### Global Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `global.imageRegistry` | Global Docker image registry | `""` |
| `global.imagePullSecrets` | Global Docker registry secret names | `[]` |

### Database Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `database.enabled` | Enable database deployment | `true` |
| `database.replicas` | Number of database replicas | `3` |
| `database.image.repository` | Database image repository | `postgres` |
| `database.image.tag` | Database image tag | `"15"` |
| `database.resources.requests.memory` | Database memory request | `"4Gi"` |
| `database.resources.requests.cpu` | Database CPU request | `"1000m"` |
| `database.persistence.size` | Database PVC size | `"50Gi"` |

### Cache Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `cache.enabled` | Enable cache deployment | `true` |
| `cache.replicas` | Number of cache replicas | `3` |
| `cache.image.repository` | Cache image repository | `redis` |
| `cache.image.tag` | Cache image tag | `"7"` |
| `cache.resources.requests.memory` | Cache memory request | `"4Gi"` |
| `cache.resources.requests.cpu` | Cache CPU request | `"1000m"` |
| `cache.persistence.size` | Cache PVC size | `"10Gi"` |

### Backend Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `backend.enabled` | Enable backend deployment | `true` |
| `backend.replicas` | Number of backend replicas | `10` |
| `backend.image.repository` | Backend image repository | `myapp/backend` |
| `backend.image.tag` | Backend image tag | `"latest"` |
| `backend.resources.requests.memory` | Backend memory request | `"600Mi"` |
| `backend.resources.requests.cpu` | Backend CPU request | `"1000m"` |

### Frontend Parameters

| Parameter | Description | Default |
|-----------|-------------|---------|
| `frontend.enabled` | Enable frontend deployment | `true` |
| `frontend.replicas` | Number of frontend replicas | `5` |
| `frontend.image.repository` | Frontend image repository | `myapp/frontend` |
| `frontend.image.tag` | Frontend image tag | `"latest"` |
| `frontend.resources.requests.memory` | Frontend memory request | `"50Mi"` |
| `frontend.resources.requests.cpu` | Frontend CPU request | `"200m"` |
| `frontend.ingress.enabled` | Enable ingress | `true` |
| `frontend.ingress.hosts[0].host` | Frontend ingress host | `myapp.local` |

## Environment-specific configurations

- `values-dev.yaml` - Development environment with reduced resources
- `values-prod.yaml` - Production environment with full resources and ingress
- `values.yaml` - Default values (staging environment)

## Components

This chart deploys the following components:

1. **Database**: PostgreSQL database with persistent storage
2. **Cache**: Redis cache with persistent storage
3. **Backend**: Application backend API
4. **Frontend**: Web frontend with ingress

Each component can be individually enabled/disabled and has configurable resource limits and replicas.
