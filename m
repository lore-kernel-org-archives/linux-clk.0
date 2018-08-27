Return-Path: <hdegoede@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
To: "David S . Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Irina Tirdea <irina.tirdea@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	netdev@vger.kernel.org,
	Johannes Stezenbach <js@sig21.net>,
	Carlo Caione <carlo@endlessm.com>,
	linux-clk@vger.kernel.org
Subject: [PATCH 2/4] r8169: Get and enable optional ether_clk clock
Date: Mon, 27 Aug 2018 16:31:58 +0200
Message-Id: <20180827143200.8597-3-hdegoede@redhat.com>
In-Reply-To: <20180827143200.8597-1-hdegoede@redhat.com>
References: <20180827143200.8597-1-hdegoede@redhat.com>
List-ID: <linux-clk.vger.kernel.org>

On some boards a platform clock is used as clock for the r8169 chip,
this commit adds support for getting and enabling this clock (assuming
it has an "ether_clk" alias set on it).

This is related to commit d31fd43c0f9a ("clk: x86: Do not gate clocks
enabled by the firmware") which is a previous attempt to fix this for some
x86 boards, but this causes all Cherry Trail SoC using boards to not reach
there lowest power states when suspending.

This commit (together with an atom-pmc-clk driver commit adding the alias)
fixes things properly by making the r8169 get the clock and enable it when
it needs it.

Buglink: https://bugzilla.kernel.org/show_bug.cgi?id=193891#c102
Cc: Johannes Stezenbach <js@sig21.net>
Cc: Carlo Caione <carlo@endlessm.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/net/ethernet/realtek/r8169.c | 33 ++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
index eaedc11ed686..779b02979493 100644
--- a/drivers/net/ethernet/realtek/r8169.c
+++ b/drivers/net/ethernet/realtek/r8169.c
@@ -13,6 +13,7 @@
 #include <linux/pci.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
+#include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/ethtool.h>
 #include <linux/mii.h>
@@ -765,6 +766,7 @@ struct rtl8169_private {
 
 	u16 event_slow;
 	const struct rtl_coalesce_info *coalesce_info;
+	struct clk *clk;
 
 	struct mdio_ops {
 		void (*write)(struct rtl8169_private *, int, int);
@@ -7614,6 +7616,11 @@ static void rtl_hw_initialize(struct rtl8169_private *tp)
 	}
 }
 
+static void rtl_disable_clk(void *data)
+{
+	clk_disable_unprepare(data);
+}
+
 static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 {
 	const struct rtl_cfg_info *cfg = rtl_cfg_infos + ent->driver_data;
@@ -7647,6 +7654,32 @@ static int rtl_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)
 	mii->reg_num_mask = 0x1f;
 	mii->supports_gmii = cfg->has_gmii;
 
+	/* Get the *optional* external "ether_clk" used on some boards */
+	tp->clk = devm_clk_get(&pdev->dev, "ether_clk");
+	if (IS_ERR(tp->clk)) {
+		rc = PTR_ERR(tp->clk);
+		if (rc == -ENOENT) {
+			/* clk-core allows NULL (for suspend / resume) */
+			tp->clk = NULL;
+		} else if (rc == -EPROBE_DEFER) {
+			return rc;
+		} else {
+			dev_err(&pdev->dev, "failed to get clk: %d\n", rc);
+			return rc;
+		}
+	} else {
+		rc = clk_prepare_enable(tp->clk);
+		if (rc) {
+			dev_err(&pdev->dev, "failed to enable clk: %d\n", rc);
+			return rc;
+		}
+
+		rc = devm_add_action_or_reset(&pdev->dev, rtl_disable_clk,
+					      tp->clk);
+		if (rc)
+			return rc;
+	}
+
 	/* disable ASPM completely as that cause random device stop working
 	 * problems as well as full system hangs for some PCIe devices users */
 	pci_disable_link_state(pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1 |
-- 
2.18.0
