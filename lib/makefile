
AFLAGS = /ml

all: s0.obj
	cd 80
	make
	cd ..
	cd 85
	make
	cd ..
	cd spc
	make
	cd ..

clean:
	del *.lib
	del *.obj
	del *.bak
	cd 80
	make clean
	cd ..
	cd 85
	make clean
	cd ..
	cd spc
	make clean
	cd ..
