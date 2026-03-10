Nexus Repository Manager – Artifact Management Project
Project Overview

This project demonstrates how to implement a centralized artifact repository using Sonatype Nexus Repository Manager to manage application build artifacts for multiple development teams.

In many development environments, teams produce build artifacts such as NodeJS packages and Java JAR files. Without a centralized storage solution, these artifacts can become difficult to manage, version, share, and deploy.

To address this problem, this project sets up a Nexus repository server that allows multiple teams to store, publish, and retrieve their application artifacts from a single location. The system also demonstrates how artifacts can be retrieved programmatically using the Nexus REST API and deployed automatically using a Bash script.

This project includes:

Nexus repository installation

npm repository configuration

Maven repository configuration

User access management for different teams

Publishing NodeJS and Java artifacts

Retrieving artifacts using the Nexus REST API

Automating deployment of the latest artifact
