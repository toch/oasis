# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/en/1.0.0/)
and this project adheres to [Semantic Versioning](http://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added

* Remove URI of Blobs as it is calculated
* Fetch blob and redirect to their URI storage, i.e. a AWS S3 object
* Allow search data / blobs according to their format or tags
* Add badges for the changelog and the license in the `README.md` file.
* Use UUID as primary key for Blobs (breaking change, please drop db before)
* Add a Utils helper to check UUID format
* Add Blob entities to represent data and metadata
* Add a search endpoint on data
* Add project to Travis CI
* Add `README.md`, `LICENSE.md`, and `CHANGELOG.md` files.
* Boot strap the specs (Guard, Minitest reports, helpers)
* Init the repository
