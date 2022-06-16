Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AC5BC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jun 2022 06:14:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358711AbiFPGOS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jun 2022 02:14:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35950 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358633AbiFPGOS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Jun 2022 02:14:18 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C07A3466B
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 23:14:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6F64E619BD
        for <linux-clk@vger.kernel.org>; Thu, 16 Jun 2022 06:14:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C598EC34114;
        Thu, 16 Jun 2022 06:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655360054;
        bh=76mIRuZFi1DEVdNILuYIz/ujXi8cTAhOKruiTFJ/Y1A=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=BkzpdvjU8DUhpJsmia/w+AVpb/52LBqhqNT8NAlzifLS3Gim1C8PRziwMMzDfrqy3
         jxCK3bUT0Rq/tHEpFVfQGZOLiFogXvoFxbecpcC72/+5TvD1slAEm9NIrnaiJpC2bM
         FhzSjrSvvSwmQZQqBFgGTVV4uZDkE03M5qRorW6oRh0ITb9KeAmPupVQhkh2GqHZpz
         oUtDUh7kXVcA08REPoxyKY/llmi8su5O5cq2PUmT5OfUBL8EWMoYmjXju+S5lquQjv
         Xcf5hB1PKBqfHHvCp+p/kgQrZLxfQbrh/5lP1X8vvseEGGdcCd3EzdasVWALP8vcfz
         OkEq7jqeB7z1A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220614180239.778334-1-marex@denx.de>
References: <20220614180239.778334-1-marex@denx.de>
Subject: Re: [PATCH v2 1/4] clk: imx: imx8mp: Add audiomix block control
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Marek Vasut <marex@denx.de>, Abel Vesa <abel.vesa@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Jacky Bai <ping.bai@nxp.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Shawn Guo <shawnguo@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
To:     Marek Vasut <marex@denx.de>, linux-clk@vger.kernel.org
Date:   Wed, 15 Jun 2022 23:14:12 -0700
User-Agent: alot/0.10
Message-Id: <20220616061414.C598EC34114@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Marek Vasut (2022-06-14 11:02:36)
> diff --git a/drivers/clk/imx/clk-imx8mp-audiomix.c b/drivers/clk/imx/clk-=
imx8mp-audiomix.c
> new file mode 100644
> index 0000000000000..bfa6080f274ff
> --- /dev/null
> +++ b/drivers/clk/imx/clk-imx8mp-audiomix.c
> @@ -0,0 +1,262 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Driver for i.MX8M Plus Audio BLK_CTRL
> + *
> + * Copyright (C) 2022 Marek Vasut <marex@denx.de>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +
> +#include <dt-bindings/clock/imx8mp-clock.h>
> +
> +#include "clk.h"
> +
> +#define CLKEN0                 0x000
> +#define CLKEN1                 0x004
> +#define SAI_MCLK_SEL(n)                (300 + 4 * (n)) /* n in 0..5 */
> +#define PDM_SEL                        0x318
> +#define SAI_PLL_GNRL_CTL       0x400
> +
> +#define SAIn_MCLK1_PARENT(n)                                           \
> +static const char *clk_imx8mp_audiomix_sai##n##_mclk1_parents[] =3D {   =
 \
> +       "sai"__stringify(n), "sai"__stringify(n)"_mclk"                 \
> +}
> +
> +SAIn_MCLK1_PARENT(1);
> +SAIn_MCLK1_PARENT(2);
> +SAIn_MCLK1_PARENT(3);
> +SAIn_MCLK1_PARENT(5);
> +SAIn_MCLK1_PARENT(6);
> +SAIn_MCLK1_PARENT(7);
> +
> +static const char *clk_imx8mp_audiomix_sai_mclk2_parents[] =3D {
> +       "sai1", "sai2", "sai3", "dummy",
> +       "sai5", "sai6", "sai7",
> +       "sai1_mclk", "sai2_mclk", "sai3_mclk", "dummy",
> +       "sai5_mclk", "sai6_mclk", "sai7_mclk",
> +       "spdif_extclk", "dummy"
> +};
> +
> +static const char *clk_imx8mp_audiomix_pdm_parents[] =3D {
> +       "ccm_pdm", "sai_pll_out_div2", "sai1_mclk", "dummy"
> +};

Can this driver use clk_parent_data instead of string names everywhere?

