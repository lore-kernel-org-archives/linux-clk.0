Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: rockchip: check grf when waiting pll lock
Date: Mon, 15 Feb 2016 22:40:18 +0100
Message-ID: <1835816.QSOU3ZhEch@phil>
In-Reply-To: <1455507205-12996-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com> <1455507205-12996-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 15. Februar 2016, 11:33:25 schrieb Shawn Lin:
> rockchip_clk_get_grf pass on return value from
> syscon_regmap_lookup_by_phandle, so we check grf to
> make sure whether to do the following things or not.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my clk-branch for 4.6 with one change below

> ---
> 
>  drivers/clk/rockchip/clk-pll.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/rockchip/clk-pll.c
> b/drivers/clk/rockchip/clk-pll.c index b7e66c9..dddbc29 100644
> --- a/drivers/clk/rockchip/clk-pll.c
> +++ b/drivers/clk/rockchip/clk-pll.c
> @@ -90,10 +90,16 @@ static long rockchip_pll_round_rate(struct clk_hw *hw,
> */
>  static int rockchip_pll_wait_lock(struct rockchip_clk_pll *pll)
>  {
> -	struct regmap *grf = rockchip_clk_get_grf();
> +	struct regmap *grf;
>  	unsigned int val;
>  	int delay = 24000000, ret;
> 
> +	grf = rockchip_clk_get_grf();
> +	if (IS_ERR(grf)) {
> +		pr_err("%s: grf regmap not available\n", __func__);
> +		return -ENODEV;

I've changed that to PTR_ERR(grf), similar to the preexisting checks


Heiko
