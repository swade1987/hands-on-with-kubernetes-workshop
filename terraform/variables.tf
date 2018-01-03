variable "digital_ocean_token" {
  description = "Your Digital Ocean token"
}

variable "unique_identifier" {
  default = "hands-on-workshop"
}

# IMPORTANT: Needs to include the 'v' at the front.
variable "kismatic_version" {
  default = "v1.7.0"
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
  default     = "lon1"
}

variable image {
  description = "Name of the image to use"
  default     = "ubuntu-16-04-x64"
}

variable droplet_size {
  description = "Size of the droplets"
  default     = "4gb"
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
