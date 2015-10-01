Return-Path: <sboyd@codeaurora.org>
Date: Thu, 1 Oct 2015 15:56:28 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 14/38] clk: vt8500: fix sign of possible PLL values
Message-ID: <20151001225628.GU19319@codeaurora.org>
References: <1442842450-29769-1-git-send-email-a.hajda@samsung.com>
 <1442842450-29769-15-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1442842450-29769-15-git-send-email-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 09/21, Andrzej Hajda wrote:
> With unsigned values underflow in loops can occur resulting in
> theoretically infinite loops.
> 
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/unsigned_lesser_than_zero.cocci [1].
> 
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2038576
> 
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
> ---
>  drivers/clk/clk-vt8500.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/clk-vt8500.c b/drivers/clk/clk-vt8500.c
> index 37e9288..098e9fa 100644
> --- a/drivers/clk/clk-vt8500.c
> +++ b/drivers/clk/clk-vt8500.c
> @@ -384,7 +384,7 @@ static void vt8500_find_pll_bits(unsigned long rate, unsigned long parent_rate,
>  static void wm8650_find_pll_bits(unsigned long rate, unsigned long parent_rate,
>  				u32 *multiplier, u32 *divisor1, u32 *divisor2)
>  {
> -	u32 mul, div1, div2;
> +	int mul, div1, div2;

Only div2 seems to need the treatment here.

>  	u32 best_mul, best_div1, best_div2;
>  	unsigned long tclk, rate_err, best_err;
>  
> @@ -452,7 +452,7 @@ static u32 wm8750_get_filter(u32 parent_rate, u32 divisor1)
>  static void wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
>  				u32 *filter, u32 *multiplier, u32 *divisor1, u32 *divisor2)
>  {
> -	u32 mul, div1, div2;
> +	int mul, div1, div2;

And here div1 and div2 are the only ones.

>  	u32 best_mul, best_div1, best_div2;
>  	unsigned long tclk, rate_err, best_err;
>  
> @@ -496,7 +496,7 @@ static void wm8750_find_pll_bits(unsigned long rate, unsigned long parent_rate,
>  static void wm8850_find_pll_bits(unsigned long rate, unsigned long parent_rate,
>  				u32 *multiplier, u32 *divisor1, u32 *divisor2)
>  {
> -	u32 mul, div1, div2;
> +	int mul, div1, div2;

And div1 and div2 here.

Can we focus the changes on the actual problematic variables? I
suppose this has never mattered because we break out of these
loops.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
