Return-Path: <jbrunet@baylibre.com>
Return-Path: <jbrunet@baylibre.com>
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] clk: fix mux clock documentation
Date: Wed, 14 Feb 2018 14:43:38 +0100
Message-Id: <20180214134340.17242-7-jbrunet@baylibre.com>
In-Reply-To: <20180214134340.17242-1-jbrunet@baylibre.com>
References: <20180214134340.17242-1-jbrunet@baylibre.com>
List-ID: <linux-clk.vger.kernel.org>

The mux documentation mentions the non-existing parameter width instead
of mask, so just sed this.

The table field is missing in the documentation of clk_mux.
Add a small blurb explaining what it is

Fixes: 9d9f78ed9af0 ("clk: basic clock hardware types")
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 include/linux/clk-provider.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index fe720d679c31..cb18526d69cb 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -450,8 +450,9 @@ void clk_hw_unregister_divider(struct clk_hw *hw);
  *
  * @hw:		handle between common and hardware-specific interfaces
  * @reg:	register controlling multiplexer
+ * @table:	array of register values corresponding to the parent index
  * @shift:	shift to multiplexer bit field
- * @width:	width of mutliplexer bit field
+ * @mask:	mask of mutliplexer bit field
  * @flags:	hardware-specific flags
  * @lock:	register lock
  *
-- 
2.14.3
