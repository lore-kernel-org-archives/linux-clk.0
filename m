Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Eric Anholt <eric@anholt.net>,  linux-clk@vger.kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1455591838-22725-2-git-send-email-eric@anholt.net>
Cc: linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "Stephen Warren" <swarren@wwwdotorg.org>,
 "Lee Jones" <lee@kernel.org>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Eric Anholt" <eric@anholt.net>
References: <1455591838-22725-1-git-send-email-eric@anholt.net>
 <1455591838-22725-2-git-send-email-eric@anholt.net>
Message-ID: <20160216214509.2278.72829@quark.deferred.io>
Subject: Re: [PATCH 2/2] clk: bcm2835: Reuse CLK_DIVIDER_MAX_AT_ZERO for recalc_rate()
Date: Tue, 16 Feb 2016 13:45:09 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Eric Anholt (2016-02-15 19:03:58)
> We were rolling this ourselves, but clk-divider can do it now.
> =

> Signed-off-by: Eric Anholt <eric@anholt.net>

Applied to clk-next.

Regards,
Mike

> ---
>  drivers/clk/bcm/clk-bcm2835.c | 13 ++-----------
>  1 file changed, 2 insertions(+), 11 deletions(-)
> =

> diff --git a/drivers/clk/bcm/clk-bcm2835.c b/drivers/clk/bcm/clk-bcm2835.c
> index 9f4df8f..353e438 100644
> --- a/drivers/clk/bcm/clk-bcm2835.c
> +++ b/drivers/clk/bcm/clk-bcm2835.c
> @@ -1060,16 +1060,7 @@ static long bcm2835_pll_divider_round_rate(struct =
clk_hw *hw,
>  static unsigned long bcm2835_pll_divider_get_rate(struct clk_hw *hw,
>                                                   unsigned long parent_ra=
te)
>  {
> -       struct bcm2835_pll_divider *divider =3D bcm2835_pll_divider_from_=
hw(hw);
> -       struct bcm2835_cprman *cprman =3D divider->cprman;
> -       const struct bcm2835_pll_divider_data *data =3D divider->data;
> -       u32 div =3D cprman_read(cprman, data->a2w_reg);
> -
> -       div &=3D (1 << A2W_PLL_DIV_BITS) - 1;
> -       if (div =3D=3D 0)
> -               div =3D 256;
> -
> -       return parent_rate / div;
> +       return clk_divider_ops.recalc_rate(hw, parent_rate);
>  }
>  =

>  static void bcm2835_pll_divider_off(struct clk_hw *hw)
> @@ -1430,7 +1421,7 @@ bcm2835_register_pll_divider(struct bcm2835_cprman =
*cprman,
>         divider->div.reg =3D cprman->regs + data->a2w_reg;
>         divider->div.shift =3D A2W_PLL_DIV_SHIFT;
>         divider->div.width =3D A2W_PLL_DIV_BITS;
> -       divider->div.flags =3D 0;
> +       divider->div.flags =3D CLK_DIVIDER_MAX_AT_ZERO;
>         divider->div.lock =3D &cprman->regs_lock;
>         divider->div.hw.init =3D &init;
>         divider->div.table =3D NULL;
> -- =

> 2.7.0
>=20
