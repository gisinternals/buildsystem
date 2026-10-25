# Apache/MS4W future work

The `builds-ms-c2` prototype also builds and deploys an Apache/MS4W serving
stack. That work is intentionally outside this buildsystem upgrade. No Apache
service installation, MS4W directory assembly, PHP runtime deployment, web
configuration, or production-site migration is performed by this repository.

A separate project may later evaluate and port the relevant pieces, including:

- Apache HTTP Server, APR/APR-util, mod_fcgid, PHP and PHP MapScript;
- MapCache Apache/FastCGI integration and server configuration;
- TinyOWS and any additional command-line or database utilities;
- MS4W directory layout, configuration templates, certificates, service
  registration, upgrade/rollback, and deployment validation;
- the reduced or altered dependency/feature choices that are specific to an
  MS4W runtime rather than the full GISInternals SDK.

That project must define its own supported architectures, security model,
licensing review, service account, deployment destinations, and rollback plan.
It must not replace the full GISInternals feature set or change the existing
daily GDAL/MapServer package workflow implicitly.

