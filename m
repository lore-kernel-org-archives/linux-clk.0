Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.3]:55433 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751327AbcAUBru (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2016 20:47:50 -0500
Received: from regular1.263xmail.com (unknown [192.168.165.231])
	by regular2.263xmail.com (Postfix) with ESMTP id 552981E1C4
	for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2016 09:47:47 +0800 (CST)
Message-ID: <56A0A87A.10409@rock-chips.com>
Date: Thu, 21 Jan 2016 01:44:26 -0800
From: zhangqing <zhangqing@rock-chips.com>
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
	sboyd@codeaurora.org
CC: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	xf@rock-chips.com
Subject: Re: [PATCH 4/4] clk: rockchip: rk3368: fix hdmi_cec gate-register
References: <1453326560-20475-1-git-send-email-heiko@sntech.de> <1453326560-20475-4-git-send-email-heiko@sntech.de>
In-Reply-To: <1453326560-20475-4-git-send-email-heiko@sntech.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

hi:

On 01/20/2016 01:49 PM, Heiko Stuebner wrote:
> Fix a typo making the sclk_hdmi_cec access a wrong register to handle
> its gate.
>
> Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: zhangqing <zhangqing@rock-chips.com>

> ---
>   drivers/clk/rockchip/clk-rk3368.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
> index 6037beb..57acb62 100644
> --- a/drivers/clk/rockchip/clk-rk3368.c
> +++ b/drivers/clk/rockchip/clk-rk3368.c
> @@ -442,7 +442,7 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
>   	GATE(SCLK_HDMI_HDCP, "sclk_hdmi_hdcp", "xin24m", 0,
>   			RK3368_CLKGATE_CON(4), 13, GFLAGS),
>   	GATE(SCLK_HDMI_CEC, "sclk_hdmi_cec", "xin32k", 0,
> -			RK3368_CLKGATE_CON(5), 12, GFLAGS),
> +			RK3368_CLKGATE_CON(4), 12, GFLAGS),
>
>   	COMPOSITE_NODIV(0, "vip_src", mux_pll_src_cpll_gpll_p, 0,
>   			RK3368_CLKSEL_CON(21), 15, 1, MFLAGS,
>

