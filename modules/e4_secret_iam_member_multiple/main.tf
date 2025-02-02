resource "google_secret_manager_secret_iam_member" "secret_access" {
  count    = length(var.secret_ids)
  secret_id = var.secret_ids[count.index]
  role      = var.role
  member    = var.member
}
