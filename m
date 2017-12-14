Return-Path: <ulf.hansson@linaro.org>
MIME-Version: 1.0
In-Reply-To: <1510234022-29442-3-git-send-email-geert+renesas@glider.be>
References: <1510234022-29442-1-git-send-email-geert+renesas@glider.be> <1510234022-29442-3-git-send-email-geert+renesas@glider.be>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 14 Dec 2017 15:11:17 +0100
Message-ID: <CAPDyKFr6=od_PL=Y_N4OB_+wkZumb=aEV4_x7Z5J4jTL-C1aDg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] clk: renesas: cpg-mssr: Keep wakeup sources active
 during system suspend
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Kevin Hilman <khilman@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	Simon Horman <horms@verge.net.au>, Magnus Damm <magnus.damm@gmail.com>,
	"linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On 9 November 2017 at 14:27, Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> If a device is part of the CPG/MSSR Clock Domain and to be used as a
> wakeup source, it must be kept active during system suspend.
>
> Currently this is handled in device-specific drivers by explicitly
> increasing the use count of the module clock when the device is
> configured as a wakeup source.  However, the proper way to prevent the
> device from being stopped is to inform this requirement to the genpd
> core, by setting the GENPD_FLAG_ACTIVE_WAKEUP flag.
>
> Note that this will only affect devices configured as wakeup sources.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe


> ---
> v2:
>   - Integrate "clk: renesas: cpg-mssr: Use GENPD_FLAG_ACTIVE_WAKEUP",
> ---
>  drivers/clk/renesas/renesas-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index e580a5e6346c2533..99699b715d7cf2de 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -500,7 +500,7 @@ static int __init cpg_mssr_add_clk_domain(struct device *dev,
>
>         genpd = &pd->genpd;
>         genpd->name = np->name;
> -       genpd->flags = GENPD_FLAG_PM_CLK;
> +       genpd->flags = GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
>         genpd->attach_dev = cpg_mssr_attach_dev;
>         genpd->detach_dev = cpg_mssr_detach_dev;
>         pm_genpd_init(genpd, &pm_domain_always_on_gov, false);
> --
> 2.7.4
>
