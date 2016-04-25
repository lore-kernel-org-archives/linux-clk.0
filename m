Return-Path: <yuantian.tang@nxp.com>
From: <yuantian.tang@nxp.com>
To: <mturquette@baylibre.com>
CC: <sboyd@codeaurora.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <scottwood@nxp.com>, Tang Yuantian
	<Yuantian.Tang@nxp.com>, Tang Yuantian <yuantian.tang@nxp.com>
Subject: [PATCH] clk: qoriq: added the third frequency support on ls1021a
Date: Mon, 25 Apr 2016 14:41:50 +0800
Message-ID: <1461566510-49107-1-git-send-email-yuantian.tang@nxp.com>
Return-Path: yuantian.tang@nxp.com
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

From: Tang Yuantian <Yuantian.Tang@nxp.com>

ls1021a CPU can work on three different clock frequency.
Currently, the third one is missing. This patch added it.

Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>
---
 drivers/clk/clk-qoriq.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 7bc1c45..2a9d952 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -194,6 +194,14 @@ static const struct clockgen_muxinfo t1023_cmux = {
 	}
 };
 
+static const struct clockgen_muxinfo ls1021a_cmux = {
+	{
+		[0] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
+		[1] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },
+		[2] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV4 },
+	}
+};
+
 static const struct clockgen_muxinfo t1040_cmux = {
 	{
 		[0] = { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },
@@ -466,7 +474,7 @@ static const struct clockgen_chipinfo chipinfo[] = {
 	{
 		.compat = "fsl,ls1021a-clockgen",
 		.cmux_groups = {
-			&t1023_cmux
+			&ls1021a_cmux
 		},
 		.cmux_to_group = {
 			0, -1
-- 
2.1.0.27.g96db324
