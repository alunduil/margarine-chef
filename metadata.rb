name "margarine"
version "1.0.0"
description "This tool adds features to an amalgamation of delicious, the social bookmarking application, and readability, the excellent web article renderer."
maintainer "Hart Hoover"
maintainer_email "hart.hoover@rackspace.com"

depends "python"
depends "apt"

supports "ubuntu"

recipe "margarine::default",
	"Installs and configures services that are common to each margarine service."

recipe "margarine::blend",
	"Installs the Blend service."

recipe "margarine::spread",
	"Installs the spread service."

recipe "margarine::tinge",
	"Installs the tinge service."

attribute "margarine/path",
  :display_name => "Deploy Directory",
  :description =>
    "The Margarine directory. Example: /srv/www",
  :required => "optional",
  :default => "/srv/www",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/pyrax_user",
  :display_name => "Rackspace Username",
  :description =>
    "The Username used to connect to your Rackspace account or Swift service.",
  :required => "optional",
  :default => "",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/pyrax_apikey",
  :display_name => "Rackspace API Key",
  :description =>
    "The API key used to connect to your Rackspace account or Swift service.",
  :required => "optional",
  :default => "",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/pyrax_region",
  :display_name => "Rackspace Datacenter",
  :description =>
    "The region used to connect to your Rackspace account or Swift service.",
  :required => "optional",
  :default => "ORD",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/queue_user",
  :display_name => "Message Queue Username",
  :description =>
    "The username used to connect to a RabbitMQ service.",
  :required => "optional",
  :default => "guest",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/queue_password",
  :display_name => "Message Queue Password",
  :description =>
    "The password used to connect to a RabbitMQ service.",
  :required => "optional",
  :default => "guest",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/queue_hostname",
  :display_name => "Message Queue Endpoint",
  :description =>
    "The endpoint used to connect to a RabbitMQ service. Example: mq1.margarine.com",
  :required => "optional",
  :default => "mq1.margarine.com",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/mongodb_user",
  :display_name => "MongoDB Username",
  :description =>
    "The username used to connect to a MongoDB service.",
  :required => "optional",
  :default => "guest",
  :recipes => [
    "margarine::default"
  ]


attribute "margarine/mongodb_password",
  :display_name => "MongoDB Password",
  :description =>
    "The password used to connect to a MongoDB service.",
  :required => "optional",
  :default => "guest",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/mongodb_connection_string",
  :display_name => "MongoDB Connection String",
  :description =>
    "The connection string used to connect to a MongoDB service.",
  :required => "optional",
  :default => "mongo.objectrocket.com:12345",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/mongodb_database",
  :display_name => "MongoDB Database",
  :description =>
    "The name of your MongoDB database.",
  :required => "optional",
  :default => "production",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/redis_url",
  :display_name => "Redis URL",
  :description =>
    "The URL of your Redis service.",
  :required => "optional",
  :default => "redis://redis.margarine.raxsavvy.com",
  :recipes => [
    "margarine::default"
  ]

attribute "margarine/blend/flask_debug",
  :display_name => "Debugging in Flask",
  :description =>
    "Whether or not you want Flask debug output.",
  :required => "optional",
  :default => "True",
  :recipes => [
    "margarine::blend"
  ]

attribute "margarine/blend/server_hostname",
  :display_name => "Web address for Margarine.",
  :description =>
    "Web address for Margarine.",
  :required => "optional",
  :default => "http://margarine.raxsavvy.com",
  :recipes => [
    "margarine::blend"
  ]

attribute "margarine/spread/mailgun_email",
  :display_name => "Mailgun Email",
  :description =>
    "Email address for your Mailgun account.",
  :required => "optional",
  :default => "user@mailgun.com",
  :recipes => [
    "margarine::spread"
  ]

attribute "margarine/spread/mailgun_password",
  :display_name => "Mailgun Password",
  :description =>
    "Password for your Mailgun account.",
  :required => "optional",
  :default => "",
  :recipes => [
    "margarine::spread"
  ]

attribute "margarine/spread/from_email",
  :display_name => "'From' Header Email address",
  :description =>
    "Email address to display for sending messages.",
  :required => "optional",
  :default => "",
  :recipes => [
    "margarine::spread"
  ]

attribute "margarine/spread/api_server_hostname",
  :display_name => "API Server Hostname",
  :description =>
    "URL of your API service.",
  :required => "optional",
  :default => "api.margarine.raxsavvy.com",
  :recipes => [
    "margarine::spread"
  ]

attribute "margarine/tinge/endpoint",
  :display_name => "API Endpoint",
  :description =>
    "API Endpoint for Tinge",
  :required => "optional",
  :default => "http://api.margarine.raxsavvy.com/v1/",
  :recipes => [
    "margarine::tinge"
  ]