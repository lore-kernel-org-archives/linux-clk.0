Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2247C43387
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9B2AB214C6
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545073228;
	bh=XQw0DCAU/DjdMK4C1ZFy7J4P1irR3utQR4ejBcqXMmU=;
	h=In-Reply-To:Subject:To:References:From:Cc:Date:List-ID:From;
	b=DYpg9UO8yKc2VwuDL4lzykDC+C+0lOYVjavCnpjtJ6iV8MSUSNWJ0N0NzNJgJO/xv
	 gE9kof7+vEBhhzwll+rSlMVYhoiq5EiBLEv4dOCfTgnB3d+AkMHfXR6NVpvY3S7zeY
	 wy07rqEktWvCcdyVGuMdYV8TYkDInBacD+uPRAX4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733258AbeLQTA1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:00:27 -0500
Received: from mail.kernel.org ([198.145.29.99]:49490 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733096AbeLQTAX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 14:00:23 -0500
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C25DA21473;
        Mon, 17 Dec 2018 19:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1545073221;
        bh=XQw0DCAU/DjdMK4C1ZFy7J4P1irR3utQR4ejBcqXMmU=;
        h=In-Reply-To:Subject:To:References:From:Cc:Date:From;
        b=C3SV7iOtdVrKCR6WFPPZJuk5NYEQnlh8CZ8u111gLD8cXxnT1T8adGDw7JCEuayTW
         5TcZ1l6XP2UO2KewPK+U1lEmOtKaBffMbLemDghtlY04HExcp/a8UqgzrqPHH/Lcyj
         7F+iDKfH2DXx2GzpZUL4X9+qUhzH8Z/+XQoktlhI=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20181215103557.2748-7-govinds@codeaurora.org>
Subject: Re: [PATCH v3 6/7] remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404
To:     Govind Singh <govinds@codeaurora.org>, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org
References: <20181215103557.2748-1-govinds@codeaurora.org> <20181215103557.2748-7-govinds@codeaurora.org>
Message-ID: <154507322089.19322.12841229714940268825@swboyd.mtv.corp.google.com>
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8
Cc:     linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Govind Singh <govinds@codeaurora.org>
Date:   Mon, 17 Dec 2018 11:00:20 -0800
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Govind Singh (2018-12-15 02:35:56)
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qco=
m_q6v5_wcss.c
> index 129f82404656..3f66bd8fa407 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -83,12 +105,32 @@ struct q6v5_wcss {
> =20
>         void __iomem *reg_base;
>         void __iomem *rmb_base;
> +       void __iomem *q6stop_base;
> =20
>         struct regmap *halt_map;
>         u32 halt_q6;
>         u32 halt_wcss;
>         u32 halt_nc;
> =20
> +       struct clk *xo;
> +       struct clk *ahbfabric_cbcr_clk;
> +       struct clk *gcc_abhs_cbcr;
> +       struct clk *gcc_axim_cbcr;
> +       struct clk *lcc_csr_cbcr;
> +       struct clk *ahbs_cbcr;
> +       struct clk *tcm_slave_cbcr;
> +       struct clk *qdsp6ss_abhm_cbcr;
> +       struct clk *qdsp6ss_sleep_cbcr;
> +       struct clk *qdsp6ss_axim_cbcr;
> +       struct clk *qdsp6ss_xo_cbcr;
> +       struct clk *qdsp6ss_core_gfmux;
> +       struct clk *wcss_bcr_cbcr;

You should look into clk_bulk_prepare_enable() or just
clk_bulk_get_all() to greatly simplify this patch.

> +       struct regulator *cx_supply;
> +
> +       struct qcom_rproc_glink glink_subdev;
> +       struct qcom_rproc_ssr ssr_subdev;
> +       struct qcom_sysmon *sysmon;
> +
>         struct reset_control *wcss_aon_reset;
>         struct reset_control *wcss_reset;
>         struct reset_control *wcss_q6_reset;
> @@ -99,9 +141,7 @@ struct q6v5_wcss {
>         phys_addr_t mem_reloc;
>         void *mem_region;
>         size_t mem_size;
> -
>         int crash_reason_smem;
> -       int pas_id;
>         int version;
>  };
> =20
> @@ -245,6 +285,197 @@ static int q6v5_wcss_start(struct rproc *rproc)
>         return ret;
>  }
> =20
[...]
> +
> +       /* Assert resets, stop core */
> +       val =3D readl(wcss->reg_base + Q6SS_RESET_REG);
> +       val |=3D Q6SS_CORE_ARES | Q6SS_BUS_ARES_ENABLE | Q6SS_STOP_CORE;
> +       writel(val, wcss->reg_base + Q6SS_RESET_REG);
> +
> +       /* Program the QDSP6SS PWR_CTL register */
> +       writel(0x01700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       writel(0x03700000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       writel(0x03300000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       writel(0x033C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       /*
> +        * Enable memories by turning on the QDSP6 memory foot/head switc=
h, one
> +        * bank at a time to avoid in-rush current
> +        */
> +       for (idx =3D 28; idx >=3D 0; idx--) {
> +               writel((readl(wcss->reg_base + Q6SS_MEM_PWR_CTL) |
> +                       (1 << idx)), wcss->reg_base + Q6SS_MEM_PWR_CTL);
> +       }

Smells like it should be in a power domain driver, but I guess it gets a
little hard because clks have to be powered on first and in some order.

> +
> +       writel(0x031C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +       writel(0x030C0000, wcss->reg_base + Q6SS_PWR_CTL_REG);
> +
> +       val =3D readl(wcss->reg_base + Q6SS_RESET_REG);
> +       val &=3D ~Q6SS_CORE_ARES;
> +       writel(val, wcss->reg_base + Q6SS_RESET_REG);
> +
> +       /* Enable the Q6 core clock at the GFM, Q6SSTOP_QDSP6SS_GFMUX_CTL=
 */
> +       ret =3D clk_prepare_enable(wcss->qdsp6ss_core_gfmux);
> +       if (ret)
> +               goto disable_gcc_axim_cbcr_clk;
> +
> +       /* Enable sleep clock branch needed for BCR circuit */
> +       ret =3D clk_prepare_enable(wcss->wcss_bcr_cbcr);
> +       if (ret)
> +               goto disable_core_gfmux_clk;
> +
> +       return 0;
> @@ -475,35 +781,60 @@ static int q6v5_wcss_init_reset(struct q6v5_wcss *w=
css)
>  static int q6v5_wcss_init_mmio(struct q6v5_wcss *wcss,
>                                struct platform_device *pdev)
>  {
> -       struct of_phandle_args args;
> +       unsigned int halt_reg[MAX_HALT_REG] =3D {0};
> +       struct device_node *syscon;
>         struct resource *res;
>         int ret;
> =20
>         res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "qdsp6=
");
> -       wcss->reg_base =3D devm_ioremap_resource(&pdev->dev, res);
> +       wcss->reg_base =3D devm_ioremap(&pdev->dev, res->start,
> +                                     resource_size(res));
>         if (IS_ERR(wcss->reg_base))
>                 return PTR_ERR(wcss->reg_base);
> =20
> -       res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, "rmb");
> -       wcss->rmb_base =3D devm_ioremap_resource(&pdev->dev, res);
> -       if (IS_ERR(wcss->rmb_base))
> -               return PTR_ERR(wcss->rmb_base);
> +       if (wcss->version =3D=3D WCSS_QCS404) {
> +               res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                                  "q6stop");
> +               if (!res) {
> +                       dev_err(&pdev->dev, "invalid q6stop_base resource=
\n");
> +                       return -EINVAL;
> +               }
> +
> +               wcss->q6stop_base =3D devm_ioremap(&pdev->dev, res->start,
> +                                                resource_size(res));

Why can't devm_ioremap_resource() be used here?

> +               if (IS_ERR(wcss->q6stop_base))
> +                       return PTR_ERR(wcss->q6stop_base);
> +       } else {
> +               res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM=
, "rmb");
> +               wcss->rmb_base =3D devm_ioremap_resource(&pdev->dev, res);
> +               if (IS_ERR(wcss->rmb_base))
> +                       return PTR_ERR(wcss->rmb_base);
> +       }
> =20
> -       ret =3D of_parse_phandle_with_fixed_args(pdev->dev.of_node,
> -                                              "qcom,halt-regs", 3, 0, &a=
rgs);
> -       if (ret < 0) {
> +       syscon =3D of_parse_phandle(pdev->dev.of_node,
> +                                 "qcom,halt-regs", 0);
> +       if (!syscon) {
>                 dev_err(&pdev->dev, "failed to parse qcom,halt-regs\n");
>                 return -EINVAL;
>         }
