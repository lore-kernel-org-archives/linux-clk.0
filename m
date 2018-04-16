Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] clk: gate: add duty cycle passthrough ops
Date: Mon, 16 Apr 2018 19:57:42 +0200
Message-Id: <20180416175743.20826-3-jbrunet@baylibre.com>
In-Reply-To: <20180416175743.20826-1-jbrunet@baylibre.com>
References: <20180416175743.20826-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

A clock gate does not resample the clock signal, it give the same
signal as the parent if enabled, so it can use the duty cycle
passthrough operations

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/clk-gate.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
index dd82485e09a1..eb6dcebfcd5c 100644
--- a/drivers/clk/clk-gate.c
+++ b/drivers/clk/clk-gate.c
@@ -107,6 +107,8 @@ const struct clk_ops clk_gate_ops = {
 	.enable = clk_gate_enable,
 	.disable = clk_gate_disable,
 	.is_enabled = clk_gate_is_enabled,
+	.set_duty_cycle = __clk_set_duty_cycle_passthrough,
+	.get_duty_cycle = __clk_get_duty_cycle_passthrough,
 };
 EXPORT_SYMBOL_GPL(clk_gate_ops);
 
-- 
2.14.3
