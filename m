Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.rapiddevelopmentkit.de ([217.6.246.34]:34502 "EHLO
	root.phytec.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964834AbcFMHsX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Mon, 13 Jun 2016 03:48:23 -0400
From: Wadim Egorov <w.egorov@phytec.de>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com,
	sboyd@codeaurora.org, lee.jones@linaro.org, lgirdwood@gmail.com,
	broonie@kernel.org, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com
Subject: [PATCH v6 4/5] clk: Kconfig: Name RK818 in Kconfig for COMMON_CLK_RK808
Date: Mon, 13 Jun 2016 09:46:28 +0200
Message-Id: <1465803989-33632-4-git-send-email-w.egorov@phytec.de>
In-Reply-To: <1465803989-33632-1-git-send-email-w.egorov@phytec.de>
References: <1465803989-33632-1-git-send-email-w.egorov@phytec.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The RK808 and RK818 PMICs are using a similar register map.
We can reuse the clk driver for the RK818 PMIC. So let's add
the RK818 in the Kconfig description.

Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
Acked-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 53ddba2..87b9fd2 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -49,10 +49,10 @@ config COMMON_CLK_MAX77802
 	  This driver supports Maxim 77802 crystal oscillator clock.
 
 config COMMON_CLK_RK808
-	tristate "Clock driver for RK808"
+	tristate "Clock driver for RK808/RK818"
 	depends on MFD_RK808
 	---help---
-	  This driver supports RK808 crystal oscillator clock. These
+	  This driver supports RK808 and RK818 crystal oscillator clock. These
 	  multi-function devices have two fixed-rate oscillators,
 	  clocked at 32KHz each. Clkout1 is always on, Clkout2 can off
 	  by control register.
-- 
1.9.1

