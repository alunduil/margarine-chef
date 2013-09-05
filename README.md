#Chef Cookbook for Margarine

This cookbook is used to deploy the Margarine applications Blend, Spread and Tinge

##Attributes you need to replace with your values

`attributes/default.rb`

```
default['margarine']['pyrax_user'] = "RAX_USER"
default['margarine']['pyrax_apikey'] = "RAX_API_KEY"
default['margarine']['pyrax_region'] = "RAX_REGION"
default['margarine']['mongodb_connection_string'] = "mongo.objectrocket.com:12345"
```

`attributes/spread.rb`

```
default['margarine']['spread']['mailgun_email'] = "MAILGUN_EMAIL"
default['margarine']['spread']['mailgun_password'] = "MAILGUN_PASSWORD"
default['margarine']['spread']['from_email'] = "FROM@DOMAIN.COM"
```

These can be passed in your chef.json or set in the attributes files.

```
chef.json = {
  :margarine => {
    :path => "/srv/www",
    :pyrax_user => "RAX_USERNAME",
    :pyrax_apikey => "RAX_APIKEY",
    :pyrax_region => "RAX_REGION",
    :queue_user => "guest",
    :queue_password => "guest",
    :queue_hostname => "MQ.DOMAIN.COM",
    :mongodb_user => "MONGO_USER",
    :mongodb_password => "PASSWORD",
    :mongodb_connection_string => "HOST:PORT",
    :mongodb_database => "production",
    :redis_url => "redis://HOSTNAME",
      :tinge => {
        :endpoint => "http://HOSTNAME/v1"
      }
  },
  }
```