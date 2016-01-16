Return-Path: <van.freenix@gmail.com>
Return-Path: <van.freenix@gmail.com>
From: Peng Fan <van.freenix@gmail.com>
To: linux-kernel@vger.kernel.org,
	xen-devel@lists.xenproject.org
Cc: linux-clk@vger.kernel.org,
	Peng Fan <van.freenix@gmail.com>,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
	Boris Ostrovsky <boris.ostrovsky@oracle.com>,
	David Vrabel <david.vrabel@citrix.com>,
	Julien Grall <julien.grall@citrix.com>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>,
	Ian Campbell <ian.campbell@citrix.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: [RFC/WIP] xen: clk: introudce pvclk for device passthrough
Date: Sat, 16 Jan 2016 13:22:40 +0800
Message-Id: <1452921760-21294-1-git-send-email-van.freenix@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

This patch was just a initial patch, not sure whether this way
is ok from you side for handlding clk when doing platform device
passhthrough. Any comments are appreciated, and your comments may
give me a better direction.

Patch was basically tested with passthrough uart2 to DomU on
freescale i.MX7D(Cortex-A7 Dual) platform with two linux os
running based on xen hypervisor.

I have not written the userspace libxl pvclk code, so I use the libxl pvusb
code for test, only need to change the compatible string in this patch
from "vclk" to "vusb", and "clk-ring-ref" to "urb-ring-ref". If this patch
is a acceptable way, I'll begin coding the userspace libxl pvclk.

I follow this doc [1] to do platform device passthrough, but I also
met the issue how to handle clk in the DomU guest. I do not want
to remove the clk api such clk_prepare_enable/disable and etc in the
uart driver, since it work well without xen. But if want the uart driver
to work well in DomU, I need to take care the clk usage. Without
this patch, clk_prepare_enable/disable will fail because no clk tree
in DomU. So I wrote this patch,

Since xen pv use asynchronous notification, clk_enable/disable can not
be implemented in the map, so I use clk_prepare_enable/disable in backend
to map clk_prepare/unprepare in frontend.

Partial dts for DomU linux:
"
        aliases {
		serial0 = &uart2;
		clk0 = &clks;
	};

	passthrough {
		compatible = "simple-bus";
		ranges; #address-cells = <1>;
		#size-cells = <1>;

		clks: clks {
			compatible = "xen,xen-clk";
			#clock-cells = <1>;
			clock-output-names = "uart2_root_clk";
		};

		uart2: serial@10000000 {
			compatible = "fsl,imx7d-uart", "fsl,imx6q-uart", "fsl,imx21-uart";
			reg = <0x10000000 0x10000>;
			interrupts = <0 27 4>;
			interrupt-parent = <65000>;
			clocks = <&clks 0>, <&clks 0>;
			clock-names = "ipg", "per";
		};
	};
"

Xen front clk driver will register itself by probing "xen,xen-clk", register
clk tree by parsing "clock-output-names" and register as ROOT clk.
See the uart2 node, ipg and per clks are also registered in Dom0,
when DomU want to prepare or set rate for the ipg clk, DomU will use pvclk
interface to pass the name "ipg" and the ID(PREPARE, SET_RATE and etc)to Dom0,
Dom0 will use __clk_lookup to find out the "struct clk *" structure and
prepare_enable or set_rate according to the ID from DomU. The ID is defined
in clkif.h in this patch.

The mapping between frontend and backend is as following:

  Frontend                  Backend
clk_prepare             clk_prepare_enable
clk_unprepare           clk_unprepare_disable
clk_set_rate            clk_set_rate
clk_get_rate            clk_get_rate

Frontend work flow example:
1. clk_prepare("ipg")
    |->ID: PREPARE, name: "ipg" packed into a structure
              |->notify backend
2. wait_completion
    Dom0 finished clk_prepare_enable and send event channel interrupt
    to DomU, In DomU frontend interrupt handler, call complete to wakeup.

[1] https://events.linuxfoundation.org/sites/events/files/slides/talk_5.pdf

Signed-off-by: Peng Fan <van.freenix@gmail.com>
Cc: xen-devel@lists.xenproject.org
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Cc: David Vrabel <david.vrabel@citrix.com>
Cc: Julien Grall <julien.grall@citrix.com>
Cc: Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Cc: Ian Campbell <ian.campbell@citrix.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>

