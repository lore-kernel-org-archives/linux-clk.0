Return-Path: <SRS0=yL/a=XB=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D1DC43331
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:06:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0A1DF20842
	for <linux-clk@archiver.kernel.org>; Fri,  6 Sep 2019 17:06:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1567789606;
	bh=1MVy/9wvLo71rdz2H0vA5KvrduoOOIPfzIlegAyfSlU=;
	h=In-Reply-To:References:To:From:Cc:Subject:Date:List-ID:From;
	b=BU8wErIO5GSqg1h3HSoThyKds6/lJTUseCY1ux6JyAfN7/Ft+thmPjx3ZRnEKhDSJ
	 fJUvJj6WdT44Qu3+ng42d3gmL/HZRAQFH+IkIJgl6L10A//sl0LqdpS0x6ujvDWXKo
	 lTY38vyNaXPMROVjHi7AbPOrrZOlmODgyRaiWoeg=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405962AbfIFRGp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Sep 2019 13:06:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:58758 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2405919AbfIFRGo (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 6 Sep 2019 13:06:44 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id B310F20578;
        Fri,  6 Sep 2019 17:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567789603;
        bh=1MVy/9wvLo71rdz2H0vA5KvrduoOOIPfzIlegAyfSlU=;
        h=In-Reply-To:References:To:From:Cc:Subject:Date:From;
        b=Ikzc05jKmYatV4yREUdEP/9Pmh/p5WzKCjxeOD86TDmbuOFq8LJPPi8cBJmSP6x3y
         glblaj5rJaR0HrHySzXehUMAvZK7V4mLVjYrmoP68kc2UkRZMuPAzJYUz2OSvEURIP
         4wgQ8lQUx1t2rX2FLzYXynEk8zqHNZ4z1KYNJwdk=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1566299605-15641-4-git-send-email-aisheng.dong@nxp.com>
References: <1566299605-15641-1-git-send-email-aisheng.dong@nxp.com> <1566299605-15641-4-git-send-email-aisheng.dong@nxp.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, mturquette@baylibre.com,
        shawnguo@kernel.org, fabio.estevam@nxp.com, linux-imx@nxp.com,
        kernel@pengutronix.de, Dong Aisheng <aisheng.dong@nxp.com>
Subject: Re: [PATCH V4 03/11] clk: imx: scu: add two cells binding support
User-Agent: alot/0.8.1
Date:   Fri, 06 Sep 2019 10:06:42 -0700
Message-Id: <20190906170643.B310F20578@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Dong Aisheng (2019-08-20 04:13:17)
> diff --git a/drivers/clk/imx/clk-imx8qxp.c b/drivers/clk/imx/clk-imx8qxp.c
> index 5e2903e..1ad3f2a 100644
> --- a/drivers/clk/imx/clk-imx8qxp.c
> +++ b/drivers/clk/imx/clk-imx8qxp.c
> @@ -134,7 +134,12 @@ static int imx8qxp_clk_probe(struct platform_device =
*pdev)
>                                 i, PTR_ERR(clks[i]));
>         }
> =20
> -       return of_clk_add_hw_provider(ccm_node, of_clk_hw_onecell_get, cl=
k_data);
> +       if (clock_cells =3D=3D 2)

Can you just read this from the DT node again instead of having a global
variable called "clock_cells" for this?

> +               ret =3D of_clk_add_hw_provider(ccm_node, imx_scu_of_clk_s=
rc_get, imx_scu_clks);
> +       else
> +               ret =3D of_clk_add_hw_provider(ccm_node, of_clk_hw_onecel=
l_get, clk_data);
> +
> +       return ret;
>  }
> =20
>  static const struct of_device_id imx8qxp_match[] =3D {
> diff --git a/drivers/clk/imx/clk-scu.c b/drivers/clk/imx/clk-scu.c
> index fbef740..48bfb08 100644
> --- a/drivers/clk/imx/clk-scu.c
> +++ b/drivers/clk/imx/clk-scu.c
> @@ -16,6 +19,21 @@
>  #define IMX_SIP_SET_CPUFREQ            0x00
> =20
>  static struct imx_sc_ipc *ccm_ipc_handle;
> +struct device_node *pd_np;
> +u32 clock_cells;
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
> @@ -128,9 +146,29 @@ static inline struct clk_scu *to_clk_scu(struct clk_=
hw *hw)
>         return container_of(hw, struct clk_scu, hw);
>  }
> =20
> -int imx_clk_scu_init(void)
> +int imx_clk_scu_init(struct device_node *np)
>  {
> -       return imx_scu_get_handle(&ccm_ipc_handle);
> +       struct platform_device *pd_dev;
> +       int ret, i;
> +
> +       ret =3D imx_scu_get_handle(&ccm_ipc_handle);
> +       if (ret)
> +               return ret;
> +
> +       if (of_property_read_u32(np, "#clock-cells", &clock_cells))
> +               return -EINVAL;
> +
> +       if (clock_cells =3D=3D 2) {
> +               for (i =3D 0; i < IMX_SC_R_LAST; i++)
> +                       INIT_LIST_HEAD(&imx_scu_clks[i]);
> +
> +               pd_np =3D of_find_compatible_node(NULL, NULL, "fsl,scu-pd=
");
> +               pd_dev =3D of_find_device_by_node(pd_np);
> +               if (!pd_dev || !device_is_bound(&pd_dev->dev))
> +                       return -EPROBE_DEFER;

Do you need to put some nodes here with of_node_put() one failure or
when they're done being used?

> +       }
> +
> +       return 0;
>  }
> =20
>  /*
> @@ -387,3 +425,99 @@ struct clk_hw *__imx_clk_scu(const char *name, const=
 char * const *parents,
[...]
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
> +               return ERR_PTR(-ENOMEM);

Why not ERR_PTR(ret)?

> +       }
> +
> +       pdev->driver_override =3D "imx-scu-clk";
> +
> +       ret =3D imx_clk_scu_attach_pd(&pdev->dev, rsrc_id);
> +       if (ret)
> +               pr_warn("%s: failed to attached the power domain %d\n",
> +                       name, ret);
> +
> +       platform_device_add(pdev);
> +
> +       /* For API backwards compatiblilty, simply return NULL for succes=
s */
> +       return NULL;
> +}
