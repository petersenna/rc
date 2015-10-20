@initialize:python@
results_dir << virtual.results_dir;
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end

myset = set()
mydict = {}

fp = open(results_dir + "/../finalize_step2/stdout", "r")
for line in fp:
    myset.add(line[:-1])
fp.close()

@r1@
identifier log_func;
position p;
@@
log_func@p(...)

@script:python@
log_func << r1.log_func;
p << r1.p;
@@
if log_func in myset:
    if not csv_pos(p) in mydict:
        mydict[csv_pos(p)] = True
        print log_func + "," + csv_pos(p)