---
 drivers/clk/Makefile             |   2 +
 drivers/clk/xen/Makefile         |   1 +
 drivers/clk/xen/clk-xen.c        | 197 ++++++++++++++++++
 drivers/clk/xen/xen-clkback.c    | 357 ++++++++++++++++++++++++++++++++
 drivers/clk/xen/xen-clkfront.c   | 432 +++++++++++++++++++++++++++++++++++++++
 include/xen/interface/io/clkif.h |  41 ++++
 6 files changed, 1030 insertions(+)
 create mode 100644 drivers/clk/xen/Makefile
 create mode 100644 drivers/clk/xen/clk-xen.c
 create mode 100644 drivers/clk/xen/xen-clkback.c
 create mode 100644 drivers/clk/xen/xen-clkfront.c
 create mode 100644 include/xen/interface/io/clkif.h

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 820714c..7668ecc 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -15,6 +15,8 @@ ifeq ($(CONFIG_OF), y)
 obj-$(CONFIG_COMMON_CLK)	+= clk-conf.o
 endif
 
+obj-$(CONFIG_XEN)		+= xen/
+
 # hardware specific clock types
 # please keep this section sorted lexicographically by file/directory path name
 obj-$(CONFIG_MACH_ASM9260)		+= clk-asm9260.o
