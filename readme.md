# Luxion FlexLM Licenses Server Docker Image

**LEGAL NOTICES:**
*You must provide your own licenses, this only provides a way to host them for your workstation/render environment.*

Clone repo to a local directory and execute `docker build -t luxion-flexlm-docker:latest .` to build your docker image. I don't have licensing to upload this image, hence the instructions to build your own.

The service runs on port the default `27000`.

A mount volume is needed for `/var/luxion_flexlm`. In my following example launch command I'm mapping/binding to a local directory, `~/luxion-flexlm-license`. **This is important so that your licenses remain if your docker instance restarts or shuts down.**

**A consistent hostname is required for the licenses server, so be sure to set the hostname argument `--hostname=<hostname>`**

**Launch command**: `docker run -d -p 27000:27000 --name=<DockerInstanceName> --hostname=<server.fqdn.com> -v ~/luxion-flexlm-license:/var/luxion_flexlm luxion-flexlm-docker:latest`

**Use at your own risk, there are no guarantees on this!**