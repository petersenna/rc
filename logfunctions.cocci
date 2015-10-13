@initialize:python@
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end
p_dict = {}

@r1 exists@
identifier log_func;
constant char[] c;
expression e1, e2;
position p;
@@
if(...) {
        ... when any
(
        log_func@p(c, ...);
|
        log_func@p(e1, c, ...);
|
        log_func@p(e1, e2, c, ...);
)
        ... when any
        return ...;
}

@script:python@
log_func << r1.log_func;
p << r1.p;
@@
if not csv_pos(p) in p_dict:
        p_dict[csv_pos(p)] = True
	print "rest," + log_func + "," + csv_pos(p)

@r2 exists@
identifier log_func;
constant char[] c;
expression e1, e2;
position p;
@@
if(...) {
        ... when any
(
        log_func@p(c, ...)
|
        log_func@p(e1, c, ...)
|
        log_func@p(e1, e2, c, ...)
)
        ... when any
        return ...;
}

@script:python@
log_func << r2.log_func;
p << r2.p;
@@
if not csv_pos(p) in p_dict:
        p_dict[csv_pos(p)] = True
	print "perm," + log_func + "," + csv_pos(p)

@r3 exists@
identifier log_func;
constant char[] c;
expression e1, e2;
position p;
@@
if(...) {
        ... when any
(
        return log_func@p(c, ...);
|
        return log_func@p(e1, c, ...);
|
        return log_func@p(e1, e2, c, ...);
)
}

@script:python@
log_func << r3.log_func;
p << r3.p;
@@
if not csv_pos(p) in p_dict:
        p_dict[csv_pos(p)] = True
	print "perm_ret," + log_func + "," + csv_pos(p)
