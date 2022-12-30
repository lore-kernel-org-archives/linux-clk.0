Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB6CC4167B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbiL3IM6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:12:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbiL3IM5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:12:57 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4271018E25
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:12:56 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id p30so15010359vsr.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:12:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovjF9LP8AGSgXaaf5365MzNw6zGtX3G+dhQI2d2MZj0=;
        b=aMTf6useIPW5ahkjqv6bsmW6ZzSOKFmJYGo1CjnRcdKkeryXRbZbItOjrvSg14iDos
         9TEuP+z48lFXwYWYeXsvOUAl4v5p8GORFfq/vefBEXkVLm8yssJ2zXlS6SnDnXUFX+Re
         oU77MB/+WyaZj7GOn7rFf7dg0x0Mu7uOV/+QY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovjF9LP8AGSgXaaf5365MzNw6zGtX3G+dhQI2d2MZj0=;
        b=foBKeNg+BvuUsZRl719mkKbGGJEiCLcRz0a6EPwqaL2pDkV4yMGSjGeDyWCNl6eQ9D
         Bupc/crAMzt8LuTOIx7QFORqWxJOxRMyhD46II5RFliY8YBpovsohJRxaBjXOM6A3y6h
         DzNPGR0k94wCenWJdS123V+PVFNg+NJN2k7fVqC8Kb+TvVME9hZ6/FMJkShsGa+zRDD2
         HgeJNccOJQVz3kSb0kfuULatGWsAewVL0gdPGyiBWhmrs+YOwCue4rBs4lc5e5KNl/XI
         VErgnbLa0SPKmtoNG1fxiFAbN3jxgtpAAMza+EqtSKPualxKGs0XNcNYwmexL7J6taBo
         CZAA==
X-Gm-Message-State: AFqh2koYztMqIahOjTv9BCF8CR9xawzHn6eKtgg7RNVnD322fBA65NU4
        sXWYy8JxpsF06J2ZfVopo+bz8INXtu6b7uzivny+8w==
X-Google-Smtp-Source: AMrXdXvj4BRr4R5dsv0zqB2v+B0EHWVqgAJmDHpFhhUkVRCeouysE+BnS2J/faKZK+rkLbAqbDs51urSHbAva+OZeOQ=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2676056vsv.9.1672387975420; Fri, 30 Dec
 2022 00:12:55 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-19-angelogioacchino.delregno@collabora.com> <20221229082103.21064-1-miles.chen@mediatek.com>
In-Reply-To: <20221229082103.21064-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:12:44 +0800
Message-ID: <CAGXv+5Eq=VDfM35u0bxAS_-Dxv9yUpNAFqar_nCyC=5tXbtMFw@mail.gmail.com>
Subject: Re: [PATCH v2 18/23] clk: mediatek: clk-mtk: Register MFG notifier in mtk_clk_simple_probe()
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        devicetree@vger.kernel.org, fparent@baylibre.com,
        ikjn@chromium.org, johnson.wang@mediatek.com,
        jose.exposito89@gmail.com, kernel@collabora.com,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com,
        nfraprado@collabora.com, pablo.sun@mediatek.com,
        rex-bc.chen@mediatek.com, robh+dt@kernel.org, ryder.lee@kernel.org,
        sam.shih@mediatek.com, sboyd@kernel.org, weiyi.lu@mediatek.com,
        y.oudjana@protonmail.com, yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Dec 29, 2022 at 4:21 PM Miles Chen <miles.chen@mediatek.com> wrote:
>
> >In preparation for commonizing topckgen probe on various MediaTek SoCs
> >clock drivers, add the ability to register the MFG MUX notifier in
> >mtk_clk_simple_probe() by passing a custom notifier register function
> >pointer, as this function will be slightly different across different
> >SoCs.
> >
> >Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >---
> > drivers/clk/mediatek/clk-mtk.c | 8 ++++++++
> > drivers/clk/mediatek/clk-mtk.h | 3 +++
> > 2 files changed, 11 insertions(+)
> >
> >diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
> >index b0a6225cd7b2..df6281492fb6 100644
> >--- a/drivers/clk/mediatek/clk-mtk.c
> >+++ b/drivers/clk/mediatek/clk-mtk.c
> >@@ -533,6 +533,14 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
> >                       goto unregister_composites;
> >       }
> >
> >+      if (mcd->clk_notifier_func) {
> >+              struct clk *mfg_mux = clk_data->hws[mcd->mfg_clk_idx]->clk;
> >+
> >+              r = mcd->clk_notifier_func(&pdev->dev, mfg_mux);
> >+              if (r)
> >+                      goto unregister_clks;
> >+      }
>
> Should we have a IS_ERR_OR_NULL() check for clk_data->hws[mcd->mfg_clk_idx]?

With a big warning to signal that something in the driver isn't written
correctly, such as no MFG clock actually being included in the driver.

ChenYu
