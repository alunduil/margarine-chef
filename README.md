margarine Cookbook
==================

This cookbook is used to deploy margarine on a system or set of systems. This cookbook expects to you to override a number of it's settings a may not work "out of the box".

Requirements
------------

- Chef 11.6.0+
- Ohai 6.18.0+

### Platforms

The following platforms are tested:

- Ubuntu 12.04, 14.04
- Debian 7.4

Other platforms may or may not work as intended or desired but probably not.

### Cookbook Dependencies

The following cookbooks are dependencies and required for this cookbook to
function:

- python
- git
- build-essential

Attributes
----------

The following attributes affect the behaviour of the deployment of margarine.
The commonly changed attributes are listed first followed by less commonly
modified attributes.
* `node['margarine']['components']` - Sets which componentns components to install/enable on a specific node. Defaults to both `blend` and `spread`.
* `node['margarine']['service']['provider']` - Sets the service mechanism used
  to run the flask portion of margarine.  Default: uwsgi.
* `node['margarine']['service']['hostname']` - Sets the hostname to bind the
  service provider to.  Default: localhost.
* `node['margarine']['service']['port']` - Sets the port to bind the service
  provider to.  Default: 5000.
* `node['margarine']['service']['proxy']` - Sets the proxy service to host the
  WSGI application behind.  Default: None.

The following describe the install methods available for margarine:
*`['margarine']['install']['method']` - Currently only `pip` is supported
*`['margarine']['install']['commit']` - branch, ref or tag to pull. defaults to `master`
*`['margarine']['install']['repository']` - git repo location

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

Includes the necessary recipes to install, configure and start the the specific service.

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

Creates the margarine user/group. Will also include the the install type recipe which is currently `install_pip`.

### install_pip

Includes required recipes to set up margarine directly from git via `python_pip`. Installs margarine from `node['margarine']['install']['repository']`

### configure

Sets up the configuration files and required directories for margarine.  The
following configuration files are created:

- margarine.ini
- logging.ini (via include recipe `configure_logging`)

The logging configuration has been updated to read from the node attributes and
will merge with the defaults appropriately (or be overwritten appropriately as
well).

### service

Sets up the various services based on the `node['margarine']['components']` array. The init files are dropped in (`/etc/init` or `/etc/init.d/` respectively) for the components of margarine installed on the node. This will also start the service(s).

Usage
-----

Use the recipes and attributes described above to configure margarine for a
particular environment.

Often, the only attributes requiring modification are the hostname attributes
for the various services and the url attributes.

A great example of configuring this cookbook for a particular environment can
be found in margarine itself under the chef directory and the associated
Vagrantfile.
