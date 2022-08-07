# Install `parabolicVelocity` boundary condition

Start with terminal (command line) session running from the Docker OpenFoam image.

`cd` into `boundary_conditions` (i.e., this directory) and execute `wmake` from the command line. This will install and make available the `parabolicVelocity` boundary condition in your Docker OpenFoam image. This must be done every time you open the Docker image, unless you make it an automatically run command when you open the image (how to do this is beyond the scope of these instructions).
