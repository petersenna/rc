@initialize:python@
checkout << virtual.checkout;
results_dir << virtual.results_dir;
@@
print checkout, results_dir

@r1@
identifier i;
@@
kr_the_C = i(...)

@script:python@
i << r1.i;
@@
asd = i
