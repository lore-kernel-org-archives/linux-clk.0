Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>
Cc: dianders@chromium.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org, linux@arm.linux.org.uk
Subject: [PATCH v2 2/2] clk: prevent orphan clocks from being used
Date: Sun, 12 Apr 2015 13:38:08 +0200
Message-ID: <178607342.OcAukPVBgb@diego>
In-Reply-To: <75204537.lSvovFhEiG@diego>
References: <75204537.lSvovFhEiG@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Orphan clocks or children of orphan clocks don't have rate information at
all and can produce strange results if they're allowed to be used and the
parent becomes available later on.

So using the newly introduced orphan status bit defer
__of_clk_get_from_provider calls for orphan clocks.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/clk.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index a9fa5ab..b977701 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -2272,6 +2272,17 @@ bool clk_is_match(const struct clk *p, const struct clk *q)
 }
 EXPORT_SYMBOL_GPL(clk_is_match);
 
+static bool clk_is_orphan(const struct clk *clk)
+{
+	if (!clk)
+		return false;
+
+	if (!clk->core)
+		return false;
+
+	return clk->core->orphan;
+}
+
 /**
  * __clk_init - initialize the data structures in a struct clk
  * @dev:	device initializing this clk, placeholder for now
@@ -3009,6 +3020,11 @@ struct clk *__of_clk_get_from_provider(struct of_phandle_args *clkspec,
 		if (provider->node == clkspec->np)
 			clk = provider->get(clkspec, provider->data);
 		if (!IS_ERR(clk)) {
+			if (clk_is_orphan(clk)) {
+				clk = ERR_PTR(-EPROBE_DEFER);
+				break;
+			}
+
 			clk = __clk_create_clk(__clk_get_hw(clk), dev_id,
 					       con_id);
 
-- 
2.1.4
