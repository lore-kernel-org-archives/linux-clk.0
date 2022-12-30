Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9306C10F1B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:22:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234631AbiL3IW0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234793AbiL3IWY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:22:24 -0500
Received: from mail-vs1-xe2b.google.com (mail-vs1-xe2b.google.com [IPv6:2607:f8b0:4864:20::e2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F1FB1A22A
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:22:24 -0800 (PST)
Received: by mail-vs1-xe2b.google.com with SMTP id 3so20620402vsq.7
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PPMh1bx7p+RWszUWsYNnjB1z/mUzp7J0r3Un1hyV3Yg=;
        b=ChHCyeXa9C49zHneJZHTToGD050rLQoMOGL1Lt/Rd7kfXVQC+SosxVz7CrUpTLdzTj
         3SsTVQD1ytTaph5osVDToCNpZog3wDsTWbuiRTLQVNrQOO0EpiYSIMhbbGipgpHpcZvY
         +Um7mpYegGA+xy2MrNrvT0WQmzf6ixi9Eff6o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPMh1bx7p+RWszUWsYNnjB1z/mUzp7J0r3Un1hyV3Yg=;
        b=SsjViKp5VSf1iAvZMQLWmLEbrxaQFInvukf89TEw4pwhl2itxNAEZF3F2+Nw05cfSG
         rmVEr2hX4T8t9DmgLwHsviXhPTMrIS5LRGndEbdDXPHZSt6Kln1K7w+0fUdRnw+f6vkg
         io25dLCvSjHqd7z7M4O2Xpr1lvTfkY0my+R7wXAoTgefI6mA6lJLUKcZiWS3/po/yBNs
         lJIxj3w5rx5xa3042ieNMEuw6FwHHOd5/FzOJ7MSl8+jIGQYYXTmsNHGa2l7ni+QIYUc
         IcqWMoEj0lD79yX+wK/6TgfsVV4Vf0cd4oMMhKEWRPwA2l9Xq0XuxpM0uzVv27tEOEz3
         hl9w==
X-Gm-Message-State: AFqh2koNL1kR9M+Xp6XQv1A02mDnZO13yp3XpK/qIK3VKPtbZHi34vMH
        9GCQP/dZShyJK6UU0RHjOc8kxDCTMNR7+LREVoRSNQ==
X-Google-Smtp-Source: AMrXdXtILSSp544twEvhbZAOHBZZSqyPKdwHftg430OofTjYalRaCuf+LT9O+Osuk/hg1h3mWuLbqx+qbQQ3Y50n/v4=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2677891vsv.9.1672388543279; Fri, 30 Dec
 2022 00:22:23 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-9-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:22:12 +0800
Message-ID: <CAGXv+5FGJhkhHHoyx8S7v6KzBJ+ifSXU+X1EUVqpkydrRVHGMw@mail.gmail.com>
Subject: Re: [PATCH v2 08/23] clk: mediatek: mt8173: Migrate to platform
 driver and common probe
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
> This driver is using CLK_OF_DECLARE() for all clocks: while this
> definitely works, it's not preferred as this makes it impossible
> to compile non boot critical clock drivers as modules and to take
> advantage of clock controller Runtime PM.
>
> As a preparation for a larger cleanup, migrate all of the clock
> controller drivers for MT8173 to platform_driver and use the
> common mtk_clk_simple_probe() where possible.

Should also mention that proper error handling was added. Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
