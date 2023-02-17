Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 552F6C05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 04:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229505AbjBQEYy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Feb 2023 23:24:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbjBQEYy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Feb 2023 23:24:54 -0500
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D8C49889
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:24:53 -0800 (PST)
Received: by mail-vs1-xe2f.google.com with SMTP id c22so1482183vsk.12
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 20:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cQTI4GIY7xWZk9axi5Tzvy8kZ0pqgNhEH02uqsyNGWY=;
        b=Oa+puq2gNoC0CrMJaOehGJxh8+6CiCwgDdIgBCfKbo7A1stwFpVgLYUjxzgVbDaLmX
         38LaXqdmRU4oXC2dtiZ6AhinNyAyytLuwKuz++0xgShjcw63lV3iR+arFRl6YTuFJDPv
         u8/ZLFw4Z+GM7AOohKrhqUIH1TnKI7wrPNYGQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cQTI4GIY7xWZk9axi5Tzvy8kZ0pqgNhEH02uqsyNGWY=;
        b=KxX+kIB0FLlvDfCXDUR3sAG8loYAjs1bHMvjMcyB9NlscEuvm7J0zJ6V27N1fzNi9M
         PVNxpsBsJc6gw9RtzmYsGoBnFQRncBOr+z7SOVYJ6lEqtNV696ctaTYQaZLmwim229SC
         4z7tk83splarsxXF+4WGefSNHHGih/sbhLdY0tb2hABTZIH7pzaH+KGdmWKU1PHwWXAc
         /h2Jr5aobTFtRIBJKVsbMT3T9q7/ztQMLPDB+RfEw0tX3EfgjP63T621WsDhl93onuWu
         ZoKSBtuQWuJQgBjmTEkt2AJL031B+lsnOf4Qy4zqnl78iBBLqumZvOAfA7J9ejtExnv7
         TOvg==
X-Gm-Message-State: AO0yUKXRM9fWttv8CKGfcWcz+uUhbi+wc+oNNH9XV2upIqMNK2y/gQY4
        aBBkfpxin6Ze0mWzUE+Cv81Q4dhJA2qxWNknAbzqXA==
X-Google-Smtp-Source: AK7set9KlM3Eli5ccJEfH1OYtj4vfRx7YRy4pEPzZGC/oWqWNj5Lm4wd5sN6Pa2zdobSA2U7pU1eefIjJ+LIz5vYe8Q=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1529570vso.60.1676607892320; Thu, 16 Feb
 2023 20:24:52 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 12:24:41 +0800
Message-ID: <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
Subject: Re: [PATCH v2 36/47] clk: mediatek: mt2712: Change Kconfig options to
 allow module build
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> All of the mt2712 drivers have been converted to platform drivers!
> Change the Kconfig options for all MT2712 clocks to tristate to allow
> building all clock drivers as modules.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index b9c0a9e21cf1..45b7aea7648d 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
>           This driver supports MediaTek MT2701 g3dsys clocks.
>
>  config COMMON_CLK_MT2712
> -       bool "Clock driver for MediaTek MT2712"
> +       tristate "Clock driver for MediaTek MT2712"

Hmm... How does that work out if mt2712-apmixedsys is a
builtin_platform_driver?

ChenYu
