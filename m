Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20170411133743.21073-1-colin.king@canonical.com>
References: <20170411133743.21073-1-colin.king@canonical.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Apr 2017 16:11:15 +0200
Message-ID: <CAPDyKFrT3XfMqE7_f3x=7hztATXTsGt-oUe=ehrNLcb33WkBdg@mail.gmail.com>
Subject: Re: [PATCH] clk: apn806: fix spelling mistake: "mising" -> "missing"
To: Colin King <colin.king@canonical.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Gregory CLEMENT <gregory.clement@free-electrons.com>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
	Russell King <rmk+kernel@armlinux.org.uk>, Paul Gortmaker <paul.gortmaker@windriver.com>,
	Konstantin Porotchkin <kostap@marvell.com>, linux-clk <linux-clk@vger.kernel.org>,
	kernel-janitors@vger.kernel.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 11 April 2017 at 15:37, Colin King <colin.king@canonical.com> wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> trivial fix to spelling mistake in dev_warn message
>
> Fixes: f109ca864414dc ("clk: apn806: Turn the eMMC clock as optional for dts backwards compatible")
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Thanks, applied for next at mmc tree!

Kind regards
Uffe

> ---
>  drivers/clk/mvebu/ap806-system-controller.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/mvebu/ap806-system-controller.c b/drivers/clk/mvebu/ap806-system-controller.c
> index 103fe18a3c29..8155baccc98e 100644
> --- a/drivers/clk/mvebu/ap806-system-controller.c
> +++ b/drivers/clk/mvebu/ap806-system-controller.c
> @@ -140,7 +140,7 @@ static int ap806_syscon_clk_probe(struct platform_device *pdev)
>                                           4, &name)) {
>                 ap806_clk_data.clk_num--;
>                 dev_warn(&pdev->dev,
> -                        "eMMC clock mising: update the device tree!\n");
> +                        "eMMC clock missing: update the device tree!\n");
>         } else {
>                 ap806_clks[4] = clk_register_fixed_factor(NULL, name,
>                                                           fixedclk_name,
> --
> 2.11.0
>