diff --git a/drivers/clk/xen/Makefile b/drivers/clk/xen/Makefile
new file mode 100644
index 0000000..60abe25
--- /dev/null
+++ b/drivers/clk/xen/Makefile
@@ -0,0 +1 @@
+obj-y		+= clk-xen.o xen-clkfront.o xen-clkback.o
diff --git a/drivers/clk/xen/clk-xen.c b/drivers/clk/xen/clk-xen.c
new file mode 100644
index 0000000..412a785
--- /dev/null
+++ b/drivers/clk/xen/clk-xen.c
@@ -0,0 +1,197 @@
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/module.h>
+#include <linux/slab.h>
+#include <linux/io.h>
+#include <linux/err.h>
+#include <linux/string.h>
+#include <xen/interface/io/clkif.h>
+
+#define to_clk_xen(_hw) container_of(_hw, struct xen_clk, hw)
+
+int xen_clkfront_do_request(int id, const char *name, unsigned long rate);
+int xen_clkfront_wait_response(int id, const char *name, unsigned long *rate);
+static int xen_clkfront_prepare(struct clk_hw *hw)
+{
+	struct clk *clk = hw->clk;
+	const char *name = __clk_get_name(clk);
+	unsigned long rate;
+	int err;
+
+	err = xen_clkfront_do_request(XENCLK_PREPARE, name, 0);
+	if (err)
+		return 0;
+
+	err = xen_clkfront_wait_response(XENCLK_PREPARE, name, NULL);
+	if (err)
+		return -EIO;
+
+	return 0;
+}
+
+void xen_clkfront_unprepare(struct clk_hw *hw)
+{
+	struct clk *clk = hw->clk;
+	const char *name = __clk_get_name(clk);
+	unsigned long rate;
+	int err;
+
+	err = xen_clkfront_do_request(XENCLK_UNPREPARE, name, 0);
+	if (err)
+		return 0;
+
+	xen_clkfront_wait_response(XENCLK_UNPREPARE, name, NULL);
+
+	return 0;
+}
+
+/* clk_enable */
+int xen_clkfront_enable(struct clk_hw *hw)
+{
+	/*
+	 * clk_enable API can be used in interrupt context,
+	 * but here the pvclk framework only works in sleepable context.
+	 * So in DomU frontend, clk_prepare takes the responsibility
+	 * for enable clk in backend.
+	 */
+	return 0;
+}
+
+/* clk_disable */
+void xen_clkfront_disable(struct clk_hw *hw)
+{
+}
+
+/* clk_get_rate */
+static unsigned long xen_clkfront_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clk *clk = hw->clk;
+	const char *name = __clk_get_name(clk);
+	unsigned long rate;
+	int err;
+	
+	if (!name) {
+		BUG_ON(!name);
+		return 0;
+	}
+
+	err = xen_clkfront_do_request(XENCLK_GET_RATE, name, 0);
+	if (err)
+		return 0;
+
+	err = xen_clkfront_wait_response(XENCLK_GET_RATE, name, &rate);
+	if (err)
+		return 0;
+
+	return rate;
+}
+
+/* clk_set_rate */
+int xen_clkfront_set_rate(struct clk_hw *hw, unsigned long rate,
+			  unsigned long parent_rate)
+{
+	struct clk *clk = hw->clk;
+	const char *name = __clk_get_name(clk);
+	int err;
+
+	if (!name) {
+		BUG_ON(!name);
+		return 0;
+	}
+
+	err = xen_clkfront_do_request(XENCLK_SET_RATE, name, rate);
+	if (err)
+		return 0;
+
+	err = xen_clkfront_wait_response(XENCLK_SET_RATE, name, NULL);
+	if (err)
+		return -EINVAL;
+
+	return 0;
+}
+
+long xen_clkfront_determine_rate(struct clk_hw *hw,
+				 unsigned long rate,
+				 unsigned long min_rate,
+				 unsigned long max_rate,
+				 unsigned long *best_parent_rate,
+				 struct clk_hw **best_parent_hw)
+{
+	/* directly return rate, let backend does this work */
+	return rate;
+}
+
+const struct clk_ops xen_clkfront_ops = {
+	.prepare = xen_clkfront_prepare,
+	.unprepare = xen_clkfront_unprepare,
+	.enable = xen_clkfront_enable,
+	.disable = xen_clkfront_disable,
+	.recalc_rate = xen_clkfront_recalc_rate,
+	.determine_rate = xen_clkfront_determine_rate,
+	.set_rate = xen_clkfront_set_rate,
+};
+EXPORT_SYMBOL_GPL(xen_clkfront_ops);
+
+struct xen_clk {
+	struct clk_hw hw;
+	u8 flags;
+	spinlock_t *lock;
+};
+
+struct clk *clk_register_xen(struct device *dev, const char *name,
+			     const char *parent_name, unsigned long flags,
+			     spinlock_t *lock)
+{
+	struct clk *clk;
+	struct clk_init_data init;
+	struct xen_clk *xenclk;
+
+	xenclk = kzalloc(sizeof(struct xen_clk), GFP_KERNEL);
+	if (!xenclk) {
+		pr_err("%s: cound not allocate xen clk\n", __func__);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	init.name = name;
+	init.ops = &xen_clkfront_ops;
+	/* register as root clk in frontend */
+	init.flags = flags | CLK_GET_RATE_NOCACHE | CLK_GET_ACCURACY_NOCACHE | CLK_IS_ROOT;
+	init.parent_names = NULL;
+	init.num_parents = 0;
+
+	xenclk->hw.init = &init;
+
+	clk = clk_register(dev, &xenclk->hw);
+	if (IS_ERR(clk)) {
+		pr_err("clk_register failure %s\n", name);
+		kfree(xenclk);
+	}
+
+	return clk;
+}
+EXPORT_SYMBOL_GPL(clk_register_xen);
+
+void clk_unregister_xen(struct clk *clk)
+{
+	struct xen_clk *xenclk;
+	struct clk_hw *hw;
+
+	hw = __clk_get_hw(clk);
+	if (!hw)
+		return;
+
+	xenclk = to_clk_xen(hw);
+
+	clk_unregister(clk);
+	kfree(xenclk);
+}
+EXPORT_SYMBOL_GPL(clk_unregister_xen);
diff --git a/drivers/clk/xen/xen-clkback.c b/drivers/clk/xen/xen-clkback.c
new file mode 100644
index 0000000..bc4c14b8
--- /dev/null
+++ b/drivers/clk/xen/xen-clkback.c
@@ -0,0 +1,357 @@
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/module.h>
+#include <linux/interrupt.h>
+#include <linux/slab.h>
+
+#include <xen/xen.h>
+#include <xen/events.h>
+#include <xen/xenbus.h>
+#include <xen/grant_table.h>
+#include <xen/page.h>
+
+#include <linux/clk.h>
+
+#include <xen/interface/grant_table.h>
+#include <xen/interface/io/clkif.h>
+
+extern struct clk *__clk_lookup(const char *name);
+extern bool __clk_is_prepared(struct clk *clk);
+
+struct xen_clkback_info {
+	domid_t domid;
+	unsigned irq;
+	unsigned long handle;
+	struct xenbus_device *clkdev;
+	spinlock_t clk_ring_lock;
+	struct xen_clkif_back_ring clk_ring;
+	atomic_t refcnt;
+	int is_connected;
+	int ring_error;
+};
+
+static void xen_clkback_do_response(struct xen_clkback_info *info,
+				    int id, char *name, unsigned long rate,
+				    int success)
+{
+	struct xen_clkif_response *res;
+	unsigned long flags;
+	int notify;
+
+	spin_lock_irqsave(&info->clk_ring_lock, flags);
+	res = RING_GET_RESPONSE(&info->clk_ring, info->clk_ring.rsp_prod_pvt);
+
+	res->success = success;
+	res->id = id;
+	res->rate = rate;
+	strncpy(res->clk_name, name, sizeof(res->clk_name));
+	info->clk_ring.rsp_prod_pvt++;
+
+	/* More stuff */
+	barrier();
+	RING_PUSH_RESPONSES_AND_CHECK_NOTIFY(&info->clk_ring, notify);
+	spin_unlock_irqrestore(&info->clk_ring_lock, flags);
+
+	if (notify)
+		notify_remote_via_irq(info->irq);
+}
+
+static int xen_clkback_handle_int(struct xen_clkback_info *info)
+{
+	struct xen_clkif_back_ring *clk_ring = &info->clk_ring;
+	struct xen_clkif_request req;
+	RING_IDX rc, rp;
+	int more_to_do;
+	struct clk *clk;
+	int err;
+	unsigned long rate;
+
+	rc = clk_ring->req_cons;
+	rp = clk_ring->sring->req_prod;
+	rmb();	/* req_cons is written by frontend. */
+	
+	if (RING_REQUEST_PROD_OVERFLOW(clk_ring, rp)) {
+		rc = clk_ring->rsp_prod_pvt;
+		info->ring_error = 1;
+		return 0;
+	}
+
+	while (rc != rp) {
+		if (RING_REQUEST_CONS_OVERFLOW(clk_ring, rc))
+			break;
+
+		req = *RING_GET_REQUEST(clk_ring, rc);
+		clk = __clk_lookup(req.clk_name);
+		if (!clk)
+			pr_err("no clk node for %s\n", req.clk_name);
+
+		switch (req.id) {
+		case XENCLK_PREPARE:
+			err = clk_prepare_enable(clk);
+			xen_clkback_do_response(info, req.id, req.clk_name, 0, err);
+			break;
+		case XENCLK_UNPREPARE:
+			clk_disable_unprepare(clk);
+			err = !__clk_is_prepared(clk);
+			xen_clkback_do_response(info, req.id, req.clk_name, 0, err);
+			break;
+		case XENCLK_GET_RATE:
+			rate = clk_get_rate(clk);
+			xen_clkback_do_response(info, req.id, req.clk_name, rate, 0);
+			break;
+		case XENCLK_SET_RATE:
+			err = clk_set_rate(clk, req.rate);
+			xen_clkback_do_response(info, req.id, req.clk_name, 0, err);
+			break;
+		}
+		clk_ring->req_cons = ++rc;
+
+		cond_resched();
+	}
+
+	RING_FINAL_CHECK_FOR_REQUESTS(clk_ring, more_to_do);
+
+	return !!more_to_do;
+}
+
+static irqreturn_t xen_clkback_be_int(int irq, void *dev_id)
+{
+	struct xen_clkback_info *info = dev_id;
+
+	if (info->ring_error)
+		return IRQ_HANDLED;
+
+	while (xen_clkback_handle_int(info))
+		cond_resched();
+
+	return IRQ_HANDLED;
+}
+
+static int xen_clkback_map(struct xen_clkback_info *info,
+			   grant_ref_t *clk_ring_ref, evtchn_port_t evtchn)
+{
+	int err;
+	void *addr;
+	struct xen_clkif_sring *clk_sring;
+
+	if (info->irq)
+		return 0;
+
+	err = xenbus_map_ring_valloc(info->clkdev, clk_ring_ref, 1, &addr);
+	if (err)
+		return err;
+
+	clk_sring = addr;
+
+	BACK_RING_INIT(&info->clk_ring, clk_sring, PAGE_SIZE);
+
+	err = bind_interdomain_evtchn_to_irq(info->domid, evtchn);
+	if (err < 0)
+		goto fail_evtchn;
+	info->irq = err;
+
+	err = request_threaded_irq(info->irq, NULL, xen_clkback_be_int,
+				   IRQF_ONESHOT, "xen-clkback", info);
+	if (err) {
+		pr_err("bind evtchn to irq failure!\n");
+		goto free_irq;
+	}
+
+	return 0;
+free_irq:
+	unbind_from_irqhandler(info->irq, info);
+	info->irq = 0;
+	info->clk_ring.sring = NULL;
+fail_evtchn:
+	xenbus_unmap_ring_vfree(info->clkdev, clk_sring);
+	return err;
+}
+
+static int xen_clkback_connect_rings(struct xen_clkback_info *info)
+{
+	struct xenbus_device *dev = info->clkdev;
+	unsigned clk_ring_ref, evtchn;
+	int err;
+
+	err = xenbus_gather(XBT_NIL, dev->otherend,
+			    "clk-ring-ref", "%u", &clk_ring_ref,
+			    "event-channel", "%u", &evtchn, NULL);
+	if (err) {
+		xenbus_dev_fatal(dev, err,
+				 "reading %s/ring-ref and event-channel",
+				 dev->otherend);
+		return err;
+	}
+
+	pr_info("xen-pvclk: clk-ring-ref %u, event-channel %u\n",
+		clk_ring_ref, evtchn);
+
+	err = xen_clkback_map(info, &clk_ring_ref, evtchn);
+	if (err)
+		xenbus_dev_fatal(dev, err, "mapping urb-ring-ref %u evtchn %u",
+			clk_ring_ref, evtchn);
+
+	return err;
+}
+
+static void xen_clkback_disconnect(struct xen_clkback_info *info)
+{
+	if (info->irq) {
+		unbind_from_irqhandler(info->irq, info);
+		info->irq = 0;
+	}
+
+	if (info->clk_ring.sring) {
+		xenbus_unmap_ring_vfree(info->clkdev, info->clk_ring.sring);
+		info->clk_ring.sring = NULL;
+	}
+}
+
+static void xen_clkback_frontend_changed(struct xenbus_device *dev,
+					 enum xenbus_state frontend_state)
+{
+	struct xen_clkback_info *info = dev_get_drvdata(&dev->dev);
+
+	switch (frontend_state) {
+	case XenbusStateInitialised:
+	case XenbusStateReconfiguring:
+	case XenbusStateReconfigured:
+		break;
+
+	case XenbusStateInitialising:
+		if (dev->state == XenbusStateClosed) {
+			pr_info("xen-pvclk: %s: prepare for reconnect\n",
+				dev->nodename);
+			xenbus_switch_state(dev, XenbusStateInitWait);
+		}
+		break;
+	case XenbusStateConnected:
+		if (dev->state != XenbusStateConnected)
+			xenbus_switch_state(dev, XenbusStateConnected);
+
+		xen_clkback_connect_rings(info);
+		break;
+	case XenbusStateClosing:
+		xen_clkback_disconnect(info);
+		xenbus_switch_state(dev, XenbusStateClosing);
+		break;
+	case XenbusStateClosed:
+		xenbus_switch_state(dev, XenbusStateClosed);
+		if (xenbus_dev_is_online(dev))
+			break;
+		/* fall through if not online */
+	case XenbusStateUnknown:
+		device_unregister(&dev->dev);
+		break;
+
+	default:
+		xenbus_dev_fatal(dev, -EINVAL, "saw state %d at frontend",
+				 frontend_state);
+		break;
+	}
+}
+
+static struct xen_clkback_info *xen_clkback_alloc(domid_t domid,
+						  unsigned long handle)
+{
+	struct xen_clkback_info *info;
+
+	info = kzalloc(sizeof(struct xen_clkback_info), GFP_KERNEL);
+	if (!info)
+		return NULL;
+
+	info->domid = domid;
+	info->handle = handle;
+	spin_lock_init(&info->clk_ring_lock);
+	atomic_set(&info->refcnt, 0);
+	info->ring_error = 0;
+
+	return info;
+}
+
+static int xen_clkback_probe(struct xenbus_device *dev,
+			     const struct xenbus_device_id *id)
+{
+	struct xen_clkback_info *info;
+	unsigned long handle;
+	int err;
+
+	if (kstrtoul(strrchr(dev->otherend, '/') + 1, 0, &handle))
+		return -EINVAL;
+
+	info = xen_clkback_alloc(dev->otherend_id, handle);
+	if (!info) {
+		xenbus_dev_fatal(dev, -ENOMEM, "Allocating backend interface");
+		return -ENOMEM;
+	}
+
+	info->clkdev = dev;
+	dev_set_drvdata(&dev->dev, info);
+
+	err = xenbus_switch_state(dev, XenbusStateInitWait);
+	if (err)
+		return err;
+
+	return 0;
+}
+
+static int xen_clkback_remove(struct xenbus_device *dev)
+{
+	struct xen_clkback_info *info = dev_get_drvdata(&dev->dev);
+
+	if (!info)
+		return 0;
+
+	xen_clkback_disconnect(info);
+
+	kfree(info);
+	dev_set_drvdata(&dev->dev, NULL);
+
+	return 0;
+}
+
+static const struct xenbus_device_id xen_clkback_ids[] = {
+	{ "vclk" },
+	{ "" },
+};
+
+static struct xenbus_driver xen_clkback_driver = {
+	.ids			= xen_clkback_ids,
+	.probe			= xen_clkback_probe,
+	.otherend_changed	= xen_clkback_frontend_changed,
+	.remove			= xen_clkback_remove,
+};
+
+static int __init xen_clkback_init(void)
+{
+	int err;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	err = xenbus_register_backend(&xen_clkback_driver);
+	if (err)
+		return err;
+
+	/* Can we avoid libxl pvclk? doing xenstore in kernel ? */
+	return 0;
+}
+module_init(xen_clkback_init);
+
+static void __exit xen_clkback_exit(void)
+{
+	xenbus_unregister_driver(&xen_clkback_driver);
+}
+module_exit(xen_clkback_exit);
+
+MODULE_ALIAS("xen-clkback:vclk");
+MODULE_AUTHOR("Peng Fan <van.freenix@gmail.com>");
+MODULE_DESCRIPTION("Xen CLK backend driver (clkback)");
+MODULE_LICENSE("Dual BSD/GPL");
diff --git a/drivers/clk/xen/xen-clkfront.c b/drivers/clk/xen/xen-clkfront.c
new file mode 100644
index 0000000..5ce787b
--- /dev/null
+++ b/drivers/clk/xen/xen-clkfront.c
@@ -0,0 +1,432 @@
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#include <linux/module.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/list.h>
+#include <linux/io.h>
+
+#include <xen/xen.h>
+#include <xen/xenbus.h>
+#include <xen/grant_table.h>
+#include <xen/events.h>
+#include <xen/page.h>
+
+#include <xen/interface/io/clkif.h>
+
+#define GRANT_INVALID_REF	0
+DEFINE_SPINLOCK(xen_clk_lock);
+static struct clk **clks;
+static struct clk_onecell_data clk_data;
+static struct xen_clkfront_info *ginfo;
+extern struct clk *clk_register_xen(struct device *dev, const char *name,
+				    const char *parent_name,
+				    unsigned long flags,
+				    spinlock_t *lock);
+static int __init xen_clkfront_register(int num, const char **clks_name)
+{
+	int i;
+
+	for (i = 0; i < num; i++) {
+		clks[i] = clk_register_xen(NULL, clks_name[i], NULL,
+					   CLK_GATE_SET_TO_DISABLE,
+					   &xen_clk_lock);
+		if (IS_ERR_OR_NULL(clks[i]))
+			return PTR_ERR(clks[i]);
+	}
+
+	return 0;
+}
+
+static void __init xen_clkfront_deregister(int num)
+{
+	int i;
+
+	for (i = 0; i < num; i++) {
+		if (clks[i])
+			clk_unregister_gate(clks[i]);
+	}
+}
+
+static const struct xenbus_device_id xen_clkfront_ids[] = {
+	{ "vclk" },
+	{ "" },
+};
+
+struct xen_clkfront_comp {
+	struct completion completion;
+	unsigned long rate;
+	int success;
+	int id;
+	char clk_name[32];
+};
+
+struct xen_clkfront_info {
+	spinlock_t lock;
+	struct xenbus_device *clkdev;
+	int clk_ring_ref;
+	struct xen_clkif_front_ring clk_ring;
+	unsigned int evtchn;
+	unsigned int irq;
+	struct xen_clkfront_comp comp[XENCLK_END];
+};
+
+static int xen_clkfront_probe(struct xenbus_device *dev,
+			      const struct xenbus_device_id *id)
+{
+	struct xen_clkfront_info *info;
+	int i;
+
+	info = kzalloc(sizeof(struct xen_clkfront_info), GFP_KERNEL);
+	if (!info)
+		return -ENOMEM;
+
+	info->clkdev = dev;
+	dev_set_drvdata(&dev->dev, info);
+
+	for (i = 0; i < ARRAY_SIZE(info->comp); i++)
+		init_completion(&(info->comp[i].completion));
+
+	ginfo = info;
+
+	return 0;
+}
+
+static void xen_clkfront_destroy_rings(struct xen_clkfront_info *info)
+{
+	if (info->irq)
+		unbind_from_irqhandler(info->irq, info);
+	info->irq = 0;
+
+	if (info->clk_ring_ref != GRANT_INVALID_REF) {
+		gnttab_end_foreign_access(info->clk_ring_ref, 0,
+					  (unsigned long)info->clk_ring.sring);
+		info->clk_ring_ref = GRANT_INVALID_REF;
+	}
+	info->clk_ring.sring = NULL;
+}
+
+static int xen_clkfront_handle_int(struct xen_clkfront_info *info)
+{
+	struct xen_clkif_response *res;
+	RING_IDX i, rp;
+	int more_to_do = 0;
+	unsigned long flags;
+	struct xen_clkfront_comp *comp;
+
+	spin_lock_irqsave(&info->lock, flags);
+	rp = info->clk_ring.sring->rsp_prod;
+	rmb(); /* ensure we see queued responses up to "rp" */
+
+	for (i = info->clk_ring.rsp_cons; i != rp; i++) {
+		res = RING_GET_RESPONSE(&info->clk_ring, i);
+		BUG_ON(res->id >= XENCLK_END);
+		comp = &info->comp[res->id];
+		comp->id = res->id;
+		comp->success = res->success;
+		comp->rate = res->rate;
+		strncpy(comp->clk_name, res->clk_name, sizeof(res->clk_name));
+		complete(&comp->completion);
+	}
+	info->clk_ring.rsp_cons = i;
+
+	if (i != info->clk_ring.req_prod_pvt)
+		RING_FINAL_CHECK_FOR_RESPONSES(&info->clk_ring, more_to_do);
+	else
+		info->clk_ring.sring->rsp_event = i + 1;
+
+	spin_unlock_irqrestore(&info->lock, flags);
+
+	return more_to_do;
+}
+
+static irqreturn_t xen_clkfront_int(int irq, void *dev_id)
+{
+	struct xen_clkfront_info *info = dev_id;
+
+	while (xen_clkfront_handle_int(info))
+		cond_resched();
+
+	return IRQ_HANDLED;
+}
+
+static int xen_clkfront_setup_rings(struct xenbus_device *dev,
+				    struct xen_clkfront_info *info)
+{
+	struct xen_clkif_sring *clk_sring;
+	grant_ref_t gref;
+	int err;
+
+	info->clk_ring_ref = GRANT_INVALID_REF;
+
+	clk_sring = (struct xen_clkif_sring *)get_zeroed_page(
+						GFP_NOIO | __GFP_HIGH);
+	if (!clk_sring) {
+		xenbus_dev_fatal(dev, -ENOMEM, "allocating clk sring");
+		return -ENOMEM;
+	}
+
+	SHARED_RING_INIT(clk_sring);
+	FRONT_RING_INIT(&info->clk_ring, clk_sring, PAGE_SIZE);
+
+	err = xenbus_grant_ring(dev, clk_sring, 1, &gref);
+	if (err < 0) {
+		free_page((unsigned long)clk_sring);
+		info->clk_ring.sring = NULL;
+		goto fail;
+	}
+	info->clk_ring_ref = gref;
+
+	err = xenbus_alloc_evtchn(dev, &info->evtchn);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "xenbus_alloc_evtchn");
+		goto fail;
+	}
+
+	err = bind_evtchn_to_irqhandler(info->evtchn, xen_clkfront_int, 0,
+					"xen_clkif", info);
+	if (err <= 0) {
+		xenbus_dev_fatal(dev, err, "bind_evtchn_to_irqhandler failed");
+		goto fail;
+	}
+
+	info->irq = err;
+
+	return 0;
+
+fail:
+	xen_clkfront_destroy_rings(info);
+	return err;
+}
+
+int xen_clkfront_wait_response(int id, const char *name, unsigned long *rate)
+{
+	struct xen_clkfront_info *info = ginfo;
+	struct xen_clkfront_comp *comp = &info->comp[id];
+
+	if (!ginfo) {
+		pr_err("Not initialized\n");
+		return -EIO;
+	}
+
+	wait_for_completion(&comp->completion);
+
+	if ((id == comp->id) && !strncmp(name, comp->clk_name, sizeof(comp->clk_name))) {
+		if (rate)
+			*rate = comp->rate;
+		return 0;
+	}
+
+	return -EIO;
+}
+
+int xen_clkfront_do_request(int id, const char *name, unsigned long rate)
+{
+	struct xen_clkfront_info *info = ginfo;
+	struct xen_clkif_request *req;
+	int notify;
+
+	if (!info) {
+		pr_err("Not initialized\n");
+		return -EIO;
+	}
+
+	req = RING_GET_REQUEST(&info->clk_ring, info->clk_ring.req_prod_pvt);
+	req->id = id;
+	req->rate = rate;
+	strncpy(req->clk_name, name, sizeof(req->clk_name));
+
+	info->clk_ring.req_prod_pvt++;
+	RING_PUSH_REQUESTS_AND_CHECK_NOTIFY(&info->clk_ring, notify);
+
+	if (notify)
+		notify_remote_via_irq(info->irq);
+
+	return 0;
+}
+
+static int xen_clkfront_connect(struct xenbus_device *dev)
+{
+	struct xen_clkfront_info *info = dev_get_drvdata(&dev->dev);
+	struct xenbus_transaction xbt;
+	int err;
+	char *message;
+
+	err = xen_clkfront_setup_rings(dev, info);
+	if (err) {
+		pr_err("%s: failure....", __func__);
+		return err;
+	}
+again:
+	err = xenbus_transaction_start(&xbt);
+	if (err) {
+		xenbus_dev_fatal(dev, err, "starting transaction");
+		goto destroy_ring;
+	}
+
+	err = xenbus_printf(xbt, dev->nodename, "clk-ring-ref", "%u",
+			    info->clk_ring_ref);
+	if (err) {
+		message = "writing clk-ring-ref";
+		goto abort_transaction;
+	}
+
+	err = xenbus_printf(xbt, dev->nodename, "event-channel", "%u",
+			    info->evtchn);
+	if (err) {
+		message = "writing event-channel";
+		goto abort_transaction;
+	}
+
+	err = xenbus_transaction_end(xbt, 0);
+	if (err) {
+		if (err == -EAGAIN)
+			goto again;
+		xenbus_dev_fatal(dev, err, "completing transaction");
+		goto destroy_ring;
+	}
+
+	return 0;
+
+abort_transaction:
+	xenbus_transaction_end(xbt, 1);
+	xenbus_dev_fatal(dev, err, "%s", message);
+
+destroy_ring:
+	xen_clkfront_destroy_rings(info);
+
+	return err;
+}
+
+static void xen_clkfront_disconnect(struct xenbus_device *dev)
+{
+	xenbus_frontend_closed(dev);
+}
+
+static void xen_clkfront_backend_changed(struct xenbus_device *dev,
+					 enum xenbus_state backend_state)
+{
+	switch (backend_state) {
+	case XenbusStateInitialising:
+	case XenbusStateReconfiguring:
+	case XenbusStateReconfigured:
+	case XenbusStateUnknown:
+		break;
+
+	case XenbusStateInitWait:
+	case XenbusStateInitialised:
+	case XenbusStateConnected:
+		if (dev->state != XenbusStateInitialising)
+			break;
+		if (!xen_clkfront_connect(dev))
+			xenbus_switch_state(dev, XenbusStateConnected);
+		break;
+
+	case XenbusStateClosed:
+		if (dev->state == XenbusStateClosed)
+			break;
+		/* Missed the backend's Closing state -- fallthrough */
+	case XenbusStateClosing:
+		xen_clkfront_disconnect(dev);
+		break;
+
+	default:
+		xenbus_dev_fatal(dev, -EINVAL, "saw state %d at frontend",
+				 backend_state);
+		break;
+	}
+}
+
+static int xen_clkfront_remove(struct xenbus_device *dev)
+{
+	struct xen_clkfront_info *info = dev_get_drvdata(&dev->dev);
+
+	xen_clkfront_destroy_rings(info);
+
+	kfree(info);
+
+	ginfo = NULL;
+
+	return -EINVAL;
+}
+
+static struct xenbus_driver xen_clkfront_driver = {
+	.ids = xen_clkfront_ids,
+	.probe = xen_clkfront_probe,
+	.otherend_changed = xen_clkfront_backend_changed,
+	.remove = xen_clkfront_remove,
+};
+
+static int __init xen_clkfront_init(void)
+{
+	struct device_node *np;
+	int nr, ret;
+	const char **clks_name;
+
+	if (!xen_domain())
+		return -ENODEV;
+
+	np = of_find_compatible_node(NULL, NULL, "xen,xen-clk");
+	if (!np) {
+		printk("error node\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_count_strings(np, "clock-output-names");
+	if (ret <= 0) {
+		of_node_put(np);
+		return ret;
+	}
+
+	nr = ret;
+
+	clks_name = kzalloc(sizeof(char *) * nr, GFP_KERNEL);
+	if (!clks_name)
+		return -ENOMEM;
+
+	ret = of_property_read_string_array(np, "clock-output-names",
+					    clks_name, nr);
+
+	if (ret < 0)
+		goto free_clks_name;
+
+	clks = kzalloc(sizeof(struct clk *) * nr, GFP_KERNEL);
+	if (!clks) {
+		ret = PTR_ERR(clks);
+		goto free_clks_name;
+	}
+
+	ret = xen_clkfront_register(nr, clks_name);
+	if (ret != 0)
+		goto free_clks;
+
+	clk_data.clks = clks;
+	clk_data.clk_num = nr;
+	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data);
+
+	ret = xenbus_register_frontend(&xen_clkfront_driver);
+	if (ret) {
+		pr_err("register frontend failure\n");
+		goto free_clks;
+	}
+
+	of_node_put(np);
+
+	return 0;
+
+free_clks:
+	xen_clkfront_deregister(nr);
+	kfree(clks);
+free_clks_name:
+	of_node_put(np);
+	kfree(clks_name);
+	return ret;
+}
+subsys_initcall(xen_clkfront_init);
diff --git a/include/xen/interface/io/clkif.h b/include/xen/interface/io/clkif.h
new file mode 100644
index 0000000..d5e3616
--- /dev/null
+++ b/include/xen/interface/io/clkif.h
@@ -0,0 +1,41 @@
+/*
+ * The code contained herein is licensed under the GNU General Public
+ * License. You may obtain a copy of the GNU General Public License
+ * Version 2 or later at the following locations:
+ *
+ * http://www.opensource.org/licenses/gpl-license.html
+ * http://www.gnu.org/copyleft/gpl.html
+ */
+
+#ifndef __XEN_PUBLIC_IO_CLKIF_H__
+#define __XEN_PUBLIC_IO_CLKIF_H__
+
+#include <xen/interface/io/ring.h>
+#include <xen/interface/grant_table.h>
+
+/**/
+enum {
+	XENCLK_PREPARE,		/* clk_prepare_enable */
+	XENCLK_UNPREPARE,	/* clk_unprepare_disable */
+	XENCLK_GET_RATE,	/* clk_get_rate */
+	XENCLK_SET_RATE,	/* clk_set_rate */
+	XENCLK_END,
+};
+
+struct xen_clkif_request {
+	int id;
+	unsigned long rate;
+	char clk_name[32];
+};
+
+struct xen_clkif_response {
+	int id;
+	int success;
+	unsigned long rate;
+	char clk_name[32];
+};
+
+DEFINE_RING_TYPES(xen_clkif, struct xen_clkif_request, struct xen_clkif_response);
+#define XEN_CLK_RING_SIZE __CONST_RING_SIZE(xen_clkif, PAGE_SIZE)
+
+#endif
-- 
2.6.2
