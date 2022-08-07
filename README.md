# Purpose

Document how to set up and run OpenFoam for microfluidics cases to solve for vector velocity field with `icoFoam` and time-dependent analyte diffusion using `scalarTransportFoam`. Note that the latter case depends on already having the vector velocity field, which is what `icoFoam` solves for.

I am creating this repository primarily to aid my students in learning how to set up and use OpenFoam for our 3D printed microfluidics research. An example of our work can be found in the following open-access paper, [Spatially and optically tailored 3D printing for highly miniaturized and integrated microfluidics](https://www.nature.com/articles/s41467-021-25788-w), published in Nature Communications in 2021.

# OpenFoam resources

- [Documentation](https://www.openfoam.com/documentation/overview).
- [User Guide](https://www.openfoam.com/documentation/user-guide).
    - Read the Overview in [Chapter 1](https://www.openfoam.com/documentation/user-guide/1-introduction) and the file structure in [Chapter 2](https://www.openfoam.com/documentation/user-guide/2-openfoam-cases). 
- [Tutorial Guide](https://www.openfoam.com/documentation/tutorial-guide).
- [CFD-Online OpenFoam sub-forum](https://www.cfd-online.com/Forums/openfoam/).


# Overall approach

- Bash command line.
    - Use bash commands and bash scripts to do almost everything for running OpenFoam simulations.
- Docker OpenFoam installation.
    - Use to run OpenFoam without having to do lengthy and possibly difficult install to run natively on your operating system.
    - Set up `parabolicVelocity` boundary condition to use for microfluidic velocity field simulations with `icoFoam`.
- Paraview.
    - Use for 3D visualization and analysis.
- Python and jupyter lab/notebook
    - Use for 2D visualization and analysis.
    - Line scans.
    - 2D planar scalar (concentration, pressure) and vector (velocity) field sampling.
- Directory and file organization.
    - Make it easy to use git to save base cases to a github repository without saving massive data files generated by actual run cases.


# Environment set up

- Make sure you have a bash shell (terminal app) on your computer.
    - On Mac OS I use [iTerm2](https://iterm2.com).
    - On Windows, you can use Windows Subsystem for Linux or git-bash, which is installed as part of [Git for Windows](https://gitforwindows.org).
    - On Linux, use the native terminal app.
- [Install Docker](https://docs.docker.com/get-docker/) for your operating system.
- Get OpenFoam docker image. I assume use of Openfoam v2112.
    - Mac OS M1/M2 processors:
        - Follow [openfoam-docker-arm](https://github.com/gerlero/openfoam-docker-arm)
    - Other OS's and Mac OS Intel processors:
        - [The Complete Guide to Docker & OpenFOAM](https://www.cfdengine.com/blog/how-to-install-openfoam-anywhere-with-docker/).
- Install `parabolicVelocity` boundary condition into Docker OpenFoam installation. See [boundary_conditions/README.md](boundary_conditions/README.md).
- Install [Paraview](https://www.paraview.org/).
- Install python/jupyterlab.
    - The simplest method is to just install [Anaconda python](https://www.anaconda.com/products/distribution). This is the method I recommend.
    - I've documented my preferred solution at [Mac OS python setup](https://github.com/gregnordin/python_setup_macbook), which may be more complicated than many people want to do, but it makes it easy for me to use virtual environments and keep my setup up-to-date without much hassle.
- Set up directory structure
    
    
# Create and run a 2D case

OpenFOAM by default only works with 3D mesh elements so to run a 2D case (say in x-y), you need to create a 3D mesh where the mesh is only 1 cell thick in the z dimension, and the boundary type is set to `empty` for the top and bottom boundaries (+z and -z surface normals).

## Summary of the overall process

- Create 3D geometry with Openscad and save as STL file.
- Sort STL file faces and create new STL file with only those parts needed by `cfMesh`'s `cartesian2DMesh`.
- Get velocity field.
    - Set up velocity field case.
    - Use `cartesian2DMesh` to create mesh from STL file.
    - Run `icoFoam`
- Get time-dependent diffusion scalar field.
    - Set up diffusion case.
    - Copy mesh from velocity field case.
    - Copy velocity field from velocity field case.
    - Run `scalarTransportFoam`.
    - Run `postProcess` to get line scans.
    - Run `postProcess` to get velocity field and analyte concentration over a plane. Do this for specific time step(s).
- Visualize with ParaView.
- Analyze files created by `postProcess` with python in jupyterlab.

## Example cases

### Straight channel

`cases/straight_channels/straight_channel_rotate_0deg` &rarr; See bash commands in `scripts/run_mesh_1_cases.txt`.

### Straight channel - rotated 45&deg;

`cases/straight_channels/straight_channel_rotate_45deg` See bash commands in `scripts/run_mesh_1_cases.txt`.


## Questions/issues as I assemble this repository:

- Include how to parallelize running a case locally?
- What case to use as an example, or use several cases?
    - Straight channel.
    - 45&deg; rotated channel.
    - Something more complicated?

# How to create and run a case on BYU supercomputer

**TBD**: *insert instructions here.*
