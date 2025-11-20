{{/*
Expand the name of the chart.
*/}}
{{- define "app-stack.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "app-stack.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "app-stack.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "app-stack.labels" -}}
helm.sh/chart: {{ include "app-stack.chart" . }}
{{ include "app-stack.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "app-stack.selectorLabels" -}}
app.kubernetes.io/name: {{ include "app-stack.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Database selector labels
*/}}
{{- define "app-stack.databaseSelectorLabels" -}}
{{ include "app-stack.selectorLabels" . }}
app.kubernetes.io/component: database
{{- end }}

{{/*
Cache selector labels
*/}}
{{- define "app-stack.cacheSelectorLabels" -}}
{{ include "app-stack.selectorLabels" . }}
app.kubernetes.io/component: cache
{{- end }}

{{/*
Backend selector labels
*/}}
{{- define "app-stack.backendSelectorLabels" -}}
{{ include "app-stack.selectorLabels" . }}
app.kubernetes.io/component: backend
{{- end }}

{{/*
Frontend selector labels
*/}}
{{- define "app-stack.frontendSelectorLabels" -}}
{{ include "app-stack.selectorLabels" . }}
app.kubernetes.io/component: frontend
{{- end }}
