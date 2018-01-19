Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/9] clk: meson: gxbb: add the fractional part of the fixed_pll
Date: Fri, 19 Jan 2018 16:55:28 +0100
Message-Id: <20180119155529.11532-9-jbrunet@baylibre.com>
In-Reply-To: <20180119155529.11532-1-jbrunet@baylibre.com>
References: <20180119155529.11532-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The fixed_pll of gxbb and gxl also has a fractional parameter. This has
not been a problem so far because the fractional part is actually set
to 0 on these platforms, so the rate remains correct when it is ignored.
Still, it is better represent the pll the way it is, so add the frac
parameter now

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index b773be1033f8..17f44ac751b3 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -202,6 +202,11 @@ static struct meson_clk_pll gxbb_fixed_pll = {
 		.shift   = 16,
 		.width   = 2,
 	},
+	.frac = {
+		.reg_off = HHI_MPLL_CNTL2,
+		.shift   = 0,
+		.width   = 12,
+	},
 	.lock = &meson_clk_lock,
 	.hw.init = &(struct clk_init_data){
 		.name = "fixed_pll",
-- 
2.14.3
