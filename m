Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Jerome Brunet <jbrunet@baylibre.com>, "Stephen Boyd" <sboyd@codeaurora.org>,
 "Kevin Hilman" <khilman@baylibre.com>, "Carlo Caione" <carlo@caione.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20170309104154.28295-4-jbrunet@baylibre.com>
Cc: "Jerome Brunet" <jbrunet@baylibre.com>, linux-clk@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20170309104154.28295-1-jbrunet@baylibre.com>
 <20170309104154.28295-4-jbrunet@baylibre.com>
Message-ID: <149013781178.54062.3390528282967464997@resonance>
Subject: Re: [PATCH v2 3/9] clk: meson8b: put dividers and muxes in tables
Date: Tue, 21 Mar 2017 16:10:11 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Jerome Brunet (2017-03-09 02:41:48)
> Until now, there was only 1 divider and 1 mux declared for the meson8b
> platform. With the ongoing work on various system, including audio, this
> is about to change. Use the same approach as gates for dividers and muxes,
> putting them in tables to fix the register address at runtime.
> =

> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Looks good to me.

Regards,
Mike

> ---
>  drivers/clk/meson/meson8b.c | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
> =

> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index d1cc4d7cc8ff..2937443d4505 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -582,6 +582,14 @@ static struct clk_gate *const meson8b_clk_gates[] =
=3D {
>         &meson8b_ao_iface,
>  };
>  =

> +static struct clk_mux *const meson8b_clk_muxes[] =3D {
> +       &meson8b_mpeg_clk_sel,
> +};
> +
> +static struct clk_divider *const meson8b_clk_dividers[] =3D {
> +       &meson8b_mpeg_clk_div,
> +};
> +
>  static int meson8b_clkc_probe(struct platform_device *pdev)
>  {
>         void __iomem *clk_base;
> @@ -604,15 +612,21 @@ static int meson8b_clkc_probe(struct platform_devic=
e *pdev)
>         /* Populate the base address for CPU clk */
>         meson8b_cpu_clk.base =3D clk_base;
>  =

> -       /* Populate the base address for the MPEG clks */
> -       meson8b_mpeg_clk_sel.reg =3D clk_base + (u32)meson8b_mpeg_clk_sel=
.reg;
> -       meson8b_mpeg_clk_div.reg =3D clk_base + (u32)meson8b_mpeg_clk_div=
.reg;
> -
>         /* Populate base address for gates */
>         for (i =3D 0; i < ARRAY_SIZE(meson8b_clk_gates); i++)
>                 meson8b_clk_gates[i]->reg =3D clk_base +
>                         (u32)meson8b_clk_gates[i]->reg;
>  =

> +       /* Populate base address for muxes */
> +       for (i =3D 0; i < ARRAY_SIZE(meson8b_clk_muxes); i++)
> +               meson8b_clk_muxes[i]->reg =3D clk_base +
> +                       (u32)meson8b_clk_muxes[i]->reg;
> +
> +       /* Populate base address for dividers */
> +       for (i =3D 0; i < ARRAY_SIZE(meson8b_clk_dividers); i++)
> +               meson8b_clk_dividers[i]->reg =3D clk_base +
> +                       (u32)meson8b_clk_dividers[i]->reg;
> +
>         /*
>          * register all clks
>          * CLKID_UNUSED =3D 0, so skip it and start with CLKID_XTAL =3D 1
> -- =

> 2.9.3
>=20
