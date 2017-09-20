[![Build Status](https://travis-ci.org/UMMISCO/kendrick.svg?branch=master)](https://travis-ci.org/UMMISCO/kendrick)
[![Build status](https://ci.appveyor.com/api/projects/status/0wy09lhcta0017ri?svg=true)](https://ci.appveyor.com/project/SergeStinckwich/kendrick)
[![Coverage Status](https://coveralls.io/repos/github/UMMISCO/kendrick/badge.svg?branch=master)](https://coveralls.io/github/UMMISCO/kendrick?branch=master)

[![Join the chat at https://gitter.im/UMMISCO/kendrick](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/UMMISCO/kendrick?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://raw.githubusercontent.com/UMMISCO/kendrick/master/LICENSE)


Kendrick: tools for simulating mathematical models of infectious disease. Classes of epidemic model include deterministic compartmental models, stochastic individual contact models, and individual-based network models.

Kendrick provide a Domain-Specific Language and a Simulation Plaform for mathematical epidemiology modeling. It helps epidemiologists craft custom analyses cheaply. It's based on [Pharo](http://www.pharo.org/) and it's open source under MIT.

All the development happens on SmalltalkHub at the moment: http://bit.ly/XrpsL2

Kendrick is based extensively on several tools of the meta-modeling platform [MOOSE](http://www.moosetechnology.org/) including [PetitParser](http://www.moosetechnology.org/tools/petitparser) and Roassal visualization engine.

Github is only used to store [issues](https://github.com/UMMISCO/Kendrick/issues) list.

## Citation

If using Kendrick for research, please cite our work as:
> BUI Thi Mai Anh, Mikal Ziane, Serge Stinckwich, HO Tuong Vinh, Benjamin Roche, Nick Papoulias (2016). *Separation of Concerns in Epidemiological Modelling*, Companion Proceedings of the 15th International Conference on Modularity, pages 196-200 URL: http://dl.acm.org/citation.cfm?id=2892699

## How to manually install Kendrick 0.48 from sources

* Download a Spur VM: https://ci.inria.fr/pharo/view/5.0-VM-Spur/job/PharoVM-spur32/
* Download the last dev MOOSE 6.1 on INRIA's CI server: https://ci.inria.fr/moose/job/moose-6.1/
* Load Kendrick: Open MOOSE 6.1 image with the Spur VM then right-click anywhere to open the main menu. Choose Playground to execute scripts. Paste the script below in Playground, select all then right-click and choose Do it to execute this.

```Smalltalk
Metacello new
    repository: 'http://smalltalkhub.com/mc/UMMISCO/Kendrick/main';
    configuration:'Kendrick';
    version: '0.48';
    load
````

## How to automagically install Kendrick 0.42 from sources

On systems with a bash cmd-line (this includes Linux, Mac and Windows with Cygwin and/or the Windows 10 Bash sub-system) 
you can compile Kendrick from sources using the following command:
```shell
wget -O- https://goo.gl/WUQxmp | bash
````

## How to download pre-compiled versions of Kendrick 0.42 for your platform

To download pre-compiled versions of Kendrick for your platform of choice, follow the links below:

* [Kendrick-0.42-Mac](https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/Kendrick-0.42-Mac.zip)
* [Kendrick-0.42-Linux](https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/Kendrick-0.42-Linux.zip)
* [Kendrick-0.42-Windows](https://gitlab.com/ird-ummisco-npapoylias/kendrick-extentions/raw/master/Kendrick-0.42-Windows.zip)

## How to invoke Kendrick

### DSL Editor
After compiling from source or downloading the pre-compiled versions of Kendrick, you can run the 
dedicated Kendrick editor (using the Kendrick DSL), by invoking:
```shell
./KendrickUI
```

### Development Environmement

To run Kendrick with the full Pharo environment (allowing to use both the DSL and the Pharo API of Kendrick),
you can invoke:
```shell
./KendrickDevUI
```

### Using External Tools

Finally, to use Kendrick with an editor of your choice, you only need to navigate in the Sources directory
of your installation, edit / add files for your project and invoke the non-interactive kendric executable 
as follows (example for simulating and visualizing the results described in Influenza1Viz.kendrick):
```shell
./Kendrick Sources/Projects/Infuenza/Visualization/Influenza1Viz.kendrick
```

In the above example you can then find the results in: 
```shell
Sources/Projects/Infuenza/Output/Influenza1Viz.png
```
