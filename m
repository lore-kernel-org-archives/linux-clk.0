Return-Path: <heiko@sntech.de>
From: Heiko Stuebner <heiko@sntech.de>
To: Shawn Lin <shawn.lin@rock-chips.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/6] soc: rockchip: power-domain: check the existing of regmap
Date: Mon, 15 Feb 2016 22:26:04 +0100
Message-ID: <1766177.2LWUTugthY@phil>
In-Reply-To: <1455507237-13161-1-git-send-email-shawn.lin@rock-chips.com>
References: <1455507153-12914-1-git-send-email-shawn.lin@rock-chips.com> <1455507237-13161-1-git-send-email-shawn.lin@rock-chips.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Am Montag, 15. Februar 2016, 11:33:57 schrieb Shawn Lin:
> Check return value of syscon_node_to_regmap for
> rockchip_pm_domain_probe. If err value is returned, probe
> procedure should abort.
> 
> Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>

applied to my armsoc/drivers branch for 4.6 with one change below

> ---
> 
>  drivers/soc/rockchip/pm_domains.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/soc/rockchip/pm_domains.c
> b/drivers/soc/rockchip/pm_domains.c index 534c589..3c4a44d 100644
> --- a/drivers/soc/rockchip/pm_domains.c
> +++ b/drivers/soc/rockchip/pm_domains.c
> @@ -402,6 +402,10 @@ static int rockchip_pm_domain_probe(struct
> platform_device *pdev) }
> 
>  	pmu->regmap = syscon_node_to_regmap(parent->of_node);
> +	if (IS_ERR(pmu->regmap)) {
> +		dev_err(dev, "no regmap available\n");
> +		return -ENODEV;

Instead of returning ENODEV I did go with

		return PTR_ERR(pmu->regmap);

the error from trying to grab the regmap.


Heiko
