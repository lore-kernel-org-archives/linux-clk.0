Return-Path: <sboyd@codeaurora.org>
Date: Wed, 14 Oct 2015 14:08:59 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Mike Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH 14/26] clk: mvebu: Convert to clk_hw based provider APIs
Message-ID: <20151014210859.GB4558@codeaurora.org>
References: <1438362246-6664-1-git-send-email-sboyd@codeaurora.org>
 <1438362246-6664-15-git-send-email-sboyd@codeaurora.org>
 <20151014170922.3027008a@free-electrons.com>
 <20151014182138.GD26883@codeaurora.org>
 <20151014221733.65507871@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151014221733.65507871@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/14, Thomas Petazzoni wrote:
> On Wed, 14 Oct 2015 11:21:38 -0700, Stephen Boyd wrote:
> 
> > > Stephen, what do you suggest to fix this issue?
> > 
> > Simplest fix is to revert this hunk.
> 
> Indeed, this is the simplest fix. But it's going backward with what you
> were trying to do originally, so it isn't really nice either.
> 
> > Longer term, we should look into making of_clk_get_parent_name() use
> > whatever string has been used when registering the clock,
> 
> I am not sure how of_clk_get_parent_name() can know the name of the
> clock without clock-output-names in the DT. Without clock-output-names,
> the only way to know the name of the parent clock is to actually ask
> the driver of the parent clock, no?

Yes that's the plan. We would try to resolve the name with
of_clk_get() and __clk_get_name() if there isn't a
clock-output-names property. If #clock-cells > 1 and of_clk_get()
fails, we would return NULL, otherwise for #clock-cells == 0 we
could fallback on the node name as a last resort. The change here
is that we don't use the node name for providers with
#clock-cells > 1 because that doesn't make any sense. We'll also
try a clk_get() in the case with #clock-cells = 0 and no
clock-output-names.

Eventually once we add the ability for OF clk providers to
register clk_hw pointers instead of clk pointers we'll be able to
"simplify" the of_clk_get() + __clk_get_name() path with a
provider clk_hw lookup and clk_hw_get_name() combination, which
should be faster and avoid any allocations.

Here's that untested patch, which we can throw into clk-next for
v4.4

-----8<----
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b005f666e3a1..16b86a551bcb 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3055,6 +3055,7 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 	u32 pv;
 	int rc;
 	int count;
+	struct clk *clk;
 
 	if (index < 0)
 		return NULL;
@@ -3080,8 +3081,25 @@ const char *of_clk_get_parent_name(struct device_node *np, int index)
 
 	if (of_property_read_string_index(clkspec.np, "clock-output-names",
 					  index,
-					  &clk_name) < 0)
-		clk_name = clkspec.np->name;
+					  &clk_name) < 0) {
+		/*
+		 * Best effort to get the name if the clock has been
+		 * registered with the framework. If the clock isn't
+		 * registered, we return the node name as the name of
+		 * the clock as long as #clock-cells = 0.
+		 */
+		clk = of_clk_get(np, index);
+		if (IS_ERR(clk)) {
+			if (clkspec.args_count == 0)
+				clk_name = clkspec.np->name;
+			else
+				clk_name = NULL;
+		} else {
+			clk_name = __clk_get_name(clk);
+			clk_put(clk);
+		}
+	}
+
 
 	of_node_put(clkspec.np);
 	return clk_name;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
