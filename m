Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Jernej Skrabec <jernej.skrabec@siol.net>
To: maxime.ripard@bootlin.com,
	wens@csie.org,
	robh+dt@kernel.org
Subject: [PATCH v2 02/27] clk: sunxi-ng: r40: Allow setting parent rate to
 display related clocks
Date: Tue, 12 Jun 2018 22:00:11 +0200
Message-Id: <20180612200036.21483-3-jernej.skrabec@siol.net>
In-Reply-To: <20180612200036.21483-1-jernej.skrabec@siol.net>
References: <20180612200036.21483-1-jernej.skrabec@siol.net>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, airlied@linux.ie,
 gustavo@padovan.org, maarten.lankhorst@linux.intel.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-sunxi@googlegroups.com, seanpaul@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

Display related peripherals need precise clocks to operate correctly.

Allow DE2, TCONs and HDMI to set parent clock.

Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
---
 drivers/clk/sunxi-ng/ccu-sun8i-r40.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
index c16a62a7bdbd..fa5317719684 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-r40.c
@@ -655,7 +655,8 @@ static SUNXI_CCU_GATE(dram_deinterlace_clk,	"dram-deinterlace",	"dram",
 
 static const char * const de_parents[] = { "pll-periph0-2x", "pll-de" };
 static SUNXI_CCU_M_WITH_MUX_GATE(de_clk, "de", de_parents,
-				 0x104, 0, 4, 24, 3, BIT(31), 0);
+				 0x104, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M_WITH_MUX_GATE(mp_clk, "mp", de_parents,
 				 0x108, 0, 4, 24, 3, BIT(31), 0);
 
@@ -667,9 +668,11 @@ static SUNXI_CCU_MUX_WITH_GATE(tcon_lcd0_clk, "tcon-lcd0", tcon_parents,
 static SUNXI_CCU_MUX_WITH_GATE(tcon_lcd1_clk, "tcon-lcd1", tcon_parents,
 			       0x114, 24, 3, BIT(31), CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_tv0_clk, "tcon-tv0", tcon_parents,
-				 0x118, 0, 4, 24, 3, BIT(31), 0);
+				 0x118, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_PARENT);
 static SUNXI_CCU_M_WITH_MUX_GATE(tcon_tv1_clk, "tcon-tv1", tcon_parents,
-				 0x11c, 0, 4, 24, 3, BIT(31), 0);
+				 0x11c, 0, 4, 24, 3, BIT(31),
+				 CLK_SET_RATE_PARENT);
 
 static const char * const deinterlace_parents[] = { "pll-periph0",
 						    "pll-periph1" };
@@ -699,7 +702,8 @@ static SUNXI_CCU_GATE(avs_clk,		"avs",		"osc24M",
 
 static const char * const hdmi_parents[] = { "pll-video0", "pll-video1" };
 static SUNXI_CCU_M_WITH_MUX_GATE(hdmi_clk, "hdmi", hdmi_parents,
-				 0x150, 0, 4, 24, 2, BIT(31), 0);
+				 0x150, 0, 4, 24, 2, BIT(31),
+				 CLK_SET_RATE_PARENT);
 
 static SUNXI_CCU_GATE(hdmi_slow_clk,	"hdmi-slow",	"osc24M",
 		      0x154, BIT(31), 0);
-- 
2.17.1


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
