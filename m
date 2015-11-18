Return-Path: <repk@triplefau.lt>
Date: Wed, 18 Nov 2015 20:24:23 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: bcm2835: Support for clock parent selection
Message-ID: <20151118192423.GC491@cruxbox>
References: <1447251765-16297-1-git-send-email-repk@triplefau.lt>
 <1447251765-16297-3-git-send-email-repk@triplefau.lt>
 <87egfn2m9y.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <87egfn2m9y.fsf@eliezer.anholt.net>
List-ID: <linux-clk.vger.kernel.org>

On Wed, Nov 18, 2015 at 10:30:17AM -0800, Eric Anholt wrote:

[...]

> > +static int bcm2835_clock_determine_rate(struct clk_hw *hw,
> > +		struct clk_rate_request *req)
> > +{
> > +	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
> > +	struct clk_hw *parent, *best_parent = NULL;
> > +	struct clk_rate_request parent_req;
> > +	unsigned long rate, best_rate = 0;
> > +	unsigned long prate, best_prate = 0;
> > +	size_t i;
> > +	u32 div;
> > +
> > +	/*
> > +	 * Select parent clock that results in the closest but lower rate
> > +	 */
> > +	for (i = 0; i < clk_hw_get_num_parents(hw); ++i) {
> > +		parent = clk_hw_get_parent_by_index(hw, i);
> > +		if (!parent)
> > +			continue;
> > +		parent_req = *req;
> 
> parent_req appears dead, so it should be removed.

Yes, will do thanks.

> > +		prate = clk_hw_get_rate(parent);
> > +		div = bcm2835_clock_choose_div(hw, req->rate, prate);
> > +		rate = bcm2835_clock_rate_from_divisor(clock, prate, div);
> > +		if (rate > best_rate && rate <= req->rate) {
> > +			best_parent = parent;
> > +			best_prate = prate;
> > +			best_rate = rate;
> > +		}
> > +	}
> > +
> > +	if (!best_parent)
> > +		return -EINVAL;
> > +
> > +	req->best_parent_hw = best_parent;
> > +	req->best_parent_rate = best_prate;
> 
> I think you're supposed to req->rate = best_rate, here, too.  With these
> two fixes,

I did not set req->rate to best_rate in order to avoid rounding down
twice the actual clock rate.

Indeed with patch 1 from this patchset bcm2835_clock_choose_div()
chooses a divisor that produces a rate lower or equal to the requested
one. As we call bcm2835_clock_choose_div() twice when using
clk_set_rate() (once with ->determine_rate() and once with ->set_rate()),
if I set req->rate in bcm2835_clock_determine_rate to the rounded down
one, the final rate will likely be again rounded down in
bcm2835_clock_set_rate().

Thanks,

-- 
Rémi Pommarel
