Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 328A8E7B5F5
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 11:33:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242211AbjJDLdf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 07:33:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232919AbjJDLde (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 07:33:34 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2548BF
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 04:33:31 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3ae450158ffso166841b6e.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 04:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696419211; x=1697024011; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FkukSHhnomt94sfNdb927qW6w4syhlErJlsLp434vh4=;
        b=BCuYIX6dSiHDSI9VooTF+w929W9ApLmjVJX9hKeO7bojyV3JGJau4CXI/cCWIE8iuC
         Bo28MkM+zoCnv+VOYKiDkIFu1dCKErV5CSfquypxZd+1JF2sgPqrymCV8vKnIVedKlKc
         RrjJ+ZQA8oNTjDOHsFIRrOypVxr/HmXFly0M0cYC6hWgxmb2Vzt/CrOBRlxu/1dvFgol
         yO3p3QMJdzfeXP7SuCUNW2xaOFVeqKP/fJAY+SOfhXXqx1U7q8GZc3tnjBUurB/bn5RT
         oHMtIjz1oIfKyfI8POmJcVHvoDLBj7fcxa7mrvWGQ9HTrEqsRHSk1Zv7YE9D6ZUoDXzd
         oxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696419211; x=1697024011;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FkukSHhnomt94sfNdb927qW6w4syhlErJlsLp434vh4=;
        b=E1AYenQIKLZb1PizS5Y5zrTB5E4GuNM4oG0Ftl1ShzieMPIrDmm18SbE+BpP4gyD5t
         wjrzbdh71UMyZfINLBqFQDGNEGGXTVpbBwhqlUd4Zj9E6+q8ZDws9Xpm2e+Fcjeuxclt
         T3a4MopslgMWi2YHS2/iHGZ/faZdKE4uigWWzqLIxnb9XcFUHqBs7N4r7POD0BSIXHEf
         HK9hYl9lr7vT2kxJyI6tsa8M+En3/mbVz1KFQmHm1UsdGTMlwxZ2Yr50CnSIvQkELSck
         8q0m6EZ/Ia2FYygRkPQpMSXwa9847YI2UglbpERmZGSbCcKT47nmdzmKZ7NeDVA+i/Nr
         SliA==
X-Gm-Message-State: AOJu0Yyxa4tqOxzsrxIcfOpJrQjkCJ6ywo76i3PRwIXvjLFRYp4f+WCH
        TZWgBijQMFIjIiWMsnOgKfdVe5L+6HM9W0PC0p4=
X-Google-Smtp-Source: AGHT+IHC+bx26ThV7GexUJqlUvDY/KueVTUNcGBY3VvnY7lc5sCx7+4NhYitEfpZ0gl0dpXK8i2FTUSZAwsuHK8A0Xk=
X-Received: by 2002:a05:6358:c10a:b0:14a:cca4:55d7 with SMTP id
 fh10-20020a056358c10a00b0014acca455d7mr1647247rwb.3.1696419211010; Wed, 04
 Oct 2023 04:33:31 -0700 (PDT)
MIME-Version: 1.0
References: <20230815130923.775117-1-festevam@gmail.com>
In-Reply-To: <20230815130923.775117-1-festevam@gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Wed, 4 Oct 2023 08:33:18 -0300
Message-ID: <CAOMZO5DFR25siA4XXjKx5aSWrn6Xq7qSVzF3jMoR5yWzSqGgDQ@mail.gmail.com>
Subject: Re: [PATCH v4] clk: imx: imx6sx: Allow a different LCDIF1 clock parent
To:     abelvesa@kernel.org
Cc:     sboyd@kernel.org, linux-clk@vger.kernel.org,
        Fabio Estevam <festevam@denx.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Abel,

Gentle ping.

On Tue, Aug 15, 2023 at 10:09=E2=80=AFAM Fabio Estevam <festevam@gmail.com>=
 wrote:
>
> From: Fabio Estevam <festevam@denx.de>
>
> It is not a good idea to hardcode the LCDIF1 parent inside the
> clock driver because some users may want to use a different clock
> parent for LCDIF1. One of the reasons could be related to EMI tests.
>
> Remove the harcoded LCDIF1 parent when the LCDIF1 parent is described
> via devicetree.
>
> Old dtb's that do not describe the LCDIF1 parent via devicetree will
> use the same PLL5 clock as parent to keep the original behavior.
>
> Signed-off-by: Fabio Estevam <festevam@denx.de>
> ---
> Changes since v3:
> - Check for the presence of 'assigned-clock-parents'. (Stephen)
>
>  drivers/clk/imx/clk-imx6sx.c | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/imx/clk-imx6sx.c b/drivers/clk/imx/clk-imx6sx.c
> index 3f1502933e59..69f8f6f9ca49 100644
> --- a/drivers/clk/imx/clk-imx6sx.c
> +++ b/drivers/clk/imx/clk-imx6sx.c
> @@ -121,6 +121,7 @@ static void __init imx6sx_clocks_init(struct device_n=
ode *ccm_node)
>  {
>         struct device_node *np;
>         void __iomem *base;
> +       bool lcdif1_assigned_clk;
>
>         clk_hw_data =3D kzalloc(struct_size(clk_hw_data, hws,
>                                           IMX6SX_CLK_CLK_END), GFP_KERNEL=
);
> @@ -498,9 +499,16 @@ static void __init imx6sx_clocks_init(struct device_=
node *ccm_node)
>         clk_set_parent(hws[IMX6SX_CLK_EIM_SLOW_SEL]->clk, hws[IMX6SX_CLK_=
PLL2_PFD2]->clk);
>         clk_set_rate(hws[IMX6SX_CLK_EIM_SLOW]->clk, 132000000);
>
> -       /* set parent clock for LCDIF1 pixel clock */
> -       clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk, hws[IMX6SX_CL=
K_PLL5_VIDEO_DIV]->clk);
> -       clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk, hws[IMX6SX_CLK_LC=
DIF1_PODF]->clk);
> +       np =3D of_find_node_by_path("/soc/bus@2200000/spba-bus@2240000/lc=
dif@2220000");
> +       lcdif1_assigned_clk =3D of_find_property(np, "assigned-clock-pare=
nts", NULL);
> +
> +       /* Set parent clock for LCDIF1 pixel clock if not done via device=
tree */
> +       if (!lcdif1_assigned_clk) {
> +               clk_set_parent(hws[IMX6SX_CLK_LCDIF1_PRE_SEL]->clk,
> +                              hws[IMX6SX_CLK_PLL5_VIDEO_DIV]->clk);
> +               clk_set_parent(hws[IMX6SX_CLK_LCDIF1_SEL]->clk,
> +                              hws[IMX6SX_CLK_LCDIF1_PODF]->clk);
> +       }
>
>         /* Set the parent clks of PCIe lvds1 and pcie_axi to be pcie ref,=
 axi */
>         if (clk_set_parent(hws[IMX6SX_CLK_LVDS1_SEL]->clk, hws[IMX6SX_CLK=
_PCIE_REF_125M]->clk))
> --
> 2.34.1
>
