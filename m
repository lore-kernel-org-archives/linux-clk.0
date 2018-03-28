Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ve1eur01on0062.outbound.protection.outlook.com ([104.47.1.62]:33752
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750753AbeC1GvH (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 28 Mar 2018 02:51:07 -0400
From: Abel Vesa <abel.vesa@nxp.com>
To: Fabio Estevam <festevam@gmail.com>
CC: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Ranjani Vaidyanathan <ranjani.vaidyanathan@nxp.com>,
        Abel Vesa <abelvesa@linux.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "b29396@freescale.com" <b29396@freescale.com>
Subject: Re: [PATCH] clk: imx7d: Move clks_init_on before any clock operations
Date: Wed, 28 Mar 2018 06:51:02 +0000
Message-ID: <20180328065100.z5nxntyax7qk7jwb@fsr-ub1664-175>
References: <1522219599-10831-1-git-send-email-abel.vesa@nxp.com>
 <1522219599-10831-3-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1522219599-10831-3-git-send-email-abel.vesa@nxp.com>
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Mar 28, 2018 at 09:46:36AM +0300, Abel Vesa wrote:
> From: Dong Aisheng <b29396@freescale.com>
>=20
> For init on clocks we should move it at the first place in imx7d_clocks_i=
nit()
> before any clock operations, else the clock operation may fail in case th=
e clock
> is still not on.
>=20
> Acked-by: Ranjani Vaidyanathan <Ranjani.Vaidyanathan@freescale.com>
> Signed-off-by: Dong Aisheng <b29396@freescale.com>
> Signed-off-by: Irina Tirdea <irina.tirdea@nxp.com>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> ---
>  drivers/clk/imx/clk-imx7d.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 89bfa75..9b17805 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -433,13 +433,6 @@ static void __init imx7d_clocks_init(struct device_n=
ode *ccm_node)
>  	clks[IMX7D_PLL_AUDIO_MAIN_BYPASS] =3D imx_clk_mux_flags("pll_audio_main=
_bypass", base + 0xf0, 16, 1, pll_audio_bypass_sel, ARRAY_SIZE(pll_audio_by=
pass_sel), CLK_SET_RATE_PARENT);
>  	clks[IMX7D_PLL_VIDEO_MAIN_BYPASS] =3D imx_clk_mux_flags("pll_video_main=
_bypass", base + 0x130, 16, 1, pll_video_bypass_sel, ARRAY_SIZE(pll_video_b=
ypass_sel), CLK_SET_RATE_PARENT);
> =20
> -	clk_set_parent(clks[IMX7D_PLL_ARM_MAIN_BYPASS], clks[IMX7D_PLL_ARM_MAIN=
]);
> -	clk_set_parent(clks[IMX7D_PLL_DRAM_MAIN_BYPASS], clks[IMX7D_PLL_DRAM_MA=
IN]);
> -	clk_set_parent(clks[IMX7D_PLL_SYS_MAIN_BYPASS], clks[IMX7D_PLL_SYS_MAIN=
]);
> -	clk_set_parent(clks[IMX7D_PLL_ENET_MAIN_BYPASS], clks[IMX7D_PLL_ENET_MA=
IN]);
> -	clk_set_parent(clks[IMX7D_PLL_AUDIO_MAIN_BYPASS], clks[IMX7D_PLL_AUDIO_=
MAIN]);
> -	clk_set_parent(clks[IMX7D_PLL_VIDEO_MAIN_BYPASS], clks[IMX7D_PLL_VIDEO_=
MAIN]);
> -
>  	clks[IMX7D_PLL_ARM_MAIN_CLK] =3D imx_clk_gate("pll_arm_main_clk", "pll_=
arm_main_bypass", base + 0x60, 13);
>  	clks[IMX7D_PLL_DRAM_MAIN_CLK] =3D imx_clk_gate("pll_dram_main_clk", "pl=
l_dram_main_bypass", base + 0x70, 13);
>  	clks[IMX7D_PLL_SYS_MAIN_CLK] =3D imx_clk_gate("pll_sys_main_clk", "pll_=
sys_main_bypass", base + 0xb0, 13);
> @@ -886,6 +879,13 @@ static void __init imx7d_clocks_init(struct device_n=
ode *ccm_node)
>  	for (i =3D 0; i < ARRAY_SIZE(clks_init_on); i++)
>  		clk_prepare_enable(clks[clks_init_on[i]]);
> =20
> +	clk_set_parent(clks[IMX7D_PLL_ARM_MAIN_BYPASS], clks[IMX7D_PLL_ARM_MAIN=
]);
> +	clk_set_parent(clks[IMX7D_PLL_DRAM_MAIN_BYPASS], clks[IMX7D_PLL_DRAM_MA=
IN]);
> +	clk_set_parent(clks[IMX7D_PLL_SYS_MAIN_BYPASS], clks[IMX7D_PLL_SYS_MAIN=
]);
> +	clk_set_parent(clks[IMX7D_PLL_ENET_MAIN_BYPASS], clks[IMX7D_PLL_ENET_MA=
IN]);
> +	clk_set_parent(clks[IMX7D_PLL_AUDIO_MAIN_BYPASS], clks[IMX7D_PLL_AUDIO_=
MAIN]);
> +	clk_set_parent(clks[IMX7D_PLL_VIDEO_MAIN_BYPASS], clks[IMX7D_PLL_VIDEO_=
MAIN]);
> +
>  	/* use old gpt clk setting, gpt1 root clk must be twice as gpt counter =
freq */
>  	clk_set_parent(clks[IMX7D_GPT1_ROOT_SRC], clks[IMX7D_OSC_24M_CLK]);
> =20
> --=20
> 2.7.4
>=20

Ignore this one please, mistakenly sent because of sending all the patches =
from the current folder.
The patchset applies on linux-next/master just fine without this one.

-- =
