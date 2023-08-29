# Docker torrent downloader

## Description
This is a Node.js application that performs torrent-related operations using various APIs. You can run it with node or docker

## Prerequisites
- Transmission
- Docker

## Installation
1. Clone this repository: `git clone https://github.com/MozkaGit/torrent-downloader.git`
2. Navigate to the project directory: `cd torrent-downloader`
3. Install dependencies: `npm install`

## Configuration
- Modify the settings in the `config.js` file as needed.

## Usage

### Running Locally with Node.js
1. Ensure you're in the project directory.
2. Start the application: `node torrent.js`
3. Use the API endpoints detailed below to use the downloader.

### Using Docker
1. Build the Docker image: `docker build -t your-image-name .`
2. Launch a Docker container: `docker run --name container-name -d -p 3000:3000 your-image-name`
3. Use the API endpoints detailed below to use the downloader.

## API Endpoints
- `/ygg`: Performs a search on YGGTorrent and returns the results.
- `/nyaa`: Performs a search on Nyaa.si and returns the results.
- `/choice1`: Downloads a torrent from YGGTorrent and adds it to Transmission.
- `/choice2`: Adds a torrent via its magnet link to Transmission.
