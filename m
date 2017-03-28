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
Subject: [PATCH v1 2/8] clk: meson: gxbb: protect against holes in the onecell_data array
Date: Tue, 28 Mar 2017 16:45:59 +0200
Message-Id: <20170328144605.25278-3-jbrunet@baylibre.com>
In-Reply-To: <20170328144605.25278-1-jbrunet@baylibre.com>
References: <20170328144605.25278-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>


The clock controller is getting more complex and it might be possible, in
the future, to have holes in the clk_hw_onecell_data array. Just make sure
we skip those holes if it ever happens.

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/clk/meson/gxbb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
index 75197664a7ee..28812ea41a60 100644
--- a/drivers/clk/meson/gxbb.c
+++ b/drivers/clk/meson/gxbb.c
@@ -1388,6 +1388,10 @@ static int gxbb_clkc_probe(struct platform_device *pdev)
 	 * register all clks
 	 */
 	for (clkid = 0; clkid < clkc_data->hw_onecell_data->num; clkid++) {
+		/* array might be sparse */
+		if (!clkc_data->hw_onecell_data->hws[clkid])
+			continue;
+
 		ret = devm_clk_hw_register(dev,
 					clkc_data->hw_onecell_data->hws[clkid]);
 		if (ret)
-- 
2.9.3
