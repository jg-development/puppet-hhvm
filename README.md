puppet-hhvm
===========

####Table of Contents

1. [Overview](#overview)
2. [Usage - Configuration options and additional functionality](#usage)

##Overview

The mysql module installs, configures, and manages the MySQL service.

##Module Description

The hhvm module manages the installation of the hhvm repo from facebook.
It installs the repo hhvm or hhvm-nightly and the hhvm-fastgci


##Usage

```puppet
class { 'hhvm':
    nightly => true
}
```