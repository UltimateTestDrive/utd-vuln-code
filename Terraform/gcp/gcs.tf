resource "google_storage_bucket" "tg_website" {
  name          = "terragot-${var.environment}"
  force_destroy = true
  labels = {
    git_file             = "terraform/gcp/gcs.tf"
  }
}

resource "google_storage_bucket_iam_binding" "allow_public_read" {
  bucket  = google_storage_bucket.tg_website.id
  members = ["allUsers"]
  role    = "roles/storage.objectViewer"
}

resource "google_storage_bucket" "internal_storage" {
  name          = "tg-internal"
  force_destroy = true
  labels = {
    git_file             = "terraform/gcp/gcs.tf"
  }
}
