@r1@
identifier ret;
constant C;
position p1, p2;
@@
if(...)@p1 {
	...
	return@p2 \(-C			\|
		 NULL			\|
		 false			\|
		 ERR_CAST(ret)		\|
		 ERR_PTR(ret)		\|
		 PTR_ERR_OR_ZERO(ret)	\);
}

@script:python@
p1 << r1.p1;
p2 << r1.p2;
@@
print "r1: ", p1[0].file, p1[0].line, p2[0].line

@r2@
identifier ret;
expression e;
constant C;
position p1, p2;
@@
<+...
ret@p1 = -C;
... when != ret = e
return@p2 ret;
...+>

@script:python@
p1 << r2.p1;
p2 << r2.p2;
@@
print "r2: ", p1[0].file, p1[0].line, p2[0].line

