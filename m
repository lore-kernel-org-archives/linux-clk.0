Return-Path: <SRS0=eW+W=6T=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63FC6C47256
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 05:08:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 393332075A
	for <linux-clk@archiver.kernel.org>; Tue,  5 May 2020 05:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1588655305;
	bh=f8FwnuRG71mwbXsGe3SK1uq3zY2HM1/R/WO3ZMRfL3Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=woul3i3NBbPthdJ0WUipwISLYHrgRwWIdzUIDUErHNa2l1Y+TFuPazm1EiC2N9OBH
	 vo9cV0Vp2YS3c0RKNukMXBilFWC3bSleVqBKz95Zpv8afo1JTM08uYRLOQ6VPuWbBI
	 23r74XHUyabkCZAE8vv5cdjIdFFKlNCB68aWtcAs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726367AbgEEFIZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 May 2020 01:08:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:59140 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725320AbgEEFIY (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 5 May 2020 01:08:24 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80C6B206E6;
        Tue,  5 May 2020 05:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588655303;
        bh=f8FwnuRG71mwbXsGe3SK1uq3zY2HM1/R/WO3ZMRfL3Q=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ygmVEkoO5Uf1aXU6BW2HOZkG7Ay+63zm0J0pF2LROU2lHWw5UfK+lHtUe3xT6UEO9
         N7sJbUGwUBF+DBUeoLhVhmg9L0u1Xp/fohu+XcmdoAo9iUhy/xg60Zwba5h54KVDeU
         0UTXME3x+9Z4zVAR4YE9UMFrV5x9j754Bg6ErZuA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1584279836-29825-4-git-send-email-aisheng.dong@nxp.com>
References: <1584279836-29825-1-git-send-email-aisheng.dong@nxp.com> <1584279836-29825-4-git-send-email-aisheng.dong@nxp.com>
Subject: Re: [PATCH V6 03/12] clk: imx: scu: add two cells binding support
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
Date:   Mon, 04 May 2020 22:08:22 -0700
Message-ID: <158865530267.11125.15146015607102638423@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2020-03-15 06:43:47)
> This patch implements the new two cells binding for SCU clocks.
> The usage is as follows:
> clocks =3D <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>
>=20
> Due to each SCU clock is associated with a power domain, without power
> on the domain, the SCU clock can't work. So we create platform devices
> for each domain clock respectively and manually attach the required domain
> before register the clock devices, then we can register clocks in the
> clock platform driver accordingly.

That's odd. See below.

