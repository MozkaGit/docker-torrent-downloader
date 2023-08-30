# Docker torrent downloader</br>[![Docker build and release](https://github.com/MozkaGit/torrent-downloader/actions/workflows/registry.yml/badge.svg)](https://github.com/MozkaGit/torrent-downloader/actions/workflows/registry.yml)

This application allows you to download torrents from Yggtorrent and Nyaa.si using various APIs. You can run it with node.js or docker (recommended).

## Features

- Search from YGGTorrents
- Search from Nyaa.si
- Add torrent files from YGGTorrents
- Add magnet links from Nyaa.si
- Download torrents from Transmission

## Getting Started

The application requires a Transmission server and a Yggtorrent user account (if you want to download from Yggtorrent too). If you don't have an account, please create one.

The recommended way of running this application is by using Docker. A Docker image is available on [Docker Hub](https://hub.docker.com/r/mozkadocker/torrents) and installation instructions are detailed below.

This application can also be run natively with Node.js, see the detailed instructions below.


## Docker installation

### Run with Docker CLI

Here is an example of a cli command to run this application:

```
docker run -d --name torrents \
  -p 3000:3000 \
  --restart on-failure \
  -e YGG_USERNAME='your_username' \
  -e YGG_PASSWORD='your_password' \
  -v ./torrents/:/app/torrents/ \
  mozkadocker/torrents:main
```

### Run with Docker Compose

Here is an example of a docker-compose configuration:

```
version: '3.3'
services:
    torrents:
        container_name: torrents
        ports:
            - '3000:3000'
        restart: on-failure
        environment:
            - YGG_USERNAME=your_username
            - YGG_PASSWORD=your_password
        volumes:
            - './torrents/:/app/torrents/'
        image: 'mozkadocker/torrents:main'
```

### Usage

Regardless of which method you use to run your container, to interact with the application you'll need to use the endpoint api [detailed a little further down](https://github.com/MozkaGit/torrent-downloader#api-endpoints) in the documentation.

### Environment Variables

Tweak these environment variables to modify the config as needed:

- `YGG_BASE_URL`: The url of yggtorrent. Since they often change their domain name, this variable will undoubtedly be useful to you.

- `FLARESOLVER_URL`: The url of your FlareSolver instance. To avoid CloudFlare blocking.

- `YGG_USERNAME`: Your yggtorrent account username.

- `YGG_PASSWORD`: Your yggtorrent account password.

- `TRANSMISSION_HOST`: The address of your Transmission server WEB UI.

- `TRANSMISSION_PORT`: The port of your Transmission server WEB UI.

- `TRANSMISSION_USER`: Username of your Transmission server WEB UI.

- `TRANSMISSION_PASS`: Password of your Transmission server WEB UI.

## Node.js installation

This application has only been tested with Node 12.22.12 and 18.17.1.

### Configuration

1. Clone this repository: `git clone https://github.com/MozkaGit/torrent-downloader.git`
2. Navigate to the project directory: `cd torrent-downloader`
3. Install dependencies: `npm install`
4. Modify the settings in the `config.js` file as needed.

```
const config = {
  transmission: {
    host: 'transmissionHost',
    port: 9091,
  },
  ygg: {
    baseUrl: 'https://www3.yggtorrent.wtf',
    flareSolverUrl: 'http://localhost:8191',
    username: 'username',
    password: 'password',
  },
};

*

module.exports = config;
```
<sup>You will need to adapt the javascript code to point to the variables in the config.js file.</sup>

### Usage
1. Ensure you're in the project directory.
2. Start the application: `node torrent.js`
3. Use the API endpoints [detailed below](https://github.com/MozkaGit/torrent-downloader#api-endpoints) to use the downloader.

## API Endpoints
- `/ygg`: Performs a search on YGGTorrent and returns the results.
- `/nyaa`: Performs a search on Nyaa.si and returns the results.
- `/choice1`: Downloads a torrent file from YGGTorrent and adds it to Transmission.
- `/choice2`: Adds a Nyaa.si torrent via its magnet link to Transmission.

### Example

Perform a search : `http://{{transmissionHost}}:3000/nyaa?anime={{your_query}}`

![search](https://github.com/MozkaGit/torrent-downloader/assets/43102748/4158c390-95ce-4ec9-8c7e-5473da567629)

Download a torrent : `http://{{transmissionHost}}:3000/choice2?number={{your_number_query]]`

![download](https://github.com/MozkaGit/torrent-downloader/assets/43102748/afddca2d-da46-4bc4-b92d-c542ef6568f8)

You can use any method to interact with the Endpoints :

- With Postman
- With a simple browser search
- With a curl request
- With Apple Shortcuts
- and so on.

## Author
MozkaGit
