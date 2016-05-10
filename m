Return-Path: <khiem.nguyen.xt@rvc.renesas.com>
Subject: [RFC 2/4] clk: renesas: r8a7795: Add Z clock
To: Geert Uytterhoeven <geert+renesas@glider.be>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@codeaurora.org>, Simon Horman <horms+renesas@verge.net.au>, Magnus
 Damm <damm+renesas@opensource.se>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Toru Oishi <toru.oishi.zj@rvc.renesas.com>,
	"Khiem Trong. Nguyen" <khiem.nguyen.xt@rvc.renesas.com>
From: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
Message-ID: <573166EB.70908@rvc.renesas.com>
Date: Tue, 10 May 2016 11:43:23 +0700
MIME-Version: 1.0
In-Reply-To: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="windows-1252"; format=flowed
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Khiem Nguyen <khiem.nguyen.xt@rvc.renesas.com>
---
  drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
  1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c 
b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index e53aff5..4120506 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -104,6 +104,7 @@ static const struct cpg_core_clk r8a7795_core_clks[] 
__initconst = {
  	DEF_DIV6_RO("r_int",    CLK_RINT,          CLK_EXTAL, CPG_RCKCR, 32),

  	DEF_BASE("r",           R8A7795_CLK_R, CLK_TYPE_GEN3_R, CLK_RINT),
+	DEF_BASE("z",           R8A7795_CLK_Z,   CLK_TYPE_GEN3_Z,   CLK_PLL0),
  };

  static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
-- 
1.9.1
