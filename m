Return-Path: <shawn.lin@rock-chips.com>
Subject: Re: [PATCH] clk: rockchip: fix some clocks' name to be more standard
 style
To: Jianqun Xu <jay.xu@rock-chips.com>, mturquette@baylibre.com,
 sboyd@codeaurora.org, heiko@sntech.de, huangtao@rock-chips.com,
 zhangqing@rock-chips.com, zhengxing@rock-chips.com
References: <1478070296-23080-1-git-send-email-jay.xu@rock-chips.com>
Cc: shawn.lin@rock-chips.com, linux-kernel@vger.kernel.org,
 lintao@rock-chips.com, linux-rockchip@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <763cad68-a068-9a4b-e26d-2c459c2d4808@rock-chips.com>
Date: Thu, 3 Nov 2016 16:52:48 +0800
MIME-Version: 1.0
In-Reply-To: <1478070296-23080-1-git-send-email-jay.xu@rock-chips.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 2016/11/2 15:04, Jianqun Xu wrote:
> Fix aclk_emmcgrf to aclk_emmc_grf, and fix aclk_emmccore to be
> aclk_emmc_core.
>

What is the standard style should be?

TRM uses aclk_emmccore but not aclk_emmc_core, so should it be more
standrad to keep it as-is?

> Signed-off-by: Jianqun Xu <jay.xu@rock-chips.com>
> ---
>  drivers/clk/rockchip/clk-rk3399.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
> index 2c7cba7..b3df2c6 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -935,11 +935,11 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
>  			RK3399_CLKGATE_CON(6), 13, GFLAGS),
>  	COMPOSITE_NOGATE(ACLK_EMMC, "aclk_emmc", mux_aclk_emmc_p, CLK_IGNORE_UNUSED,
>  			RK3399_CLKSEL_CON(21), 7, 1, MFLAGS, 0, 5, DFLAGS),
> -	GATE(ACLK_EMMC_CORE, "aclk_emmccore", "aclk_emmc", CLK_IGNORE_UNUSED,
> +	GATE(ACLK_EMMC_CORE, "aclk_emmc_core", "aclk_emmc", CLK_IGNORE_UNUSED,
>  			RK3399_CLKGATE_CON(32), 8, GFLAGS),
>  	GATE(ACLK_EMMC_NOC, "aclk_emmc_noc", "aclk_emmc", CLK_IGNORE_UNUSED,
>  			RK3399_CLKGATE_CON(32), 9, GFLAGS),
> -	GATE(ACLK_EMMC_GRF, "aclk_emmcgrf", "aclk_emmc", CLK_IGNORE_UNUSED,
> +	GATE(ACLK_EMMC_GRF, "aclk_emmc_grf", "aclk_emmc", CLK_IGNORE_UNUSED,
>  			RK3399_CLKGATE_CON(32), 10, GFLAGS),
>
>  	/* perilp0 */
>


-- 
Best Regards
Shawn Lin
