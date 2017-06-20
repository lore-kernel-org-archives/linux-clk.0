Return-Path: <sboyd@codeaurora.org>
Date: Mon, 19 Jun 2017 18:55:47 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Dong Aisheng <aisheng.dong@nxp.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
	shawnguo@kernel.org, Anson.Huang@nxp.com, ping.bai@nxp.com
Subject: Re: [PATCH 3/9] clk: fractional-divider: add
 CLK_FRAC_DIVIDER_ZERO_BASED flag support
Message-ID: <20170620015547.GN4493@codeaurora.org>
References: <1494856763-6543-1-git-send-email-aisheng.dong@nxp.com>
 <1494856763-6543-4-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1494856763-6543-4-git-send-email-aisheng.dong@nxp.com>
List-ID: <linux-clk.vger.kernel.org>

On 05/15, Dong Aisheng wrote:
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index a6efbb9..4466cae 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -557,6 +557,11 @@ void clk_hw_unregister_fixed_factor(struct clk_hw *hw);
>   * @lock:	register lock
>   *
>   * Clock with adjustable fractional divider affecting its output frequency.
> + *
> + * Flags:
> + * CLK_FRAC_DIVIDER_ZERO_BASED - by default the divisor is the value read
> + *	from the register.  If CLK_FRAC_DIVIDER_ZERO_BASED is set then the
> + *	divider is the raw value read from the register plus one.

This should say the numerator and denominator are both the value
read plus one. It isn't clear if it applies to the numerator, or
the denominator, or both.

>   */
>  struct clk_fractional_divider {
>  	struct clk_hw	hw;

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
