Return-Path: <repk@triplefau.lt>
From: Remi Pommarel <repk@triplefau.lt>
To: Stephen Warren <swarren@wwwdotorg.org>,
	Lee Jones <lee@kernel.org>,
	Eric Anholt <eric@anholt.net>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH 2/2] clk: bcm2835: Add PWM clock support
Date: Thu,  5 Nov 2015 00:08:22 +0100
Message-Id: <1446678502-16243-3-git-send-email-repk@triplefau.lt>
In-Reply-To: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
References: <1446678502-16243-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Register the pwm clock for bcm2835.
This patch also adds the ability to set a clock default rate.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 arch/arm/boot/dts/bcm2835.dtsi      |  8 ++++++++
 drivers/clk/bcm/clk-bcm2835.c       | 28 +++++++++++++++++++++++++++-
 include/dt-bindings/clock/bcm2835.h |  3 ++-
 3 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/bcm2835.dtsi b/arch/arm/boot/dts/bcm2835.dtsi
index aef64de..0736de3 100644
--- a/arch/arm/boot/dts/bcm2835.dtsi
+++ b/arch/arm/boot/dts/bcm2835.dtsi
@@ -177,6 +177,14 @@
 			status = "disabled";
 		};
 
+		pwm: pwm@7e20c000 {
+			compatible = "brcm,bcm2835-pwm";
+			reg = <0x7e20c000 0x28>;
+			clocks = <&clocks BCM2835_CLOCK_PWM>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+		};
+
 		usb@7e980000 {
 			compatible = "brcm,bcm2835-usb";
 			reg = <0x7e980000 0x10000>;
diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 9469729..0647118 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -39,6 +39,7 @@
 
 #include <linux/clk-provider.h>
 #include <linux/clkdev.h>
+#include <linux/clk.h>
 #include <linux/clk/bcm2835.h>
 #include <linux/module.h>
 #include <linux/of.h>
@@ -625,6 +626,8 @@ struct bcm2835_clock_data {
 	const char *const *parents;
 	int num_mux_parents;
 
+	unsigned long dft_rate;
+
 	u32 ctl_reg;
 	u32 div_reg;
 
@@ -807,6 +810,17 @@ static const struct bcm2835_clock_data bcm2835_clock_emmc_data = {
 	.frac_bits = 8,
 };
 
+static const struct bcm2835_clock_data bcm2835_clock_pwm_data = {
+	.name = "pwm",
+	.num_mux_parents = ARRAY_SIZE(bcm2835_clock_per_parents),
+	.parents = bcm2835_clock_per_parents,
+	.dft_rate = 9600000,
+	.ctl_reg = CM_PWMCTL,
+	.div_reg = CM_PWMDIV,
+	.int_bits = 12,
+	.frac_bits = 12,
+};
+
 struct bcm2835_pll {
 	struct clk_hw hw;
 	struct bcm2835_cprman *cprman;
@@ -1440,6 +1454,7 @@ bcm2835_register_pll_divider(struct bcm2835_cprman *cprman,
 static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
 					  const struct bcm2835_clock_data *data)
 {
+	struct clk *ret;
 	struct bcm2835_clock *clock;
 	struct clk_init_data init;
 	const char *parents[1 << CM_SRC_BITS];
@@ -1477,7 +1492,15 @@ static struct clk *bcm2835_register_clock(struct bcm2835_cprman *cprman,
 	clock->data = data;
 	clock->hw.init = &init;
 
-	return devm_clk_register(cprman->dev, &clock->hw);
+	ret = devm_clk_register(cprman->dev, &clock->hw);
+	if (IS_ERR(ret))
+		goto out;
+
+	if (data->dft_rate)
+		clk_set_rate(ret, data->dft_rate);
+
+out:
+	return ret;
 }
 
 static int bcm2835_clk_probe(struct platform_device *pdev)
@@ -1576,6 +1599,9 @@ static int bcm2835_clk_probe(struct platform_device *pdev)
 				  cprman->regs + CM_PERIICTL, CM_GATE_BIT,
 				  0, &cprman->regs_lock);
 
+	clks[BCM2835_CLOCK_PWM] =
+		bcm2835_register_clock(cprman, &bcm2835_clock_pwm_data);
+
 	return of_clk_add_provider(dev->of_node, of_clk_src_onecell_get,
 				   &cprman->onecell);
 }
diff --git a/include/dt-bindings/clock/bcm2835.h b/include/dt-bindings/clock/bcm2835.h
index d323efa..61f1d20 100644
--- a/include/dt-bindings/clock/bcm2835.h
+++ b/include/dt-bindings/clock/bcm2835.h
@@ -43,5 +43,6 @@
 #define BCM2835_CLOCK_TSENS		27
 #define BCM2835_CLOCK_EMMC		28
 #define BCM2835_CLOCK_PERI_IMAGE	29
+#define BCM2835_CLOCK_PWM		30
 
-#define BCM2835_CLOCK_COUNT		30
+#define BCM2835_CLOCK_COUNT		31
-- 
2.0.1
