Cookbook Name
=============

linux-kernel-dev

Description
===========

Cookbook that will install / configure a linux kernel dev environment on a linux VM.

Requirements
============

## Platform

Tested on the following platforms, but could very well work on others

* Debian (7.1+)
* Ubuntu (12.04+)
* CentOS (6.4+)

## Cookbooks

* apt
* yum
* build-essential

Attributes
==========

Attributes are under the `node['linux_kernel_dev']` namespace.

* `node['linux_kernel_dev']['??']` - source from which to install ruby

Recipes
=======

## default

Installs required packages and sets up the environment.  The repo is mounted from a local directory using vagrant shared folders so editing can happen locally rather than on the VM if desired.

Usage
=====

Add the `linux_kernel_dev` cookbook to the runlist.

License and Author
==================

- Author:: Chris Horton (<hortoncd@gmail.com>)
- Copyright:: 2016, Chris Horton

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
