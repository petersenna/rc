@initialize:python@
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end

p_dict = {}

@r1 exists@
identifier pf;
constant char[] c;
position p;
expression e;
@@
if(...) {
        ... when any
        \(pf@p(c, ...)\|pf@p(e, c, ...)\)
        ... when any
        return ...;
}

@script:python@
pf << r1.pf;
p << r1.p;
@@
if not p in p_dict.keys():
        p_dict[p] = True
	print pf + "," + csv_pos(p2)

