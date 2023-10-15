{{$d := dict "CRITICAL" "🔴" "HIGH" "🟠" "MEDIUM" "🟡" "UNKNOWN" "🟤" }}

{{- range . -}}
## {{ .Target }}

### {{ .Type }}

{{- $prev := "" }}
{{- range $i, $v := .Vulnerabilities }}
{{- if eq 0 $i }}
| Library | Vulnerability | Fixed Version | Title |
|---------|---------------|---------------|-------|
{{- end }}
{{- with $v }}
{{- $new := ne .PkgName $prev }}
| {{ if $new }}{{ .PkgName }}<br/>{{ .InstalledVersion }}{{ end -}}
| {{ get $d .Vulnerability.Severity }} {{ .VulnerabilityID -}}
| {{ .FixedVersion -}}
| {{ escapeXML .Title -}}
|
{{- $prev = .PkgName }}
{{- end }}
{{- end }}

{{ range $i, $v := .Misconfigurations }}
{{- if eq 0 $i }}
| Type | Vulnerability | Title |
|------|---------------|-------|
{{- end }}
{{- with $v }}
| {{ .Type -}}
| {{ get $d .Severity }} {{ .ID -}}
| {{ escapeXML .Title -}}
|
{{- end }}
{{- end }}

{{- end }}