> +
> +
> +static const char * const clk_imx8mp_audiomix_pll_parents[] =3D {
> +       "osc_24m", "dummy", "dummy", "dummy"
> +};
> +
> +static const char * const clk_imx8mp_audiomix_pll_bypass_sels[] =3D {
> +       "sai_pll", "sai_pll_ref_sel"
> +};
> +
> +#define CLK_GATE(name, cname)                                          \
> +       {                                                               \
> +               name"_cg",                                              \
> +               IMX8MP_CLK_AUDIOMIX_##cname,                            \
> +               "audio_ahb", NULL, 1,                                   \
> +               CLKEN0 + 4 * !!(IMX8MP_CLK_AUDIOMIX_##cname / 32),      \
> +               1, IMX8MP_CLK_AUDIOMIX_##cname % 32                     \
> +       }
> +
> +#define CLK_SAIn(n)                                                    \
> +       {                                                               \
> +               "sai"__stringify(n)"_mclk1_sel",                        \
> +               IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1_SEL,                 \
> +               NULL,                                                   \
> +               clk_imx8mp_audiomix_sai##n##_mclk1_parents,             \
> +               ARRAY_SIZE(clk_imx8mp_audiomix_sai##n##_mclk1_parents), \
> +               SAI_MCLK_SEL(n), 1, 0                                   \
> +       }, {                                                            \
> +               "sai"__stringify(n)"_mclk2_sel",                        \
> +               IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2_SEL,                 \
> +               NULL,                                                   \
> +               clk_imx8mp_audiomix_sai_mclk2_parents,          \
> +               ARRAY_SIZE(clk_imx8mp_audiomix_sai_mclk2_parents),      \
> +               SAI_MCLK_SEL(n), 4, 1                                   \
> +       }, {                                                            \
> +               "sai"__stringify(n)"_ipg_cg",                           \
> +               IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG,                       \
> +               "audio_ahb", NULL, 1,                                   \
> +               CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_IPG             \
> +       }, {                                                            \
> +               "sai"__stringify(n)"_mclk1_cg",                         \
> +               IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1,                     \
> +               "sai"__stringify(n)"_mclk1_sel", NULL, 1,               \
> +               CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK1           \
> +       }, {                                                            \
> +               "sai"__stringify(n)"_mclk2_cg",                         \
> +               IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2,                     \
> +               "sai"__stringify(n)"_mclk2_sel", NULL, 1,               \
> +               CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK2           \
> +       }, {                                                            \
> +               "sai"__stringify(n)"_mclk3_cg",                         \
> +               IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3,                     \
> +               "sai_pll_out_div2", NULL, 1,                            \
> +               CLKEN0, 1, IMX8MP_CLK_AUDIOMIX_SAI##n##_MCLK3           \
> +       }
> +
> +#define CLK_PDM                                                         =
       \
> +       {                                                               \
> +               "pdm_sel", IMX8MP_CLK_AUDIOMIX_PDM_SEL, NULL,           \
> +               clk_imx8mp_audiomix_pdm_parents,                        \
> +               ARRAY_SIZE(clk_imx8mp_audiomix_pdm_parents),            \
> +               PDM_SEL, 2, 0                                           \
> +       }
> +
> +struct clk_imx8mp_audiomix_sel {
> +       const char      *name;
> +       int             clkid;
> +       const char      *parent;        /* For gate */
> +       const char      **parents;      /* For mux */
> +       int             num_parents;
> +       u16             reg;
> +       u8              width;
> +       u8              shift;
> +};
> +
> +static struct clk_imx8mp_audiomix_sel sels[] =3D {
> +       CLK_GATE("asrc", ASRC_IPG),
> +       CLK_GATE("pdm", PDM_IPG),
> +       CLK_GATE("earc", EARC_IPG),
> +       CLK_GATE("ocrama", OCRAMA_IPG),
> +       CLK_GATE("aud2htx", AUD2HTX_IPG),
> +       CLK_GATE("earc_phy", EARC_PHY),
> +       CLK_GATE("sdma2", SDMA2_ROOT),
> +       CLK_GATE("sdma3", SDMA3_ROOT),
> +       CLK_GATE("spba2", SPBA2_ROOT),
> +       CLK_GATE("dsp", DSP_ROOT),
> +       CLK_GATE("dspdbg", DSPDBG_ROOT),
> +       CLK_GATE("edma", EDMA_ROOT),
> +       CLK_GATE("audpll", AUDPLL_ROOT),
> +       CLK_GATE("mu2", MU2_ROOT),
> +       CLK_GATE("mu3", MU3_ROOT),
> +       CLK_PDM,
> +       CLK_SAIn(1),
> +       CLK_SAIn(2),
> +       CLK_SAIn(3),
> +       CLK_SAIn(5),
> +       CLK_SAIn(6),
> +       CLK_SAIn(7)
> +};
> +
> +struct clk_imx8mp_audiomix_priv {
> +       struct clk_hw           *clk[IMX8MP_CLK_AUDIOMIX_END];

What is this tabbed to align to?

> +};
> +
> +static struct clk_hw *
> +clk_imx8mp_audiomix_of_clk_get(struct of_phandle_args *clkspec, void *da=
ta)
> +{
> +       struct clk_imx8mp_audiomix_priv *priv =3D data;
> +       unsigned int idx =3D clkspec->args[0];
> +
> +       return priv->clk[idx];

This could simply be clk_hw_onecell_data and then it has range safety?

> +}
> +
> +static int clk_imx8mp_audiomix_probe(struct platform_device *pdev)
> +{
> +       struct clk_imx8mp_audiomix_priv *priv;
> +       struct device *dev =3D &pdev->dev;
> +       struct resource *res;
> +       void __iomem *base;
> +       struct clk_hw *hw;
> +       int i;
> +
> +       priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +       base =3D devm_ioremap_resource(dev, res);

Use devm_platform_ioremap_resource() please.

> +       if (IS_ERR(base))
> +               return PTR_ERR(base);
> +
> +       for (i =3D 0; i < ARRAY_SIZE(sels); i++) {
> +               if (sels[i].num_parents =3D=3D 1) {
> +                       hw =3D devm_clk_hw_register_gate(dev,
> +                                                      sels[i].name,
> +                                                      sels[i].parent,
> +                                                      0,
> +                                                      base + sels[i].reg,
> +                                                      sels[i].shift,
> +                                                      0, NULL);
> +               } else {
> +                       hw =3D devm_clk_hw_register_mux(dev, sels[i].name,
> +                                                     sels[i].parents,
> +                                                     sels[i].num_parents,
> +                                                     0,
> +                                                     base + sels[i].reg,
> +                                                     sels[i].shift,
> +                                                     sels[i].width,
> +                                                     0, NULL);
> +               }
> +
> +               if (IS_ERR(hw))
> +                       return PTR_ERR(hw);
> +
> +               priv->clk[sels[i].clkid] =3D hw;
> +       }
> +
> +       /* SAI PLL */
> +       hw =3D devm_clk_hw_register_mux(dev, "sai_pll_ref_sel",
> +                                     clk_imx8mp_audiomix_pll_parents,
> +                                     ARRAY_SIZE(clk_imx8mp_audiomix_pll_=
parents),
> +                                     CLK_SET_RATE_NO_REPARENT,
> +                                     base + SAI_PLL_GNRL_CTL, 0, 2, 0, N=
ULL);
> +       priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL_REF_SEL] =3D hw;
> +
> +       hw =3D imx_dev_clk_hw_pll14xx(dev, "sai_pll", "sai_pll_ref_sel",
> +                                   base + 0x400, &imx_1443x_pll);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL] =3D hw;
> +
> +       hw =3D devm_clk_hw_register_mux(dev, "sai_pll_bypass",
> +                                     clk_imx8mp_audiomix_pll_bypass_sels,
> +                                     ARRAY_SIZE(clk_imx8mp_audiomix_pll_=
bypass_sels),
> +                                     CLK_SET_RATE_NO_REPARENT | CLK_SET_=
RATE_PARENT,
> +                                     base + SAI_PLL_GNRL_CTL, 16, 1, 0, =
NULL);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL_BYPASS] =3D hw;
> +
> +       hw =3D devm_clk_hw_register_gate(dev, "sai_pll_out", "sai_pll_byp=
ass",
> +                                      0, base + SAI_PLL_GNRL_CTL, 13,
> +                                      0, NULL);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +       priv->clk[IMX8MP_CLK_AUDIOMIX_SAI_PLL_OUT] =3D hw;
> +
> +       hw =3D devm_clk_hw_register_fixed_factor(dev, "sai_pll_out_div2",
> +                                              "sai_pll_out", 0, 1, 2);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       return devm_of_clk_add_hw_provider(&pdev->dev,
> +                                          clk_imx8mp_audiomix_of_clk_get,
> +                                          priv);
> +}
> +
> +static const struct of_device_id clk_imx8mp_audiomix_of_match[] =3D {

Include mod_device_table.h for of_device_id struct

> +       { .compatible =3D "fsl,imx8mp-audio-blk-ctrl" },
> +       { /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, clk_imx8mp_audiomix_of_match);
> +
> +static struct platform_driver clk_imx8mp_audiomix_driver =3D {
> +       .probe  =3D clk_imx8mp_audiomix_probe,
> +       .driver =3D {
> +               .name =3D "imx8mp-audio-blk-ctrl",
> +               .of_match_table =3D clk_imx8mp_audiomix_of_match,
> +       },
