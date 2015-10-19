@initialize:python@
results_dir << virtual.results_dir;
@@
import os

myset = set()
myfile = os.path.join(results_dir, "../log_function_names_step1/stdout")

fp = open(myfile, "r")
for line in fp:
    myset.add(line[:-1])
fp.close()

func_dict = {}

@r1@
identifier log_func;
position p;
constant char[] c;
@@
log_func@p(..., c, ...)

@r2@
identifier r1.log_func;
expression list [n] el;
position r1.p;
@@
log_func@p(el)

@script:python@
log_func << r1.log_func;
p << r1.p;
n << r2.n;
@@
func_args = log_func + "," + str(n)

if log_func in myset:
    if not func_args in func_dict:
        func_dict[func_args] = True
        print func_args
