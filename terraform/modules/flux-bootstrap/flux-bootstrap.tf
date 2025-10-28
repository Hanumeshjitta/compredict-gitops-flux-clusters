resource "null_resource" "flux_bootstrap" {
  provisioner "local-exec" {
    environment = {
      GITHUB_TOKEN = var.github_token
    }

    interpreter = ["PowerShell", "-Command"]
    command = <<-EOT
      Write-Host "==== Waiting for Kubernetes cluster to be ready ===="

      $maxRetries = 20
      $retryDelay = 15
      $count = 0
      $clusterReady = $false

      while ($count -lt $maxRetries) {
        try {
          kubectl --kubeconfig=${var.kubeconfig_path} get nodes | Out-Null
          if ($LASTEXITCODE -eq 0) {
            Write-Host "Cluster is ready!"
            $clusterReady = $true
            break
          }
        } catch {
          Write-Host "Cluster not ready yet, retrying..."
        }
        Start-Sleep -Seconds $retryDelay
        $count++
      }

      if (-not $clusterReady) {
        Write-Host "Cluster API not reachable after retries. Exiting."
        exit 1
      }

      Write-Host "==== Bootstrapping FluxCD ===="

      # Fix: force Flux to use a temp directory on the same drive (D:)
      $env:TEMP = "C:\\flux"
      $env:TMP = "C:\\flux"

      flux bootstrap github `
        --owner=${var.github_owner} `
        --repository=${var.github_repo} `
        --branch=${var.github_branch} `
        --path=${var.flux_path} `
        --kubeconfig=${var.kubeconfig_path} `
        --personal

      if ($LASTEXITCODE -ne 0) {
        Write-Host "Flux bootstrap failed"
        exit 1
      } else {
        Write-Host "Flux bootstrap completed successfully!"
      }
    EOT
  }
}

