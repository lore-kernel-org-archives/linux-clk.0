Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 822F8C636CC
	for <linux-clk@archiver.kernel.org>; Thu, 16 Feb 2023 07:30:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229718AbjBPHaP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 02:30:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229678AbjBPHaP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 02:30:15 -0500
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com [IPv6:2607:f8b0:4864:20::e2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 845CF392AC
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:30:13 -0800 (PST)
Received: by mail-vs1-xe2c.google.com with SMTP id p14so1092974vsn.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Feb 2023 23:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zgjdmMw404e96eCGT0CwRLnwbGzyDOlmcdjqegZU+w4=;
        b=U29za6dP4nZim4LX73LJtepxSFecuP04iFHVMGXIIuisBRRZ7kL0/VWKWH1sCfZ9HT
         HK5v10fiBN7n7KMtRCCc8Cj48nNuRpvwJY0qGcaH1Yuwlc+2qRCXLLeC0x1ru68PZr7d
         /PiCpCIHgxgl/sd0GSozR6wEbSm0s1TjHb7ko=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zgjdmMw404e96eCGT0CwRLnwbGzyDOlmcdjqegZU+w4=;
        b=qiFT1bXs+GBO1qwLFOHyC35oQ6Ee8dHbvg1BhV4BJf8GUi49LyoOUU4a2DdSWvXxLy
         kF6H20719UHt4HzjE+udqKFz6ENYG7SNo2H2xPjBmODvRZZM6J4yVS1rD4C5lZJwrCTV
         1mAqjwJeJShDfJ2+OK3NG6oMInBusv496eun8mrV2DES6Cw6oJi9gt4X8S+iI3Y+Pp5E
         NeYYYpD7yBxJ4RPRFoprS5ugyAQ1N0f+cg5VoDxkqfnskVrLfopQWeFmdMMhjzNRlnk7
         WRqX7hrSlBXVpfxFqkEHZGsIH/BRUO3pvSLRxjwaZqRkHKKAFYygqoIMaipT0vxHGBTS
         TAow==
X-Gm-Message-State: AO0yUKWE1ZzmndD1Z5zDsdW9lJWg3vWCCj/zdoR/jXKMw0ovaRc71VzE
        iuyxBJh5bgxop/6VO+81acY1Z8TBxV2iqIT9bGpsiw==
X-Google-Smtp-Source: AK7set+jJ/AVTqSNvsg91s9wgAmlKRg3temVxbwWlpvNRXd5CctR0P9VX7JvIhJNWWy7kb2HaRpKDPvC64m+RlpI6bs=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr931199vso.60.1676532612556; Wed, 15 Feb
 2023 23:30:12 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-9-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 16 Feb 2023 15:30:01 +0800
Message-ID: <CAGXv+5F8OQX1WTDVLtLL3s_5ztVDO1hmzNN4uySsut74jbyoww@mail.gmail.com>
Subject: Re: [PATCH v2 08/47] clk: mediatek: mt2712: Move apmixedsys clock
 driver to its own file
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
        linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 14, 2023 at 9:41 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The only clock driver that does not support mtk_clk_simple_probe() is
> apmixedsys: in preparation for enabling module build of non-critical
> mt2712 clocks, move this to its own file.
> While at it, also fix some indentation issues in the PLLs table.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
