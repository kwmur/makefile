#############################################################################
# Makefile for building: makefile
# Author:      kwmur
# Last Change: 07-Dec-2013.
# Project:     makefile
#############################################################################

####### Files

TARGET    =	my_project
HEADERS   =	
SOURCES   =	$(TARGET).c get_data.c print_hist.c
OBJECTS   =	$(SOURCES:.c=.o)
DIST      =	

####### Compiler, tools and options

CC        =	gcc
CXX       =	g++
LINK      =	$(CC)
LEX       =	flex
YACC      =	byacc

SITEDIR   =
INCS      =	$(SITEDIR)/include
#CINCS     =	-I$(INCS)
#CXXINCS   =	\
#		-I$(INCS)

CFLAGS    =	-Wall
CXXFLAGS  =	-pipe -O2 
CPPFLAGS  =
LFLAGS    =
LEXFLAGS  =
YACCFLAGS =	-d

#LIBDIR    =     -L \
#		$(SITEDIR)/lib \

LIBS       =	

ZIP             =	zip -r -9
COPY_FILE       =	cp
COPY_DIR        =	cp -r
DEL_FILE        =	rm -f
DEL_DIR         =	rmdir
MOVE            =	mv
CHK_DIR_EXISTS  =	if not exist
MKDIR           =	mkdir
INSTALL_FILE    =	$(COPY_FILE)
INSTALL_DIR     =	$(COPY_DIR)
DEPEND          =	$(CC) -MM
EXEEXT          =	.exe

####### Implicit rules

.SUFFIXES: .cpp .cc .cxx .C .c

.cpp.o:
	$(CXX)	-c	$(CPPFLAGS)  $(CXXFLAGS)  $(CXXINCS)  $<

.cc.o:
	$(CXX)	-c	$(CPPFLAGS)  $(CXXFLAGS)  $(CXXINCS)  $<

.cxx.o:
	$(CXX)	-c	$(CPPFLAGS)  $(CXXFLAGS)  $(CXXINCS)  $<

.C.o:
	$(CXX)	-c	$(CPPFLAGS)  $(CXXFLAGS)  $(CXXINCS)  $<

.c.o:
	$(CC)	-c	$(CFLAGS)  $(CINCS)  $<

####### Build rules

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(LINK)	-o $@	$(OBJECTS)	$(LIBDIR)  $(LFLAGS)  $(LIBS)


dist:
	$(ZIP) $(TARGET).zip $(SOURCES) $(DIST)

clean: 
	-$(DEL_FILE) $(OBJECTS)

distclean: clean
	-$(DEL_FILE) $(TARGET)$(EXEEXT)

####### Compile

depend:
	$(DEPEND) $(SOURCES) > .deps

-include .deps

####### Install

install:  

uninstall:  
