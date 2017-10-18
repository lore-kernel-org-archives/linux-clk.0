Return-Path: <viresh.kumar@linaro.org>
Return-Path: <viresh.kumar@linaro.org>
Date: Wed, 18 Oct 2017 09:18:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Julia Lawall <julia.lawall@lip6.fr>
Cc: Bhumika Goyal <bhumirks@gmail.com>, vireshk@kernel.org,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] CLK: SPEAr: make structure field and function
 argument as const
Message-ID: <20171018034816.GE27082@vireshk-i7>
References: <1508251114-7042-1-git-send-email-bhumirks@gmail.com>
 <1508251114-7042-2-git-send-email-bhumirks@gmail.com>
 <alpine.DEB.2.20.1710171641400.5035@hadrien>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <alpine.DEB.2.20.1710171641400.5035@hadrien>
List-ID: <linux-clk.vger.kernel.org>

On 17-10-17, 16:42, Julia Lawall wrote:
> 
> 
> On Tue, 17 Oct 2017, Bhumika Goyal wrote:
> 
> > Make the masks field of clk_aux structure const as it do not modify the
> > fields of the aux_clk_masks structure it points to.
> >
> > Make the struct aux_clk_masks *aux argument of the function
> > clk_register_aux as const as the argument is only stored in the masks
> > field of a clk_aux structure which is now made const.
> >
> > Signed-off-by: Bhumika Goyal <bhumirks@gmail.com>
> > ---
> >  drivers/clk/spear/clk-aux-synth.c | 2 +-
> >  drivers/clk/spear/clk.h           | 4 ++--
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/clk/spear/clk-aux-synth.c b/drivers/clk/spear/clk-aux-synth.c
> > index f271c35..8bea5df 100644
> > --- a/drivers/clk/spear/clk-aux-synth.c
> > +++ b/drivers/clk/spear/clk-aux-synth.c
> > @@ -136,7 +136,7 @@ static int clk_aux_set_rate(struct clk_hw *hw, unsigned long drate,
> >
> >  struct clk *clk_register_aux(const char *aux_name, const char *gate_name,
> >  		const char *parent_name, unsigned long flags, void __iomem *reg,
> > -		struct aux_clk_masks *masks, struct aux_rate_tbl *rtbl,
> > +	        const struct aux_clk_masks *masks, struct aux_rate_tbl *rtbl,
> >  		u8 rtbl_cnt, spinlock_t *lock, struct clk **gate_clk)
> >  {
> >  	struct clk_aux *aux;
> > diff --git a/drivers/clk/spear/clk.h b/drivers/clk/spear/clk.h
> > index 9834944..b9d28b3 100644
> > --- a/drivers/clk/spear/clk.h
> > +++ b/drivers/clk/spear/clk.h
> > @@ -49,7 +49,7 @@ struct aux_rate_tbl {
> >  struct clk_aux {
> >  	struct			clk_hw hw;
> >  	void __iomem		*reg;
> > -	struct aux_clk_masks	*masks;
> > +        const struct aux_clk_masks *masks;
> 
> There are spaces before const here.

Fix that and add my:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
