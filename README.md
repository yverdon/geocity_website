# mapnv website

Code for a [Wagtail](https://wagtail.io/) +
[CodeRed CMS](https://www.coderedcorp.com/cms/) website.

## Requirements

| Software                                             |     Version | 
|:-----------------------------------------------------|------------:|
| [Docker Engine](https://docs.docker.com/engine/)     |  >= 20.10.2 |
| [Docker Compose](https://docs.docker.com/compose/)   |   >= 1.27.4 |


## Getting started

0. **Clone** the project:
   ```
   git clone https://github.com/yverdon/geocity_website.git && cd geocity_website
   ```

1. Prepare your environment and variables in your `.env` file.
   Use the provided `env.sample` file to get inspired.

   You will especially have to:

   * **Generate** a [`DJANGO_SECRET_KEY`](https://docs.djangoproject.com/en/3.1/ref/settings/#secret-key).    
   This can be done using [`get_random_secret_key`](https://github.com/django/django/blob/3c447b108ac70757001171f7a4791f493880bf5b/django/core/management/utils.py#L82).    
   E.g.:    
   ```
   python manage.py shell -c \
          "from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())"
   ```
   
   * **Create** a directory to store the media data wherever you want
   on your host machine.    
   Its path must be set in the `MEDIA_DIR` environment variable.    
  
   * **Create** a directory to store the database data wherever you want
   on your host machine.    
   Its path must be set in the `DBDATA_DIR` environment variable.  

2. **Build** and **run** the app:
   ```
   docker-compose up --build
   ```

3. Go to http://localhost:8082/ in your browser, or http://localhost:8082/admin/
   to log in the admin interface and get to work on your website content!

## Useful docker commands

| Command                                    | Description  | 
|:-------------------------------------------|:-------------|
| `docker-compose build`                     | Build the app.         |
| `docker-compose up`                        | Run the app in the forground.   |
| `docker-compose up --build`                | Build and run the app in the forground.     |
| `docker-compose stop`                      | Stop all the containers.     |
| `docker-compose down`                      | Stop and delete all the containers (but keep the data). |
| `docker-compose down -v`                   | Stop and delete all the containers and irreversibly delete the container data. |
| `docker-compose exec <service> <command>`  | Execute a command inside the running service. |

## Documentation links

* To customize the content, design, and features of the site see
  [CodeRed CMS](https://docs.coderedcorp.com/cms/).

* For deeper customization of backend code see
  [Wagtail](http://docs.wagtail.io/) and
  [Django](https://docs.djangoproject.com/).

* For HTML template design see [Bootstrap](https://getbootstrap.com/).

---

Made with ♥ using [Wagtail](https://wagtail.io/) +
[CodeRed CMS](https://www.coderedcorp.com/cms/)
