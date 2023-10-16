{{$d := dict "CRITICAL" "🔴" "HIGH" "🟠" "MEDIUM" "🟡" "UNKNOWN" "🟤" }}

{{- range . -}}
## {{ .Target }}

### {{ .Type }}

{{- range $v_index, $vul := .Vulnerabilities }}
{{- if eq 0 $v_index }}
|Title|Severity|CVE|Package Name|Installed Version|Fixed Version|References|
|:--:|:--:|:--:|:--:|:--:|:--:|:--|
{{- end }}
{{- with $vul }}
|{{ .Title }}|{{ get $d .Vulnerability.Severity }}{{ .Vulnerability.Severity }}|{{ .VulnerabilityID }}|{{ .PkgName }}|{{ .InstalledVersion }}|{{ .FixedVersion }}|{{ range $r_index, $ref := .Vulnerability.References }}{{ if $r_index }}, {{ end }}{{ $ref }}{{ end }}|
{{- end }}
{{- end }}

{{- end }}
