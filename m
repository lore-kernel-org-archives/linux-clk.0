Return-Path: <sboyd@codeaurora.org>
Date: Mon, 28 Sep 2015 11:46:40 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: mturquette@baylibre.com, Kevin Hilman <khilman@kernel.org>,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	Pavel Machek <pavel@ucw.cz>, Caesar Wang <wxt@rock-chips.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v2] clk: readd refcounting for struct clk instances
Message-ID: <20150928184640.GM23081@codeaurora.org>
References: <6257096.h7pub3XnDQ@diego>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <6257096.h7pub3XnDQ@diego>
List-ID: <linux-clk.vger.kernel.org>

On 09/23, Heiko Stübner wrote:
> ---
> 
> While it may be nice to do the actual handling of the clock references
> only in the calling code, in this current use case it would create
> a big additional overhead.
> 
> It looks like this so called synchronous reset on power-domain state-
> changes, requiring device clocks to be turned on, is not that uncommon
> or rockchip-specific.
> For this Kevin requested that we read the clocks from the actual consumer
> devices and not double-list them in the power-domain node as well.
> 
> So when expecting pm_clk_add_clk() to work, the current powerdomain code
> can simply do when adding a device to a domain in rockchip_pd_attach_dev():
>     while ((clk = of_clk_get(dev->of_node, i++)) && !IS_ERR(clk)) {
> 	dev_dbg(dev, "adding clock '%pC' to list of PM clocks\n", clk);
> 	error = pm_clk_add_clk(dev, clk);
> 	clk_put(clk);
>     }
> 
> The clock gets handed off to the generic pm clock handling and thus
> clk_put in there.
> 
> 
> On the other hand when only the rockchip power-domain code is expected
> to get and put the clock, we would require a lot of new overhead, as now
> the code would also need to track which devices got added to what
> domain and also all clock-references until the device gets detached
> again. So this would essentially duplicate a big part of what the
> genpd-code does (per-domain device-list and per-device clock-list).
> 
> As this seems to be not uncommon, future powerdomain drivers
> might need that too and would also need to duplicate that handling.
> 
> When allowing multiple __clk_get and __clk_put calls on the other
> hand, the overhead for the regular case comes down to one atomic_inc,
> atomic_sub_and_test and the function call to the new separate release
> function ;-) .
> 

Why are we doing of_clk_get(), pm_clk_add_clk(), and then
clk_put()?  Just drop that clk_put() in the caller and remove the
__clk_get() inside pm_clk_add_clk() and everything works the
same. This patch does most of that, except it doesn't handle the
error path where we would need to throw a clk_put().

Really, that snippet of code that loops over a device's clocks
and adds them to a pm domain is an example of duplicate code that
should go into some common layer like the PM clock stuff. Then we
don't have any kind of situation where we're passing struct clk
pointers off to other layers of code and this "problem" doesn't
exist.

----8<----
diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index acef9f9f759a..529a03e8282c 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -95,7 +95,7 @@ static int __pm_clk_add(struct device *dev, const char *con_id,
                        return -ENOMEM;
                }
        } else {
-               if (IS_ERR(clk) || !__clk_get(clk)) {
+               if (IS_ERR(clk)) {
                        kfree(ce);
                        return -ENOENT;
                }
@@ -129,7 +129,7 @@ int pm_clk_add(struct device *dev, const char *con_id)
  * @clk: Clock pointer
  *
  * Add the clock to the list of clocks used for the power management of @dev.
- * It will increment refcount on clock pointer, use clk_put() on it when done.
+ * Callers should not call clk_put() on @clk after calling this function.
  */
 int pm_clk_add_clk(struct device *dev, struct clk *clk)
 {


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
