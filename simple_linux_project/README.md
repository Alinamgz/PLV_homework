## To build and install this `greeting` simple linux project run:


``` 
$: autoreconf -i
```

`autoreconf` is an autotoolthat runs  `autoconf` and, when needed, `aclocal`, `autoheader`, `automake` etc to regenerate the GNU Build System files in specified
DIRECTORIES and their subdirectories (defaulting to `.`).    
By default, it only remakes those files that are older than their sources.  
Flag `-i` says to copy missing standard auxiliary files 


``` 
$: ./configure 
```
`configure` script will generate Makefile. You can run it as it is, or specify `--host=host-type`, `--build=build-type` and / or `--target=target-type`

``` 
$: make
 ```
`make` builds our `greeting` app. Now you can run app with `$: ./greeting`

``` 
$: [sudo] make install
 ```
**Note:** `make install` might require `sudo`.  
After running `$: [sudo] make install` you can run app with `$: greeting`

``` 
$: [sudo] make clear-all 
```
**Note:** `make clear-all` depends on `make uninstall` and it might require `sudo`
