IrrlichtHome = ./../irrlicht-1.9

CFLAGS = -std=c++11 -g3 -O0 -W -Wall -Wextra -Wshadow -Wdouble-promotion -Wno-missing-field-initializers -Wno-deprecated-declarations -pedantic
PPFLAGS = -isystem$(IrrlichtHome)/include -I./Source/ -D_REENTRANT
LDFLAGS = -L./Source/ -L$(IrrlichtHome)/lib/Linux -lIrrlicht -L/usr/X11R6/lib$(LIBSELECT) -lGL -lXxf86vm -lXext -lX11 -lXcursor

DESTPATH = ./Bin/

all: xeffects example1 example2 example3 example4 example5 example6

example%: ./Source/example%.o
	$(CXX) $(CFLAGS) $(PPFLAGS) ./$< ./Source/CShaderPre.o ./Source/EffectHandler.o $(LDFLAGS) -o $(DESTPATH)/$@
	
xeffects: ./Source/CShaderPre.o ./Source/EffectHandler.o 
	$(AR) -rs ./Source/libxeffects.a $^

./Source/%.o: ./Source/%.cpp
	$(CXX) $(CFLAGS) $(PPFLAGS) $< -c -o $@

clean:
	$(RM) ./Source/*.o
	$(RM) ./Source/libxeffects.a
