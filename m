Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Carlo Caione" <carlo@caione.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170309104154.28295-7-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170309104154.28295-1-jbrunet@baylibre.com>
 <20170309104154.28295-7-jbrunet@baylibre.com>
Message-ID: <149013840504.54062.12985141705597897606@resonance>
Subject: Re: [PATCH v2 6/9] clk: meson: gxbb: mpll: use rw operation
Date: Tue, 21 Mar 2017 16:20:05 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-03-09 02:41:51)
> Use read/write operations for the mpll clocks instead of the
> read-only ones.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Looks good to me.

Regards,
Mike

> ---
>  drivers/clk/meson/gxbb.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> =

> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 79fb8989f8dd..5059c7bbdbb3 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -459,7 +459,7 @@ static struct meson_clk_mpll gxbb_mpll0 =3D {
>         .lock =3D &clk_lock,
>         .hw.init =3D &(struct clk_init_data){
>                 .name =3D "mpll0",
> -               .ops =3D &meson_clk_mpll_ro_ops,
> +               .ops =3D &meson_clk_mpll_ops,
>                 .parent_names =3D (const char *[]){ "fixed_pll" },
>                 .num_parents =3D 1,
>         },
> @@ -489,7 +489,7 @@ static struct meson_clk_mpll gxbb_mpll1 =3D {
>         .lock =3D &clk_lock,
>         .hw.init =3D &(struct clk_init_data){
>                 .name =3D "mpll1",
> -               .ops =3D &meson_clk_mpll_ro_ops,
> +               .ops =3D &meson_clk_mpll_ops,
>                 .parent_names =3D (const char *[]){ "fixed_pll" },
>                 .num_parents =3D 1,
>         },
> @@ -519,7 +519,7 @@ static struct meson_clk_mpll gxbb_mpll2 =3D {
>         .lock =3D &clk_lock,
>         .hw.init =3D &(struct clk_init_data){
>                 .name =3D "mpll2",
> -               .ops =3D &meson_clk_mpll_ro_ops,
> +               .ops =3D &meson_clk_mpll_ops,
>                 .parent_names =3D (const char *[]){ "fixed_pll" },
>                 .num_parents =3D 1,
>         },
> -- =

> 2.9.3
>=20
