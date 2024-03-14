# Project Overview

This project is my final project of WTECH Cloud Engineering Program.

## Architecture

The project is built using the following GCP components:

- **Compute Engine**: Serves as the backbone by hosting our application and providing the main compute resource.
- **Cloud SQL**: Acts as the heart of our data management, offering a robust and scalable relational database service.
- **Cloud Storage**: Functions as the brain for data storage, utilized for storing application data and backups, ensuring both durability and availability.

## Deployment Steps

To get this project up and running, I briefly follow the outlined steps:

### Set up GCP Project

1. **Create a GCP Project**: I create a new project.
2. **Enable APIs**: I ensured the **Compute Engine**, **Cloud SQL**, and **Cloud Storage APIs** are enabled for my project.

### Deploy Compute Engine Instance

- Navigate to the **Compute Engine** service in the Cloud Console and set up my instance, choosing the appropriate machine type and region.

### Set up Cloud SQL

1. Access the **Cloud SQL** service in the Cloud Console.
2. Opt for "Create Instance" and select the desired SQL service PostgreSQL.
3. Ensure my instance is configured with a private IP and resides in the same VPC as the Compute Engine instance for seamless connectivity.

### Configure Cloud Storage

- Move to the **Cloud Storage** section in the Cloud Console, create a new bucket, making sure to disable public access and enable versioning for enhanced data integrity.

### Connecting Components

- Establish a connection between the Compute Engine instance and Cloud SQL database using the internal IP.
- Configure my application to leverage Cloud Storage for essential data storage needs.
