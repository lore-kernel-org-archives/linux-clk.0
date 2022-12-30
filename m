Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A80C4167B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:18:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233908AbiL3ISa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:18:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234765AbiL3IR5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:17:57 -0500
Received: from mail-ua1-x929.google.com (mail-ua1-x929.google.com [IPv6:2607:f8b0:4864:20::929])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA5331A060
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:17:56 -0800 (PST)
Received: by mail-ua1-x929.google.com with SMTP id u3so1367146uae.0
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UKptmBLuOQg1RM4zVHa29163pPmBL0D399wKsCGeJf8=;
        b=LvNoP9vLe6bcqAB3jeW57I2iLYWVxxrHHxAE39uHilcHZ6iInZxn9iXNpVYI6S6hbs
         uqsm6uaQKXnYhhYQF6xbVj2/Ja/3HTtor48an7kltiVPUAVGykta8SDU3e5xXlf9Zaru
         Led7+q/PlqhI5FT3ZPnIlOHDStqgRUxpeIF9M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKptmBLuOQg1RM4zVHa29163pPmBL0D399wKsCGeJf8=;
        b=LEwkdqo7QKX5LXZ6Z4ZWTEIBUZ8fRK4Xwji/mMnUlYFysWGLlykyBLjsB0GGTU31DF
         hgoXb21aIUaJ+js7v73KJSKrhKgSykLQ72Bi6Txwes+4mhFQenWLsN/Valj+Fe4pI5US
         KUPqYRaPYjEDjge+/Bq/so8kY12HkCZE5aMcBzlqvGHp9Sj19atONvgvXzXygn7vG5V8
         TDN024d/32aTW93hrzJ1sx+HPw3QdZNOC8MQEDXshRwCdp+mDxzGiyFmBfQwNc6N29ZO
         AIdoEUUz3vH/OmTBumFoKlthTg4Q8gErL6Zi0jlRFnr3wgAdULqYlgSvNUycrYeEHbSJ
         7K4g==
X-Gm-Message-State: AFqh2kox31LSCFrGQS1j+rFfDAVOSd7xfXFGVCqi95SgkuEE74wjqGjm
        CN9beR707BlArRQss68KAPbacqn4wLfJgQll4Ui4LQ==
X-Google-Smtp-Source: AMrXdXvVoiFEJpFzEVXeUJXm4MP1RYdUzBiiTLiLJOdYxjRbC1msIGJnP7BIg5ubV8Sk8yKBy18sm6YwSacIh59ToeA=
X-Received: by 2002:a9f:386b:0:b0:419:1620:be75 with SMTP id
 q40-20020a9f386b000000b004191620be75mr2823546uad.78.1672388275999; Fri, 30
 Dec 2022 00:17:55 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-17-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:17:45 +0800
Message-ID: <CAGXv+5GR7ef8pTVDHa20QH4hBv2rMAqoY2MjKqK5QRdbFdfDKw@mail.gmail.com>
Subject: Re: [PATCH v2 16/23] clk: mediatek: mt8186: Join top_adj_div and top_muxes
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        fparent@baylibre.com, chun-jie.chen@mediatek.com,
        sam.shih@mediatek.com, y.oudjana@protonmail.com,
        nfraprado@collabora.com, rex-bc.chen@mediatek.com,
        ryder.lee@kernel.org, daniel@makrotopia.org,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        pablo.sun@mediatek.com, msp@baylibre.com, weiyi.lu@mediatek.com,
        ikjn@chromium.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
        kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 23, 2022 at 5:43 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like done for MT8192, join the two to register them in one shot, as
> there's no point in doing that separately from one another.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8186-topckgen.c | 15 ++-------------
>  1 file changed, 2 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8186-topckgen.c b/drivers/clk/mediatek/clk-mt8186-topckgen.c
> index d05143891b69..63befb1f492d 100644
> --- a/drivers/clk/mediatek/clk-mt8186-topckgen.c
> +++ b/drivers/clk/mediatek/clk-mt8186-topckgen.c
> @@ -669,9 +669,6 @@ static struct mtk_composite top_muxes[] = {
>         MUX(CLK_TOP_APLL_I2S4_MCK_SEL, "apll_i2s4_mck_sel", apll_mck_parents, 0x0320, 19, 1),
>         MUX(CLK_TOP_APLL_TDMOUT_MCK_SEL, "apll_tdmout_mck_sel", apll_mck_parents,
>                 0x0320, 20, 1),
> -};
> -
> -static const struct mtk_composite top_adj_divs[] = {
>         DIV_GATE(CLK_TOP_APLL12_CK_DIV0, "apll12_div0", "apll_i2s0_mck_sel",
>                         0x0320, 0, 0x0328, 8, 0),
>         DIV_GATE(CLK_TOP_APLL12_CK_DIV1, "apll12_div1", "apll_i2s1_mck_sel",
> @@ -747,26 +744,19 @@ static int clk_mt8186_topck_probe(struct platform_device *pdev)
>         if (r)
>                 goto unregister_muxes;
>
> -       r = mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base,
> -                                       &mt8186_clk_lock, clk_data, &pdev->dev);
> -       if (r)
> -               goto unregister_composite_muxes;
> -
>         r = clk_mt8186_reg_mfg_mux_notifier(&pdev->dev,
>                                             clk_data->hws[CLK_TOP_MFG]->clk);
>         if (r)
> -               goto unregister_composite_divs;
> +               goto unregister_composite_muxes;
>
>         r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>         if (r)
> -               goto unregister_composite_divs;
> +               goto unregister_composite_muxes;
>
>         platform_set_drvdata(pdev, clk_data);
>
>         return r;
>
> -unregister_composite_divs:
> -       mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
>  unregister_composite_muxes:
>         mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);
>  unregister_muxes:
> @@ -787,7 +777,6 @@ static int clk_mt8186_topck_remove(struct platform_device *pdev)
>
>         of_clk_del_provider(node);
>         mtk_clk_unregister_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), clk_data);
> -       mtk_clk_unregister_composites(top_muxes, ARRAY_SIZE(top_muxes), clk_data);

Wrong line? Not sure how this would've compiled.

>         mtk_clk_unregister_muxes(top_mtk_muxes, ARRAY_SIZE(top_mtk_muxes), clk_data);
>         mtk_clk_unregister_factors(top_divs, ARRAY_SIZE(top_divs), clk_data);
>         mtk_clk_unregister_fixed_clks(top_fixed_clks, ARRAY_SIZE(top_fixed_clks), clk_data);
> --
> 2.39.0
>
