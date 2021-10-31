# Purei
Is a web player for youtube video. The owner of this project usually use this player to play music/playlists on Youtube.

The name Purei came from the Japanese pronunciation of "play".

## Usage
NOTE: Allow auto play on your browser for better experiences(maybe).

### Visiting the webapp using your browser(currently unavailable)
I have not deployed the app yet. After I increase the quality of the webapp, I may consider deploy it somewhere with a URL. Stay tuned for more information.

### Deploying this yourself
#### With node.js or npm
I assume you choose this option because you know how [node.js](https://nodejs.org/en/) or [npm](https://www.npmjs.com/) works.
1. `cd app`
2. `npm start` or `node bin/www`
3. Go to your webapp in your browser, usually [localhost:3000](http://localhost:3000)

#### With Vagrant using VM
1. [Install vagrant](https://www.vagrantup.com/downloads)
2. `vagrant up`
3. Go to [localhost:8080](http://localhost:8080) in your browser.

#### With docker-compose
1. `docker-compose up`
2. Go to [localhost:3000](http://localhost:8080) in your browser.
