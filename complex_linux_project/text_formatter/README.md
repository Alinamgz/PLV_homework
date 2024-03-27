### building *libconvert.so* HowTo:
---
`make` - build *libconvert.so* shared library **and** *main* app for testing

`make lib` - build library

`make test` - buiild testing app

`make install` -  **NB:** requires sudo. Builds library and puts it in */usr/lib*  .

`make uninstall` - **NB:** requires sudo. Removes: \
	 - library from */usr/lib* \
	 - test binary \
	 - lib file from dir it was built in \
	 - *obj* dir with all *\*.o* files \
	 
	
`make reinstal` - make uninstall **+** make install

`make retest` - make reinstall **+** make test

`make clean` - removes *obj* dir with *\*.o*  files in it

`make clean-all` - removes: \
	 - test binary \
	 - lib file from dir it was built in \
	 - *obj* dir with all *\*.o* files

---
