* 1.2.4
  - Fixed data_path consistency, if you're using `['nsq']['data_path']` in production
    to set the nsqd data_path, please update to `['nsq']['nsqd']['data_path']`.
* 1.2.3 - Added support for missing nsqd options
* 1.2.2 - Added support for customizing the system users used to run nsq services
* 1.2.1 - Fixed bug in nsqlookupd upstart template when default attributes used
* 1.1.3 - Fixed bug where `only_if` failed to execute due to quoting
* 1.1.2 - Added support for the `to_nsq` utility when installing 0.2.30 and above.
* 1.0.0 - Initial Release
