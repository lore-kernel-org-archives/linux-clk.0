Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] clk: mux: add duty cycle passthrough ops
Date: Mon, 16 Apr 2018 19:57:43 +0200
Message-Id: <20180416175743.20826-4-jbrunet@baylibre.com>
In-Reply-To: <20180416175743.20826-1-jbrunet@baylibre.com>
References: <20180416175743.20826-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

A clock mux does not resample the clock signal, it give the same
signal as the selected parent, so it can use the duty cycle
passthrough operations.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-mux.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/clk-mux.c b/drivers/clk/clk-mux.c
index 1628b93655ed..f7c597779928 100644
--- a/drivers/clk/clk-mux.c
+++ b/drivers/clk/clk-mux.c
@@ -124,11 +124,15 @@ const struct clk_ops clk_mux_ops = {
 	.get_parent = clk_mux_get_parent,
 	.set_parent = clk_mux_set_parent,
 	.determine_rate = clk_mux_determine_rate,
+	.set_duty_cycle = __clk_set_duty_cycle_passthrough,
+	.get_duty_cycle = __clk_get_duty_cycle_passthrough,
 };
 EXPORT_SYMBOL_GPL(clk_mux_ops);
 
 const struct clk_ops clk_mux_ro_ops = {
 	.get_parent = clk_mux_get_parent,
+	.set_duty_cycle = __clk_set_duty_cycle_passthrough,
+	.get_duty_cycle = __clk_get_duty_cycle_passthrough,
 };
 EXPORT_SYMBOL_GPL(clk_mux_ro_ops);
 
-- 
2.14.3
