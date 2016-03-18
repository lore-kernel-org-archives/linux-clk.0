Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from smtp5-g21.free.fr ([212.27.42.5]:3615 "EHLO smtp5-g21.free.fr"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751126AbcCRHrh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Fri, 18 Mar 2016 03:47:37 -0400
Date: Fri, 18 Mar 2016 08:47:25 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Emilio Lopez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] clk: sunxi: Accept a greater rate when setting a parent
 clock
Message-Id: <20160318084725.64448d32b15c51b070691fbb@free.fr>
In-Reply-To: <E1advmk-0004Nt-Ba@bombadil.infradead.org>
References: <E1advmk-0004Nt-Ba@bombadil.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Ping!

On Thu, 10 Mar 2016 08:15:02 +0100
Jean-Francois Moine <moinejf@free.fr> wrote:

> The best rate of a clock may be a bit greater than the requested one.
> In such a case, the rate setting from a child clock was rejected.
> 
> Signed-off-by: Jean-Francois Moine <moinejf@free.fr>
> ---
> I don't know exactly why the rate constraint existed nor what can be
> the impact of setting the rate of other clocks.
> 
> I had the problem when setting the PLL2 clock of the H3 (patch to come).
> It has 4 outputs, so, it is composed of a base clock and 4 children
> clocks pll2, pll2x2, pll2x4 and pll2x8 with a fixed factor (/4, /2, 1
> and *2).
> The pll2 clock rate may be only 24576000 (for the audio family 48000Hz)
> or 22579200 (for the audio family 44100Hz).
> 
> Setting 24576000 asks for mul=86 and div=21,4 giving 24571428 as the
> best rate, i.e. a bit slower than requested: good.
> 
> Setting 22579200 asks for mul=64 and div=17,4 giving 22588235, i.e.
> a bit greater: then, the rate setting was rejected (no parent clock),
> preventing audio streaming at 44100Hz.
> ---
>  drivers/clk/sunxi/clk-factors.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sunxi/clk-factors.c b/drivers/clk/sunxi/clk-factors.c
> index 59428db..d0774c2 100644
> --- a/drivers/clk/sunxi/clk-factors.c
> +++ b/drivers/clk/sunxi/clk-factors.c
> @@ -86,7 +86,7 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
>  	int i, num_parents;
>  	unsigned long parent_rate, best = 0, child_rate, best_child_rate = 0;
>  
> -	/* find the parent that can help provide the fastest rate <= rate */
> +	/* find the parent that can help provide the fastest rate */
>  	num_parents = clk_hw_get_num_parents(hw);
>  	for (i = 0; i < num_parents; i++) {
>  		parent = clk_hw_get_parent_by_index(hw, i);
> @@ -100,7 +100,7 @@ static int clk_factors_determine_rate(struct clk_hw *hw,
>  		child_rate = clk_factors_round_rate(hw, req->rate,
>  						    &parent_rate);
>  
> -		if (child_rate <= req->rate && child_rate > best_child_rate) {
> +		if (child_rate > best_child_rate) {
>  			best_parent = parent;
>  			best = parent_rate;
>  			best_child_rate = child_rate;
> -- 
> 2.7.2
