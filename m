Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1468828152-18389-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: "Nicolas Ferre" <nicolas.ferre@atmel.com>,
 "Jean-Christophe Plagniol-Villard" <plagnioj@jcrosoft.com>,
 "Alexandre Belloni" <alexandre.belloni@free-electrons.com>,
 songjun.wu@microchip.com, "Hans Verkuil" <hans.verkuil@cisco.com>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 stable@vger.kernel.org
References: <1468828152-18389-1-git-send-email-boris.brezillon@free-electrons.com>
Message-ID: <146888915908.8780.13721343837356910500@resonance>
Subject: Re: [PATCH] clk: at91: fix clk_programmable_set_parent()
Date: Mon, 18 Jul 2016 17:45:59 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2016-07-18 00:49:12)
> Since commit 1bdf02326b71e ("clk: at91: make use of syscon/regmap
> internally"), clk_programmable_set_parent() is always selecting the
> first parent (AKA slow_clk), no matter what's passed in the 'index'
> parameter.
> =

> Fix that by initializing the pckr variable to the index value.
> =

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Reported-by: Hans Verkuil <hans.verkuil@cisco.com>
> Fixes: 1bdf02326b71e ("clk: at91: make use of syscon/regmap internally")
> Cc: <stable@vger.kernel.org>

Applied to clk-fixes.

Regards,
Mike

> ---
>  drivers/clk/at91/clk-programmable.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/at91/clk-programmable.c b/drivers/clk/at91/clk-p=
rogrammable.c
> index 10f846cc8db1..25d5906640c3 100644
> --- a/drivers/clk/at91/clk-programmable.c
> +++ b/drivers/clk/at91/clk-programmable.c
> @@ -99,7 +99,7 @@ static int clk_programmable_set_parent(struct clk_hw *h=
w, u8 index)
>         struct clk_programmable *prog =3D to_clk_programmable(hw);
>         const struct clk_programmable_layout *layout =3D prog->layout;
>         unsigned int mask =3D layout->css_mask;
> -       unsigned int pckr =3D 0;
> +       unsigned int pckr =3D index;
>  =

>         if (layout->have_slck_mck)
>                 mask |=3D AT91_PMC_CSSMCK_MCK;
> -- =

> 2.7.4
>=20
