{{- define "kewm.commonName" -}}
{{- if eq .Values.environment "prod" -}}
kewm.kroger.com
{{- else if or (eq .Values.environment "dev") (eq .Values.environment "test") (eq .Values.environment "stage") (eq .Values.environment "perf") -}}
{{ .Values.serverAlias }}
{{- else -}}
*.kewm.rch2-{{ .Values.datacenter }}-ax-np.kroger.com
{{- end -}}
{{- end }}

{{- define "kewm.dnsNames" -}}
{{- if eq .Values.environment "prod" -}}
- "kewm.kroger.com"
- "kewm.cloudha.kroger.com"
- "*.kewm.rch2-{{ .Values.datacenter }}-ax-p.kroger.com"
{{- else if eq .Values.environment "stage" -}}
- "kewmstage.kroger.com"
- "kewmstage.cloudha.kroger.com"
- "*.kewm.rch2-{{ .Values.datacenter }}-ax-np.kroger.com"
{{- else if or (eq .Values.environment "dev") (eq .Values.environment "test") (eq .Values.environment "stage") (eq .Values.environment "perf") -}}
- "kewm{{ .Values.environment }}.kroger.com"
- "kewm{{ .Values.environment }}.cloudhanp.kroger.com"
- "*.kewm.rch2-{{ .Values.datacenter }}-ax-np.kroger.com"
{{- else -}}
- "*.kewm.rch2-{{ .Values.datacenter }}-ax-np.kroger.com"
{{- end -}}
{{- end }}

{{- define "kewm.ingressServerAlias" -}}
{{- if eq .Values.environment "prod" -}}
kewm.kroger.com,kewm.cloudha.kroger.com
{{- else -}}
{{ .Values.serverAlias }},{{ .Values.name }}{{ .Values.environment }}.kroger.com
{{- end -}}
{{- end }}

{{- define "kewm.ingressTlsHosts" -}}
{{- if eq .Values.environment "prod" -}}
- kewm.kroger.com
- kewm.kewm.rch2-{{ .Values.datacenter }}-ax-p.kroger.com
{{- else -}}
- {{ .Values.name }}{{ .Values.environment }}.kroger.com
- {{ .Values.ingress.host }}
{{- end -}}
{{- end }}

{{- define "kewm.ingressRuleHost" -}}
{{- if eq .Values.environment "prod" -}}
kewm.kewm.rch2-{{ .Values.datacenter }}-ax-p.kroger.com
{{- else -}}
{{ .Values.ingress.host }}
{{- end -}}
{{- end }}
