Return-Path: <scott.wood@nxp.com>
From: Scott Wood <scott.wood@nxp.com>
To: "Y.T. Tang" <yuantian.tang@nxp.com>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>
CC: "sboyd@codeaurora.org" <sboyd@codeaurora.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2] clk: qoriq: added ls1012a clock configuration
Date: Wed, 23 Nov 2016 07:27:07 +0000
Message-ID: <DB5PR0401MB1928B72A81C6867EB699AB0C91B70@DB5PR0401MB1928.eurprd04.prod.outlook.com>
References: <1479802499-9083-1-git-send-email-yuantian.tang@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>

On 11/22/2016 02:28 AM, yuantian.tang@nxp.com wrote:=0A=
> From: Tang Yuantian <Yuantian.Tang@nxp.com>=0A=
> =0A=
> Signed-off-by: Tang Yuantian <yuantian.tang@nxp.com>=0A=
> ---=0A=
> v2:=0A=
>   - remove commit message as it is duplicated to title=0A=
> =0A=
>  drivers/clk/clk-qoriq.c | 19 +++++++++++++++++++=0A=
>  1 file changed, 19 insertions(+)=0A=
> =0A=
> diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c=0A=
> index 1bece0f..65c21d7 100644=0A=
> --- a/drivers/clk/clk-qoriq.c=0A=
> +++ b/drivers/clk/clk-qoriq.c=0A=
> @@ -202,6 +202,14 @@ static const struct clockgen_muxinfo ls1021a_cmux =
=3D {=0A=
>  	}=0A=
>  };=0A=
>  =0A=
> +static const struct clockgen_muxinfo ls1012a_cmux =3D {=0A=
> +	{=0A=
> +		[0] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },=0A=
> +		{},=0A=
> +		[2] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV2 },=0A=
> +	}=0A=
> +};=0A=
> +=0A=
>  static const struct clockgen_muxinfo t1040_cmux =3D {=0A=
>  	{=0A=
>  		[0] =3D { CLKSEL_VALID, CGA_PLL1, PLL_DIV1 },=0A=
> @@ -482,6 +490,16 @@ static const struct clockgen_chipinfo chipinfo[] =3D=
 {=0A=
>  		.pll_mask =3D 0x03,=0A=
>  	},=0A=
>  	{=0A=
> +		.compat =3D "fsl,ls1012a-clockgen",=0A=
> +		.cmux_groups =3D {=0A=
> +			&ls1012a_cmux=0A=
> +		},=0A=
> +		.cmux_to_group =3D {=0A=
> +			0, -1=0A=
> +		},=0A=
> +		.pll_mask =3D 0x03,=0A=
> +	},=0A=
> +	{=0A=
>  		.compat =3D "fsl,ls1043a-clockgen",=0A=
>  		.init_periph =3D t2080_init_periph,=0A=
>  		.cmux_groups =3D {=0A=
> @@ -1282,6 +1300,7 @@ static void __init clockgen_init(struct device_node=
 *np)=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_1, "fsl,qoriq-clockgen-1.0", clockgen_init=
);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_2, "fsl,qoriq-clockgen-2.0", clockgen_init=
);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls1021a, "fsl,ls1021a-clockgen", clockgen_=
init);=0A=
> +CLK_OF_DECLARE(qoriq_clockgen_ls1012a, "fsl,ls1012a-clockgen", clockgen_=
init);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls1043a, "fsl,ls1043a-clockgen", clockgen_=
init);=0A=
>  CLK_OF_DECLARE(qoriq_clockgen_ls2080a, "fsl,ls2080a-clockgen", clockgen_=
init);=0A=
=0A=
Again, can you please keep the chip lists sorted?  ls1012a doesn't go=0A=
after ls1021a.=0A=
=0A=
-Scott=0A=
=0A=
