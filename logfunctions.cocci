@initialize:python@
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end

p_dict = {}

@r1 exists@
identifier pf;
constant char[] c;
position p1, p2;
@@
if@p1(...) {
        ... when any
        pf@p2(c, ...)
        ... when any
        return ...;
}

@script:python@
pf << r1.pf;
p1 << r1.p1;
p2 << r1.p2;
@@
if not p2 in p_dict.keys() and p1[0].line != p2[0].line:
        p_dict[p2] = True
	print pf + "," + csv_pos(p2)

