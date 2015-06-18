Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "Sasha Levin" <sasha.levin@oracle.com>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <1434623543-10517-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Nicolas Ferre" <nicolas.ferre@atmel.com>,
 "Jean-Christophe Plagniol-Villard" <plagnioj@jcrosoft.com>,
 "Alexandre Belloni" <alexandre.belloni@free-electrons.com>,
 "Stephen Boyd" <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
 =?utf-8?b?IiBKacWZw60gUHJjaGFs?= <jiri.prchal@aksignal.cz>,
 "Boris Brezillon" <boris.brezillon@free-electrons.com>,
 stable@vger.kernel.org
References: <1434623543-10517-1-git-send-email-boris.brezillon@free-electrons.com>
Message-ID: <20150618204939.9112.25706@quantum>
Subject: Re: [PATCH] clk: at91: fix determine_rate prototype (again)
Date: Thu, 18 Jun 2015 13:49:39 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Boris Brezillon (2015-06-18 03:32:23)
> Commit ae74ea64ccdb8b99ee2618b58020263d5b1d9b22 ("clk: at91: usb:
> propagate rate modification to the parent clk") was a backport of a bug
> fix applied in 4.0, but in the meantime the ->determine_rate() prototype
> has changed, thus introduction a prototype mismatch bug in pre-4.0
> kernels. This prototype mismatch was supposed to be fixed by commit
> 76723e7ed589998384a080e29204df4659c67cf2, which fix the bug on 3.19 kerne=
ls,
> but the ->determine_rate() has also changed between 3.18 and 3.19.
> Hopefully this patch will definitely fix the prototype mismatch for 3.18.
> =

> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Reported-by: Ji=C5=99=C3=AD Prchal <jiri.prchal@aksignal.cz>
> Tested-by: Ji=C5=99=C3=AD Prchal <jiri.prchal@aksignal.cz>
> Fixes: 76723e7ed589998384a080e29204df4659c67cf2 ("clk: at91: usb: fix
> determine_rate prototype")
> Cc: <stable@vger.kernel.org> # 3.18

Boris,

Does this only apply to the 3.18 stable kernel? If so,

Acked-by: Michael Turquette <mturquette@baylibre.com>

Regards,
Mike

> ---
>  drivers/clk/at91/clk-usb.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> =

> diff --git a/drivers/clk/at91/clk-usb.c b/drivers/clk/at91/clk-usb.c
> index 0283a57..d0d335d 100644
> --- a/drivers/clk/at91/clk-usb.c
> +++ b/drivers/clk/at91/clk-usb.c
> @@ -59,7 +59,7 @@ static unsigned long at91sam9x5_clk_usb_recalc_rate(str=
uct clk_hw *hw,
>  static long at91sam9x5_clk_usb_determine_rate(struct clk_hw *hw,
>                                               unsigned long rate,
>                                               unsigned long *best_parent_=
rate,
> -                                             struct clk_hw **best_parent=
_hw)
> +                                             struct clk **best_parent_cl=
k)
>  {
>         struct clk *parent =3D NULL;
>         long best_rate =3D -EINVAL;
> @@ -91,7 +91,7 @@ static long at91sam9x5_clk_usb_determine_rate(struct cl=
k_hw *hw,
>                                 best_rate =3D tmp_rate;
>                                 best_diff =3D tmp_diff;
>                                 *best_parent_rate =3D tmp_parent_rate;
> -                               *best_parent_hw =3D __clk_get_hw(parent);
> +                               *best_parent_clk =3D parent;
>                         }
>  =

>                         if (!best_diff || tmp_rate < rate)
> -- =

> 1.9.1
> =

> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
