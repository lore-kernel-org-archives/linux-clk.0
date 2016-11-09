Return-Path: <yamada.masahiro@socionext.com>
MIME-Version: 1.0
In-Reply-To: <20161109110046.9594-1-u.kleine-koenig@pengutronix.de>
References: <20161109110046.9594-1-u.kleine-koenig@pengutronix.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 9 Nov 2016 20:25:22 +0900
Message-ID: <CAK7LNARSfBBFffOyRa03hGqfJ+7gSHe-A+Efm9oM1sOdgLL-Ag@mail.gmail.com>
Subject: Re: [PATCH] clk: gate: fix coding style
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>, Sascha Hauer <kernel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

2016-11-09 20:00 GMT+09:00 Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutron=
ix.de>:
> The : of the ?: operator should have a leading space.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>
> I always wonder if I should send such patches or if they hurt more than
> they are worth. *shrug* ignore at will.
>
> Best regards
> Uwe
>
>  drivers/clk/clk-gate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk-gate.c b/drivers/clk/clk-gate.c
> index 4e691e35483a..59e302538d23 100644
> --- a/drivers/clk/clk-gate.c
> +++ b/drivers/clk/clk-gate.c
> @@ -145,7 +145,7 @@ struct clk_hw *clk_hw_register_gate(struct device *de=
v, const char *name,
>         init.name =3D name;
>         init.ops =3D &clk_gate_ops;
>         init.flags =3D flags | CLK_IS_BASIC;
> -       init.parent_names =3D (parent_name ? &parent_name: NULL);
> +       init.parent_names =3D (parent_name ? &parent_name : NULL);
>         init.num_parents =3D (parent_name ? 1 : 0);
>

Do we need the parentheses?


--=20
Best Regards
Masahiro Yamada
