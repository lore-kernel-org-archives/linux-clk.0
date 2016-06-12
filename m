Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lucky1.263xmail.com ([211.157.147.133]:38440 "EHLO
	lucky1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751182AbcFLKrI (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jun 2016 06:47:08 -0400
Subject: Re: [PATCH] clk: rockchip: add flag CLK_SET_RATE_PARENT for
 dclk_vop0_div on RK3399
To: Xing Zheng <zhengxing@rock-chips.com>, heiko@sntech.de
References: <1465724928-14611-1-git-send-email-zhengxing@rock-chips.com>
Cc: dianders@chromium.org, elaine.zhang@rock-chips.com,
	huangtao@rock-chips.com, briannorris@chromium.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
From: Yakir Yang <ykk@rock-chips.com>
Message-ID: <575D3D9B.1070501@rock-chips.com>
Date: Sun, 12 Jun 2016 18:46:51 +0800
MIME-Version: 1.0
In-Reply-To: <1465724928-14611-1-git-send-email-zhengxing@rock-chips.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Xing,

On 06/12/2016 05:48 PM, Xing Zheng wrote:
> The functions and features VOP0 more complete than VOP1's, we need to
> use it dclk_vop0_div operate VPLLI, and let VOP0 as the default primary
> screen.
>
> Signed-off-by: Xing Zheng <zhengxing@rock-chips.com>

Tested on RK3399 Kevin board, after apply this patch, my eDP panel light 
up normally. So

Tested-by: Yakir Yang <ykk@rock-chips.com>

BR,
- Yakir

> ---
>
>   drivers/clk/rockchip/clk-rk3399.c |    2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
> index 7ecb12c3..6affa75 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -1157,7 +1157,7 @@ static struct rockchip_clk_branch rk3399_clk_branches[] __initdata = {
>   	GATE(HCLK_VOP0_NOC, "hclk_vop0_noc", "hclk_vop0_pre", CLK_IGNORE_UNUSED,
>   			RK3399_CLKGATE_CON(28), 0, GFLAGS),
>   
> -	COMPOSITE(DCLK_VOP0_DIV, "dclk_vop0_div", mux_pll_src_vpll_cpll_gpll_p, 0,
> +	COMPOSITE(DCLK_VOP0_DIV, "dclk_vop0_div", mux_pll_src_vpll_cpll_gpll_p, CLK_SET_RATE_PARENT,
>   			RK3399_CLKSEL_CON(49), 8, 2, MFLAGS, 0, 8, DFLAGS,
>   			RK3399_CLKGATE_CON(10), 12, GFLAGS),
>   


