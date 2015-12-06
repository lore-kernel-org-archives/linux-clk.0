Return-Path: <repk@triplefau.lt>
From: Remi Pommarel <repk@triplefau.lt>
To: Stephen Warren <swarren@wwwdotorg.org>,
	Eric Anholt <eric@anholt.net>,
	Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Remi Pommarel <repk@triplefau.lt>
Subject: [PATCH v3 3/4] clk: bcm2835: Add PWM clock support
Date: Sun,  6 Dec 2015 17:22:48 +0100
Message-Id: <1449418969-5565-4-git-send-email-repk@triplefau.lt>
In-Reply-To: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt>
List-ID: <linux-clk.vger.kernel.org>

Register the pwm clock for bcm2835.

Signed-off-by: Remi Pommarel <repk@triplefau.lt>
---
 drivers/clk/bcm/clk-bcm2835.c       | 13 +++++++++++++
 include/dt-bindings/clock/bcm2835.h |  3 ++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 6e4dd6f..015e687 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -807,6 +807,16 @@ static const struct bcm2835_clock_data bcm2835_clock_emmc_data = {
 	.frac_bits = 8,
 };
 
+static const struct bcm2835_clock_data bcm2835_clock_pwm_data = {
+	.name = "pwm",
+	.num_mux_parents = ARRAY_SIZE(bcm2835_clock_per_parents),
+	.parents = bcm2835_clock_per_parents,
+	.ctl_reg = CM_PWMCTL,
+	.div_reg = CM_PWMDIV,
+	.int_bits = 12,
+	.frac_bits = 12,
+};
+
 struct bcm2835_pll {
 	struct clk_hw hw;
 	struct bcm2835_cprman *cprman;
@@ -1584,6 +1594,9 @@ static int bcm2835_clk_probe(struct platform_device *pdev)
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
