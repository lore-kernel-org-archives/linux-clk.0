Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8A98C07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 09:43:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8EF0E2084A
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 09:43:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="PKT2Tzdi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EF0E2084A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726134AbeLKJnN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 04:43:13 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:35061 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbeLKJnN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 04:43:13 -0500
Received: by mail-ua1-f68.google.com with SMTP id d2so4913689ual.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Dec 2018 01:43:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qiCVCqL8DPBEqqUZ9Lkm11QkiqOa+zItnYetZ5jc2W4=;
        b=PKT2Tzdi+fV9EVYj6CKY2Cr5xBcsIDOxBV+AGZS7uXXQjH7fzOY9HCOX8AvFVH6A4U
         jt8YA3KPthxCPzuab73HPP54OyR5L7bBQlpAD+CrQbRmFionC9TJt+RgubFP+23weoZJ
         3fbfSobZXGULbOJjULjvM9u0aSu6+JPxo+XEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qiCVCqL8DPBEqqUZ9Lkm11QkiqOa+zItnYetZ5jc2W4=;
        b=X4zFo0+kk9yVD3yEWnDN2SIcQnZxsHkge9ps6Kr/WyZhaqJegQTNlg0aXLyDNEq2md
         bwfEF3vG7wT84LSiFVoV0KbvmGU2PtGhXV59Q6Vq3Q0xFDiNQfSCEfHkYa3a84xwTPzG
         RWDwwI3oeO1lPU8wKooWDcgVJlCGYx/rK32R8Bw8t0OJN7uYdeU8QnonAUSV+gRLuQch
         wW41Uq6iyXLW86xPKgYZniF1qyJlegUxEdKXkP0/YFHUidQbovzg/gsdWZNStkGNC24h
         QqKw5Y1D/1gPglXioCuoJw7WaOlPmyaT2tSJwuXIVwJOmsJZXJjjc+tM0/6ky0yj2AJs
         jlSQ==
X-Gm-Message-State: AA+aEWbK6+KQ9JzLXif5EtEBZKLL1oiUPxHma4V9kARh/ovZffvzoG75
        cbFiOXKjXu19hsiIyBJZ7S2dxGkCcJRya6MrBwnz9g==
X-Google-Smtp-Source: AFSGD/VGXOGhRU+5j41SWhMn/JGDx25SC/LQU9uF8R3wQtVvb2xPc1rTO8zBx+jYhJwht90zrDsmaHjc4MhvvQPkVx8=
X-Received: by 2002:ab0:3484:: with SMTP id c4mr6993247uar.39.1544521391423;
 Tue, 11 Dec 2018 01:43:11 -0800 (PST)
MIME-Version: 1.0
References: <20181205195050.4759-5-robh@kernel.org>
In-Reply-To: <20181205195050.4759-5-robh@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 11 Dec 2018 10:42:35 +0100
Message-ID: <CAPDyKFq2x=BKVc36xqyjjjh5xMZa_Ws=-wv9bwadiNkBEgmsdA@mail.gmail.com>
Subject: Re: [PATCH] clk: Use of_node_name_eq for node name comparisons
To:     Rob Herring <robh@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Tero Kristo <t-kristo@ti.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-omap <linux-omap@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 5 Dec 2018 at 20:50, Rob Herring <robh@kernel.org> wrote:
>
> Convert string compares of DT node names to use of_node_name_eq helper
> instead. This removes direct access to the node name pointer.
>
> For instances using of_node_cmp, this has the side effect of now using
> case sensitive comparisons. This should not matter for any FDT based
> system which all of these are.
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Tero Kristo <t-kristo@ti.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: linux-renesas-soc@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Signed-off-by: Rob Herring <robh@kernel.org>

For the ux500 part:

