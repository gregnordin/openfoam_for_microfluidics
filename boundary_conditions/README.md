# `parabolicVelocity` boundary condition

## Installation

Start with terminal (command line) session running from the Docker OpenFoam image.

`cd` into `boundary_conditions` (i.e., this directory) and execute `wmake` from the command line. This will install and make available the `parabolicVelocity` boundary condition in your Docker OpenFoam image. This must be done every time you open the Docker image, unless you make it an automatically run command when you open the image (how to do this is beyond the scope of these instructions).

## Usage

To use the boundary condition:

- Add `libs ("libparabolicVelocity.so");` as the last line in your `system/controlDict` file. See `pitzDailyParabolicInlet/system/controlDict` for an example.
- Properly use the boundary condition in the file `0/U`. See `pitzDailyParabolicInlet/0/U` for an example. 
  - Note that `n` is the surface normal direction of the inlet surface pointing in the direction of the desired flow. If `n` points into the simulation region, flow is into the region. If it points out of the simulation region, flow is out of the region.
  - `y` is the local y direction for the surface, i.e., the direction in the 2D plane of the simulation geometry of the inlet surface. The vectors `n` and `y` must be orthogonal and define a plane that is the same as the 2D plane of the simulation. 
  - `maxValue` is the peak velocity of that parabolic flow in units of meters per second.

## Example

See `pitzDailyParabolicInlet`. Run the case by `cd`'ing into the directory and executing `simpleFoam > log.simpleFoam`. Open in Parafoam by selecting `pitzDailyParabolicInlet.foam` from the `Open` menu item.
