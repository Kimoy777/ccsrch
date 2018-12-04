Usage: /Users/beyondphotographs/Downloads/ccsrch-1.0.8-osx_intel 3/ccsrch <options> <start path>
  where <options> are:
    -b		   Add the byte offset into the file of the number
    <p>Generic search for credit card data starting in current directory with output to screen:</p>
    
    -e		   Include the Modify Access and Create times in terms 
		   of seconds since the epoch
    <p><code>ccsrch ./</code></p>
    -f		   Only print the filename w/ potential PAN data
    <p>Generic search for credit card data starting in c:\storage with output to mycard.log:</p>
    -j		   Include the Modify Access and Create times in terms 
		   of normal date/time
    <p><code>ccsrch -o mycard.log c:\storage</code></p>
    -o <filename>  Output the data to the file <filename> vs. standard out
    
    -t <1 or 2>	   Check if the pattern follows either a Track 1 
		   or 2 format
    <p>Search for credit card data and check for Track 2 data formats with output to screen:</p>
    -T		   Check for both Track 1 and Track 2 patterns
    <p><code>ccsrch -t 2 ./</code></p>
    <p>Search for credit card data and check for Track 2 data formats with output to file c.log:</p>
    -c		   Show a count of hits per file (only when using -o)
    `ccsrch -t 2 -o c.log ./`
    -s		   Show live status information (only when using -o)
    -l N	   Limits the number of results from a single file before going
		   on to the next file.
     Search for all track data types in ascii only files and ignore known test card numbers:
    -n <list>      File extensions to exclude (i.e .dll,.exe)
    `ccsrch -T -i ignore.list -a ./`
    -h		   Usage information
    
    
CC      = gcc
INCL    =
OBJS    = ccsrch.o
LIBSDIR	= -L./
LIBS	= 
PROGS	= ccsrch

#this hack is to support OSX
UNAME := $(shell uname)
ifeq ($(UNAME), Darwin)
  CFLAGS	=-O2
  LDFLAGS	=
else
  CFLAGS	=-O2
  LDFLAGS	=
endif

strict: CFLAGS += -pedantic -Wall -Werror

all:	${PROGS}

ccsrch:	${OBJS}
	${CC} ${CFLAGS} ${INCL} ${LDFLAGS} ${OBJS} ${LIBSDIR} ${LIBS} -o ${PROGS}

strict:	${PROGS}

clean:
	rm -f core *.core ${PROGS} ${OBJS}

.c.o:
	${CC} ${CFLAGS} ${INCL} -c $<

install:
	cp ccsrch /usr/local/bin/
	chmod 4755 /usr/local/bin/ccsrch

