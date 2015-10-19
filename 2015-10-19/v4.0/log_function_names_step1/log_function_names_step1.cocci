@initialize:python@
@@
func_dict = {}

@r1 exists@
identifier log_func, label;
constant char[] c;
position p;
statement S1, S2, S3, S4;
@@
if(...) {
        ... when any
            when != if(...) S1 else S2

        log_func@p(..., c, ...)

        ... when any
            when != if(...) S3 else S4
(
        return ...;
|
        goto label;
)
}

@script:python@
log_func << r1.log_func;
@@
if not log_func in func_dict:
    func_dict[log_func] = True
    print log_func
