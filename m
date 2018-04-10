Return-Path: <biju.das@bp.renesas.com>
From: Biju Das <biju.das@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] clk: renesas: rcar-gen2: Centralize quirks handling
Date: Tue, 10 Apr 2018 13:33:55 +0000
Message-ID: <OSBPR01MB210330E35EB1211C84756A96B8BE0@OSBPR01MB2103.jpnprd01.prod.outlook.com>
References: <1523365498-16789-1-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1523365498-16789-1-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

Hi Geert,

Thanks for the patch.

> -----Original Message-----
> From: Geert Uytterhoeven [mailto:geert+renesas@glider.be]
> Sent: 10 April 2018 14:05
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Biju Das <biju.das@bp.renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-clk@vger.kernel.org; linux-
> kernel@vger.kernel.org; Geert Uytterhoeven <geert+renesas@glider.be>
> Subject: [PATCH] clk: renesas: rcar-gen2: Centralize quirks handling
>
> Introduce centralized quirks handling like on R-Car Gen3, and convert the
> RZ/G1C SD clock table handling over to it.
>
> This makes it easier to add more quirks later, if/when needed.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Biju Das <biju.das@bp.renesas.com>

> ---
> To be queued in clk-renesas-for-v4.18.
>
>  drivers/clk/renesas/rcar-gen2-cpg.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/renesas/rcar-gen2-cpg.c b/drivers/clk/renesas/rc=
ar-
> gen2-cpg.c
> index 0c49f59d5074b1c4..daf88bc2cdae177b 100644
> --- a/drivers/clk/renesas/rcar-gen2-cpg.c
> +++ b/drivers/clk/renesas/rcar-gen2-cpg.c
> @@ -261,9 +261,15 @@ static const struct clk_div_table
> cpg_sd01_div_table[] =3D {  static const struct rcar_gen2_cpg_pll_config
> *cpg_pll_config __initdata;  static unsigned int cpg_pll0_div __initdata;=
  static
> u32 cpg_mode __initdata;
> +static u32 cpg_quirks __initdata;
>
> -static const struct soc_device_attribute soc_r8a77470[] =3D {
> -{ .soc_id =3D "r8a77470" },
> +#define SD_SKIP_FIRSTBIT(0)/* Skip first clock in SD table
> */
> +
> +static const struct soc_device_attribute cpg_quirks_match[] __initconst =
=3D {
> +{
> +.soc_id =3D "r8a77470",
> +.data =3D (void *)SD_SKIP_FIRST,
> +},
>  { /* sentinel */ }
>  };
>
> @@ -333,7 +339,7 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct
> device *dev,
>
>  case CLK_TYPE_GEN2_SD0:
>  table =3D cpg_sd01_div_table;
> -if (soc_device_match(soc_r8a77470))
> +if (cpg_quirks & SD_SKIP_FIRST)
>  table++;
>
>  shift =3D 4;
> @@ -341,7 +347,7 @@ struct clk * __init rcar_gen2_cpg_clk_register(struct
> device *dev,
>
>  case CLK_TYPE_GEN2_SD1:
>  table =3D cpg_sd01_div_table;
> -if (soc_device_match(soc_r8a77470))
> +if (cpg_quirks & SD_SKIP_FIRST)
>  table++;
>
>  shift =3D 0;
> @@ -372,9 +378,15 @@ struct clk * __init
> rcar_gen2_cpg_clk_register(struct device *dev,  int __init
> rcar_gen2_cpg_init(const struct rcar_gen2_cpg_pll_config *config,
>        unsigned int pll0_div, u32 mode)  {
> +const struct soc_device_attribute *attr;
> +
>  cpg_pll_config =3D config;
>  cpg_pll0_div =3D pll0_div;
>  cpg_mode =3D mode;
> +attr =3D soc_device_match(cpg_quirks_match);
> +if (attr)
> +cpg_quirks =3D (uintptr_t)attr->data;
> +pr_debug("%s: mode =3D 0x%x quirks =3D 0x%x\n", __func__, mode,
> +cpg_quirks);
>
>  spin_lock_init(&cpg_lock);
>
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
