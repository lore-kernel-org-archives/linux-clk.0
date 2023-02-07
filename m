Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFD50C636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 07:07:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjBGHHq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 02:07:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229656AbjBGHHq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 02:07:46 -0500
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0319B423C
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 23:07:45 -0800 (PST)
Received: by mail-ua1-x930.google.com with SMTP id q19so2596265uac.10
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 23:07:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ryLOEKWbee+ndjps07t4kDI2Eg2FatHh2fvzWokSXBU=;
        b=eoZ6mKxOp2w6xUsUEooFANxsnzN/A6kMbr5e8jO18lPmqMXcrsWo3B88hanIbtdLAE
         0xFl1kDIp6B2Y6mHtnh+RrLHHU2iHC1HmSAeOtyo6DAd7O4MqxbGhU5dygKI8JAMdVEl
         yLi/knhfNvEXH9lE9ivUjFclZySG+12+smFQg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ryLOEKWbee+ndjps07t4kDI2Eg2FatHh2fvzWokSXBU=;
        b=qkqlnisPOyNLDcGIECvoZhncreyux5oM5HCKkt7FMwHuLGq8zb1B2pUASsCkErSJN1
         xsaHW4qh/KUGyYq2anxnWKaIBqtoECf3LZjpi0bNYGsUSMjwivfuPkvnOQlB+WYrAFl1
         KXAyIbwHogwMGzh2CntRk5OElP31qNIW/jqL+ovCvDfVbeQuCzHZkEUms1NmH9hHze8A
         xavSPeinyM5L/3l9/L5zpRzPDcrQT9cdn18sOBvkPj2GwJFnwwmHmoW4Fok6nPZOD2bL
         Y4pzYmxyyRoVpcvI0BpL8MOHg0x+0KtAxyyYucBdm1FKrULmVVFKD9GZr9N+gmIxNw7K
         wZJg==
X-Gm-Message-State: AO0yUKVnuKT4vnp/JmYJtG4cc67SW0x454TbTHW02/orEHzpMAyjHG1O
        xuHXgI753nIrrjXY3pcSELfeOZ6DGtCjQDjfVX9u6Q==
X-Google-Smtp-Source: AK7set/bGnKz5U9kIPIfo8WqyaYvhc91nHxy9RmnWyFXodO5/eIlBgd4lmr1uUB0s2fHTNklpOlu2qX7HHS/cqrlwlc=
X-Received: by 2002:ab0:3b90:0:b0:683:c74a:af60 with SMTP id
 p16-20020ab03b90000000b00683c74aaf60mr362260uaw.74.1675753664132; Mon, 06 Feb
 2023 23:07:44 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-9-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 15:07:33 +0800
Message-ID: <CAGXv+5GAHngx89bts_SMxh3kD=4kNP9LYLc-J3pixKojVs=GMg@mail.gmail.com>
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
>
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
> + */
> +#include <linux/clk.h>

Missed one. I think you would want <linux/clk-provider.h> instead?
And you could drop the header from drivers/clk/mediatek/clk-mt2712.c

ChenYu
