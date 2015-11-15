Return-Path: <michael@amarulasolutions.com>
Return-Path: <michael@amarulasolutions.com>
Date: Sun, 15 Nov 2015 11:38:04 +0100
From: Michael Trimarchi <michael@amarulasolutions.com>
To: shawnguo@kernel.org
Cc: kernel@pengutronix.de, mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2] clk: imx: clk-imx6q: Let OSC to be routed to anaclk2/2b
Message-ID: <20151115103800.GB9808@panicking>
References: <1446991642-3088-1-git-send-email-michael@amarulasolutions.com>
 <20151115101938.GA9808@panicking>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151115101938.GA9808@panicking>
List-ID: <linux-clk.vger.kernel.org>

OSC can be used as USB hub source clock. An example we can route to
CLK2_P imx6 pin.

This show a usage example:

[...]
	usb_hub: usb-hub {
		compatible = "smsc,usb3503a";
		clocks = <&clks IMX6QDL_CLK_LVDS2_GATE>;
		clock-names = "refclk";
	};
};

[...]
&clks {
        assigned-clocks = <&clks IMX6QDL_CLK_LVDS2_SEL>;
        assigned-clock-parents = <&clks IMX6QDL_CLK_OSC>;
};

/sys/kernel/debug/clk/clk_summary

osc                                 5            5    24000000          0 0
[...]
    lvds2_sel                       1            1    24000000          0 0
       lvds2_gate                   1            1    24000000          0 0
[...]

Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
---
Changes in v2:
	- rework the commit message to give a better description

 drivers/clk/imx/clk-imx6q.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index b2c1c04..8fe0015 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -70,7 +70,8 @@ static const char *cko_sels[] = { "cko1", "cko2", };
 static const char *lvds_sels[] = {
 	"dummy", "dummy", "dummy", "dummy", "dummy", "dummy",
 	"pll4_audio", "pll5_video", "pll8_mlb", "enet_ref",
-	"pcie_ref_125m", "sata_ref_100m",
+	"pcie_ref_125m", "sata_ref_100m",  "usbphy1", "usbphy2",
+	"dummy", "dummy", "dummy", "dummy", "osc",
 };
 static const char *pll_bypass_src_sels[] = { "osc", "lvds1_in", "lvds2_in", "dummy", };
 static const char *pll1_bypass_sels[] = { "pll1", "pll1_bypass_src", };
-- 
2.6.3
