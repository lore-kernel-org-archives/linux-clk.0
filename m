Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-sh2.amlogic.com ([58.32.228.45]:49543 "EHLO
        mail-sh2.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750784AbeASCHH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jan 2018 21:07:07 -0500
Subject: Re: [PATCH 3/9] clk: meson: remove unnecessary rounding in the pll
 clock
To: Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
References: <20180118184532.6856-1-jbrunet@baylibre.com>
 <20180118184532.6856-4-jbrunet@baylibre.com>
CC: <yixun.lan@amlogic.com>, Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, Carlo Caione <carlo@caione.org>,
        <linux-amlogic@lists.infradead.org>, <linux-clk@vger.kernel.org>
From: Yixun Lan <yixun.lan@amlogic.com>
Message-ID: <31b18269-22f3-e536-9eb2-449a7e1fb863@amlogic.com>
Date: Fri, 19 Jan 2018 10:06:50 +0800
MIME-Version: 1.0
In-Reply-To: <20180118184532.6856-4-jbrunet@baylibre.com>
Content-Type: text/plain; charset="windows-1252"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 01/19/18 02:45, Jerome Brunet wrote:
> The pll driver perform the rate calculation in Mhz, which adds an
> unnecessary rounding down to the Mhz of the rate. Use 64bits long
> integer to perform this calculation safely on meson8b and perform the
> calculation in Hz instead
> 
> Fixes: 7a29a869434e ("clk: meson: Add support for Meson clock controller")
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/clk/meson/clk-pll.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 2614341fc4ad..fa4cec13d6e8 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -51,8 +51,7 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>  {
>  	struct meson_clk_pll *pll = to_meson_clk_pll(hw);
>  	struct parm *p;
> -	unsigned long parent_rate_mhz = parent_rate / 1000000;
> -	unsigned long rate_mhz;
> +	u64 rate;
>  	u16 n, m, frac = 0, od, od2 = 0;
>  	u32 reg;
>  
> @@ -74,17 +73,18 @@ static unsigned long meson_clk_pll_recalc_rate(struct clk_hw *hw,
>  		od2 = PARM_GET(p->width, p->shift, reg);
>  	}
>  
> +	rate = (u64)m * parent_rate;
> +
>  	p = &pll->frac;
>  	if (p->width) {
>  		reg = readl(pll->base + p->reg_off);
>  		frac = PARM_GET(p->width, p->shift, reg);
> -		rate_mhz = (parent_rate_mhz * m + \
> -				(parent_rate_mhz * frac >> 12)) * 2 / n;
> -		rate_mhz = rate_mhz >> od >> od2;
> -	} else
> -		rate_mhz = (parent_rate_mhz * m / n) >> od >> od2;
>  
> -	return rate_mhz * 1000000;
> +		rate += (u64)parent_rate * frac >> 12;
> +		rate *= 2;
> +	}
> +
> +	return (rate / n) >> od >> od2;
>  }
>  
>  static long meson_clk_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> 

Hi Jerome:
 This is exactly what I want to propose, thanks for pushing this!

 With the whole series, the fixed_pll is more accurate, and the ethernet
driver on axg is capable of choosing fclk_div2..

Yixun
