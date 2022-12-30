Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4767BC4167B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 08:16:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiL3IQX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 03:16:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234736AbiL3IQF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 03:16:05 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 648A51A061
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:16:04 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id o63so15825642vsc.10
        for <linux-clk@vger.kernel.org>; Fri, 30 Dec 2022 00:16:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=KPlTEqYa3MYCMl9BvqJcl9vvn2yJXyimwlsnQsWb80g=;
        b=YhAxgjwByMUVtC0QltQ0WZbdI/jd05toOa5H1jc5GThVHN2I114FIGBg6IFEm61vTO
         vjueufSh3oZGhR632HQeIa257kEzkJLao4uA7qTC8d7DgDRea0pwxhRcTZcFSnZ9xmoj
         mnvt8dyoAkT7xtkdOpPxs554wJdeEe+ZrTvxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KPlTEqYa3MYCMl9BvqJcl9vvn2yJXyimwlsnQsWb80g=;
        b=yc4NhmAwCTLwahNxIfuJmmQebsm4fZ1NJ+Zt3lc/ELnpfN0qyV3EMRox01BdWlz6UH
         n9At/OqFFFfwkvAwMFRZCcKslEiPC2KxxMM+ODMvkcK+mzD1vFTW/PFLcbjl9LNjDmYY
         7SxBQ2QFHJ1AkzKD+vmtK4Rkn/uvqneivyNA4GtazZ58CyObCasS9gRUz74yHa/AhRo2
         cb3yb73HuyYT3NkvueerBKVk8DIKQNZuQFUd/F9izicCCmcDXBeaRc0AI1MKdhh99ul+
         /9Nfl3fuwtEgrPwTGkX1A7bxbNd/KIQ+d3gFoq0d4OONnlHb7XLOa1M3MCs5KHhU+bPR
         NVnw==
X-Gm-Message-State: AFqh2kr9sQetQCDMyVqcxcWV/qdU67LWh0yRUMht+cHZqz3CF+qTlWLT
        nRaNAkgdpUijLLewBkP4/kSbJFqvGWu4XEhOVNpVkg==
X-Google-Smtp-Source: AMrXdXv0jj8OdD6WjSDbEKQJNJ1yRigoEOsjWSkDG9TTutwpBPDNw73XntP58sJQMP+TekyU6XVuIFUl5/GDLYHuanA=
X-Received: by 2002:a05:6102:3e06:b0:3b5:fd8:7948 with SMTP id
 j6-20020a0561023e0600b003b50fd87948mr4003899vsv.85.1672388163532; Fri, 30 Dec
 2022 00:16:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-21-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-21-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 16:15:52 +0800
Message-ID: <CAGXv+5E26i6F2BPZYDfRhM-OMei-Br276UNtRVr5=+7pT+HTqg@mail.gmail.com>
Subject: Re: [PATCH v2 20/23] clk: mediatek: clk-mt8186-topckgen: Migrate to mtk_clk_simple_probe()
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
> As done with MT8192, migrate MT8186 topckgen away from a custom probe
> function and use mtk_clk_simple_{probe, remove}().
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
