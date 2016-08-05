Return-Path: <heiko@sntech.de>
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chris Zhong <zyw@rock-chips.com>
Cc: dianders@chromium.org, tfiga@chromium.org, yzq@rock-chips.com, groeck@chromium.org, wulf@rock-chips.com, marcheu@chromium.org, linux-rockchip@lists.infradead.org, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: rockchip: mark rk3399 hdcp_noc and pclk_vio_grf as critical
Date: Fri, 05 Aug 2016 13:02:48 +0200
Message-ID: <4055149.Zs66lEhv2I@diego>
In-Reply-To: <1470209784-2665-1-git-send-email-zyw@rock-chips.com>
References: <1470209784-2665-1-git-send-email-zyw@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi Chris,

Am Mittwoch, 3. August 2016, 15:36:24 schrieb Chris Zhong:
> The Type-C DP need these clocks: aclk_hdcp_noc, hclk_hdcp_noc,
> pclk_hdcp_noc, pclk_vio_grf. Mark them as critical to avoid someone
> close them.
> 
> Signed-off-by: Chris Zhong <zyw@rock-chips.com>
> 
> ---
> 
>  drivers/clk/rockchip/clk-rk3399.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/rockchip/clk-rk3399.c
> b/drivers/clk/rockchip/clk-rk3399.c index 78e51cb..6c8ed25 100644
> --- a/drivers/clk/rockchip/clk-rk3399.c
> +++ b/drivers/clk/rockchip/clk-rk3399.c
> @@ -1466,6 +1466,9 @@ static struct rockchip_clk_branch
> rk3399_clk_pmu_branches[] __initdata = {
> 
>  static const char *const rk3399_cru_critical_clocks[] __initconst = {
>  	"aclk_cci_pre",
> +	"aclk_hdcp_noc",
> +	"hclk_hdcp_noc",
> +	"pclk_hdcp_noc",
>  	"pclk_perilp0",
>  	"pclk_perilp0",
>  	"hclk_perilp0",

ok, we have marked all other noc (interconnect) clocks as critical, so this 
looks good.

> @@ -1485,6 +1488,7 @@ static const char *const rk3399_cru_critical_clocks[]
> __initconst = { "gpll_hclk_perilp1_src",
>  	"gpll_aclk_perilp0_src",
>  	"gpll_aclk_perihp_src",
> +	"pclk_vio_grf",

I don't necessarily agree with this one. It seems for the analogix-dp the 
preferred way is to have the driver handle its needed clock, see
	"[PATCH v1 6/6] drm/rockchip: dw_hdmi: introduce the pclk for grf" [0]


Heiko

[0] https://patchwork.kernel.org/patch/9223331/
