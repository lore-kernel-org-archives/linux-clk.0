Return-Path: <khiem.nguyen.xt@rvc.renesas.com>
Subject: [RFC 3/4] clk: renesas: r8a7796: Add Z clock
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
 <573166EB.70908@rvc.renesas.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus
 Damm <damm+renesas@opensource.se>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <5731672B.9040204@rvc.renesas.com>
Date: Tue, 10 May 2016 11:44:27 +0700
MIME-Version: 1.0
In-Reply-To: <573166EB.70908@rvc.renesas.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
  drivers/clk/renesas/r8a7796-cpg-mssr.c | 2 ++
  1 file changed, 2 insertions(+)

diff --git a/drivers/clk/renesas/r8a7796-cpg-mssr.c 
b/drivers/clk/renesas/r8a7796-cpg-mssr.c
index c84b549..7368805 100644
--- a/drivers/clk/renesas/r8a7796-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7796-cpg-mssr.c
@@ -94,6 +94,8 @@ static const struct cpg_core_clk r8a7796_core_clks[] 
__initconst = {

  	DEF_FIXED("cl",         R8A7796_CLK_CL,    CLK_PLL1_DIV2, 48, 1),
  	DEF_FIXED("cp",         R8A7796_CLK_CP,    CLK_EXTAL,      2, 1),
+
+	DEF_BASE("z",           R8A7795_CLK_Z,   CLK_TYPE_GEN3_Z,   CLK_PLL0),
  };

  static const struct mssr_mod_clk r8a7796_mod_clks[] __initconst = {
-- 
1.9.1
