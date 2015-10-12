@initialize:python@
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end

p_dict = {}

@r1 exists@
identifier printer;
constant char[] c;
va_list args;
size_t size;
expression e;
position p;
@@
if(...) {
        ... when any
(
        printer@p(c, ...);
|
	printer@p(c, args);
|
        printer@p(e, c, ...);
|
        printer@p(e, c, args);
|
        printer@p(e, size, c, ...);
|
        printer@p(e, size, c, args);
)
        ... when any
        return ...;
}

@script:python@
printer << r1.printer;
p << r1.p;
@@
if not p in p_dict.keys():
        p_dict[p] = True
	print printer + "," + csv_pos(p)

