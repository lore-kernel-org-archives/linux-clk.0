Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
CC: <geert+renesas@glider.be>, <linux-renesas-soc@vger.kernel.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: shmobile: r8a7795: Add USB3.0 clocks
Date: Fri, 22 Jan 2016 19:02:29 +0900
Message-ID: <1453456949-9840-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the latest clk.git / clk-next branch.
 (commit id = 3da834e3e5a4a5d26882955298b55a9ed37a00bc)

 drivers/clk/shmobile/r8a7795-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
index 13e9947..fc260b3 100644
--- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
+++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
@@ -122,6 +122,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("scif2",		 310,	R8A7795_CLK_S3D4),
 	DEF_MOD("pcie1",		 318,	R8A7795_CLK_S3D1),
 	DEF_MOD("pcie0",		 319,	R8A7795_CLK_S3D1),
+	DEF_MOD("usb3-if1",		 327,	R8A7795_CLK_S3D1),
+	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D4),
-- 
1.9.1
