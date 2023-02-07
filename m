Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96601C636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:33:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230230AbjBGGdZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:33:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230232AbjBGGdZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:33:25 -0500
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F7B21946
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:33:22 -0800 (PST)
Received: by mail-ua1-x92e.google.com with SMTP id ch22so337569uab.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GhEJW88dUamcVlxz1ctqv2Q07xJfwW2/bNyU0rz8iQk=;
        b=JVvlH3kx8Is97sQFT4RvzJlTQ+zbkU+oBsvJYwzSnaP3fS0ixxmBSYWsPS20j3rhDl
         8+A047CYm0DGQ8NNgLgKYVcAglDhkECnCio+M69CZ/u6/4Fe+5N5VqBvuJachOs7H4VK
         WMq76TJmzWmDR89TxB7dhLP8cLGkKad2MXJf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GhEJW88dUamcVlxz1ctqv2Q07xJfwW2/bNyU0rz8iQk=;
        b=0xd3Rb+PfC43SQSymEEZFJ6iE7H5zv5+WFQ5Way0jXaf71JEX1wbBt0Ag2jrZEmYrY
         7bEZc6wnOGVv7sQO1iEDsClu+Jr/cKQRdgKERwtjqjbIvO8jCGN01933FlfmoT6u2MT0
         1nPBD4suT8i/cPzn6QCKjrSHfy7iOi5dpXSLseZHSyIxpV69OWiN4B4dG/oz0BUFXcOn
         EgD1gRR8OENRDRw6zBDwWZISoh7K/NiOz0JOG17sDd+Se2H55xz7CUI/XkVz+5pW5Uol
         E2VcRQxzfc9le4Vod2PZvEkR7N9DXzv6vc80Pm5C3CkmHlGpHFHFQTuMPRcRcSs2i7BA
         M0LQ==
X-Gm-Message-State: AO0yUKUxq+JsBckfa4IIEErgnkDGzR+3i9NsydkidRGt+ilOqYmnWfLx
        cOaMncjh4/4rc1eY8ORtGe+IPq3ueWJTFpk/i1Ui6Q==
X-Google-Smtp-Source: AK7set+YKznaFHPKW5d8ydDKeXnKeXaGm6lSyKFulo85U5cVsQELhT7ZwYey65wdDhWkdey4zY8XvSZcd/FntPH7fcA=
X-Received: by 2002:ab0:2bd5:0:b0:5e6:3536:22e4 with SMTP id
 s21-20020ab02bd5000000b005e6353622e4mr368876uar.55.1675751601965; Mon, 06 Feb
 2023 22:33:21 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-10-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-10-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:33:10 +0800
Message-ID: <CAGXv+5GfwY2+55UupTUNYVudg3-YDQtkkfhT=M53CJwdqG=ERg@mail.gmail.com>
Subject: Re: [PATCH v1 09/45] clk: mediatek: mt2712: Change to use
 module_platform_driver macro
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

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that all of the clocks in clk-mt2712.c are using the common
> mtk_clk_simple_{probe,remove}() callbacks we can safely migrate
> to module_platform_driver.

Instead of splitting the conversion into a module among many patches,
I'd do it in one go. With one patch we get a working module instead
of a half-baked one half way through the series.

The subject could say "Convert X driver from builtin to module". And
instead of "migrate to module_platform_driver", the body could say
"convert to module by switching to module_platform_driver, and adding
missing MODULE_* statements". I believe this constitutes one logical
change. Maybe the accompanying Kconfig change should be included as
well?

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/clk-mt2712.c | 10 ++--------
>  1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index c5fd76d1b9df..65c1cbcbd54e 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1028,7 +1028,7 @@ static const struct of_device_id of_match_clk_mt2712_simple[] = {
>         { /* sentinel */ }
>  };
>
> -static struct platform_driver clk_mt2712_simple_drv = {
> +static struct platform_driver clk_mt2712_drv = {

Why the name change? If you do change the name, could you also change
the of match table's name as well to be consistent, and also mention
the change in the commit log?

I'd just leave it alone though.


ChenYu

>         .probe = mtk_clk_simple_probe,
>         .remove = mtk_clk_simple_remove,
>         .driver = {
> @@ -1036,10 +1036,4 @@ static struct platform_driver clk_mt2712_simple_drv = {
>                 .of_match_table = of_match_clk_mt2712_simple,
>         },
>  };
> -
> -static int __init clk_mt2712_init(void)
> -{
> -       return platform_driver_register(&clk_mt2712_simple_drv);
> -}
> -
> -arch_initcall(clk_mt2712_init);
> +module_platform_driver(clk_mt2712_drv);
> --
> 2.39.1
>
