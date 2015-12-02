Return-Path: <repk@triplefau.lt>
Date: Wed, 2 Dec 2015 23:21:52 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: bcm2835: Always round up clock divisor
Message-ID: <20151202222152.GH12775@cruxbox>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20151118191141.GB491@cruxbox>
List-ID: <linux-clk.vger.kernel.org>

Hi Eric

On Wed, Nov 18, 2015 at 07:11:41PM -0100, Remi Pommarel wrote:
> On Wed, Nov 18, 2015 at 10:25:45AM -0800, Eric Anholt wrote:
> > Remi Pommarel <repk@triplefau.lt> writes:
> > 
> > > Make bcm2835_clock_choose_div always round up the chosen MASH divisor so that
> > > the resulting average rate will not be higher than the requested one.
> > >
> > > Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> > > ---
> > >  drivers/clk/bcm/clk-bcm2835.c | 15 ++++++++-------
> > >  1 file changed, 8 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> > > index 39bf582..1237716 100644
> > > --- a/drivers/clk/bcm/clk-bcm2835.c
> > > +++ b/drivers/clk/bcm/clk-bcm2835.c
> > > @@ -1152,18 +1152,19 @@ static u32 bcm2835_clock_choose_div(struct clk_hw *hw,
> > >  {
> > >  	struct bcm2835_clock *clock = bcm2835_clock_from_hw(hw);
> > >  	const struct bcm2835_clock_data *data = clock->data;
> > > -	u32 unused_frac_mask = GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0);
> > > +	u32 unused_frac_mask =
> > > +		GENMASK(CM_DIV_FRAC_BITS - data->frac_bits, 0) >> 1;
> > >  	u64 temp = (u64)parent_rate << CM_DIV_FRAC_BITS;
> > > +	u64 rem;
> > >  	u32 div;
> > >  
> > > -	do_div(temp, rate);
> > > +	rem = do_div(temp, rate);
> > >  	div = temp;
> > >  
> > > -	/* Round and mask off the unused bits */
> > > -	if (unused_frac_mask != 0) {
> > > -		div += unused_frac_mask >> 1;
> > > -		div &= ~unused_frac_mask;
> > > -	}
> > > +	/* Round up and mask off the unused bits */
> > > +	if ((div & unused_frac_mask) != 0 || rem != 0)
> > > +		div += unused_frac_mask + 1;
> > > +	div &= ~unused_frac_mask;
> > 
> > Suppose we've got 8 of our 12 frac bits populated.  You've added a ">>
> > 1" to the unused_frac_mask, so it's only 0x7 instead of 0xf.  When you
> > say "round up", you add 0x8 (the high bit of the unused mask") then and
> > with ~0x7.  If you started with 0x1 in the low bits of div, you'd end up
> > with 0x8, so you've set an unused bit instead of actually rounding up.
> > 
> > Did my logic work, here?  I think you just want to drop the ">>1" in
> > unused_frac_mask.
> 
> I don't think so.
> 
> If we have 8 of our 12 frac bits populated GENMASK(12 - 8, 0) will be 0x1f
> because GENMASK(4, 0) generates a mask from bit at position 0 to bit at
> position 4 inclusively (which is the fifth bit). So GENMASK(4, 0) >> 1 will
> be 0xf which is what we want here.

Does my logic seems sensible to you or am I missing something ? I just
want to be sure we agree before I send another version for this
patchset.

Thanks.

Best Regards

-- 
Remi
