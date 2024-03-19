{{- $severity_icon := dict "CRITICAL" "🔴" "HIGH" "🟠" "MEDIUM" "🟡" "UNKNOWN" "🟤" -}}

{{- range . -}}
## {{ .Target }}

### {{ .Type }} [{{ .Class }}]

{{ if .Vulnerabilities -}}
| Title | Severity | CVE | Package Name | Installed Version | Fixed Version | PrimaryURL |
| :--: | :--: | :--: | :--: | :--: | :--: | :-- |
{{- range .Vulnerabilities }}
| {{ .Title -}}
| {{ get $severity_icon .Severity }}{{ .Severity -}}
| {{ .VulnerabilityID -}}
| {{ .PkgName -}}
| {{ .InstalledVersion -}}
| {{ .FixedVersion -}}
| {{ .PrimaryURL -}}
|
{{- end }}

{{ else -}}
_No vulnerabilities found_

{{ end }}

{{- end }}
