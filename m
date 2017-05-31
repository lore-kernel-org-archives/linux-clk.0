Return-Path: <phil@raspberrypi.org>
Subject: [PATCH v2 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
From: Phil Elwell <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
Message-ID: <8a9ebac4-b299-b887-27b2-86f4f61846fd@raspberrypi.org>
Date: Wed, 31 May 2017 10:18:25 +0100
MIME-Version: 1.0
In-Reply-To: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Restrict clock sources for the PCM peripheral to the oscillator and
PLLD_PER because other source may have varying rates or be switched off.
Prevent other sources from being selected by replacing their names in
the list of potential parents with dummy entries (entry index is
significant).

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 0258538..81ecd4c 100644
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
+	.num_mux_parents = ARRAY_SIZE(bcm2835_clock_pcm_per_parents),	\
+	.parents = bcm2835_clock_pcm_per_parents,			\
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
