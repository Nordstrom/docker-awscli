# docker-awscli

Nordstrom's Ubuntu-derived  AWS CLI image. This repository defines an image with a recent release of the `awscli`, as well as a deployable runtime environment for Python applications and services (specifically, Python version 2.7).

We intend periodically to publish an updated image tag that will contain the most recent release of the AWS CLI at the time of publication. The images published will be tagged with multiple tags in decreasing specifity; the most recent release of `awscli` as of writing is `1.11.170`, and it is published as three tags:

1. `quay.io/nordstrom/awscli:1.11.170`
1. `quay.io/nordstrom/awscli:1.11`
1. `quay.io/nordstrom/awscli:1`

This allows the image consumer to control the granularity of version to which they are exposed. In general, the patch releases (e.g., `1.11.170`) will not be updated when issues are discovered (e.g., CVEs), while the minor (`1.11`) and major (`1`) tags will be replaced with each image published within their scope[1].

So far we are only targeting Python 2.7.

[1] Yes, this means that we overwrite the tag value when updating. Maintaining fine-grained versioning in the `FROM` of a Dockerfile is a significant hassle (which would be necessary if we used immutable tags), so mutating the tag value is a compromise.
