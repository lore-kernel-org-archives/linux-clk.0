Return-Path: <sebastien.szymanski@armadeus.com>
From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
To: Shawn Guo <shawn.guo@linaro.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Subject: [PATCH 1/1] ARM: clk-imx6q: refine sata's parent
Date: Wed, 20 May 2015 16:30:37 +0200
Message-Id: <1432132237-31004-1-git-send-email-sebastien.szymanski@armadeus.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

According to IMX6D/Q RM, table 18-3, sata clock's parent is ahb, not ipg.

This patch is based on branch:
git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git imx/soc

Signed-off-by: Sébastien Szymanski <sebastien.szymanski@armadeus.com>
---
 drivers/clk/imx/clk-imx6q.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
index 128f887..d046f8e 100644
--- a/drivers/clk/imx/clk-imx6q.c
+++ b/drivers/clk/imx/clk-imx6q.c
@@ -450,7 +450,7 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
 	clk[IMX6QDL_CLK_GPMI_IO]      = imx_clk_gate2("gpmi_io",       "enfc",              base + 0x78, 28);
 	clk[IMX6QDL_CLK_GPMI_APB]     = imx_clk_gate2("gpmi_apb",      "usdhc3",            base + 0x78, 30);
 	clk[IMX6QDL_CLK_ROM]          = imx_clk_gate2("rom",           "ahb",               base + 0x7c, 0);
-	clk[IMX6QDL_CLK_SATA]         = imx_clk_gate2("sata",          "ipg",               base + 0x7c, 4);
+	clk[IMX6QDL_CLK_SATA]         = imx_clk_gate2("sata",          "ahb",               base + 0x7c, 4);
 	clk[IMX6QDL_CLK_SDMA]         = imx_clk_gate2("sdma",          "ahb",               base + 0x7c, 6);
 	clk[IMX6QDL_CLK_SPBA]         = imx_clk_gate2("spba",          "ipg",               base + 0x7c, 12);
 	clk[IMX6QDL_CLK_SPDIF]        = imx_clk_gate2("spdif",         "spdif_podf",        base + 0x7c, 14);
-- 
2.0.5
