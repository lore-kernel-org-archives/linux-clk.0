Return-Path: <repk@triplefau.lt>
Date: Fri, 4 Dec 2015 21:37:06 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: bcm2835: Support for clock parent selection
Message-ID: <20151204203706.GI12775@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
 <1447251765-16297-3-git-send-email-repk@triplefau.lt>
 <87egfn2m9y.fsf@eliezer.anholt.net>
 <20151118192423.GC491@cruxbox>
 <87io4fgibw.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <87io4fgibw.fsf@eliezer.anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On Thu, Dec 03, 2015 at 04:37:07PM -0800, Eric Anholt wrote:
> Remi Pommarel <repk@triplefau.lt> writes:
> 
> > On Wed, Nov 18, 2015 at 10:30:17AM -0800, Eric Anholt wrote:
> >
> > [...]
> >
> >> > +static int bcm2835_clock_determine_rate(struct clk_hw *hw,
> >> > +		struct clk_rate_request *req)
> >> > +{
> >> > +	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
> >> > +	struct clk_hw *parent, *best_parent = NULL;
> >> > +	struct clk_rate_request parent_req;
> >> > +	unsigned long rate, best_rate = 0;
> >> > +	unsigned long prate, best_prate = 0;
> >> > +	size_t i;
> >> > +	u32 div;
> >> > +
> >> > +	/*
> >> > +	 * Select parent clock that results in the closest but lower rate
> >> > +	 */
> >> > +	for (i = 0; i < clk_hw_get_num_parents(hw); ++i) {
> >> > +		parent = clk_hw_get_parent_by_index(hw, i);
> >> > +		if (!parent)
> >> > +			continue;
> >> > +		parent_req = *req;
> >> 
> >> parent_req appears dead, so it should be removed.
> >
> > Yes, will do thanks.
> >
> >> > +		prate = clk_hw_get_rate(parent);
> >> > +		div = bcm2835_clock_choose_div(hw, req->rate, prate);
> >> > +		rate = bcm2835_clock_rate_from_divisor(clock, prate, div);
> >> > +		if (rate > best_rate && rate <= req->rate) {
> >> > +			best_parent = parent;
> >> > +			best_prate = prate;
> >> > +			best_rate = rate;
> >> > +		}
> >> > +	}
> >> > +
> >> > +	if (!best_parent)
> >> > +		return -EINVAL;
> >> > +
> >> > +	req->best_parent_hw = best_parent;
> >> > +	req->best_parent_rate = best_prate;
> >> 
> >> I think you're supposed to req->rate = best_rate, here, too.  With these
> >> two fixes,
> >
> > I did not set req->rate to best_rate in order to avoid rounding down
> > twice the actual clock rate.
> >
> > Indeed with patch 1 from this patchset bcm2835_clock_choose_div()
> > chooses a divisor that produces a rate lower or equal to the requested
> > one. As we call bcm2835_clock_choose_div() twice when using
> > clk_set_rate() (once with ->determine_rate() and once with ->set_rate()),
> > if I set req->rate in bcm2835_clock_determine_rate to the rounded down
> > one, the final rate will likely be again rounded down in
> > bcm2835_clock_set_rate().
> 
> If we pass bcm2835_clock_rate_from_divisor(bcm2835_clock_choose_div()),
> to bcm2835_clock_choose_div(), will it actually give a different divisor
> than the first call?  (That seems like an unfortunate problem in our
> implementation, if so).

Unfortunately yes. Because we want the divided rate to be lower or equal
to the expected one, I round up the div each time the div_64() produces a
reminder. Thus calling bcm2835_clock_choose_div() with
bcm2835_clock_rate_from_divisor(bcm2835_clock_choose_div()) will still
likely see a reminder from div_64().

> 
> I'd be willing to go along with this, but if so I'd like a comment
> explaining why we aren't setting the field that we should pretty
> obviously be setting.

I can either put a comment here explaining why we do not update
req->rate or do as the patch attached at the end.

This patch adds an argument to bcm2835_clock_choose_div() to switch on or
off the div round up. Then bcm2835_clock_determine_rate() could choose
the appropriate divisor that produces the highest lower rate while
bcm2835_clock_set_rate() can actually set the divisor which will remain
the same.

On second though I prefer the second solution. What do you think ?

Thanks.

Best Regards,

-- 
Remi

---------------------------------->8------------------------------
diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
index 08ae4f6..1b0803c 100644
--- a/drivers/clk/bcm/clk-bcm2835.c
+++ b/drivers/clk/bcm/clk-bcm2835.c
@@ -1158,7 +1158,8 @@ static int bcm2835_clock_is_on(struct clk_hw *hw)

 static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
                                    unsigned long rate,
-                                   unsigned long parent_rate)
+                                   unsigned long parent_rate,
+                                   int round_up)
 {
        struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
        const struct bcm2835_clock_data *data = clock->data;
@@ -1172,7 +1173,7 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
        div = temp;

        /* Round up and mask off the unused bits */
-       if ((div & unused_frac_mask) != 0 || rem != 0)
+       if (round_up && ((div & unused_frac_mask) != 0 || rem != 0))
                div += unused_frac_mask + 1;
        div &= ~unused_frac_mask;

@@ -1272,7 +1273,7 @@ static int bcm2835_clock_set_rate(struct clk_hw *hw,
        struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
        struct bcm2835_cprman *cprman = clock->cprman;
        const struct bcm2835_clock_data *data = clock->data;
-       u32 div = bcm2835_clock_choose_div(hw, rate, parent_rate);
+       u32 div = bcm2835_clock_choose_div(hw, rate, parent_rate, 0);

        cprman_write(cprman, data->div_reg, div);

@@ -1297,7 +1298,7 @@ static int bcm2835_clock_determine_rate(struct clk_hw *hw,
                if (!parent)
                        continue;
                prate = clk_hw_get_rate(parent);
-               div = bcm2835_clock_choose_div(hw, req->rate, prate);
+               div = bcm2835_clock_choose_div(hw, req->rate, prate, 1);
                rate = bcm2835_clock_rate_from_divisor(clock, prate, div);
                if (rate > best_rate && rate <= req->rate) {
                        best_parent = parent;
@@ -1312,6 +1313,8 @@ static int bcm2835_clock_determine_rate(struct clk_hw *hw,
        req->best_parent_hw = best_parent;
        req->best_parent_rate = best_prate;

+       req->rate = best_rate;
+
        return 0;
 }
