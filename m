Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FD0C4361B
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:56:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AD0A23139
	for <linux-clk@archiver.kernel.org>; Sun, 13 Dec 2020 05:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730373AbgLMF4R (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Dec 2020 00:56:17 -0500
Received: from mail.kernel.org ([198.145.29.99]:50218 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726460AbgLMF4R (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 13 Dec 2020 00:56:17 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607838936;
        bh=NgODyGm83dt8jca4MMElGH3Xczruj/XxNJk2IUGhS2U=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=q0oi4os11jeqyac7r6xlLVuHZ0oHK5UV7Lb2GYFPSKa1KPbcTi9mbZOluRCuDVjEl
         Om47AL9uLjhz7KJEdfSIeEcVOu7M0AtuRZUSTrKh5O+APuSATt3sbrB/OqhtsDdta7
         LaT5iSUTaBtOqXN5ip/tddQm3Hoz66uex1M0mpYZRbEqZDO0lzc0lvwY0Dt5ZRgdsM
         sxRdpfOh+aACSNrAgsUvwTi7J0eWoAQ6HB4w7DRC6IQuG3qNJGwo99vWJm+acNoDiN
         3le0VtI5OGnNUm9a2jq/eF9eo9hp/mZ6NCEzc4orc4+zs4iwTN6w5Gjo6NxU5JwZaL
         Gk+Qw4pDmrfJg==
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20201116075532.4019252-9-m.tretter@pengutronix.de>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de> <20201116075532.4019252-9-m.tretter@pengutronix.de>
Subject: Re: [PATCH 08/12] soc: xilinx: vcu: implement clock provider for output clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     rajanv@xilinx.com, tejasp@xilinx.com, dshah@xilinx.com,
        rvisaval@xilinx.com, michals@xilinx.com, kernel@pengutronix.de,
        robh+dt@kernel.org, mturquette@baylibre.com,
        Michael Tretter <m.tretter@pengutronix.de>
To:     Michael Tretter <m.tretter@pengutronix.de>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Date:   Sat, 12 Dec 2020 21:55:34 -0800
Message-ID: <160783893475.1580929.17041767429276672732@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Michael Tretter (2020-11-15 23:55:28)
> diff --git a/drivers/soc/xilinx/xlnx_vcu.c b/drivers/soc/xilinx/xlnx_vcu.c
> index 725e646aa726..cedc8b7859f7 100644
> --- a/drivers/soc/xilinx/xlnx_vcu.c
> +++ b/drivers/soc/xilinx/xlnx_vcu.c
> @@ -545,6 +512,146 @@ static int xvcu_set_pll(struct xvcu_device *xvcu)
>         return xvcu_pll_enable(xvcu);
>  }
> =20
> +static struct clk_hw *xvcu_clk_hw_register_leaf(struct device *dev,
> +                                               const char *name,
> +                                               const char * const *paren=
t_names,
> +                                               u8 num_parents,
> +                                               struct clk_hw *parent_def=
ault,
> +                                               void __iomem *reg,
> +                                               spinlock_t *lock)
> +{
> +       unsigned long flags =3D CLK_SET_RATE_NO_REPARENT | CLK_SET_RATE_P=
ARENT;
> +       u8 divider_flags =3D CLK_DIVIDER_ONE_BASED | CLK_DIVIDER_ALLOW_ZE=
RO |

Why u8?

> +                          CLK_DIVIDER_ROUND_CLOSEST;
> +       struct clk_hw *mux =3D NULL;
> +       struct clk_hw *divider =3D NULL;
> +       struct clk_hw *gate =3D NULL;
> +       char *name_mux;
> +       char *name_div;
> +       int err;
> +
> +       name_mux =3D devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_mux"=
);
> +       if (!name_mux) {
> +               err =3D -ENOMEM;
> +               goto err;
> +       }
> +       mux =3D clk_hw_register_mux(dev, name_mux, parent_names, num_pare=
nts,
> +                                 flags, reg, 0, 1, 0, lock);
> +       if (IS_ERR(mux)) {
> +               err =3D PTR_ERR(divider);
> +               goto err;
> +       }
> +       clk_hw_set_parent(mux, parent_default);

Can this be done from assigned-clock-parents binding?

> +
> +       name_div =3D devm_kasprintf(dev, GFP_KERNEL, "%s%s", name, "_div"=
);
> +       if (!name_div) {
> +               err =3D -ENOMEM;
> +               goto err;
> +       }
> +       divider =3D clk_hw_register_divider_parent_hw(dev, name_div, mux,=
 flags,
> +                                                   reg, 4, 6, divider_fl=
ags,
> +                                                   lock);
> +       if (IS_ERR(divider)) {
> +               err =3D PTR_ERR(divider);
> +               goto err;
> +       }
> +
> +       gate =3D clk_hw_register_gate_parent_hw(dev, name, divider,
> +                                             CLK_SET_RATE_PARENT, reg, 1=
2, 0,
> +                                             lock);
> +       if (IS_ERR(gate)) {
> +               err =3D PTR_ERR(gate);
> +               goto err;
> +       }
> +
> +       return gate;
> +
> +err:
> +       if (!IS_ERR_OR_NULL(gate))

Would be nicer to have some more goto labels and skip the IS_ERR_OR_NULL
checks.

> +               clk_hw_unregister_gate(gate);
> +       if (!IS_ERR_OR_NULL(divider))
> +               clk_hw_unregister_divider(divider);
> +       if (!IS_ERR_OR_NULL(mux))
> +               clk_hw_unregister_divider(mux);
> +
> +       return ERR_PTR(err);
> +}
> +
> +static void xvcu_clk_hw_unregister_leaf(struct clk_hw *hw)
> +{
> +       struct clk_hw *gate =3D hw;
> +       struct clk_hw *divider;
> +       struct clk_hw *mux;
> +
> +       if (!gate)
> +               return;
> +
> +       divider =3D clk_hw_get_parent(gate);
> +       clk_hw_unregister_gate(gate);
> +       if (!divider)
> +               return;
> +
> +       mux =3D clk_hw_get_parent(divider);
> +       clk_hw_unregister_mux(mux);
> +       if (!divider)
> +               return;
> +
> +       clk_hw_unregister_divider(divider);
> +}
> +
> +static DEFINE_SPINLOCK(venc_core_lock);
> +static DEFINE_SPINLOCK(venc_mcu_lock);

Any reason to not allocate these spinlocks too?

> +
> +static int xvcu_register_clock_provider(struct xvcu_device *xvcu)
> +{
> +       struct device *dev =3D xvcu->dev;
> +       const char *parent_names[2];
> +       struct clk_hw *parent_default;
> +       struct clk_hw_onecell_data *data;
> +       struct clk_hw **hws;
> +       void __iomem *reg_base =3D xvcu->vcu_slcr_ba;
> +
> +       data =3D devm_kzalloc(dev, struct_size(data, hws, CLK_XVCU_NUM_CL=
OCKS), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +       data->num =3D CLK_XVCU_NUM_CLOCKS;
> +       hws =3D data->hws;
> +
> +       xvcu->clk_data =3D data;
> +
> +       parent_default =3D xvcu->pll;
> +       parent_names[0] =3D "dummy";

What is "dummy"?

> +       parent_names[1] =3D clk_hw_get_name(parent_default);

Can we use the new way of specifying clk parents from DT or by using
direct pointers instead of using string names? The idea is to get rid of
clk_hw_get_name() eventually.

> +
> +       hws[CLK_XVCU_ENC_CORE] =3D
> +               xvcu_clk_hw_register_leaf(dev, "venc_core_clk",
> +                                         parent_names,
> +                                         ARRAY_SIZE(parent_names),
> +                                         parent_default,
> +                                         reg_base + VCU_ENC_CORE_CTRL,
> +                                         &venc_core_lock);
> +       hws[CLK_XVCU_ENC_MCU] =3D
> +               xvcu_clk_hw_register_leaf(dev, "venc_mcu_clk",
> +                                         parent_names,
> +                                         ARRAY_SIZE(parent_names),
> +                                         parent_default,
> +                                         reg_base + VCU_ENC_MCU_CTRL,
> +                                         &venc_mcu_lock);
> +
