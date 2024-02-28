{{/*
Expand the name of the chart.
*/}}
{{- define "rangeApp.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "rangeApp.fullname" -}}
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
{{- define "rangeApp.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "rangeApp.labels" -}}
helm.sh/chart: {{ include "rangeApp.chart" . }}
{{ include "rangeApp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "rangeApp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "rangeApp.name" . }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "rangeApp.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "rangeApp.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Each pods labels
*/}}
{{- define "rangeApp.api" -}}
role: {{ include "rangeApp.name" . }}-api
{{- end }}
{{- define "rangeApp.mysqlData" -}}
role: {{ include "rangeApp.name" . }}-mysqlData
{{- end }}
{{- define "rangeApp.redisData" -}}
role: {{ include "rangeApp.name" . }}-redisData
{{- end }}
{{- define "rangeApp.influxData" -}}
role: {{ include "rangeApp.name" . }}-influxData
{{- end }}