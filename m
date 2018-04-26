Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55155 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753232AbeDZIj7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Apr 2018 04:39:59 -0400
Received: by mail-wm0-f66.google.com with SMTP id f6so11469397wmc.4
        for <linux-clk@vger.kernel.org>; Thu, 26 Apr 2018 01:39:58 -0700 (PDT)
Subject: Re: [PATCH 1/2] clk: meson: mpll: add round closest support
To: Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180420095603.29964-1-jbrunet@baylibre.com>
 <20180420095603.29964-2-jbrunet@baylibre.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Message-ID: <f60eb9b0-c9dc-e9bd-1c2d-6df01a583a35@baylibre.com>
Date: Thu, 26 Apr 2018 10:39:56 +0200
MIME-Version: 1.0
In-Reply-To: <20180420095603.29964-2-jbrunet@baylibre.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 20/04/2018 11:56, Jerome Brunet wrote:
> Allow the mpll driver to round the requested rate up if
> CLK_MESON_MPLL_ROUND_CLOSEST is set and it provides a rate closer to the
> requested rate.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/clk-mpll.c | 25 ++++++++++++++++++++-----
>  drivers/clk/meson/clkc.h     |  3 +++
>  2 files changed, 23 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
> index 0df1227b65b3..4e5283eb892a 100644
> --- a/drivers/clk/meson/clk-mpll.c
> +++ b/drivers/clk/meson/clk-mpll.c
> @@ -89,10 +89,23 @@ static long rate_from_params(unsigned long parent_rate,
>  static void params_from_rate(unsigned long requested_rate,
>  			     unsigned long parent_rate,
>  			     unsigned int *sdm,
> -			     unsigned int *n2)
> +			     unsigned int *n2,
> +			     u8 flags)
>  {
>  	uint64_t div = parent_rate;
> -	unsigned long rem = do_div(div, requested_rate);
> +	uint64_t frac = do_div(div, requested_rate);
> +	unsigned long rem;
> +
> +	frac *= SDM_DEN;
> +	rem = do_div(frac, requested_rate);
> +
> +	/* Should we round up ? */
> +	if (flags & CLK_MESON_MPLL_ROUND_CLOSEST
> +	    && rem > (requested_rate / 2)) {
> +		frac = (frac + 1) % SDM_DEN;
> +		if (frac == 0)
> +			div += 1;
> +	}
>  
>  	if (div < N2_MIN) {
>  		*n2 = N2_MIN;
> @@ -102,7 +115,7 @@ static void params_from_rate(unsigned long requested_rate,
>  		*sdm = SDM_DEN - 1;
>  	} else {
>  		*n2 = div;
> -		*sdm = DIV_ROUND_UP_ULL((u64)rem * SDM_DEN, requested_rate);
> +		*sdm = frac;
>  	}
>  }
>  
> @@ -125,9 +138,11 @@ static long mpll_round_rate(struct clk_hw *hw,
>  			    unsigned long rate,
>  			    unsigned long *parent_rate)
>  {
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
>  	unsigned int sdm, n2;
>  
> -	params_from_rate(rate, *parent_rate, &sdm, &n2);
> +	params_from_rate(rate, *parent_rate, &sdm, &n2, mpll->flags);
>  	return rate_from_params(*parent_rate, sdm, n2);
>  }
>  
> @@ -140,7 +155,7 @@ static int mpll_set_rate(struct clk_hw *hw,
>  	unsigned int sdm, n2;
>  	unsigned long flags = 0;
>  
> -	params_from_rate(rate, parent_rate, &sdm, &n2);
> +	params_from_rate(rate, parent_rate, &sdm, &n2, mpll->flags);
>  
>  	if (mpll->lock)
>  		spin_lock_irqsave(mpll->lock, flags);
> diff --git a/drivers/clk/meson/clkc.h b/drivers/clk/meson/clkc.h
> index 8fe73c4edca8..8cc265cd3d2b 100644
> --- a/drivers/clk/meson/clkc.h
> +++ b/drivers/clk/meson/clkc.h
> @@ -97,8 +97,11 @@ struct meson_clk_mpll_data {
>  	struct parm ssen;
>  	struct parm misc;
>  	spinlock_t *lock;
> +	u8 flags;
>  };
>  
> +#define CLK_MESON_MPLL_ROUND_CLOSEST	BIT(0)
> +
>  struct meson_clk_audio_div_data {
>  	struct parm div;
>  	u8 flags;
> 

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
