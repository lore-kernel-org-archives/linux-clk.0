Return-Path: <phil@raspberrypi.org>
To: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>, Eric Anholt <eric@anholt.net>,
        Stefan Wahren <stefan.wahren@i2se.com>,
        Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
From: Phil Elwell <phil@raspberrypi.org>
Subject: [PATCH 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
Message-ID: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
Date: Tue, 30 May 2017 17:28:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Restrict clock sources for the PCM peripheral to the oscillator and
PLLD_PER because other source may have varying rates or be switched off.
Prevent other sources from being selected by replacing their names in
the list of potential parents with dummy entries (entry index is
significant).

Signed-off-by: Phil Elwell <phil@raspberrypi.org>
---
 drivers/clk/bcm/clk-bcm2835.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 0258538..facc346 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1511,6 +1511,16 @@ struct bcm2835_clk_desc {
 	"pllh_aux",
 };
 
+static const char *const bcm2835_pcm_per_parents[] = {
+	"-",
+	"xosc",
+	"-",
+	"-",
+	"-",
+	"-",
+	"plld_per",
+};
+
 #define REGISTER_PER_CLK(...)	REGISTER_CLK(				\
 	.num_mux_parents = ARRAY_SIZE(bcm2835_clock_per_parents),	\
 	.parents = bcm2835_clock_per_parents,				\
@@ -2000,6 +2010,7 @@ struct bcm2835_clk_desc {
 		.int_bits = 12,
 		.frac_bits = 12,
 		.is_mash_clock = true,
+		.parents = bcm2835_pcm_per_parents,
 		.tcnt_mux = 23),
 	[BCM2835_CLOCK_PWM]	= REGISTER_PER_CLK(
 		.name = "pwm",
-- 
1.9.1
