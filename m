Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1827AC4332F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 07:16:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234570AbiL3HQG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 02:16:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbiL3HQD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 02:16:03 -0500
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5987F1704C
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 23:16:01 -0800 (PST)
Received: by mail-vs1-xe31.google.com with SMTP id 3so20520246vsq.7
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 23:16:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=77WNp07597wRX7W6AdblvnXM0gbT+J8p0UTrY090tdA=;
        b=a1TSSDKNx2rDH/1nQRZ3nsQAgU4EnJrb3cB4rL2w3rGVSnCSdJoydjkUEqg0pkKvwP
         BOUabMFAUBOiW2MctJYO0CZSokjrh4wBmMrUCRZZrhQSowF61LYBSO56LqRh0YyBs6Rf
         Z9XIBDkk2XH4TDTWmiHNCLlO8DF5CzCijXb0A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77WNp07597wRX7W6AdblvnXM0gbT+J8p0UTrY090tdA=;
        b=uJowW8WnzMEnOg3A8hlHbJPoTksu99PBjLTbRzzfossQBDoNC/H1nnGcMDLDMAx/8U
         KY4/wekC6bGcFB2RisJ5ouGrkvIQOzPm/GmRcrWQ1vEZxV63jiuOgkw9bylm0nbr//X/
         OsKfCkGTpgZC/Sxh1u+N5zo1AZBQLJrvX7z4H42rRnJnLQaB4z0Q7b1tkghAIe1XrOvJ
         iPZSc92L7V+ZXcWf0UNnz2BGcZZ2DziPJFLJ/5+Dba16cF99ubAbuxYBDH26gRvKWpvS
         mI9UD8NlV9ngLPx812bZLpQ4Slk88CMZXxBE7AEvkU9mSq5ILowtNMRIgC8Ya5wsAQCD
         jvlQ==
X-Gm-Message-State: AFqh2kqCOx9odPMRP6DZT82I8sU9P5sY9dPIHKm+wNMb5ODM35wR8xb4
        ypxxzXFJ+/EVByEtOdkxbXkPw5nsoPOsgFoaqb+JGA==
X-Google-Smtp-Source: AMrXdXv0ZVlpanVEg2D1eXiIaHSf5I+bsKPIfCgfS93tmGGPyZU7JO/WUQxFmta6DR2aqOTUfYFciBm2MfmiJHbu/kM=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2663570vsv.9.1672384560459; Thu, 29 Dec
 2022 23:16:00 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-14-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-14-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 15:15:49 +0800
Message-ID: <CAGXv+5GBREamLPmjURz5Rb+dYe4oKAxw+gKNqeeSBns_h37=Ng@mail.gmail.com>
Subject: Re: [PATCH v2 13/23] clk: mediatek: mt8173: Migrate pericfg/topckgen
 to mtk_clk_simple_probe()
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
> Function mtk_clk_simple_probe() gained the ability to register multiple
> clock types: migrate MT8173's pericfg and topckgen to this common
> probe function to reduce duplication and code size.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
