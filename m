Return-Path: <jacob@teenage.engineering>
Return-Path: <jacob@teenage.engineering>
From: Jacob Siverskog <jacob@teenage.engineering>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org
Cc: Belisko Marek <marek.belisko@gmail.com>,
	Jacob Siverskog <jacob@teenage.engineering>,
	Jens Rudberg <jens@teenage.engineering>
Subject: [PATCH v2] clk: si5351: Add PLL soft reset
Date: Fri, 20 Nov 2015 18:22:17 +0100
Message-Id: <1448040137-21400-2-git-send-email-jacob@teenage.engineering>
In-Reply-To: <1448040137-21400-1-git-send-email-jacob@teenage.engineering>
References: <CAEnXRPvCLRDFotc8FkS35df1PoLUW=X=1bTTUHR=UhRU_9zrCw@mail.gmail.com>
 <1448040137-21400-1-git-send-email-jacob@teenage.engineering>
List-ID: <linux-clk.vger.kernel.org>

This is according to figure 12 ("I2C Programming Procedure") in
"Si5351A/B/C Data Sheet"
(https://www.silabs.com/Support%20Documents/TechnicalDocs/Si5351-B.pdf).

Without the PLL soft reset, we were unable to get three outputs
working at the same time.

According to Silicon Labs support, performing PLL soft reset will only
be noticeable if the PLL parameters have been changed.

Signed-off-by: Jacob Siverskog <jacob@teenage.engineering>
Signed-off-by: Jens Rudberg <jens@teenage.engineering>
---
 drivers/clk/clk-si5351.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/clk-si5351.c b/drivers/clk/clk-si5351.c
index e346b22..984c058 100644
--- a/drivers/clk/clk-si5351.c
+++ b/drivers/clk/clk-si5351.c
@@ -1091,6 +1091,12 @@ static int si5351_clkout_set_rate(struct clk_hw *hw, unsigned long rate,
 	si5351_set_bits(hwdata->drvdata, SI5351_CLK0_CTRL + hwdata->num,
 			SI5351_CLK_POWERDOWN, 0);
 
+	/* do a pll soft reset on both plls, needed in some cases to get all
+	 * outputs running
+	 */
+	si5351_reg_write(hwdata->drvdata, SI5351_PLL_RESET,
+			 SI5351_PLL_RESET_A | SI5351_PLL_RESET_B);
+
 	dev_dbg(&hwdata->drvdata->client->dev,
 		"%s - %s: rdiv = %u, parent_rate = %lu, rate = %lu\n",
 		__func__, clk_hw_get_name(hw), (1 << rdiv),
-- 
2.6.3
