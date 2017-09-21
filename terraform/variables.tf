variable "digital_ocean_token" {
  description = "Your Digital Ocean token"
}

# possible options
# New York - nyc1, nyc2, nyc3
# San Fransico - sfo1, sfo2
# Amsterdam - ams2, ams3
# Singapore - sgp1
# London - lon1
# Frankfurt - fra1
# Toronto - tor1
# Bangalore - blr1
variable region {
  description = "Region to launch in"
  default     = "nyc1"
}

variable image {
  description = "Name of the image to use"
  default     = "ubuntu-16-04-x64"
}

variable cluster_tag {
  description = "A unique tag for the cluster"
  default     = "firstname-lastname"
}

variable droplet_size {
  description = "Size of the droplets"
  default     = "1gb"
}

variable master_count {
  description = "Number of k8s master droplets"
  default     = 1
}

variable etcd_count {
  description = "Number of etcd droplets"
  default     = 1
}

variable worker_count {
  description = "Number of k8s worker droplets"
  default     = 1
}

variable ingress_count {
  description = "Number of k8s ingress droplets"
  default     = 1
}
