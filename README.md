# docker-odtone

This is a Docker container within which the [ODTONE](http://atnog.github.io/ODTONE/) project
 is built and can be tested with the local demo.

The container is based on Ubuntu 14.04 and the master branch of ODTONE, which has
been modified slightly to allow it to be built with the latest version of the [Boost C++ libraries 1.61.0](http://www.boost.org/users/history/version_1_61_0.html)

## Getting Started

Clone this repo

```
git clone https://github.com/miguelpdl/docker-odtone.git

```

Then initialise the subproject(s) within this repo

```
git submodule update --init
```

In a docker environment build the ODTONE docker image (depends on your system having 'make' tools installed)

```
make build
```

Now you can run the docker container with the tool provided

```
./tools/rundocker.sh
```

Once the container is up and running you can shell into it with

```
docker exec -it odtone-80221 bash
```

This should drop you into a shell at the directory

```
/tmp/odtone-80221
```

Goto the 'src' directory and run the build command. This should download the correct version of Boost (1.61.0) install its libraries and also then build ODTONE.

```
./build_boost_odtone.sh
```
Once this is complete there should be 3 applications and 3 configuration flies in the "dist" folder

```
link_sap  
link_sap.conf  
mih_usr  
mih_usr.conf  
odtone-mihf  
odtone.conf
```

##Running the ODTONE Local demo
The [ODTINE local demo as outlined on the ODTONE getting started page](http://atnog.github.io/ODTONE/documentation/odtone/getStart.html#odtone.getStart.local_demo) can now be followed.

Open up 3 seperate terminals

Terminal 1:
This is the MIHF
```
./dist/odtone-mihf --conf.file dist/odtone.conf
```

Terminal 2:
Change the 'dist/link_sap.conf' configuration file to your machines setting, as in change the "Link SAP interface technology" and "Link SAP interface address" which is really the MAC address of the interface being monitored. Then run the link_sap.

```
./dist/link_sap --conf.file dist/link_sap.conf
```

Terminal 3:
Finally run a MIH user who will be waiting to hear about events
```
./dist/mih_usr --conf.file dist/mih_usr.conf --dest mihf1
```

Finally cause an event to happen on the Link SAP interface address being monitored.  
