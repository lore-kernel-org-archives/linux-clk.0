Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Kevin Hilman <khilman@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-pm@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] clk: renesas: cpg-mssr: Keep wakeup sources active during system suspend
Date: Thu,  9 Nov 2017 14:27:01 +0100
Message-Id: <1510234022-29442-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1510234022-29442-1-git-send-email-geert+renesas@glider.be>
References: <1510234022-29442-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

If a device is part of the CPG/MSSR Clock Domain and to be used as a
wakeup source, it must be kept active during system suspend.

Currently this is handled in device-specific drivers by explicitly
increasing the use count of the module clock when the device is
configured as a wakeup source.  However, the proper way to prevent the
device from being stopped is to inform this requirement to the genpd
core, by setting the GENPD_FLAG_ACTIVE_WAKEUP flag.

Note that this will only affect devices configured as wakeup sources.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Integrate "clk: renesas: cpg-mssr: Use GENPD_FLAG_ACTIVE_WAKEUP",
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index e580a5e6346c2533..99699b715d7cf2de 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -500,7 +500,7 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
 
 	genpd = &pd->genpd;
 	genpd->name = np->name;
-	genpd->flags = GENPD_FLAG_PM_CLK;
+	genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = cpg_mssr_attach_dev;
 	genpd->detach_dev = cpg_mssr_detach_dev;
 	pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
-- 
2.7.4
