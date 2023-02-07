Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D609AC636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 07:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229512AbjBGHMu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 02:12:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229525AbjBGHMt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 02:12:49 -0500
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DB4AD12
        for <linux-clk@vger.kernel.org>; Mon,  6 Feb 2023 23:12:48 -0800 (PST)
Received: by mail-vs1-xe33.google.com with SMTP id t20so1026395vsa.12
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2023 23:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fOCWApX156tOfy22WEfKjuF2sPGgnBI2kTlPddDDMxI=;
        b=b/hXV4pxZIzumEMHXNjrdfKA+eRJ7XqQiW2WXrgNLlz7xlWAe3VsU6E1aTpQ3UKu4s
         PIPs/HelH1kBEw7zwHn6eU63usGbh1XJ+i4RCSyUJe7q7bZWniUgNpyksZ7YdbgaX0pA
         Ret3VSCC3ucT9HYyCsy1PU6cZyGBdhRvD7Vxs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOCWApX156tOfy22WEfKjuF2sPGgnBI2kTlPddDDMxI=;
        b=QXBKSPJxbmedgJvA+C06wYoFJNbbXZF0ZoEpuEGeQmVhZCA116EkohyHZDEWwAcc6P
         5mZhl/v/bqS8IOXtrQVF/jXnnyO9kW/Fy+j7kOfOmokzrgWSV2FMC74QCXC3PoPfZlyg
         2JWE6pvoZt23WMYsDY23hTlB7LVWQKTnq4SkFIyhDUiH724pv/o5zhVwtxmMtKe7+ngc
         WLqfgXEpZ2eaQz4bG6Z4Agyfa9yqwoeozc2fMn8nIDjGSG654vCAr+ih7j4oIsaqetpq
         1OK8+uvhgJkui6Wm+UoWhM4e+Vp+v/a9MwubBwbP92Dw/4w5S6QxIjgANXbyI9xSOKQX
         GeNA==
X-Gm-Message-State: AO0yUKX9nXWIBL4F2BdRgk8FfNMJ4GkT6VnO0GSguPeAMPXL3adXjj9a
        DAheQzdiHVoyNH3aC7pQTybGyaMi/F/a6aIIYCUH/A==
X-Google-Smtp-Source: AK7set96fhA2GvSOixgC41jK7IqHQ4VfH3GRO2zASJ2fzcnZNJW7Zc0QzdAs4TrWQLaww08y9Myd6n9uw3g662INj4U=
X-Received: by 2002:a05:6102:2445:b0:411:a162:c432 with SMTP id
 g5-20020a056102244500b00411a162c432mr269027vss.26.1675753967286; Mon, 06 Feb
 2023 23:12:47 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-12-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-12-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 15:12:36 +0800
Message-ID: <CAGXv+5EvYq9eJkfvrEt-LEN0ODt-_tQ+wiAK-BjKeSi6VCDzEA@mail.gmail.com>
Subject: Re: [PATCH v1 11/45] clk: mediatek: mt8365: Move apmixedsys clock
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

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> In preparation for migrating all other mt8365 clocks to the common
> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> While at it, use the builtin_platform_driver() macro for it.

`git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
agrees this is mostly a code move.

> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Makefile                |   2 +-
>  drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 164 +++++++++++++++++++
>  drivers/clk/mediatek/clk-mt8365.c            | 142 ----------------

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

But see below.

>  3 files changed, 165 insertions(+), 143 deletions(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8365-apmixedsys.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3c7dd19cdddf..b004a47026d4 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -112,7 +112,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
>                                    clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
>                                    clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
>                                    clk-mt8195-apusys_pll.o
> -obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o
> +obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o clk-mt8365-apmixedsys.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
>  obj-$(CONFIG_COMMON_CLK_MT8365_MFG) += clk-mt8365-mfg.o
> diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> new file mode 100644
> index 000000000000..6f0fdf92bbd2
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2022 MediaTek Inc.
> + * Copyright (c) 2023 Collabora Ltd.
> + */
> +
> +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
> +#include <linux/clk.h>

like in the MT2712 patch, this could be clk-provider.h .
Or maybe we should do a pass of header cleanup? There's a bunch left
over from the conversion from |struct clk| to |structk clk_hw|, and
then migration to mtk_clk_simple_probe.

What do you think?

ChenYu
