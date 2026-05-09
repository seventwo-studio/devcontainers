packer {
  required_plugins {
    tart = {
      version = ">= 1.14.0"
      source  = "github.com/cirruslabs/tart"
    }
  }
}

variable "macos_version" {
  type    = string
  default = "sequoia"
}

variable "tart_base_image" {
  type        = string
  default     = "ghcr.io/cirruslabs/macos-sequoia-xcode:latest"
  description = "Base Tart image to build from. Use a Cirrus Labs image with Xcode pre-installed, or 'ghcr.io/cirruslabs/macos-sequoia-vanilla:latest' for a minimal base."
}

variable "disk_size" {
  type        = number
  default     = 100
  description = "Disk size in GB for the VM image"
}

variable "vm_name" {
  type    = string
  default = "seventwo-macos-runner"
}

source "tart-cli" "macos-runner" {
  vm_base_name = var.tart_base_image
  vm_name      = "${var.vm_name}"
  cpu_count    = 4
  memory_gb    = 8
  disk_size_gb = var.disk_size
  ssh_username = "admin"
  ssh_password = "admin"
  ssh_timeout  = "120s"

  create_grace_time = "30s"
}

build {
  name = "macos-runner"

  sources = ["source.tart-cli.macos-runner"]

  // Upload provisioning scripts
  provisioner "file" {
    source      = "scripts/"
    destination = "/tmp/provision/"
  }

  // Run main provisioning script
  provisioner "shell" {
    inline = [
      "chmod +x /tmp/provision/*.sh",
      "/tmp/provision/provision.sh"
    ]
  }

  // Cleanup
  provisioner "shell" {
    inline = [
      "rm -rf /tmp/provision",
      "sudo purge",
      "sudo periodic daily weekly monthly"
    ]
  }
}
