Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Xing Zheng <zhengxing@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org, keescook@google.com, leozwang@google.com, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: rk3036: Add apll as the critical clock
Date: Thu, 21 Jan 2016 10:21:50 +0100
Message-ID: <7538210.fX6mmzZ75v@phil>
In-Reply-To: <1453279037-23971-1-git-send-email-zhengxing@rock-chips.com>
References: <1453279037-23971-1-git-send-email-zhengxing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Xing,

Am Mittwoch, 20. Januar 2016, 16:37:17 schrieb Xing Zheng:
> The apll may be closed if there are some child clock nodes below
> it when the device startup. Therefore, the apll should be keep
> critical.
> 
> The apll tree like this:
>     pll_apll
>        apll
>           armclk
>              pclk_dbg
>              aclk_core_pre
>           aclk_hvec
>           uart_pll_clk
>              uart2_src
>                 uart2_frac
>              uart1_src
>                 uart1_frac
>              uart0_src
>                 uart0_frac

can you find out which of those clocks does cause your hang?
Because things like the uart-clocks for example should be handled by their 
driver already, at the time the clk_disable_unused runs(). So I'd really 
like the critical clock to be the actually needed clock.

Thanks
Heiko


> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>
> ---
> 
>  drivers/clk/rockchip/clk-rk3036.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3036.c
> b/drivers/clk/rockchip/clk-rk3036.c index ebce980..483913b 100644
> --- a/drivers/clk/rockchip/clk-rk3036.c
> +++ b/drivers/clk/rockchip/clk-rk3036.c
> @@ -425,6 +425,7 @@ static struct rockchip_clk_branch
> rk3036_clk_branches[] __initdata = { };
> 
>  static const char *const rk3036_critical_clocks[] __initconst = {
> +	"apll",
>  	"aclk_cpu",
>  	"aclk_peri",
>  	"hclk_peri",
