# Service accounts are used to provide credentials to software running in
# your GCP account.

resource "google_service_account" "k8s-svc" {
  project      = var.project
  account_id   = var.k8s-svc-account
  display_name = var.k8s-svc-account-name
}

# Giving privileges to the service account, we are assigning a role, 'roles/container.admin'
resource "google_project_iam_member" "kube-api-admin" {
  project = var.project
  role    = "roles/container.admin"
  member  = "serviceAccount:${google_service_account.k8s-svc.email}"
}

