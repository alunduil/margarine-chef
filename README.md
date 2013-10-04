margarine Cookbook
==================

This cookbook is used to deploy margarine on a system or set of systems.

Requirements
------------

- Chef 11.6.0+
- Ohai 6.18.0+

### Platforms

The following platforms are tested:

- Ubuntu 12.04

The following platforms are known to work:

- N/A

Other platforms may or may not work as intended or desired.

### Cookbook Dependencies

The following cookbooks are dependencies and required for this cookbook to
function:

- python

The following cookbooks are suggested but not required for the cookbook's basic
functionality:

- N/A

See __USAGE__ below for more information.

Attributes
----------

The following attributes affect the behaviour of the deployment of margarine.
The commonly changed attributes are listed first followed by less commonly
modified attributes.

* `node['margarine']['service']['provider']` - Sets the service mechanism used
  to run the flask portion of margarine.  Default: uwsgi.
* `node['margarine']['service']['hostname']` - Sets the hostname to bind the
  service provider to.  Default: localhost.
* `node['margarine']['service']['port']` - Sets the port to bind the service
  provider to.  Default: 5000.
* `node['margarine']['service']['proxy']` - Sets the proxy service to host the
  WSGI application behind.  Default: None.

The service attributes have a bit of overlap and the following attributes apply
to the datastore, email, token_store and queue sections.  Thus the following
attributes should have SERVICE replaced with one of the aforementioned sections
(i.e. `node['margarine']['datastore']['type']` instead of 
`node['margarine'][SERVICE]['type']`.

* `node['margarine'][SERVICE]['type']` - Sets the type of service used for the
  particular component of margarine.  Defaults:
  * datastore - mongodb
  * email - smtp
  * token_store - redis
  * queue - amqp
* `node['margarine'][SERVICE]['username']` - Sets the username for the service.
* `node['margarine'][SERVICE]['password']` - Sets the password for the service.
* `node['margarine'][SERVICE]['hostname']` - Sets the hostname to connect to
  for the service.  Default: localhost
* `node['margarine'][SERVICE]['port']` - Sets the port to connect to for the
  service.

* `node['margarine']['datastore']['database']` - Sets the database to use for
  margarine's metadata.
* `node['margarine']['email']['from']` - Sets the FROM address for outgoing
  emails that margarine produces.  Default: no-reply@HOSTNAME.

Currently pyrax is used to connect to an object store and it's attributes
should be over-written in any production environment with the following
attributes:

* `node['margarine']['pyrax']['username'] - Sets the pyrax username.  Default:
  None.
* `node['margarine']['pyrax']['password'] - Sets the pyrax password (API key).
  Default: None.
* `node['margarine']['pyrax']['type'] - Sets the authentication or service type
  for pyrax.  Default: rackspace.

The last three common attributes set deployment specific information:

* `node['margarine']['urls']['tinge']` - Sets the URL that tinge (the frontend
  service) runs behind.  Default: http://HOSTNAME.
* `node['margarine']['urls']['blend']` - Sets the URL endpoint that blend (the
  API service) runs behind.  Default: http://api.HOSTNAME/v1/.
* `node['margarine']['security']['uuid']` - Sets the opaque value used in the
  HTTP Digest mechanism in margarine.  This should be set on an environment for
  maximum efficiency and allow requests to slide between hosts.  Default: None.

More attributes are available but not generally necessary for normal operation.
These attributes are defined in the attributes directory and should be reviewed
for any functionality that might be desirable if the above does not fill a
particular need.

Recipes
-------

This section outlines how to use the basic recipes in your environment.  The
recipes you find in the cookbook not listed here are functional but not
recommended for direct usage.

### default

Installs all three components of margarine on the target node by including the
component recipes.

### component recipes

The `margarine::tinge`, `margarine::blend`, and `margarine::spread` recipes are
the bread of margarine deployments.  The simplest use of margarine is to
configure the appropriate attributes from the above and add one of the
aforementioned component cookbooks to node or role run_lists.

These recipes include the three basic components of cconfiguration management:

- install (package)
- configure (template)
- service (service)

### install

Installs margarine based on the specified mechanism in 
``node['margarine']['install']['method']``.  By default, this does a source
installation and this will be changed later to a pip or package installation.

### configure

Sets up the configuration files and required directories for margarine.  The
following configuration files are created:

- margarine.ini
- logging.ini
- pyrax.ini

The logging configuration merges with loggers, handlers, and formatters (see
python's logging configuration documentation for more information) defined in
the following data_bags:

- margarine_loggers
- margarine_handlers
- margarine_formatters

If you would like to have margarine just use syslog mechanisms you can specify
that the default defined loggers be used by setting the following attribute to
true:

- ``node['margarine']['logging']['default']``

### service

Sets up the various services for the components of margarine installed on the
node.  This includes WSGI handlers and proxy services (i.e. nginx or apache)
that allow margarine to interact with the world as well.

Usage
-----

Use the recipes and attributes described above to configure margarine for a
particular environment.

Often, the only attributes requiring modification are the hostname attributes
for the various services and the url attributes.

A great example of configuring this cookbook for a particular environment can
be found in margarine itself under the chef directory and the associated
Vagrantfile.
