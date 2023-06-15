# CGEM
Implementing CGEM in SCHISM

## Task instructions
- [Extract and plot timeseries data for CGEM](ExtractingTimeseries.md)

## Contents
- [cgem.nml](cgem.nml) - namelist for CGEM
- [write_initial_conditions.py](write_initial_conditions.py) - writes initial condition files
- [PYTHON](PYTHON.MD) - instructions for installing pyschism and pylibs
- env_schism.yml, pyschism.module, env_pylibs.yml, pylibs.module - conda environments and custom modules for pyschism and pylibs
- [COMPILE](COMPILE.MD) - instructions for compiling
- [schism](schism) - same directory structure as original schism code, but only contains directories and files that were changed due to CGEM
- [schism/src/CGEM](schism/src/CGEM) is the CGEM code
- [schism/src/Hydro](schism/src/Hydro) - slight modifications are made to schism_init and schism_step

## Preprocessing
Python script [write_initial_conditions.py](write_initial_conditions.py) writes initial condition files(GEN...ic) required to run SCHISM.  To use:
```
python write_initial_conditions.py
```
Requires the following libraries: pylib, f90nml, FileInput

This is not 'directory friendly' yet.  The grid file needs to be in the current working directory(CWD), as does cgem.nml.  Output is also written to CWD.
