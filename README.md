#tmutil

##Overview
The tmutil module allows you to manage Time Machine on remote hosts. Connect remote computers to your Time Machine server, using OS X Server and Time Machine Server.

##Usage
Use it like this (Assumes:

```puppet
class { 'tmutil':
  user     => 'TestUser',
  password => 'P@ssword',
  server   => 'xserve.exammple.com',
  share    => 'TimeMachines',
}
```

If you would like to exclude something from a Time Machine backup:

```puppet
tmutil::exclude { '/Applications': }
```


Support
-------

Please log tickets and issues at our [Projects site](https://github.com/nastechnology/nastechnology-tmutil/issues)
