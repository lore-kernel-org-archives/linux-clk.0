Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH] clk: fix mux clock documentation
Date: Mon, 12 Feb 2018 14:37:12 +0100
Message-Id: <20180212133712.15132-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The mux documentation mentions the non-existing parameter width instead
of mask. Just sed this.

Fixes: 9d9f78ed9af0 ("clk: basic clock hardware types")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/linux/clk-provider.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b3210c431e33..210a890008f9 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -456,7 +456,7 @@ void clk_hw_unregister_divider(struct clk_hw *hw);
  * @reg:	register controlling multiplexer
  * @table:	array of register values corresponding to the parent index
  * @shift:	shift to multiplexer bit field
- * @width:	width of mutliplexer bit field
+ * @mask:	mask of mutliplexer bit field
  * @flags:	hardware-specific flags
  * @lock:	register lock
  *
-- 
2.14.3
