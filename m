Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular2.263xmail.com ([211.157.152.4]:39565 "EHLO
	regular2.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751987AbcAUBsV (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 20 Jan 2016 20:48:21 -0500
Received: from regular1.263xmail.com (unknown [192.168.165.185])
	by regular2.263xmail.com (Postfix) with ESMTP id A48E118EA35
	for <linux-clk@vger.kernel.org>; Thu, 21 Jan 2016 09:48:18 +0800 (CST)
Message-ID: <56A0A899.9080908@rock-chips.com>
Date: Thu, 21 Jan 2016 01:44:57 -0800
From: zhangqing <zhangqing@rock-chips.com>
MIME-Version: 1.0
To: Heiko Stuebner <heiko@sntech.de>, mturquette@baylibre.com,
	sboyd@codeaurora.org
CC: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
	xf@rock-chips.com
Subject: Re: [PATCH 1/4] clk: rockchip: fix cpuclk mux bit of big cpu-cluster
References: <1453326560-20475-1-git-send-email-heiko@sntech.de>
In-Reply-To: <1453326560-20475-1-git-send-email-heiko@sntech.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

hi:

On 01/20/2016 01:49 PM, Heiko Stuebner wrote:
> Both clusters have their mux bit in bit 7 of their respective register.
> For whatever reason the big cluster currently lists bit 15 which is
> definitly wrong.
>
> Fixes: 3536c97a52db ("clk: rockchip: add rk3368 clock controller")
> Reported-by: Zhang Qing <zhangqing@rock-chips.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>

Reviewed-by: zhangqing <zhangqing@rock-chips.com>

> ---
> I plan to include them into my clk-fixes branch, so posted for reference
> and possible objections ;-)
>
>   drivers/clk/rockchip/clk-rk3368.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
> index 21f3ea9..f6667b8 100644
> --- a/drivers/clk/rockchip/clk-rk3368.c
> +++ b/drivers/clk/rockchip/clk-rk3368.c
> @@ -165,7 +165,7 @@ static const struct rockchip_cpuclk_reg_data rk3368_cpuclkb_data = {
>   	.core_reg = RK3368_CLKSEL_CON(0),
>   	.div_core_shift = 0,
>   	.div_core_mask = 0x1f,
> -	.mux_core_shift = 15,
> +	.mux_core_shift = 7,
>   };
>
>   static const struct rockchip_cpuclk_reg_data rk3368_cpuclkl_data = {
>

