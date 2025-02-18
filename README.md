# PostgreSQL - Development Database Setup

This repository contains the Docker Compose configuration for setting up a local PostgreSQL database for development.

## Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running.

## Setup

1.  **Clone the repository:**

    ```bash
    git clone https://github.com/naierii/reian-postgresql-docker-sandbox.git
    cd <your project_directory>
    ```

2.  **Create a `.env` file:**

    Copy the `.env.example` file to a new file named `.env`:

    ```bash
    cp .env.example .env
    ```

    Edit the `.env` file and fill in the actual values for your database credentials:

    ```
    POSTGRES_USER=your_db_user  # Replace with your desired username
    POSTGRES_PASSWORD=your_db_password # Replace with a strong password
    POSTGRES_DB=your_db_name    # Replace with your desired database name
    PGADMIN_DEFAULT_EMAIL=your_pgadmin_email # Replace with your email
    PGADMIN_DEFAULT_PASSWORD=your_pgadmin_password # Choose a strong password
    ```

    **Do NOT commit the .env file to Git!**

3.  **Start the Database and pgAdmin:**

    ```bash
    docker-compose up -d
    ```

    This will download the necessary Docker images (if you haven't already) and start the PostgreSQL and pgAdmin containers.

4.  **Access pgAdmin:**

    Open your web browser and go to [http://localhost:5050](http://localhost:5050). Log in with the credentials you set in your `.env` file.

5.  **Connect pgAdmin to PostgreSQL:**

    - Right click on "Servers" -> "Register" -> "Server"
    - General Tab:
      - Name: `Local PostgreSQL` (or any name you prefer)
    - Connection Tab:
      - Host name/address: `postgres`
      - Port: `5432`
      - Maintenance Database: `your_db_name` (replace with your database)
      - Username: `your_db_user` (replace with your username)
      - Password: `your_db_password` (replace with your password)
    - Save

## Stopping the Database

To stop the database and pgAdmin containers:

```bash
docker-compose down
```

To stop the database and pgAdmin containers, and remove volumes:

```bash
docker-compose down -v
```

## Troubleshooting

- (To add common issues and their solution here).
