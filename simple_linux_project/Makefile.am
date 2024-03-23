AUTOMAKE_OPTIONS = foreign
bin_PROGRAMS = greeting

SUBDIR = inc src
greeting_SOURCES = src/main.c src/greeting.c inc/greeting

clean-all: uninstall
	find . -name 'config*' -not -name '*.ac' | xargs rm -rf     # remove all config* files and dirs except config*.ac
	find . -name 'Makefile*' -not -name '*.am' | xargs rm -rf # remove all Makefile* files     except Makefile*.am
	rm -rf src/.deps **/.dirstamp .dirstamp
	rm -rf aclocal.m4 autom4te.cache
	rm -f **/*.o
	rm -f greeting
 
