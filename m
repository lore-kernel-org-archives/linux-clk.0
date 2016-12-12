Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jose Abreu <Jose.Abreu@synopsys.com>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <040cc9afdfa0e95ce7a01c406ff427ef7dc0c0fd.1481540717.git.joabreu@synopsys.com>
Cc: "Jose Abreu" <Jose.Abreu@synopsys.com>,
 "Carlos Palminha" <CARLOS.PALMINHA@synopsys.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org
References: <040cc9afdfa0e95ce7a01c406ff427ef7dc0c0fd.1481540717.git.joabreu@synopsys.com>
Message-ID: <148156941210.37646.9887321843077068242@resonance>
Subject: Re: [PATCH] clk/axs10x: Clear init field in driver probe
Date: Mon, 12 Dec 2016 11:03:32 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Jose Abreu (2016-12-12 03:08:55)
> Init field must be cleared in driver probe as this structure is not dinam=
ically allocated. If not, wrong flags can be passed to core.
> =

> Signed-off-by: Jose Abreu <joabreu@synopsys.com>

Applied to clk-next. You can find this patch merged after v4.10-rc1 is
released in a couple of weeks.

Regards,
Mike

> Cc: Carlos Palminha <palminha@synopsys.com>
> Cc: Stephen Boyd <sboyd@codeaurora.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  drivers/clk/axs10x/i2s_pll_clock.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/drivers/clk/axs10x/i2s_pll_clock.c b/drivers/clk/axs10x/i2s_=
pll_clock.c
> index 411310d..02d3bcd 100644
> --- a/drivers/clk/axs10x/i2s_pll_clock.c
> +++ b/drivers/clk/axs10x/i2s_pll_clock.c
> @@ -182,6 +182,7 @@ static int i2s_pll_clk_probe(struct platform_device *=
pdev)
>         if (IS_ERR(pll_clk->base))
>                 return PTR_ERR(pll_clk->base);
>  =

> +       memset(&init, 0, sizeof(init));
>         clk_name =3D node->name;
>         init.name =3D clk_name;
>         init.ops =3D &i2s_pll_ops;
> -- =

> 1.9.1
> =

>=20
