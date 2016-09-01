Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from regular1.263xmail.com ([211.150.99.140]:55819 "EHLO
        regular1.263xmail.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750813AbcIAGIn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Sep 2016 02:08:43 -0400
Subject: Re: [PATCH] clk: rockchip: add 2016M to big cpu clk rate table
To: Shunqian Zheng <zhengsq@rock-chips.com>, heiko@sntech.de,
        sboyd@codeaurora.org, mturquette@baylibre.com,
        dianders@chromium.org
References: <1472684782-17940-1-git-send-email-zhengsq@rock-chips.com>
Cc: linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        zhangqing@rock-chips.com, linux-kernel@vger.kernel.org
From: Xing Zheng <zhengxing@rock-chips.com>
Message-ID: <57C7C5D2.7000404@rock-chips.com>
Date: Thu, 1 Sep 2016 14:08:18 +0800
MIME-Version: 1.0
In-Reply-To: <1472684782-17940-1-git-send-email-zhengsq@rock-chips.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Shunqian,

On 2016年09月01日 07:06, Shunqian Zheng wrote:
> We would prefer the 2016M as 2.0G than 1992M which seems odd, adding
> it to big cpu clk rate table then we can set 2016M in dts.
>
> Signed-off-by: Shunqian Zheng <zhengsq@rock-chips.com>
> ---
>   drivers/clk/rockchip/clk-rk3399.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
> index ede6c47..a6a15c6 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -375,6 +375,7 @@ static struct rockchip_cpuclk_rate_table rk3399_cpuclkb_rates[] __initdata = {
>   	RK3399_CPUCLKB_RATE(2184000000, 1, 11, 11),
>   	RK3399_CPUCLKB_RATE(2088000000, 1, 10, 10),
>   	RK3399_CPUCLKB_RATE(2040000000, 1, 10, 10),
> +	RK3399_CPUCLKB_RATE(2016000000, 1, 9, 9),
>   	RK3399_CPUCLKB_RATE(1992000000, 1, 9, 9),
>   	RK3399_CPUCLKB_RATE(1896000000, 1, 9, 9),
>   	RK3399_CPUCLKB_RATE(1800000000, 1, 8, 8),
It looks good to me.

Reviewed-by: Xing Zheng <zhengxing@rock-chips.com>

Thanks.

-- 
- Xing Zheng


