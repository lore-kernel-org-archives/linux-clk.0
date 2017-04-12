Return-Path: <gregory.clement@free-electrons.com>
From: Gregory CLEMENT <gregory.clement@free-electrons.com>
To: Colin King <colin.king@canonical.com>
Cc: Michael Turquette <mturquette@baylibre.com>,  Stephen Boyd <sboyd@codeaurora.org>,  Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,  Ulf Hansson <ulf.hansson@linaro.org>,  Russell King <rmk+kernel@armlinux.org.uk>,  Paul Gortmaker <paul.gortmaker@windriver.com>,  Konstantin Porotchkin <kostap@marvell.com>,  linux-clk@vger.kernel.org,  kernel-janitors@vger.kernel.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: apn806: fix spelling mistake: "mising" -> "missing"
References: <20170411133743.21073-1-colin.king@canonical.com>
Date: Wed, 12 Apr 2017 11:41:06 +0200
In-Reply-To: <20170411133743.21073-1-colin.king@canonical.com> (Colin King's
	message of "Tue, 11 Apr 2017 14:37:43 +0100")
Message-ID: <877f2qgdzh.fsf@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-clk.vger.kernel.org>

Hi Colin,
 
 On mar., avril 11 2017, Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
>
> trivial fix to spelling mistake in dev_warn message
>
> Fixes: f109ca864414dc ("clk: apn806: Turn the eMMC clock as optional for dts backwards compatible")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>


The intial patch was merged through the mmc subsystem while it modifies
a clk driver. So I would suggest either Ulf applying it or waiting for
v4.12-rc1 to apply the patch through the clk subsystem.

Gregory

> ---
>  drivers/clk/mvebu/ap806-system-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
> index 103fe18a3c29..8155baccc98e 100644
> --- a/drivers/clk/mvebu/ap806-system-controller.c
> +++ b/drivers/clk/mvebu/ap806-system-controller.c
> @@ -140,7 +140,7 @@ static int ap806_syscon_clk_probe(struct platform_device *pdev)
>  					  4, &name)) {
>  		ap806_clk_data.clk_num--;
>  		dev_warn(&pdev->dev,
> -			 "eMMC clock mising: update the device tree!\n");
> +			 "eMMC clock missing: update the device tree!\n");
>  	} else {
>  		ap806_clks[4] = clk_register_fixed_factor(NULL, name,
>  							  fixedclk_name,
> -- 
> 2.11.0
>

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
