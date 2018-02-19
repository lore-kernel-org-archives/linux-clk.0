Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Carlo Caione <carlo@caione.org>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/11] clk: meson: add fractional part of meson8b fixed_pll
Date: Mon, 19 Feb 2018 12:21:36 +0100
Message-Id: <20180219112146.21746-2-jbrunet@baylibre.com>
In-Reply-To: <20180219112146.21746-1-jbrunet@baylibre.com>
References: <20180219112146.21746-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Add the missing frac parameter to the meson8b fixed_pll. It seems to be
always on this platform, so the rate remains unchanged

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/meson8b.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
index ea73b5de9672..62c54a75a1d2 100644
--- a/drivers/clk/meson/meson8b.c
+++ b/drivers/clk/meson/meson8b.c
@@ -125,6 +125,11 @@ static struct clk_regmap meson8b_fixed_pll = {
 			.shift   = 16,
 			.width   = 2,
 		},
+		.frac = {
+			.reg_off = HHI_MPLL_CNTL2,
+			.shift   = 0,
+			.width   = 12,
+		},
 		.l = {
 			.reg_off = HHI_MPLL_CNTL,
 			.shift   = 31,
-- 
2.14.3
