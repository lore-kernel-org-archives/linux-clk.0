Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Wadim Egorov <w.egorov@phytec.de>
To: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	lee.jones@linaro.org, lgirdwood@gmail.com, broonie@kernel.org,
	a.zummo@towertech.it, alexandre.belloni@free-electrons.com,
	dianders@chromium.org, zyw@rock-chips.com
Subject: [RESEND PATCH v5 4/5] clk: Kconfig: Name RK818 in Kconfig for COMMON_CLK_RK808
Date: Thu, 2 Jun 2016 08:50:27 +0200
Message-Id: <1464850228-17244-4-git-send-email-w.egorov@phytec.de>
In-Reply-To: <1464850228-17244-1-git-send-email-w.egorov@phytec.de>
References: <1464850228-17244-1-git-send-email-w.egorov@phytec.de>
Sender: linux-kernel-owner@vger.kernel.org
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
