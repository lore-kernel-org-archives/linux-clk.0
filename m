Return-Path: <sboyd@codeaurora.org>
Date: Wed, 3 Jun 2015 16:37:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Mike Turquette <mturquette@linaro.org>, linux-clk@vger.kernel.org,
	Mikko Perttunen <mikko.perttunen@kapsi.fi>,
	Tomeu Vizoso <tomeu.vizoso@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>, Tony Lindgren <tony@atomide.com>,
	Ralf Baechle <ralf@linux-mips.org>,
	Emilio L??pez <emilio@elopez.com.ar>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	Tero Kristo <t-kristo@ti.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org, linux-mips@linux-mips.org
Subject: Re: [PATCH v3] clk: change clk_ops' ->determine_rate() prototype
Message-ID: <20150603233728.GA490@codeaurora.org>
References: <1432138345-19044-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
In-Reply-To: <1432138345-19044-1-git-send-email-boris.brezillon@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/20, Boris Brezillon wrote:
> Clock rates are stored in an unsigned long field, but ->determine_rate()
> (which returns a rounded rate from a requested one) returns a long
> value (errors are reported using negative error codes), which can lead
> to long overflow if the clock rate exceed 2Ghz.
> 
> Change ->determine_rate() prototype to return 0 or an error code, and pass
> a pointer to a clk_rate_request structure containing the expected target
> rate and the rate constraints imposed by clk users.
> 
> The clk_rate_request structure might be extended in the future to contain
> other kind of constraints like the rounding policy, the maximum clock
> inaccuracy or other things that are not yet supported by the CCF
> (power consumption constraints ?).
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> CC: Jonathan Corbet <corbet@lwn.net>
> CC: Tony Lindgren <tony@atomide.com>
> CC: Ralf Baechle <ralf@linux-mips.org>
> CC: "Emilio López" <emilio@elopez.com.ar>
> CC: Maxime Ripard <maxime.ripard@free-electrons.com>
> CC: Tero Kristo <t-kristo@ti.com>
> CC: linux-doc@vger.kernel.org
> CC: linux-kernel@vger.kernel.org
> CC: linux-arm-kernel@lists.infradead.org
> CC: linux-omap@vger.kernel.org
> CC: linux-mips@linux-mips.org
> ---
> 
> Hi Stephen,
> 
> This patch is based on clk-next and contains the changes you suggested
> in your previous review.
> 
> It was tested on sama5d4 and compile tested on several ARM platforms
> (those enabled in multi_v7_defconfig).
> 

Thanks. I think we should wait until the next -rc1 drops to apply the
patch for the next merge window. That will make it least likely to conflict
with other trees, and we can provide it on a stable branch should there
be clock providers going through other trees somewhere. Please
remind me if I forget.

> @@ -1186,15 +1191,21 @@ EXPORT_SYMBOL_GPL(__clk_determine_rate);
>   */
>  unsigned long __clk_round_rate(struct clk *clk, unsigned long rate)
>  {
> -	unsigned long min_rate;
> -	unsigned long max_rate;
> +
> +	struct clk_rate_request req;
> +	int ret;
>  
>  	if (!clk)
>  		return 0;
>  
> -	clk_core_get_boundaries(clk->core, &min_rate, &max_rate);
> +	clk_core_get_boundaries(clk->core, &req.min_rate, &req.max_rate);
> +	req.rate = rate;
> +
> +	ret = clk_core_round_rate_nolock(clk->core, &req);
> +	if (ret)
> +		return ret;

This returns a negative int for unsigned long. Is that intentional?

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
