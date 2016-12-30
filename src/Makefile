all: refill

refill: main.c parse.tab.c lex.yy.c
	cc -o refill main.c parse.tab.c lex.yy.c

lex.yy.c: refill.l
	flex refill.l

parse.tab.c: refill.y
	bison -d -g -v -d -o parse.tab.c refill.y

clean:
	rm refill lex.yy.c parse.tab.c parse.tab.h
