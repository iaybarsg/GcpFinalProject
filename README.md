Project Overview

It includes various GCP services like Compute Engine, Cloud SQL, and Cloud Storage to demonstrate a basic yet functional cloud infrastructure setup.

Architecture
The project consists of the following components:

Compute Engine: Hosts our application and serves as the main compute resource.
Cloud SQL: Manages our database requirements, providing a robust and scalable relational database service.
Cloud Storage: Used for storing application data and backups, ensuring durability and availability.

To deploy this project, follow these steps:

Set up GCP Project

Create a GCP Project: Log into the Google Cloud Console and create a new project.
Enable APIs: Make sure to enable the Compute Engine, Cloud SQL, and Cloud Storage APIs for your project.
Deploy Compute Engine Instance
Navigate to the Compute Engine service in the Cloud Console.

Set up Cloud SQL
Go to the Cloud SQL service in the Cloud Console.
Click "Create Instance" and choose the SQL service that I require (MySQL, PostgreSQL, etc.).
Configure my instance with a private IP and ensure it's in the same VPC as my Compute Engine instance.

Configure Cloud Storage
Head over to the Cloud Storage section in the Cloud Console.
Ensuring that I disable public access and enable versioning for the bucket.

Connecting Components
Use the internal IP to connect my Compute Engine instance with the Cloud SQL database.
Configure my application to use Cloud Storage for data that needs to be stored.
