Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:38428 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935069AbeFMKiW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jun 2018 06:38:22 -0400
MIME-Version: 1.0
In-Reply-To: <20180601065821.28234-2-o.rempel@pengutronix.de>
References: <20180601065821.28234-1-o.rempel@pengutronix.de> <20180601065821.28234-2-o.rempel@pengutronix.de>
From: Dong Aisheng <dongas86@gmail.com>
Date: Wed, 13 Jun 2018 18:38:21 +0800
Message-ID: <CAA+hA=QERRK5KTo43t3eyPhBOfCbvpwYrR-Kf7zz2hGQbRKPuw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] clk: imx7d: add IMX7D_MU_ROOT_CLK
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
        <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri, Jun 1, 2018 at 2:58 PM, Oleksij Rempel <o.rempel@pengutronix.de> wrote:
> This clock is needed for iMX mailbox driver
>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/clk/imx/clk-imx7d.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/imx/clk-imx7d.c b/drivers/clk/imx/clk-imx7d.c
> index 975a20d3cc94..1c2541dc40e7 100644
> --- a/drivers/clk/imx/clk-imx7d.c
> +++ b/drivers/clk/imx/clk-imx7d.c
> @@ -793,6 +793,7 @@ static void __init imx7d_clocks_init(struct device_node *ccm_node)
>         clks[IMX7D_DRAM_PHYM_ROOT_CLK] = imx_clk_gate4("dram_phym_root_clk", "dram_phym_cg", base + 0x4130, 0);
>         clks[IMX7D_DRAM_PHYM_ALT_ROOT_CLK] = imx_clk_gate4("dram_phym_alt_root_clk", "dram_phym_alt_post_div", base + 0x4130, 0);
>         clks[IMX7D_DRAM_ALT_ROOT_CLK] = imx_clk_gate4("dram_alt_root_clk", "dram_alt_post_div", base + 0x4130, 0);
> +       clks[IMX7D_MU_ROOT_CLK] = imx_clk_gate2("mu_root_clk", "ipg_root_clk", base + 0x4270, 0);

The clock slice on MX7D needs to operate while its parent clock is on.
So this seems ought to be imx_clk_gate4?

Besides that, a nitpick:
although the address is already out of order, but we are still better to keep
in increasing order as long as we can.

Regards
Dong Aisheng

>         clks[IMX7D_OCOTP_CLK] = imx_clk_gate4("ocotp_clk", "ipg_root_clk", base + 0x4230, 0);
>         clks[IMX7D_SNVS_CLK] = imx_clk_gate4("snvs_clk", "ipg_root_clk", base + 0x4250, 0);
>         clks[IMX7D_CAAM_CLK] = imx_clk_gate4("caam_clk", "ipg_root_clk", base + 0x4240, 0);
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
