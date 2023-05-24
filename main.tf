# Configure the GCP provider
provider "google" {
  project     = "<your-project-id>"
  region      = "<your-region>"
  credentials = file("<path-to-service-account-key>")
}

# Create a smaller instance for code development
resource "google_compute_instance" "code_development_instance" {
  name         = "code-development-instance"
  machine_type = "n1-standard-2"  # Specify the desired machine type for code development
  zone         = "<your-zone>"
  
  # Add any additional configuration options as needed
  # ...

  # Specify the boot disk image and size
  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-10"  # Change to your preferred image
      size  = 10  # Specify the desired disk size in GB
    }
  }

  # Add any additional block configuration as needed (networking, SSH keys, etc.)
  # ...
}

# Create a medium size instance with GPUs for machine learning training
resource "google_compute_instance" "ml_training_instance" {
  name         = "ml-training-instance"
  machine_type = "n1-standard-4"  # Specify the desired machine type for ML training
  zone         = "<your-zone>"
  
  # Add any additional configuration options as needed
  # ...

  # Specify the boot disk image and size
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1804-lts"  # Change to your preferred image
      size  = 50  # Specify the desired disk size in GB
    }
  }

  # Add GPU configuration
  guest_accelerator {
    type  = "nvidia-tesla-k80"  # Change to your desired GPU type
    count = 1  # Specify the number of GPUs required
  }

  # Add any additional block configuration as needed (networking, SSH keys, etc.)
  # ...
}

# Create a large instance for large scale data processing jobs
resource "google_compute_instance" "data_processing_instance" {
  name         = "data-processing-instance"
  machine_type = "n1-standard-8"  # Specify the desired machine type for data processing
  zone         = "<your-zone>"
  
  # Add any additional configuration options as needed
  # ...

  # Specify the boot disk image and size
  boot_disk {
    initialize_params {
      image = "centos-cloud/centos-8"  # Change to your preferred image
      size  = 100  # Specify the desired disk size in GB
    }
  }

  # Add any additional block configuration as needed (networking, SSH keys, etc.)
  # ...
}

