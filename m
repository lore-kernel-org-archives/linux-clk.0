Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ray Jui <rjui@broadcom.com>, "Stephen Boyd" <sboyd@codeaurora.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1445293639-5863-2-git-send-email-rjui@broadcom.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 bcm-kernel-feedback-list@broadcom.com, "Simran Rai" <ssimran@broadcom.com>,
 "Ray Jui" <rjui@broadcom.com>, stable@vger.kernel.org
References: <1445293639-5863-1-git-send-email-rjui@broadcom.com>
 <1445293639-5863-2-git-send-email-rjui@broadcom.com>
Message-ID: <20151021094154.20687.68970@quantum>
Subject: Re: [PATCH v2] clk: iproc: Fix PLL output frequency calculation
Date: Wed, 21 Oct 2015 02:41:54 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Ray Jui (2015-10-19 15:27:19)
> From: Simran Rai <ssimran@broadcom.com>
> =

> This patch affects the clocks that use fractional ndivider in their
> PLL output frequency calculation. Instead of 2^20 divide factor, the
> clock's ndiv integer shift was used. Fixed the bug by replacing ndiv
> integer shift with 2^20 factor.
> =

> Signed-off-by: Simran Rai <ssimran@broadcom.com>
> Signed-off-by: Ray Jui <rjui@broadcom.com>
> Reviewed-by: Scott Branden <sbranden@broadcom.com>
> Fixes: 5fe225c105fd ("clk: iproc: add initial common clock support")

Applied to clk-next.

Regards,
Mike

> ---
>  drivers/clk/bcm/clk-iproc-pll.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> =

> diff --git a/drivers/clk/bcm/clk-iproc-pll.c b/drivers/clk/bcm/clk-iproc-=
pll.c
> index 2dda4e8..d679ab8 100644
> --- a/drivers/clk/bcm/clk-iproc-pll.c
> +++ b/drivers/clk/bcm/clk-iproc-pll.c
> @@ -345,8 +345,8 @@ static unsigned long iproc_pll_recalc_rate(struct clk=
_hw *hw,
>         struct iproc_pll *pll =3D clk->pll;
>         const struct iproc_pll_ctrl *ctrl =3D pll->ctrl;
>         u32 val;
> -       u64 ndiv;
> -       unsigned int ndiv_int, ndiv_frac, pdiv;
> +       u64 ndiv, ndiv_int, ndiv_frac;
> +       unsigned int pdiv;
>  =

>         if (parent_rate =3D=3D 0)
>                 return 0;
> @@ -366,22 +366,19 @@ static unsigned long iproc_pll_recalc_rate(struct c=
lk_hw *hw,
>         val =3D readl(pll->pll_base + ctrl->ndiv_int.offset);
>         ndiv_int =3D (val >> ctrl->ndiv_int.shift) &
>                 bit_mask(ctrl->ndiv_int.width);
> -       ndiv =3D (u64)ndiv_int << ctrl->ndiv_int.shift;
> +       ndiv =3D ndiv_int << 20;
>  =

>         if (ctrl->flags & IPROC_CLK_PLL_HAS_NDIV_FRAC) {
>                 val =3D readl(pll->pll_base + ctrl->ndiv_frac.offset);
>                 ndiv_frac =3D (val >> ctrl->ndiv_frac.shift) &
>                         bit_mask(ctrl->ndiv_frac.width);
> -
> -               if (ndiv_frac !=3D 0)
> -                       ndiv =3D ((u64)ndiv_int << ctrl->ndiv_int.shift) |
> -                               ndiv_frac;
> +               ndiv +=3D ndiv_frac;
>         }
>  =

>         val =3D readl(pll->pll_base + ctrl->pdiv.offset);
>         pdiv =3D (val >> ctrl->pdiv.shift) & bit_mask(ctrl->pdiv.width);
>  =

> -       clk->rate =3D (ndiv * parent_rate) >> ctrl->ndiv_int.shift;
> +       clk->rate =3D (ndiv * parent_rate) >> 20;
>  =

>         if (pdiv =3D=3D 0)
>                 clk->rate *=3D 2;
> -- =

> 1.9.1
>=20
