Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Neil Armstrong <narmstrong@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Carlo Caione <carlo@caione.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/8] clk: meson: gxbb: protect against holes in the onecell_data array
Date: Fri, 31 Mar 2017 15:04:05 +0200
Message-Id: <20170331130411.4781-3-jbrunet@baylibre.com>
In-Reply-To: <20170331130411.4781-1-jbrunet@baylibre.com>
References: <20170331130411.4781-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The clock controller is getting more complex and it might be possible, in
the future, to have holes in the clk_hw_onecell_data array. Just make sure
we skip those holes if it ever happens.

Acked-by: Michael Turquette <mturquette@baylibre.com>
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
