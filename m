Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67079C636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 06:50:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjBGGus (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 01:50:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229601AbjBGGur (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 01:50:47 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1AA59298DA
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 22:50:46 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id d66so15207059vsd.9
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 22:50:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ovD4NTkRVtFpsf9ep+ByBKc78lLKrAGdTdRbhoRExPc=;
        b=aSz1OItET9lgxK/S1Ryjin49/fpFyBf/eXdaBxZu3kafmKocBA7g/+H7Dc6o8PE9ml
         TpgXs1r44ebC1xHMW2isjHKBewi5M6NwitN4otd+IlASmD+fEKgdmtNl34/v69XDAGPE
         Y2L13X715ApbH8k5GDcCZLUdwbW0SgrXbEXKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ovD4NTkRVtFpsf9ep+ByBKc78lLKrAGdTdRbhoRExPc=;
        b=HQGVAk5x61RhiaaLoLNWmAh5nuremXM6ZiJKi4b7s/txxgYuuyq52w5ZdabTp/yvBd
         /DG96OPpl12B8am8fmxo8LBTPQVUqa4dcfQa320IhjCqDDj05H1hPdob0twxPYu5tyKh
         rYVUEpowq39N9CMSPfSbHYUpCu4/Z5Ie4oVwYpAG765tMVApJbUy8ysGtFwEUgFRmec/
         zdqkFSCa+KO/ZQc3dREl/Y8NYtPPZ+nfERLH5lu4CJyOiN1ohPn3Eus4yRJYNscAIolq
         THraTE1HkC8bsdwPr0gwcI3Ld67DFxakYGYMoYwcQK48hHYRPkorU0yqKJpfB28NvrMK
         uSDg==
X-Gm-Message-State: AO0yUKVkM85cA8X4Jd1xePkW3UCCNIrA5HoiMkzOge1zPQclk/pjqgVQ
        fJP5yqqyPl3/YmWKbtgVvZEsyKJq4M9T7qleOyNJCQ==
X-Google-Smtp-Source: AK7set99t3gC07Hg4yA0UO3w3cEuRbQykjCNUiz+MsYe6moWdFHqfF8gGT+ZkK7EQ8lATbxIIWMvgDhlF5i8p+oiQ3k=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr463700vsa.65.1675752645237; Mon, 06 Feb
 2023 22:50:45 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 14:50:34 +0800
Message-ID: <CAGXv+5EFKxx8-8aD1VeMpPmNsztPJMsirpDc4Nd17ZMi7ED_9Q@mail.gmail.com>
Subject: Re: [PATCH v1 08/45] clk: mediatek: mt2712: Move apmixedsys clock
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
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 11:29 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The only clock driver that does not support mtk_clk_simple_probe() is
> apmixedsys: in preparation for enabling module build of non-critical
> mt2712 clocks, move this to its own file.
> While at it, also fix some indentation issues in the PLLs table.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile                |   2 +-
>  drivers/clk/mediatek/clk-mt2712-apmixedsys.c | 152 +++++++++++++++++
>  drivers/clk/mediatek/clk-mt2712.c            | 164 -------------------
>  3 files changed, 153 insertions(+), 165 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt2712-apmixedsys.c

`git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
agrees this is mostly code movement.

> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index e5d018270ed0..3c7dd19cdddf 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -38,7 +38,7 @@ obj-$(CONFIG_COMMON_CLK_MT2701_HIFSYS) += clk-mt2701-hif.o
>  obj-$(CONFIG_COMMON_CLK_MT2701_IMGSYS) += clk-mt2701-img.o
>  obj-$(CONFIG_COMMON_CLK_MT2701_MMSYS) += clk-mt2701-mm.o
>  obj-$(CONFIG_COMMON_CLK_MT2701_VDECSYS) += clk-mt2701-vdec.o
> -obj-$(CONFIG_COMMON_CLK_MT2712) += clk-mt2712.o
> +obj-$(CONFIG_COMMON_CLK_MT2712) += clk-mt2712.o clk-mt2712-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_BDPSYS) += clk-mt2712-bdp.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_IMGSYS) += clk-mt2712-img.o
>  obj-$(CONFIG_COMMON_CLK_MT2712_JPGDECSYS) += clk-mt2712-jpgdec.o
> diff --git a/drivers/clk/mediatek/clk-mt2712-apmixedsys.c b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> new file mode 100644
> index 000000000000..e841be3a02c9
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt2712-apmixedsys.c
> @@ -0,0 +1,152 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017 MediaTek Inc.
> + * Copyright (c) 2023 Collabora Ltd.
> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

I think the original author still applies, given you are mostly just
moving the code?

[...]

> +static const struct of_device_id of_match_clk_mt2712_apmixed[] = {
> +       { .compatible = "mediatek,mt2712-apmixedsys" },
> +       { /* sentinel */ }
> +};
> +
> +static struct platform_driver clk_mt2712_apmixed_drv = {
> +       .probe = clk_mt2712_apmixed_probe,
> +       .driver = {
> +               .name = "clk-mt2712",

I'd change the name as well, but I'm not sure if that constitutes a
uAPI change.

> +               .of_match_table = of_match_clk_mt2712_apmixed,
> +       },
> +};
> +builtin_platform_driver(clk_mt2712_apmixed_drv)


ChenYu
