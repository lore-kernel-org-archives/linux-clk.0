Return-Path: <geert@linux-m68k.org>
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 2/3] clk: renesas: mstp: Provide dummy attach/detach_dev callbacks
Date: Wed, 13 Apr 2016 16:44:16 +0200
Message-Id: <1460558657-10128-3-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1460558657-10128-1-git-send-email-geert+renesas@glider.be>
References: <1460558657-10128-1-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

Provide dummy cpg_mstp_{at,de}tach_dev() PM Domain callbacks if CPG/MSTP
support is not included, so the rcar-sysc driver won't have to care
about this.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - New.
---
 include/linux/clk/renesas.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/linux/clk/renesas.h b/include/linux/clk/renesas.h
index 095b1681daf46faf..ab57a298a3740c5c 100644
--- a/include/linux/clk/renesas.h
+++ b/include/linux/clk/renesas.h
@@ -25,7 +25,12 @@ void r8a7779_clocks_init(u32 mode);
 void rcar_gen2_clocks_init(u32 mode);
 
 void cpg_mstp_add_clk_domain(struct device_node *np);
+#ifdef CONFIG_CLK_RENESAS_CPG_MSTP
 int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev);
 void cpg_mstp_detach_dev(struct generic_pm_domain *unused, struct device *dev);
+#else
+#define cpg_mstp_attach_dev	NULL
+#define cpg_mstp_detach_dev	NULL
+#endif
 
 #endif
-- 
1.9.1