Acked-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>  drivers/clk/renesas/clk-mstp.c   |  2 +-
>  drivers/clk/ti/clkctrl.c         |  2 +-
>  drivers/clk/ti/dpll.c            |  2 +-
>  drivers/clk/ux500/u8500_of_clk.c | 10 +++++-----
>  4 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/renesas/clk-mstp.c b/drivers/clk/renesas/clk-mstp.c
> index 1c1768c2cc82..765175d1148a 100644
> --- a/drivers/clk/renesas/clk-mstp.c
> +++ b/drivers/clk/renesas/clk-mstp.c
> @@ -280,7 +280,7 @@ int cpg_mstp_attach_dev(struct generic_pm_domain *unused, struct device *dev)
>                         goto found;
>
>                 /* BSC on r8a73a4/sh73a0 uses zb_clk instead of an mstp clock */
> -               if (!strcmp(clkspec.np->name, "zb_clk"))
> +               if (of_node_name_eq(clkspec.np, "zb_clk"))
>                         goto found;
>
>                 of_node_put(clkspec.np);
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index 469f560ae1cf..40630eb950fc 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -448,7 +448,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>         char *c;
>
>         if (!(ti_clk_get_features()->flags & TI_CLK_CLKCTRL_COMPAT) &&
> -           !strcmp(node->name, "clk"))
> +           of_node_name_eq(node, "clk"))
>                 ti_clk_features.flags |= TI_CLK_CLKCTRL_COMPAT;
>
>         addrp = of_get_address(node, 0, NULL, NULL);
> diff --git a/drivers/clk/ti/dpll.c b/drivers/clk/ti/dpll.c
> index 92e28af7afba..6c3329bc116f 100644
> --- a/drivers/clk/ti/dpll.c
> +++ b/drivers/clk/ti/dpll.c
> @@ -410,7 +410,7 @@ static void __init of_ti_omap3_dpll_setup(struct device_node *node)
>
>         if ((of_machine_is_compatible("ti,omap3630") ||
>              of_machine_is_compatible("ti,omap36xx")) &&
> -           !strcmp(node->name, "dpll5_ck"))
> +            of_node_name_eq(node, "dpll5_ck"))
>                 of_ti_dpll_setup(node, &omap3_dpll5_ck_ops, &dd);
>         else
>                 of_ti_dpll_setup(node, &omap3_dpll_ck_ops, &dd);
> diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
> index d5888591e1a9..18a3c4522831 100644
> --- a/drivers/clk/ux500/u8500_of_clk.c
> +++ b/drivers/clk/ux500/u8500_of_clk.c
> @@ -545,21 +545,21 @@ static void u8500_clk_init(struct device_node *np)
>         for_each_child_of_node(np, child) {
>                 static struct clk_onecell_data clk_data;
>
> -               if (!of_node_cmp(child->name, "prcmu-clock")) {
> +               if (of_node_name_eq(child, "prcmu-clock")) {
>                         clk_data.clks = prcmu_clk;
>                         clk_data.clk_num = ARRAY_SIZE(prcmu_clk);
>                         of_clk_add_provider(child, of_clk_src_onecell_get, &clk_data);
>                 }
> -               if (!of_node_cmp(child->name, "prcc-periph-clock"))
> +               if (of_node_name_eq(child, "prcc-periph-clock"))
>                         of_clk_add_provider(child, ux500_twocell_get, prcc_pclk);
>
> -               if (!of_node_cmp(child->name, "prcc-kernel-clock"))
> +               if (of_node_name_eq(child, "prcc-kernel-clock"))
>                         of_clk_add_provider(child, ux500_twocell_get, prcc_kclk);
>
> -               if (!of_node_cmp(child->name, "rtc32k-clock"))
> +               if (of_node_name_eq(child, "rtc32k-clock"))
>                         of_clk_add_provider(child, of_clk_src_simple_get, rtc_clk);
>
> -               if (!of_node_cmp(child->name, "smp-twd-clock"))
> +               if (of_node_name_eq(child, "smp-twd-clock"))
>                         of_clk_add_provider(child, of_clk_src_simple_get, twd_clk);
>         }
>  }
> --
> 2.19.1
>
