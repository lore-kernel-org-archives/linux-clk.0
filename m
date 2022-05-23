Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63551C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 23 May 2022 22:50:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbiEWWuV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 May 2022 18:50:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbiEWWuV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 May 2022 18:50:21 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18E77A80A
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:50:19 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id r84so2482416qke.10
        for <linux-clk@vger.kernel.org>; Mon, 23 May 2022 15:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RupDdku696YI2aJ6LFtSWAU5mlc/9wa0HAPdVsaaX/g=;
        b=R74stxJhmvV8DOQAtRBN0/hGyLdW6u51nBr0b0EvrakKeyBawMzZGF95fa6y18lmTh
         SKeUFQl0ZVdMxd+mPnH0+IOovnvAM3oXBlz8XbzBjiQ8DGTqYfguS+rNgCLQG757PsqM
         3V+iv7wk6dRbJTm9w1guUxDiXAYsNiyP+OXyR5UApn35Q7fnRQpqNts40p4cVyyRm0Vq
         WdzU4P/iL3F0TcsmWvm2UvYDTuA8Xqzam5VgvuBOpwO5fFqER3xAGsu9Zb4eASs3TUTr
         2BGNOejDyBEl3knkhGfD07/RHO2bv3sXPvNEEzT87txTupfaYaEhdA1rMNh5/Im2xyIF
         EaKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RupDdku696YI2aJ6LFtSWAU5mlc/9wa0HAPdVsaaX/g=;
        b=IBg+ZmNHGP3DGk6NGTa9JWsjerebbco/nsbXMiGe8RBNlop0Uoy15Teb7XcKY53yXm
         9xrXIp4BZckdkFKzhA3CjUU8jlZas3l50p3NOHXJDZ1u0mx9cSO5SQ1SVyBY5o+28obY
         SWdS1Tgw+htBzew3nShhVgmmyRoaPouZIpPvJPCkIRE8dYubMAk0B5kCKH0d+N103R4h
         8MYztQpzicKOS0ElGhisdM8xbSwXVSu0Z0K7xPS+yqLwp3Q9VppSoJSG/husRpzlbySV
         Ts9QRgN3kQIsvDheCppSKiuSoifvrC6N7fcz99tpCooYGQKbjWX7qcrSjjBpnCKRuVx4
         Xp4w==
X-Gm-Message-State: AOAM531OsXXMc30vCvPL/ySk1Cjj65fxPZFH1hul83y9JkeOBCjjJ9TU
        nyoTuj8nNdaTZhUItzTftJA6w+1qEf31R69KeAkGAg==
X-Google-Smtp-Source: ABdhPJzZdapOYYj/QSmAr5fRdCMSDzn5R35SYPpAvq0ZsnvOd7pRBzd1D2aYKF1/xQ4y3KqMOChYjVUwSAl6uMA8JBA=
X-Received: by 2002:a05:620a:2a11:b0:6a0:4ae4:fee6 with SMTP id
 o17-20020a05620a2a1100b006a04ae4fee6mr15742412qkp.30.1653346218984; Mon, 23
 May 2022 15:50:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220523213837.1016542-1-marijn.suijten@somainline.org> <20220523213837.1016542-8-marijn.suijten@somainline.org>
In-Reply-To: <20220523213837.1016542-8-marijn.suijten@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Tue, 24 May 2022 01:50:08 +0300
Message-ID: <CAA8EJpr5iY8=VX8ixY7BOrzkqhvg=bJcP+WCHW03d7rmYo+_VQ@mail.gmail.com>
Subject: Re: [PATCH 7/9] drm/msm/dsi_phy_14nm: Replace parent names with
 clk_hw pointers
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     phone-devel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rajeev Nandan <quic_rajeevny@quicinc.com>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Marek <jonathan@marek.ca>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 24 May 2022 at 00:38, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> parent_hw pointers are easier to manage and cheaper to use than
> repeatedly formatting the parent name and subsequently leaving the clk
> framework to perform lookups based on that name.
>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Nit: my rant regarding syntax changes applies here too.

> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c | 36 ++++++++++------------
>  1 file changed, 17 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> index 8199c53567f4..574f95ab2f22 100644
> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c
> @@ -764,14 +764,14 @@ static int dsi_14nm_set_usecase(struct msm_dsi_phy *phy)
>
>  static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
>                                                 const char *name,
> -                                               const char *parent_name,
> +                                               const struct clk_hw *parent_hw,
>                                                 unsigned long flags,
>                                                 u8 shift)
>  {
>         struct dsi_pll_14nm_postdiv *pll_postdiv;
>         struct device *dev = &pll_14nm->phy->pdev->dev;
>         struct clk_init_data postdiv_init = {
> -               .parent_names = (const char *[]) { parent_name },
> +               .parent_hws = (const struct clk_hw *[]) { parent_hw },
>                 .num_parents = 1,
>                 .name = name,
>                 .flags = flags,
> @@ -800,7 +800,7 @@ static struct clk_hw *pll_14nm_postdiv_register(struct dsi_pll_14nm *pll_14nm,
>
>  static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **provided_clocks)
>  {
> -       char clk_name[32], parent[32], vco_name[32];
> +       char clk_name[32], vco_name[32];
>         struct clk_init_data vco_init = {
>                 .parent_data = &(const struct clk_parent_data) {
>                         .fw_name = "ref",
> @@ -811,7 +811,7 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
>                 .ops = &clk_ops_dsi_pll_14nm_vco,
>         };
>         struct device *dev = &pll_14nm->phy->pdev->dev;
> -       struct clk_hw *hw;
> +       struct clk_hw *hw, *n1_postdiv, *n1_postdivby2;
>         int ret;
>
>         DBG("DSI%d", pll_14nm->phy->id);
> @@ -824,48 +824,46 @@ static int pll_14nm_register(struct dsi_pll_14nm *pll_14nm, struct clk_hw **prov
>                 return ret;
>
>         snprintf(clk_name, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dvco_clk", pll_14nm->phy->id);
>
>         /* N1 postdiv, bits 0-3 in REG_DSI_14nm_PHY_CMN_CLK_CFG0 */
> -       hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent,
> -                                      CLK_SET_RATE_PARENT, 0);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       n1_postdiv = pll_14nm_postdiv_register(pll_14nm, clk_name,
> +                       &pll_14nm->clk_hw, CLK_SET_RATE_PARENT, 0);
> +       if (IS_ERR(n1_postdiv))
> +               return PTR_ERR(n1_postdiv);
>
>         snprintf(clk_name, 32, "dsi%dpllbyte", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
>
>         /* DSI Byte clock = VCO_CLK / N1 / 8 */
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent,
> -                                         CLK_SET_RATE_PARENT, 1, 8);
> +       hw = devm_clk_hw_register_fixed_factor_parent_hw(dev, clk_name,
> +                       n1_postdiv, CLK_SET_RATE_PARENT, 1, 8);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>
>         provided_clocks[DSI_BYTE_PLL_CLK] = hw;
>
>         snprintf(clk_name, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dn1_postdiv_clk", pll_14nm->phy->id);
>
>         /*
>          * Skip the mux for now, force DSICLK_SEL to 1, Add a /2 divider
>          * on the way. Don't let it set parent.
>          */
> -       hw = devm_clk_hw_register_fixed_factor(dev, clk_name, parent, 0, 1, 2);
> -       if (IS_ERR(hw))
> -               return PTR_ERR(hw);
> +       n1_postdivby2 = devm_clk_hw_register_fixed_factor_parent_hw(dev,
> +                       clk_name, n1_postdiv, 0, 1, 2);
> +       if (IS_ERR(n1_postdivby2))
> +               return PTR_ERR(n1_postdivby2);
>
>         snprintf(clk_name, 32, "dsi%dpll", pll_14nm->phy->id);
> -       snprintf(parent, 32, "dsi%dn1_postdivby2_clk", pll_14nm->phy->id);
>
>         /* DSI pixel clock = VCO_CLK / N1 / 2 / N2
>          * This is the output of N2 post-divider, bits 4-7 in
>          * REG_DSI_14nm_PHY_CMN_CLK_CFG0. Don't let it set parent.
>          */
> -       hw = pll_14nm_postdiv_register(pll_14nm, clk_name, parent, 0, 4);
> +       hw = pll_14nm_postdiv_register(pll_14nm, clk_name, n1_postdivby2,
> +                       0, 4);
>         if (IS_ERR(hw))
>                 return PTR_ERR(hw);
>
> -       provided_clocks[DSI_PIXEL_PLL_CLK]      = hw;
> +       provided_clocks[DSI_PIXEL_PLL_CLK] = hw;
>
>         return 0;
>  }
> --
> 2.36.1
>


-- 
With best wishes
Dmitry
