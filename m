Return-Path: <ore@pengutronix.de>
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	devicetree@vger.kernel.org,
	Fabio Estevam <fabio.estevam@nxp.com>,
	kernel@pengutronix.de,
	Liam Girdwood <lgirdwood@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Leonard Crestez <leonard.crestez@nxp.com>
Cc: Oleksij Rempel <o.rempel@pengutronix.de>
Subject: [PATCH v6 3/6] kernel/reboot.c: export pm_power_off_prepare
Date: Tue, 20 Jun 2017 16:09:07 +0200
Message-Id: <20170620140910.7568-4-o.rempel@pengutronix.de>
In-Reply-To: <20170620140910.7568-1-o.rempel@pengutronix.de>
References: <20170620140910.7568-1-o.rempel@pengutronix.de>
List-ID: <linux-clk.vger.kernel.org>

Export pm_power_off_prepare. It is needed to implement power off on
Freescale/NXP iMX6 based boards with external power management
integrated circuit (PMIC).

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
---
 kernel/reboot.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index bd30a973fe94..a6903bf772c7 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -49,6 +49,7 @@ int reboot_force;
  */
 
 void (*pm_power_off_prepare)(void);
+EXPORT_SYMBOL(pm_power_off_prepare);
 
 /**
  *	emergency_restart - reboot the system
-- 
2.11.0
