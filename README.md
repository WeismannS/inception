Sure! Here's the full content as a markdown file — you can copy and save it as `README.md`:

```markdown
# 🐳 Inception - 42 Network Project

## 🧠 Project Overview

**Inception** is a system administration project at 42 that challenges students to build a secure and modular web infrastructure using Docker and Docker Compose. You will learn to manage containers, configure web servers, handle databases, and enforce best practices in software deployment — all within a Linux virtual machine.

## 📦 Project Architecture

This infrastructure is composed of the following core services, each running in its own container:

- **NGINX** – A secure reverse proxy with TLSv1.2 or TLSv1.3 only.
- **WordPress** – Served using `php-fpm`, isolated from NGINX.
- **MariaDB** – A secure relational database for WordPress.
- **Docker Volumes** – To persist:
  - WordPress site files
  - WordPress database data
- **Docker Network** – To ensure clean inter-container communication.

> Each container is built from scratch using the **penultimate stable** version of Alpine or Debian. No prebuilt services (except base OS images) are allowed.

## 🔐 Security Requirements

- Only HTTPS via port **443** (TLSv1.2 or TLSv1.3)
- No insecure infinite loops like `tail -f`, `sleep`, or `while true`
- Passwords and sensitive data managed through `.env` (never committed)
- Custom admin username (not containing "admin" or variations)

## 🌐 Domain Configuration

Set your domain to:  
```

\<your\_login>.42.fr → points to your VM's local IP

````

For example:  
```bash
DOMAIN_NAME=wil.42.fr
````

## 🛠️ Setup & Usage

### Prerequisites

* Virtual Machine running a Linux distribution (Ubuntu recommended)
* Docker & Docker Compose installed
* `make`

### Steps

1. Clone this repository:

   ```bash
   git clone https://github.com/<your-login>/inception.git
   cd inception
   ```

2. Configure your `.env` file inside `srcs/`:

   ```env
   DOMAIN_NAME=your_login.42.fr
   MYSQL_ROOT_PASSWORD=your_secure_root_pw
   MYSQL_USER=wordpress_user
   MYSQL_PASSWORD=secure_password
   WORDPRESS_DB_NAME=wordpress
   WORDPRESS_ADMIN_USER=customadmin
   ...
   ```

3. Run the project:

   ```bash
   make
   ```

4. Open your browser and navigate to:

   ```
   https://<your_login>.42.fr
   ```

## 📁 Project Structure

```
inception/
├── Makefile
└── srcs/
    ├── .env
    ├── docker-compose.yml
    └── requirements/
        ├── mariadb/
        │   ├── Dockerfile
        │   └── ...
        ├── nginx/
        │   ├── Dockerfile
        │   └── ...
        ├── wordpress/
        │   ├── Dockerfile
        │   └── ...
        └── tools/
```

## ➕ Bonus Features (Optional)

If all mandatory requirements are perfectly met, you may implement:

* 🔁 **Redis** – Caching for WordPress
* 🌐 **Static Website** – A personal or portfolio site (non-PHP)
* 🔧 **Adminer** – Lightweight DB management UI
* 📂 **FTP Server** – For WordPress file volume access
* 🧩 **Custom Service** – Your own justified idea!

## 🚨 Evaluation Checklist

✅ Services are isolated
✅ No `latest` tags
✅ Proper use of `.env`
✅ Volumes persist data
✅ NGINX serves only via HTTPS
✅ Dockerfiles written from scratch
✅ Makefile builds the entire project
✅ Domain is correctly configured
✅ No infinite loops or insecure practices

## 📚 References

* [Docker Documentation](https://docs.docker.com/)
* [NGINX SSL Configuration](https://nginx.org/en/docs/http/configuring_https_servers.html)
* [WordPress + php-fpm Setup](https://developer.wordpress.org/)
* [MariaDB Docs](https://mariadb.org/documentation/)

```

Let me know if you'd like a downloadable version or if you want to personalize it with your login or repo name.
```
