Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A32CC3DA7C
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:14:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbiL3IOi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:14:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234659AbiL3IOh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:14:37 -0500
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 495EB193FE
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:14:36 -0800 (PST)
Received: by mail-vk1-xa33.google.com with SMTP id bi24so2567139vkb.6
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:14:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=h/23SH/RDubUwtPhGDvvJ5R7dhk7aa2Q9znGGjv9398=;
        b=hQL750/SptDyM5zC9SONd1+yKhS6sU/IIgcEppsoQ+cTBrkG0dJKYth3P6vkDRv1m2
         rZSgt08UXmchg3fKG/2gV4l20jzUYuaKZ802nmCM+vwvC7x/OzXK0f1aVK4YC3dm/OYJ
         +vLtcMX04P3A/R8rugf17ELK3VwPbMxjI21wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h/23SH/RDubUwtPhGDvvJ5R7dhk7aa2Q9znGGjv9398=;
        b=1pWVjPYilPBGGQiWRY6irE1EGABIFkT5WZK12vDaYbIowqjXpKsseqZAQK8vX7DETX
         Gz+Sa1jFdwb0vLMvinRrMmpvZCacfBQyW8yMxQc242shI9tj2cNvswu/yoOl1y6RDdLB
         wMSj1pjJ73JqE1/zBU+wJwM5T/ncT5venQP5rP8fW0n2qQpWQlKKI27nXei80YXe7RMW
         PF/EY+OzVcxCU0LlKTHb7PU9gCaHnsnx34XCEJubzUepgeq07ljyvvDqY0nUHFX8AUtr
         ZiZZiYp9anmbDqZEKSlYWsknPk83PnxSuK/dfbkJRW3qxfVDvjUpHHwKxzGzeU3AO+Og
         J0ig==
X-Gm-Message-State: AFqh2krFiDyo8oQ+TgFwavWgg+JSEWGSPih0Xu8kl5DOyWxJLVxYZHHz
        1jeLlIAbc/Xs2evpXpMPbDE4EwlbY6l4/8CSOBSbOQ==
X-Google-Smtp-Source: AMrXdXv+RCjAisIysYzOgTd+TZASYGjgYmh6pgy5c7q3H14gY+3IMCe6R4lmwzLkmBOTPRmsWJgPiOASnjVqpAniq1Y=
X-Received: by 2002:a1f:940a:0:b0:3bd:e439:84e4 with SMTP id
 w10-20020a1f940a000000b003bde43984e4mr3202746vkd.11.1672388075447; Fri, 30
 Dec 2022 00:14:35 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-24-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-24-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:14:24 +0800
Message-ID: <CAGXv+5HtEE_1wFOHwXLe+gJrcEgs63g-UpiiRXoSqh+fZW=N+Q@mail.gmail.com>
Subject: Re: [PATCH v2 23/23] clk: mediatek: clk-mt7986-topckgen: Migrate to mtk_clk_simple_probe()
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
> There are no more non-common calls in clk_mt7986_topckgen_probe():
> migrate this driver to mtk_clk_simple_probe().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
