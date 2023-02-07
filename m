Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE757C636CD
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 08:08:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231132AbjBGIIJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 03:08:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjBGIII (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 03:08:08 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A5621A07
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 00:08:06 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id b18so2612335uan.11
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 00:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bTuYq0wh0Ha5e/JZi49gtHl89wWgCPyAt0VAMeZNSPg=;
        b=Uf0oqSFBef2a1mrodogZRfMbpWJvWhQbsNF0kPiXGDypT3gwD/NJmNxEgccU9mTWz8
         ramu3CsFoylAZoLODo9U9uZPp+hwst32zLAVjX9NBqguoCVhvci7mqNn6hEN3+9bSdOa
         2F3tmPUWUyI84TH12zzVQavTEli3Ric0YeEo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bTuYq0wh0Ha5e/JZi49gtHl89wWgCPyAt0VAMeZNSPg=;
        b=H6jgzT0wA9EN5iWFEzlYO9opzogp8Pvo0GeeXprYjBzF44qzjubc8o3uIu/eNBW+dO
         CHbRVYNF2KGkIf0xdJ+4/wDTYcqBNZ1/33BxnAxrgAwGGhGsCifsaZIpJABxilUKW5l9
         e3pBFMs8W8YJFThGqJwAh+jpFiA8OKlOlq4gytirifCgq+jfFhM80slKvxVZ6TV8f3Br
         69RTc2/zaLEdiU2Kh2PX6ecfJIXT2t9ISmbWM4GOIohKZ3smSudiJ8aniuntCG/jdodr
         nX1eqFtPh4gNF+PJ5PgcjrV7hBn5yUn3VUAVzcvAvOnp2DVEbGsSdfbuREGzq9kMhMl/
         EVGg==
X-Gm-Message-State: AO0yUKWxXy8IHmAiw638YSwiH+pZAu9x4JWF0bRu+B1iXwVcTFcJPAfD
        IhE8MmX3roIaq4rlV3mmsQyYpZOWUDmBmNuM2tKvJg==
X-Google-Smtp-Source: AK7set/7W+6ki8pvexuyDYOumAa8CWiX97wy3VacbLOj5N7vZr1I9k2KRGuurkDuZjWbxhNPTH/KK6+YC18we+S4HoY=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr406815uar.55.1675757285570; Tue, 07 Feb
 2023 00:08:05 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-17-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-17-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 16:07:54 +0800
Message-ID: <CAGXv+5Gb5S0k1c5EqPKoiBBHFyf7QBqyeWZkdAjQDCcTLYU_bw@mail.gmail.com>
Subject: Re: [PATCH v1 16/45] clk: mediatek: mt8167: Convert to mtk_clk_simple_{probe,remove}()
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
> Convert topckgen and infracfg clock drivers to use the common
> mtk_clk_simple_probe() mechanism and change this from the old
> "static" CLK_OF_DECLARE to be a platform driver, allowing it
> to eventually be built as a module.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Code looks OK, but vdecsys converted to builtin_platform_driver() while
the others to module_platform_driver(). This deserves an explanation.

ChenYu
