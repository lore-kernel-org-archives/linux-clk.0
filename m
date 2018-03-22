Return-Path: <fengguang.wu@intel.com>
Date: Thu, 22 Mar 2018 15:42:18 +0800
From: kbuild test robot <lkp@intel.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: kbuild-all@01.org, Maxime Ripard <maxime.ripard@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	Corentin Labbe <clabbe.montjoie@gmail.com>,
	Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH] net: stmmac: dwmac-sun8i: sun8i_syscon_reg_field can be
 static
Message-ID: <20180322074217.GA7358@ivytown2.lkp.intel.com>
References: <20180317092857.4396-7-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180317092857.4396-7-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


Fixes: e3c10deef23c ("net: stmmac: dwmac-sun8i: Use regmap_field for syscon register access")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 dwmac-sun8i.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index de93f0f..bbc0514 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -79,7 +79,7 @@ struct sunxi_priv_data {
 };
 
 /* EMAC clock register @ 0x30 in the "system control" address range */
-const struct reg_field sun8i_syscon_reg_field = {
+static const struct reg_field sun8i_syscon_reg_field = {
 	.reg = 0x30,
 	.lsb = 0,
 	.msb = 31,
