resource "google_dns_managed_zone" "resume_zone" {
  name     = "resume-zone"
  dns_name = "anushrey.dev."
}

resource "google_dns_record_set" "resume_root_domain" {
  name         = "anushrey.dev."
  type         = "A"
  ttl          = 300
  managed_zone = google_dns_managed_zone.resume_zone.name

  rrdatas = [google_compute_global_address.static_ip.address]
}


