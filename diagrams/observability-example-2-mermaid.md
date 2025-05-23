```mermaid

graph LR
    A[Your Application] -->|Instrumented with| B[OpenTelemetry SDK]
    B --> C[OpenTelemetry Collector]
    C -->|Metrics| D[Grafana Mimir]
    D --> E[Grafana Dashboard]
    C -->|Traces| F[Grafana Tempo]
    C -->|Logs| G[Grafana Loki]
    F --> E
    G --> E