>=20
> Note because we do not have power domain info in device tree and the SCU
> resource ID is the same for power domain and clock, so we use resource ID
> to find power domains.
>=20
> Later, we will also use this clock platform driver to support suspend/res=
ume
> and runtime pm.
>=20
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
[...]
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index b8b2072742a5..4fadff14d8b2 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -8,6 +8,9 @@
>  #include <linux/arm-smccc.h>
>  #include <linux/clk-provider.h>
>  #include <linux/err.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/slab.h>
> =20
>  #include "clk-scu.h"
> @@ -16,6 +19,20 @@
>  #define IMX_SIP_SET_CPUFREQ            0x00
> =20
>  static struct imx_sc_ipc *ccm_ipc_handle;
> +struct device_node *pd_np;
> +
> +struct imx_scu_clk_node {
> +       const char *name;
> +       u32 rsrc;
> +       u8 clk_type;
> +       const char * const *parents;
> +       int num_parents;
> +
> +       struct clk_hw *hw;
> +       struct list_head node;
> +};
> +
> +struct list_head imx_scu_clks[IMX_SC_R_LAST];
> =20
>  /*
>   * struct clk_scu - Description of one SCU clock
> @@ -128,9 +145,32 @@ static inline struct clk_scu *to_clk_scu(struct clk_=
hw *hw)
>         return container_of(hw, struct clk_scu, hw);
>  }
> =20
> -int imx_clk_scu_init(void)
> +int imx_clk_scu_init(struct device_node *np)
>  {
> -       return imx_scu_get_handle(&ccm_ipc_handle);
> +       struct platform_device *pd_dev;
> +       u32 clk_cells;
> +       int ret, i;
> +
> +       ret =3D imx_scu_get_handle(&ccm_ipc_handle);
> +       if (ret)
> +               return ret;
> +
> +       if (of_property_read_u32(np, "#clock-cells", &clk_cells))

Why wouldn't there be #clock-cells in the node?

> +               return -EINVAL;
> +
> +       if (clk_cells =3D=3D 2) {
> +               for (i =3D 0; i < IMX_SC_R_LAST; i++)
> +                       INIT_LIST_HEAD(&imx_scu_clks[i]);
> +
> +               pd_np =3D of_find_compatible_node(NULL, NULL, "fsl,scu-pd=
");
> +               pd_dev =3D of_find_device_by_node(pd_np);
> +               if (!pd_dev || !device_is_bound(&pd_dev->dev)) {

What is device_is_bound() check for? Add a comment?

> +                       of_node_put(pd_np);
> +                       return -EPROBE_DEFER;
> +               }
> +       }
> +
> +       return 0;
>  }
> =20
>  /*
> @@ -387,3 +427,99 @@ struct clk_hw *__imx_clk_scu(const char *name, const=
 char * const *parents,
> =20
>         return hw;
>  }
> +
> +struct clk_hw *imx_scu_of_clk_src_get(struct of_phandle_args *clkspec,
> +                                     void *data)
> +{
> +       unsigned int rsrc =3D clkspec->args[0];
> +       unsigned int idx =3D clkspec->args[1];
> +       struct list_head *scu_clks =3D data;
> +       struct imx_scu_clk_node *clk;
> +
> +       list_for_each_entry(clk, &scu_clks[rsrc], node) {
> +               if (clk->clk_type =3D=3D idx)
> +                       return clk->hw;
> +       }
> +
> +       return ERR_PTR(-ENODEV);
> +}
> +
> +static int imx_clk_scu_probe(struct platform_device *pdev)
> +{
> +       struct device *dev =3D &pdev->dev;
> +       struct imx_scu_clk_node *clk =3D dev_get_platdata(dev);
> +       struct clk_hw *hw;
> +
> +       hw =3D __imx_clk_scu(clk->name, clk->parents, clk->num_parents,
> +                          clk->rsrc, clk->clk_type);
> +       if (IS_ERR(hw))
> +               return PTR_ERR(hw);
> +
> +       clk->hw =3D hw;
> +       list_add_tail(&clk->node, &imx_scu_clks[clk->rsrc]);
> +
> +       dev_dbg(dev, "register SCU clock rsrc:%d type:%d\n", clk->rsrc,
> +               clk->clk_type);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver imx_clk_scu_driver =3D {
> +       .driver =3D {
> +               .name =3D "imx-scu-clk",
> +               .suppress_bind_attrs =3D true,
> +       },
> +       .probe =3D imx_clk_scu_probe,
> +};
> +builtin_platform_driver(imx_clk_scu_driver);
> +
> +static int imx_clk_scu_attach_pd(struct device *dev, u32 rsrc_id)
> +{
> +       struct of_phandle_args genpdspec =3D {
> +               .np =3D pd_np,
> +               .args_count =3D 1,
> +               .args[0] =3D rsrc_id,
> +       };
> +
> +       return of_genpd_add_device(&genpdspec, dev);
> +}
> +
> +struct clk_hw *imx_clk_scu_alloc_dev(const char *name,
> +                                    const char * const *parents,
> +                                    int num_parents, u32 rsrc_id, u8 clk=
_type)
> +{
> +       struct imx_scu_clk_node clk =3D {
> +               .name =3D name,
> +               .rsrc =3D rsrc_id,
> +               .clk_type =3D clk_type,
> +               .parents =3D parents,
> +               .num_parents =3D num_parents,
> +       };
> +       struct platform_device *pdev;
> +       int ret;
> +
> +       pdev =3D platform_device_alloc(name, PLATFORM_DEVID_NONE);
> +       if (!pdev) {
> +               pr_err("%s: failed to allocate scu clk dev rsrc %d type %=
d\n",
> +                      name, rsrc_id, clk_type);
> +               return ERR_PTR(-ENOMEM);
> +       }
> +
> +       ret =3D platform_device_add_data(pdev, &clk, sizeof(clk));
> +       if (ret) {
> +               platform_device_put(pdev);
> +               return ERR_PTR(ret);
> +       }
> +
> +       pdev->driver_override =3D "imx-scu-clk";
> +
> +       ret =3D imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);

Why do we have to allocate a device for each power domain? Is this
because we don't have support for one device being in multiple power
domains? That is supported now as far as I recall, by basically making
dummy platform devices like this. So maybe this code isn't necessary and
we can have one platform device for the clk controller and then have it
control certain power domains manually from runtime PM callbacks? It's
possible the runtime PM callbacks are too simple for this case and we
need to tell clk providers what clk is having runtime PM enabled for it.
Maybe we can adjust the core clk framework to introduce a callback for
the clk that is runtime PM enabling and put the logic there about what
to do?
