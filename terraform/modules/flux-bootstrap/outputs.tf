/*
output "flux_bootstrap_status" {
  value = "Flux successfully bootstrapped to repository ${var.github_repo}"
}
*/

output "flux_bootstrap_status" {
  description = "Status of Flux bootstrap"
  value       = "Flux bootstrap triggered for ${var.github_repo}"
}

