Return-Path: <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH v4 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
Message-ID: <8cc0ba82-d33e-127b-7b86-ac595ef416d1@raspberrypi.org>
Date: Thu, 1 Jun 2017 15:14:16 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Restrict clock sources for the PCM peripheral to the oscillator and
PLLD_PER because other source may have varying rates or be switched off.
Prevent other sources from being selected by replacing their names in
the list of potential parents with dummy entries (entry index is
significant).

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
Reviewed-by: Eric Anholt <eric@anholt.net>
Acked-by: Stefan Wahren <stefan.wahren@i2se.com>
---
 drivers/clk/bcm/clk-bcm2835.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 0258538..49867d2 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1516,6 +1516,31 @@ struct bcm2835_clk_desc {
 	.parents = bcm2835_clock_per_parents,				\
 	__VA_ARGS__)
 
+/*
+ * Restrict clock sources for the PCM peripheral to the oscillator and
+ * PLLD_PER because other source may have varying rates or be switched
+ * off.
+ *
+ * Prevent other sources from being selected by replacing their names in
+ * the list of potential parents with dummy entries (entry index is
+ * significant).
+ */
+static const char *const bcm2835_pcm_per_parents[] = {
+	"-",
+	"xosc",
+	"-",
+	"-",
+	"-",
+	"-",
+	"plld_per",
+	"-",
+};
+
+#define REGISTER_PCM_CLK(...)	REGISTER_CLK(				\
+	.num_mux_parents = ARRAY_SIZE(bcm2835_pcm_per_parents),		\
+	.parents = bcm2835_pcm_per_parents,				\
+	__VA_ARGS__)
+
 /* main vpu parent mux */
 static const char *const bcm2835_clock_vpu_parents[] = {
 	"gnd",
@@ -1993,7 +2018,7 @@ struct bcm2835_clk_desc {
 		.int_bits = 4,
 		.frac_bits = 8,
 		.tcnt_mux = 22),
-	[BCM2835_CLOCK_PCM]	= REGISTER_PER_CLK(
+	[BCM2835_CLOCK_PCM]	= REGISTER_PCM_CLK(
 		.name = "pcm",
 		.ctl_reg = CM_PCMCTL,
 		.div_reg = CM_PCMDIV,
-- 
1.9.1
