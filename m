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
Subject: [PATCH 4/4] RFC: r8169: Disable clk during suspend / resume
Date: Mon, 27 Aug 2018 16:32:00 +0200
Message-Id: <20180827143200.8597-5-hdegoede@redhat.com>
In-Reply-To: <20180827143200.8597-1-hdegoede@redhat.com>
References: <20180827143200.8597-1-hdegoede@redhat.com>
List-ID: <linux-clk.vger.kernel.org>

Disable the clk during suspend to save power. Note that tp->clk may be
NULL, the clk core functions handle this without problems.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/net/ethernet/realtek/r8169.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/ethernet/realtek/r8169.c b/drivers/net/ethernet/realtek/r8169.c
index 779b02979493..aebc90158bd9 100644
--- a/drivers/net/ethernet/realtek/r8169.c
+++ b/drivers/net/ethernet/realtek/r8169.c
@@ -7312,8 +7312,10 @@ static int rtl8169_suspend(struct device *device)
 {
 	struct pci_dev *pdev = to_pci_dev(device);
 	struct net_device *dev = pci_get_drvdata(pdev);
+	struct rtl8169_private *tp = netdev_priv(dev);
 
 	rtl8169_net_suspend(dev);
+	clk_disable_unprepare(tp->clk);
 
 	return 0;
 }
@@ -7340,6 +7342,7 @@ static int rtl8169_resume(struct device *device)
 	struct net_device *dev = pci_get_drvdata(pdev);
 	struct rtl8169_private *tp = netdev_priv(dev);
 
+	clk_prepare_enable(tp->clk);
 	rtl8169_init_phy(dev, tp);
 
 	if (netif_running(dev))
-- 
2.18.0
