Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] clk: meson: mpll: correct N2 maximum value
Date: Tue, 28 Feb 2017 14:30:01 +0100
Message-Id: <20170228133002.17894-7-jbrunet@baylibre.com>
In-Reply-To: <20170228133002.17894-1-jbrunet@baylibre.com>
References: <20170228133002.17894-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

Gxbb datasheet says N2 maximum value is 127 but the register field is
9 bits wide, the maximum value should 511.

Test shows value greater than 127, all the way to 511, works well

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/clk-mpll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
index 342b85d4e22a..540dabe5adad 100644
--- a/drivers/clk/meson/clk-mpll.c
+++ b/drivers/clk/meson/clk-mpll.c
@@ -68,7 +68,7 @@
 #define SDM_MIN 1
 #define SDM_MAX 16383
 #define N2_MIN	4
-#define N2_MAX	127
+#define N2_MAX	511
 
 #define to_meson_clk_mpll(_hw) container_of(_hw, struct meson_clk_mpll, hw)
 
-- 
2.9.3
