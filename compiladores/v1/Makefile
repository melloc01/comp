#@<Makefile>::

exec=expr

include=-I.

optflags=-g

CFLAGS=$(optflags) $(directives) $(include) 

objs=main.o parser.o lexer.o

$(exec): $(objs)
	$(CC) $(objs) -o $(exec)
clean:
	$(RM) *.o

mostlyclean: clean
	$(RM) *~ $(exec)
