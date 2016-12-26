Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, xf@rock-chips.com, robh+dt@kernel.org, mark.rutland@arm.com, linux-clk@vger.kernel.org, huangtao@rock-chips.com, xxx@rock-chips.com, cl@rock-chips.com, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/4] clk: rockchip: add new pll-type for rk3328
Date: Mon, 26 Dec 2016 12:17:06 +0100
Message-ID: <30891453.yaZWColTmb@phil>
In-Reply-To: <1482723930-5876-5-git-send-email-zhangqing@rock-chips.com>
References: <1482723930-5876-1-git-send-email-zhangqing@rock-chips.com> <1482723930-5876-5-git-send-email-zhangqing@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 26. Dezember 2016, 11:45:30 CET schrieb Elaine Zhang:
> The rk3328's pll and clock are similar with rk3036's,
> it different with pll_mode_mask, the rk3328 soc
> pll mode only one bit(rk3036 soc have two bits)
> so these should be independent and separate from
> the series of rk3328s.
> 
> Changes in v3:
>   fix up the pll type pll_rk3328 description and use
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---

pll-specific code looks good now, but please make this patch before the clock 
controller in the series and move the 

@@ -130,6 +152,7 @@
 enum rockchip_pll_type {
        pll_rk3036,
        pll_rk3066,
+       pll_rk3328,
        pll_rk3399,
 };
 
from patch3 into this one.


Thanks
Heiko

PS: I will have some comments for the clock controller patch, but it's xmas, 
so that may take bit still.
