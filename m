Return-Path: <>
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: <mturquette@baylibre.com>, <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>
CC: <geert+renesas@glider.be>, <linux-renesas-soc@vger.kernel.org>, Yoshihiro
 Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH] clk: shmobile: r8a7795: Add USB-DMAC clocks
Date: Mon, 1 Feb 2016 19:27:52 +0900
Message-ID: <1454322472-6696-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
---
 This patch is based on the renesas-drivers.git /
 renesas-devel-20160126-v4.5-rc1 tag.
 (commit id = f834955ea55e4bed01d55339a4428eef219e8313)

 Reference:
 http://thread.gmane.org/gmane.linux.kernel.clk/3337/focus=184

 drivers/clk/shmobile/r8a7795-cpg-mssr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/shmobile/r8a7795-cpg-mssr.c b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
index fc260b3..13d59d1 100644
--- a/drivers/clk/shmobile/r8a7795-cpg-mssr.c
+++ b/drivers/clk/shmobile/r8a7795-cpg-mssr.c
@@ -124,6 +124,8 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("pcie0",		 319,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb3-if1",		 327,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
+	DEF_MOD("usb-dmac0",		 330,	R8A7795_CLK_S3D2),
+	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D2),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
 	DEF_MOD("audmac1",		 501,	R8A7795_CLK_S3D4),
-- 
1.9.1
