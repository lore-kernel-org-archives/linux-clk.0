Return-Path: <xuejiancheng@hisilicon.com>
From: Jiancheng Xue <xuejiancheng@hisilicon.com>
To: <sboyd@codeaurora.org>, <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <hermit.wangheming@hisilicon.com>, <shawn.guo@linaro.org>,
        <project-aspen-dev@linaro.org>,
        Younian Wang <wangyounian@hisilicon.com>
Subject: [PATCH 3/3] clk: hisilicon: correct ir clock rate for hi3798cv200 SoC
Date: Wed, 18 Oct 2017 07:00:29 -0400
Message-ID: <1508324429-6012-4-git-send-email-xuejiancheng@hisilicon.com>
In-Reply-To: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
References: <1508324429-6012-1-git-send-email-xuejiancheng@hisilicon.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Younian Wang <wangyounian@hisilicon.com>

Correct ir clock rate for hi3798cv200 SoC.

Signed-off-by: Younian Wang <wangyounian@hisilicon.com>
---
 drivers/clk/hisilicon/crg-hi3798cv200.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/hisilicon/crg-hi3798cv200.c b/drivers/clk/hisilicon/crg-hi3798cv200.c
index 25d750c..61bd941 100644
--- a/drivers/clk/hisilicon/crg-hi3798cv200.c
+++ b/drivers/clk/hisilicon/crg-hi3798cv200.c
@@ -258,7 +258,7 @@ static const struct hisi_crg_funcs hi3798cv200_crg_funcs = {
 #define HI3798CV200_SYSCTRL_NR_CLKS 16
 
 static const struct hisi_gate_clock hi3798cv200_sysctrl_gate_clks[] = {
-	{ HISTB_IR_CLK, "clk_ir", "100m",
+	{ HISTB_IR_CLK, "clk_ir", "24m",
 		CLK_SET_RATE_PARENT, 0x48, 4, 0, },
 	{ HISTB_TIMER01_CLK, "clk_timer01", "24m",
 		CLK_SET_RATE_PARENT, 0x48, 6, 0, },
-- 
2.7.4
