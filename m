Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Stephen Boyd <sboyd@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: mux: document clk_mux table field
Date: Thu, 18 Jan 2018 10:50:18 +0100
Message-Id: <20180118095018.20256-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The table field is missing in the documentation of clk_mux.
Add a small blurb explaining what it is

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/linux/clk-provider.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index b45623809a9a..38861e75b017 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -452,6 +452,7 @@ void clk_hw_unregister_divider(struct clk_hw *hw);
  *
  * @hw:		handle between common and hardware-specific interfaces
  * @reg:	register controlling multiplexer
+ * @table:	array of register values corresponding to the parent index
  * @shift:	shift to multiplexer bit field
  * @width:	width of mutliplexer bit field
  * @flags:	hardware-specific flags
-- 
2.14.3
