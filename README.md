# Express.js Vagrant Template
This is the template repo for an [express.js](https://expressjs.com/) app, and uses [Vagrant](https://www.vagrantup.com/) for VM deployment testing, and [Chef-Solo](https://docs.chef.io/chef_solo/) for provision.  
This template is adapted from the template given in SFU CMPT470 course, by [Greg Baker](https://www2.cs.sfu.ca/~ggbaker/).

## Prerequirements:
* [Vagrant installed](https://www.vagrantup.com/downloads)

## Usage:
### Starting a new app:
1. `vagrant up`
2. `vagrant ssh`
3. `cd project & express --view=pug app`  

After that, when you add any dependencies, add them in the recipe(default.rb) too.

### Development:
1. `vagrant up` to boot up the VM.
2. `vagrant ssh` to connect to the VM.
3. `cd project/app`
4. `DEBUG=app:* npm start`. You may have to `sudo service expressjs_app stop` before this too.
5. View your app at [http://localhost:3000](http://localhost:3000).

### Deployment:
1. `vagrant up`
2. View your app at [http://localhost:8080](http://localhost:8080).

### Destroying:
* `vagrant destroy`