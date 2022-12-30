Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8592FC10F1B
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 05:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229507AbiL3F2h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 00:28:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229839AbiL3F1e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 00:27:34 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D6CA186E6
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 21:24:04 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id 128so20352720vsz.12
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 21:24:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=d2kO8pgMtBzZNlbzXFL36B4N197Fi4UW0BCO8fu4xqw=;
        b=Jl6Crh7Mm8B+2BMASpdiBuOTVnQhVFGCt9wvg6YWVF8Sn+/cS2kn+Qjmt1syT0QYVO
         vphIcYXev2LxGuz2zpb9Ea9eYlVyi5e94+rLvxxA2ltlA98SH9EnW2pGRYFziKBsiSyi
         18xo3AUt8+af1atgoRPWyHq/iyretmjX6m+zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d2kO8pgMtBzZNlbzXFL36B4N197Fi4UW0BCO8fu4xqw=;
        b=7pZqWYqG7GrD/hiX6Wy/OZlG7i4zCfUqLwMgspXVAxOS7n5DR2qhlMEaAYsWJbQJVv
         a9azbeux3MKydfpUAmw2Ah9LcNIPJWUCgvScZjCFXFTicdpIb+eVQ+xfAGNZZN50B/Yq
         bCS+gVqCpl+1GQUSfp3rnhSbD+n1ImZlCyWDJgzmd2FOals81rleLeMQZFNJAnP5QPIo
         WYbkNMtTLO0+f+zo1Osg7t+OzfJ0MT2l1EBIJGIauiGvO1cYuOIa8tTWbPwA4MU6tZKa
         WF0VDyCwb+MA9rLUruEQBR8h/Qp0PhL6qnqzaVJjZOgxHUBq0eF283XxRH9zJ21VdG/1
         J5dQ==
X-Gm-Message-State: AFqh2kpXTel3hPrB7FO55VLw5wTz5jDWcElUcF4zYebTJGeBoj4R6Ow9
        fa13P8XEUSvkVYLE7L7lfXd8mYcnPfc3cNGHj4O1kA==
X-Google-Smtp-Source: AMrXdXsNEPEEDbmMNdTXQ66dzte31fV01YoUyu4VK+PpkfRFqDEmbhNsYqdkXtoVcZvmwH1OYa9y0JeRg/5FrrgR4TQ=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2641293vsv.9.1672377843567; Thu, 29 Dec
 2022 21:24:03 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221223094259.87373-23-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221223094259.87373-23-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 13:23:52 +0800
Message-ID: <CAGXv+5GcBCrHRUJHZG1XAXbh+BJxGnuYSbF-QgPY6Sh5nPEt1A@mail.gmail.com>
Subject: Re: [PATCH v2 22/23] clk: mediatek: clk-mt7986-topckgen: Properly
 keep some clocks enabled
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
> Instead of calling clk_prepare_enable() on a bunch of clocks at probe
> time, set the CLK_IS_CRITICAL flag to the same as these are required
> to be always on, and this is the right way of achieving that.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
