Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DADEC636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 09:41:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231672AbjBGJlY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 04:41:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231646AbjBGJlX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 04:41:23 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3E65FC1
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 01:41:22 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id t20so1357300vsa.12
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 01:41:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=z47jquheaISlmvaf1FVEcgmJUQJ8XYLvl0oKGBE77is=;
        b=aYa9zIdLtif0FwTqlAZxpxZYrEurh8AKhOhMK3XToKB/QecPRTMdA1Fflvep/53b3L
         yvOUUxfWyt0mZhjXkWfy3hFC+RT/zoBQT/eEZXazsNpTqtgMvvgnkSS3490OHqoyahU+
         Y/grwzdCpJbh9rW94SKE1TcKDpHzazlb3HUHw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z47jquheaISlmvaf1FVEcgmJUQJ8XYLvl0oKGBE77is=;
        b=rn6RDPNp+qtnfK+64Vbg4dVG3MWep38p0JmpM/I31ds2ds+XKGz9sZt/ER5IyxtOHi
         uwp91p0Tf2liUmf5/b2q531hhq3B9rabYJjgHI5jLPN6U9qCTjEsGKT/LLUVSCP4Rs92
         +sMuDIJFpUk4a1n4J31Q3AISSEhiGgenU75GhRgS37bFzqLKSmBDVbn4dg0uMX4ppNKE
         SAlH8KJ+P42q6YpqQyM+UPdw5jLYln1fSpZj5x4YYgMBMtyMJRiLpxRa4W4ydwP2c9X3
         WXJZuwLwtP9992w9DbpUB+oQ+hXrbpk6lSkAf6I+mKh0xYDofVK12c7T7wvpjEUYL4ui
         pq7A==
X-Gm-Message-State: AO0yUKVQhhxOlCy5vYWwm0YduZg1r6e/ly9Qsn7de8djG1kX3xUFozj0
        IZEVje3hBMOA+XRT/rWQUCgvQdomUP12uEKVrlvAdw==
X-Google-Smtp-Source: AK7set/0Pocl3IQY+0CFHfoLLcC5bZPmOMEhu0z0xP0ngcuSbBnObUD0C6IFTIgXY/RCiQll0BfBa+K/EcxnU37xCoU=
X-Received: by 2002:a67:d206:0:b0:3ed:2cd6:deed with SMTP id
 y6-20020a67d206000000b003ed2cd6deedmr644186vsi.65.1675762881149; Tue, 07 Feb
 2023 01:41:21 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-19-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-19-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 17:41:10 +0800
Message-ID: <CAGXv+5GYFv_Eqzbv9w4T6XWjuC-wnSp6Djj74dymChfXj6UXCw@mail.gmail.com>
Subject: Re: [PATCH v1 18/45] clk: mediatek: mt8183: Compress clocks arrays
 entries where possible
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Increase human readability and decrease number of lines by compressing
> the clock array entries where possible, to a maximum of ~90 columns.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c | 432 ++++++++++--------------------
>  1 file changed, 144 insertions(+), 288 deletions(-)

wdiff agrees. I'd go up to 100 columns though. Should be able to squeeze
out a couple more lines.
