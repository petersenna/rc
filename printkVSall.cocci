@initialize:python@
@@
def csv_pos(p):
    return p[0].column + "," + p[0].column_end + "," + p[0].current_element + \
    "," + p[0].file + "," + p[0].line + "," + p[0].line_end
p_dict = {}

@r1@
position p;
@@
(
pr_alert@p(...)
|
pr_alert_once@p(...)
|
pr_alert_ratelimited@p(...)
|
pr_cont@p(...)
|
pr_cont_once@p(...)
|
pr_crit@p(...)
|
pr_crit_once@p(...)
|
pr_crit_ratelimited@p(...)
|
pr_debug@p(...)
|
pr_debug_once@p(...)
|
pr_debug_ratelimited@p(...)
|
pr_devel@p(...)
|
pr_devel_once@p(...)
|
pr_devel_ratelimited@p(...)
|
pr_emerg@p(...)
|
pr_emerg_once@p(...)
|
pr_emerg_ratelimited@p(...)
|
pr_err@p(...)
|
pr_err_once@p(...)
|
pr_err_ratelimited@p(...)
|
pr_fmt@p(...)
|
pr_info@p(...)
|
pr_info_once@p(...)
|
pr_info_ratelimited@p(...)
|
pr_notice@p(...)
|
pr_notice_once@p(...)
|
pr_notice_ratelimited@p(...)
|
pr_warning@p(...)
|
pr_warn_once@p(...)
|
pr_warn_ratelimited@p(...)
|
dev_alert@p(...)
|
dev_alert_once@p(...)
|
dev_alert_ratelimited@p(...)
|
dev_crit@p(...)
|
dev_crit_once@p(...)
|
dev_crit_ratelimited@p(...)
|
dev_dbg@p(...)
|
dev_dbg_once@p(...)
|
dev_dbg_ratelimited@p(...)
|
dev_emerg@p(...)
|
dev_emerg_once@p(...)
|
dev_emerg_ratelimited@p(...)
|
dev_err@p(...)
|
dev_err_once@p(...)
|
dev_err_ratelimited@p(...)
|
_dev_info@p(...)
|
dev_info@p(...)
|
dev_info_once@p(...)
|
dev_info_ratelimited@p(...)
|
dev_level_once@p(...)
|
dev_level_ratelimited@p(...)
|
dev_notice@p(...)
|
dev_notice_once@p(...)
|
dev_notice_ratelimited@p(...)
|
dev_printk@p(...)
|
dev_printk_emit@p(...)
|
dev_vdbg@p(...)
|
dev_vprintk_emit@p(...)
|
dev_warn@p(...)
|
dev_WARN@p(...)
|
dev_warn_once@p(...)
|
dev_WARN_ONCE@p(...)
|
dev_warn_ratelimited@p(...)
|
netif_alert@p(...)
|
netif_crit@p(...)
|
netif_dbg@p(...)
|
netif_emerg@p(...)
|
netif_err@p(...)
|
netif_info@p(...)
|
netif_notice@p(...)
|
netif_printk@p(...)
|
netif_vdbg@p(...)
|
netif_warn@p(...)
|
netdev_alert@p(...)
|
netdev_crit@p(...)
|
netdev_dbg@p(...)
|
netdev_emerg@p(...)
|
netdev_err@p(...)
|
netdev_info@p(...)
|
netdev_notice@p(...)
|
netdev_printk@p(...)
|
netdev_vdbg@p(...)
|
netdev_warn@p(...)
|
netdev_WARN@p(...)
)

@script:python@
p << r1.p;
@@
if not csv_pos(p) in p_dict:
        p_dict[csv_pos(p)] = True
	print p[0].file, "something"

@r2@
position p;
@@
printk@p(...)

@script:python@
p << r2.p;
@@
if not csv_pos(p) in p_dict:
        p_dict[csv_pos(p)] = True
	print p[0].file,  "printk"
