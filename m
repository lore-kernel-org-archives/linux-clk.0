Return-Path: <guodong.xu@linaro.org>
Return-Path: <guodong.xu@linaro.org>
From: Guodong Xu <guodong.xu@linaro.org>
To: mturquette@baylibre.com,
	sboyd@codeaurora.org,
	jorge.ramirez-ortiz@linaro.org,
	xinliang.liu@linaro.org,
	guodong.xu@linaro.org,
	john.stultz@linaro.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 1/2] clk: hi6220: Change syspll and media_syspll clk to 1.19GHz
Date: Tue, 28 Jun 2016 18:31:41 +0800
Message-Id: <1467109902-17625-1-git-send-email-guodong.xu@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

From: Xinliang Liu <xinliang.liu@linaro.org>

In the bootloader of HiKey/96boards, syspll and media_syspll clk
was initialized to 1.19GHz. So, here changes it in kernel accordingly.

1.19GHz was chosen over 1.2GHz because at 1.19GHz we get more precise
HDMI pixel clock (1.19G/16 = 74.4MHz) for 1280x720p@60Hz HDMI
(74.25MHz required by standards). Closer pixel clock means better
compatibility to HDMI monitors.

Signed-off-by: Guodong Xu <guodong.xu@linaro.org>
Signed-off-by: Xinliang Liu <xinliang.liu@linaro.org>
---
 drivers/clk/hisilicon/clk-hi6220.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/hisilicon/clk-hi6220.c b/drivers/clk/hisilicon/clk-hi6220.c
index f02cb41..a36ffcb 100644
--- a/drivers/clk/hisilicon/clk-hi6220.c
+++ b/drivers/clk/hisilicon/clk-hi6220.c
@@ -34,8 +34,8 @@ static struct hisi_fixed_rate_clock hi6220_fixed_rate_clks[] __initdata = {
 	{ HI6220_PLL_BBP,	"bbppll0",	NULL, 0, 245760000, },
 	{ HI6220_PLL_GPU,	"gpupll",	NULL, 0, 1000000000,},
 	{ HI6220_PLL1_DDR,	"ddrpll1",	NULL, 0, 1066000000,},
-	{ HI6220_PLL_SYS,	"syspll",	NULL, 0, 1200000000,},
-	{ HI6220_PLL_SYS_MEDIA,	"media_syspll",	NULL, 0, 1200000000,},
+	{ HI6220_PLL_SYS,	"syspll",	NULL, 0, 1190400000,},
+	{ HI6220_PLL_SYS_MEDIA,	"media_syspll",	NULL, 0, 1190400000,},
 	{ HI6220_DDR_SRC,	"ddr_sel_src",  NULL, 0, 1200000000,},
 	{ HI6220_PLL_MEDIA,	"media_pll",    NULL, 0, 1440000000,},
 	{ HI6220_PLL_DDR,	"ddrpll0",      NULL, 0, 1600000000,},
-- 
1.9.1
