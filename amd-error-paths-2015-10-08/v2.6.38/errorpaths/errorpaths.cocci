@initialize:python@
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end

@r1@
constant C;
position p1, p2;
@@
if(...)@p1 {
	...
	return@p2 \(-C			\|
		NULL			\|
		false			\|
		ERR_CAST(...)		\|
		ERR_PTR(...)		\|
		PTR_ERR_OR_ZERO(...)	\);
}

@script:python@
p1 << r1.p1;
p2 << r1.p2;
@@
print "r1," + csv_pos(p2)

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
print "r2," + csv_pos(p2)

