# Website for SIA Monta Digital

This repository contains the source code for the [Monta Digital website](http://www.montadigital.com). It is built using Jekyll, and deployed to an S3 bucket.

## Dependencies

The [*Jekyll* ruby gem](http://jekyllrb.com) is required to build the website.

Install *jekyll* with:

    gem install jekyll

A deploy script is included that requires the [*s3_website* ruby gem](https://github.com/laurilehmijoki/s3_website).

Install *s3\_website* with:

    gem install s3_website
    
## Configuration

There are two *s3_website.yml* files. The production configuration file is at the project root, and the test environment one is in the *preview-build-config/* folder. 

Both of these require S3 access tokens, CloudFront access tokens and S3 bucket names. These values are read from the environment (or the *.env* file, if it is present).

Copy the *.env-template* file to *.env*, and replace the placeholder values with real values.

## Deployment

A deploy script is included in the repository - *deploy.sh*.

It will build the website using Jekyll, and then push to S3 using s3_website.

Two caveats:

1. The deploy script will abort, if the working directory is not clean. That means it is not possible to deploy non-committed changes.
2. If the current branch is *master*, the script will deploy to the bucket identified by the S3_BUCKET_PROD environment variable.
  
    For any other branch, it will deploy to the bucket identified by the S3_BUCKET_DEMO environment variable.