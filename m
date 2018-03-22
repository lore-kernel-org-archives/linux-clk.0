Return-Path: <fengguang.wu@intel.com>
Date: Thu, 22 Mar 2018 16:41:52 +0800
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
Subject: [RFC PATCH] net: stmmac: dwmac-sun8i: sun8i_ccu_reg_field can be
 static
Message-ID: <20180322084152.GA79138@ivytown2.lkp.intel.com>
References: <20180317092857.4396-10-wens@csie.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20180317092857.4396-10-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


Fixes: 0e59c15b2797 ("net: stmmac: dwmac-sun8i: Add support for GMAC on Allwinner R40 SoC")
Signed-off-by: Fengguang Wu <fengguang.wu@intel.com>
---
 dwmac-sun8i.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index be6705e8..622fb2b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -98,7 +98,7 @@ const struct reg_field sun8i_syscon_reg_field = {
 };
 
 /* EMAC clock register @ 0x164 in the CCU address range */
-const struct reg_field sun8i_ccu_reg_field = {
+static const struct reg_field sun8i_ccu_reg_field = {
 	.reg = 0x164,
 	.lsb = 0,
 	.msb = 31,
