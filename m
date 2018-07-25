Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Nicholas Mc Guire <hofrat@osadl.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531649904-6072-2-git-send-email-hofrat@osadl.org>
Cc: Kees Cook <keescook@chromium.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Nicholas Mc Guire <hofrat@osadl.org>
References: <1531649904-6072-1-git-send-email-hofrat@osadl.org>
 <1531649904-6072-2-git-send-email-hofrat@osadl.org>
Message-ID: <153255125317.48062.14342630708691039501@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH 2/2] drivers: clk: st: address sparse warnings
Date: Wed, 25 Jul 2018 13:40:53 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Nicholas Mc Guire (2018-07-15 03:18:24)
>  Refactoring of code to make it more readable and at the same time make
> sparse happy again.
> =

> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>
> ---
> =

> sparse complained about:
> drivers/clk/st/clkgen-pll.c:225:12: warning: context imbalance in 'clkgen=
_pll_enable' - different lock contexts for basic block
> drivers/clk/st/clkgen-pll.c:267:9: warning: context imbalance in 'clkgen_=
pll_disable' - different lock contexts for basic block
> drivers/clk/st/clkgen-pll.c:413:9: warning: context imbalance in 'set_rat=
e_stm_pll3200c32' - different lock contexts for basic block
> drivers/clk/st/clkgen-pll.c:570:9: warning: context imbalance in 'set_rat=
e_stm_pll4600c28' - different lock contexts for basic block
> =

> Which are technically false positives as the pll->lock which is being
> checked is determined at configuration time, thus the locks are balanced.
> Never the less the refactored code seems more readable and was =

> commented to make it clear.

This stuff above should go into the commit text.

> =

> Patch was compile tested with: multi_v7_defconfig (implies
> CONFIG_ARCH_STI=3Dy)
> =

> Patch is against 4.18-rc4 (localversion-next is next-20180713)
> =

>  drivers/clk/st/clkgen-pll.c | 51 +++++++++++++++++++++++++--------------=
------
>  1 file changed, 28 insertions(+), 23 deletions(-)

I believe this driver is in stasis mode. Not sure anyone is testing this
right now. Please Cc people who have worked on this driver, like Gabriel
Fernandez.
 =

> =

> diff --git a/drivers/clk/st/clkgen-pll.c b/drivers/clk/st/clkgen-pll.c
> index 7a7106dc..cbb5184 100644
> --- a/drivers/clk/st/clkgen-pll.c
> +++ b/drivers/clk/st/clkgen-pll.c
> @@ -228,13 +228,13 @@ static int clkgen_pll_enable(struct clk_hw *hw)
>         unsigned long flags =3D 0;
>         int ret =3D 0;
>  =

> -       if (pll->lock)
> +       if (pll->lock) {
> +               /* stih418 and stih407 */
>                 spin_lock_irqsave(pll->lock, flags);
> -
> -       ret =3D __clkgen_pll_enable(hw);
> -
> -       if (pll->lock)
> +               ret =3D __clkgen_pll_enable(hw);
>                 spin_unlock_irqrestore(pll->lock, flags);
> +       } else
> +               ret =3D __clkgen_pll_enable(hw);
>  =

>         return ret;
>  }
> @@ -259,13 +259,13 @@ static void clkgen_pll_disable(struct clk_hw *hw)
>         struct clkgen_pll *pll =3D to_clkgen_pll(hw);
>         unsigned long flags =3D 0;
>  =

> -       if (pll->lock)
> +       if (pll->lock) {
> +               /* stih418 and stih407 */
>                 spin_lock_irqsave(pll->lock, flags);
> -
> -       __clkgen_pll_disable(hw);
> -
> -       if (pll->lock)
> +               __clkgen_pll_disable(hw);
>                 spin_unlock_irqrestore(pll->lock, flags);
> +       } else
> +               __clkgen_pll_disable(hw);
>  }
>  =

>  static int clk_pll3200c32_get_params(unsigned long input, unsigned long =
output,
> @@ -400,15 +400,18 @@ static int set_rate_stm_pll3200c32(struct clk_hw *h=
w, unsigned long rate,
>  =

>         __clkgen_pll_disable(hw);
>  =

> -       if (pll->lock)
> +       if (pll->lock) {
> +               /* stih407 and stih418 */
>                 spin_lock_irqsave(pll->lock, flags);
> -
> -       CLKGEN_WRITE(pll, ndiv, pll->ndiv);
> -       CLKGEN_WRITE(pll, idf, pll->idf);
> -       CLKGEN_WRITE(pll, cp, pll->cp);
> -
> -       if (pll->lock)
> +               CLKGEN_WRITE(pll, ndiv, pll->ndiv);
> +               CLKGEN_WRITE(pll, idf, pll->idf);
> +               CLKGEN_WRITE(pll, cp, pll->cp);
>                 spin_unlock_irqrestore(pll->lock, flags);
> +       } else {
> +               CLKGEN_WRITE(pll, ndiv, pll->ndiv);
> +               CLKGEN_WRITE(pll, idf, pll->idf);
> +               CLKGEN_WRITE(pll, cp, pll->cp);
> +       }

Please don't duplicate this code. The sparse warnings can be fixed by
adding a fake lock acquire to the else of the if condition. We do this
in drivers/clk/clk.c so you should be able to copy it from there.

> =20
