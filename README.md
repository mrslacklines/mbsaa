# Microblog Sentiment Analysis

The whole application is built as a set of microservices enclosed in interlinked docker containers.

## Installation

You will need git, docker and docker-compose at the very minimum to install MBSAA.
The installation is fully automatic and requires:

* Pulling the github repo `git clone git@github.com:user/repo.git`
* Building all the Docker containers with `docker-compose build`

To start the application simply
```docker-compose up```

### Configuration

The configuration is kept in the `config.yml` file. Please feel free to modify it to suit your needs. The provided file is to serve as an example only -- not a production-ready configuration.

### Gazetteer
You will need to populate the Gazetteer database manually once the containers were successfully built. In order to do that you will need to connect to a running docker container:

* Get the mbsaa container ID by running `docker ps` (e.g. b6387b38d346).
* Connect to the container with: `docker exec -it [container-id] bash`
* Once you were successfully logged in go to `/opt/mbsaa/res/gazetteer` and run `./load_db.sh cities15000.txt rethinkdb:28015`

## Agregating posts

The posts are aggregated by crawling the websites (Tripadvisor and the Skyscraper forum) as well as by listening to the live stream (Twitter).

### Spiders

To start spiders simply issue GET requests to:

`http://127.0.0.1:5000/start_spider/<spider_name>`

The available spider names are:

`tripadvisor`
and
`skyscraper`

To stop all current crawls issue a GET request to:

`http://127.0.0.1:5000/stop_crawls/`

The spiders keep track of the visited urls and scraped posts. In order to resume a spider issue a GET request to:

`127.0.0.1:5000/resume_spider/<spider_name>`

### Listener

To start listening to the Twitter stream simply go:

`http://127.0.0.1:5000/twitter/start_listening/`

and to stop:

`http://127.0.0.1:5000/twitter/stop_listening/`


## Getting the results

You can easily get the overall results by GETting:

`http://127.0.0.1:5000/get_stats/`

or the results for a specific city (keyword) with:

`http://127.0.0.1:5000/get_stats/<city>`

