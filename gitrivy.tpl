{{$d := dict "CRITICAL" "🔴" "HIGH" "🟠" "MEDIUM" "🟡" "UNKNOWN" "🟤" }}

{{- range . -}}
## {{ .Target }}

### {{ .Type }}

|Title|Severity|CVE|Package Name|Installed Version|Fixed Version|References|
|:--:|:--:|:--:|:--:|:--:|:--:|:--|
{{- range .Vulnerabilities }}
|{{ .Title }}|{{ get $d .Vulnerability.Severity }}{{ .Vulnerability.Severity }}|{{ .VulnerabilityID }}|{{ .PkgName }}|{{ .InstalledVersion }}|{{ .FixedVersion }}|{{ range $index, $reference := .References }}{{ if $index }}, {{ end }}{{ $reference }}{{ end }}|
{{- end }}

{{- end }}
