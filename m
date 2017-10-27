Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 03/10] clk: sunxi-ng: fix the A64/H5 clock description of
 DE2 CCU
Date: Fri, 27 Oct 2017 23:06:51 +0800
Message-Id: <20171027150658.18509-4-icenowy@aosc.io>
In-Reply-To: <20171027150658.18509-1-icenowy@aosc.io>
References: <20171027150658.18509-1-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-sunxi@googlegroups.com,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Icenowy Zheng <icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>

The clocks of A64/H5 SoCs in the DE2 CCU is the same as the clocks in H3
DE2 CCU rather than the A83T DE2 CCU (the parent of them is the DE
module clock).

Fix this by change the clock descriptions to use the clocks of H3.

Fixes: 763c5bd045b1 ("clk: sunxi-ng: add support for DE2 CCU")
Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clk/sunxi-ng/ccu-sun8i-de2.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
index 2db5d4e00ea7..468d1abaf0ee 100644
--- a/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
+++ b/drivers/clk/sunxi-ng/ccu-sun8i-de2.c
@@ -177,10 +177,10 @@ static const struct sunxi_ccu_desc sun8i_h3_de2_clk_desc = {
 };
 
 static const struct sunxi_ccu_desc sun50i_a64_de2_clk_desc = {
-	.ccu_clks	= sun8i_a83t_de2_clks,
-	.num_ccu_clks	= ARRAY_SIZE(sun8i_a83t_de2_clks),
+	.ccu_clks	= sun8i_h3_de2_clks,
+	.num_ccu_clks	= ARRAY_SIZE(sun8i_h3_de2_clks),
 
-	.hw_clks	= &sun8i_a83t_de2_hw_clks,
+	.hw_clks	= &sun8i_h3_de2_hw_clks,
 
 	.resets		= sun50i_a64_de2_resets,
 	.num_resets	= ARRAY_SIZE(sun50i_a64_de2_resets),
-- 
2.13.6


_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
