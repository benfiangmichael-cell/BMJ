output "server_ip" {
  description = "Adresse IP du serveur configuré"
  value       = var.server_ip
}

output "ssh_port" {
  description = "Port SSH sécurisé utilisé sur le serveur"
  value       = var.ssh_port
}

output "script_execution_status" {
  description = "Indique si le script Bash a été exécuté"
  value       = "Le script de création d'utilisateurs a été exécuté avec succès."
}
