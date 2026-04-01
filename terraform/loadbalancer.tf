resource "google_compute_global_address" "static_ip" {
  name = "resume-static-ip"
}

resource "google_compute_backend_bucket" "resume_backend" {
  name        = "resume-backend-bucket"
  bucket_name = google_storage_bucket.resume_bucket.name
  enable_cdn  = true
}


resource "google_compute_url_map" "resume_map" {
  name            = "resume-url-map"
  default_service = google_compute_backend_bucket.resume_backend.self_link
}

resource "google_compute_target_http_proxy" "resume_http_proxy" {
  name    = "resume-http-proxy"
  url_map = google_compute_url_map.resume_map.self_link
}

resource "google_compute_global_forwarding_rule" "resume_forwarding_rule" {
  name                  = "resume-forwarding-rule"
  target                = google_compute_target_http_proxy.resume_http_proxy.self_link
  port_range            = "80"
  ip_address            = google_compute_global_address.static_ip.address
  load_balancing_scheme = "EXTERNAL"
}

resource "google_compute_managed_ssl_certificate" "resume_ssl_cert" {
  name = "resume-ssl-cert"
  managed {
    domains = ["anushrey.dev"]
  }
}

resource "google_compute_target_https_proxy" "resume_https_proxy" {
  name             = "resume-https-proxy"
  url_map          = google_compute_url_map.resume_map.self_link
  ssl_certificates = [google_compute_managed_ssl_certificate.resume_ssl_cert.id]
}


resource "google_compute_global_forwarding_rule" "resume_https_forwarding_rule" {
  name                  = "resume-https-forwarding-rule"
  ip_address            = google_compute_global_address.static_ip.address
  port_range            = "443"
  target                = google_compute_target_https_proxy.resume_https_proxy.self_link
  load_balancing_scheme = "EXTERNAL"
}
