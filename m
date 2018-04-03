Return-Path: <fabrizio.castro@bp.renesas.com>
From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Biju Das
	<biju.das@bp.renesas.com>, Chris Paterson <Chris.Paterson2@renesas.com>
Subject: RE: [PATCH 3/5] clk: renesas: r8a7791/r8a7793: Fix LB clock divider
Date: Tue, 3 Apr 2018 10:18:55 +0000
Message-ID: <TY1PR01MB177020A5C1391AF629FA66BDC0A50@TY1PR01MB1770.jpnprd01.prod.outlook.com>
References: <1522344790-20061-1-git-send-email-geert+renesas@glider.be>
 <1522344790-20061-4-git-send-email-geert+renesas@glider.be>
In-Reply-To: <1522344790-20061-4-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

> Subject: [PATCH 3/5] clk: renesas: r8a7791/r8a7793: Fix LB clock divider
>
> The CLK_TYPE_GEN2_LB clock type is meant for SoCs like R-Car H2, where
> the LB clock divider depends on the value of the MD18 pin.
>
> On R-Car M2-W and M2-N, the LB clock divider is fixed to 24.  Hence
> model the clock as a fixed factor clock instead.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

> ---
>  drivers/clk/renesas/r8a7791-cpg-mssr.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/renesas/r8a7791-cpg-mssr.c b/drivers/clk/renesas=
/r8a7791-cpg-mssr.c
> index 820b220b09cc6bdb..1b91f03b75980766 100644
> --- a/drivers/clk/renesas/r8a7791-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a7791-cpg-mssr.c
> @@ -57,7 +57,6 @@ static struct cpg_core_clk r8a7791_core_clks[] __initda=
ta =3D {
>
>  /* Core Clock Outputs */
>  DEF_BASE("z",    R8A7791_CLK_Z,    CLK_TYPE_GEN2_Z,    CLK_PLL0),
> -DEF_BASE("lb",   R8A7791_CLK_LB,   CLK_TYPE_GEN2_LB,   CLK_PLL1),
>  DEF_BASE("adsp", R8A7791_CLK_ADSP, CLK_TYPE_GEN2_ADSP, CLK_PLL1),
>  DEF_BASE("sdh",  R8A7791_CLK_SDH,  CLK_TYPE_GEN2_SDH,  CLK_PLL1),
>  DEF_BASE("sd0",  R8A7791_CLK_SD0,  CLK_TYPE_GEN2_SD0,  CLK_PLL1),
> @@ -70,6 +69,7 @@ static struct cpg_core_clk r8a7791_core_clks[] __initda=
ta =3D {
>  DEF_FIXED("hp",     R8A7791_CLK_HP,    CLK_PLL1,         12, 1),
>  DEF_FIXED("i",      R8A7791_CLK_I,     CLK_PLL1,          2, 1),
>  DEF_FIXED("b",      R8A7791_CLK_B,     CLK_PLL1,         12, 1),
> +DEF_FIXED("lb",     R8A7791_CLK_LB,    CLK_PLL1,         24, 1),
>  DEF_FIXED("p",      R8A7791_CLK_P,     CLK_PLL1,         24, 1),
>  DEF_FIXED("cl",     R8A7791_CLK_CL,    CLK_PLL1,         48, 1),
>  DEF_FIXED("m2",     R8A7791_CLK_M2,    CLK_PLL1,          8, 1),
> --
> 2.7.4




Renesas Electronics Europe Ltd, Dukes Meadow, Millboard Road, Bourne End, B=
uckinghamshire, SL8 5FH, UK. Registered in England & Wales under Registered=
 No. 04586709.
