Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7BE8C636CC
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 07:03:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbjBCHDL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 02:03:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231160AbjBCHDJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 02:03:09 -0500
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180B591184
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 23:02:33 -0800 (PST)
Received: by mail-vk1-xa29.google.com with SMTP id l20so2109308vkm.11
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 23:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHxnq4NIAvqcaAQqKPv9unLZ6dk9i+ul3lPvliSm8to=;
        b=i+piRv4aM1OJLjMLD6b35atiMLDBkWlgdjMTQx2ceBe7f2oj2MubVl2GOeYz8svWBL
         JCj0B5LIykOnqKn1Xzvx0lbNKW5MiDYo4R6gEjjpfX9UxpMYpTu3fny1wERq2gd70BU+
         wy/PsccjJ2lZMarPhrYApiZegzi/vuPR6d/r0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZHxnq4NIAvqcaAQqKPv9unLZ6dk9i+ul3lPvliSm8to=;
        b=IIJI2qeKXCye4Sj96WvpOT/Klmyge8aRV9wz37ak/e2w5iFvgO7alHDhBcM5z1DH4V
         ScmJWrDW/rJEo69/XtgmGfOPymvXjanygxc/gsJRQ+528WSDXp/PvbBC9FUtOmXFGEqK
         +JXr5vylTKmcBhF+doI2eiEyj4i37+YlRmTUqDyH4Z/AGXnLg1dNHAME5KmTshBN4BUh
         5JKCumPMGQCbA7vagaqwGf76y3zqwPuZHKNtJYUZCS+G6Q3Pj5IhvbWEGIrj5KFWpnNO
         HvrVPcTwAS0WE2XKW5BoeApcURoqEcXalXaYYsqTok3wE9Gk4p55/WMsqU/Na5i6pvk+
         iItA==
X-Gm-Message-State: AO0yUKVXSzAO3MECsLgg2fhcXTieavwucPWybCzMzEApZHDm6760Ftx/
        HN+XFA2w7Sb64KkCjBs0UQAgRsnhGsmVYqXZ5itoBw==
X-Google-Smtp-Source: AK7set+aTOijar/puEUL78ABZvo/AOqIKUR8h1vEUaV4Q1CRoGlXDNr1x4ZpVZTctOHPDyk/5tzwRCQVHGrQ0dN6omE=
X-Received: by 2002:a05:6122:131:b0:3e8:8f:f3a7 with SMTP id
 a17-20020a056122013100b003e8008ff3a7mr1321932vko.30.1675407752112; Thu, 02
 Feb 2023 23:02:32 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-11-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-11-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 15:02:21 +0800
Message-ID: <CAGXv+5FGCVSihGu5diCQ1Q=jPRHz7RQ2KrXk-13LL4z1wbkfjg@mail.gmail.com>
Subject: Re: [PATCH v5 10/19] clk: mediatek: Add MT8188 mfgcfg clock support
To:     "Garmin.Chang" <Garmin.Chang@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 19, 2023 at 8:50 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 mfg clock controller which provides clock gate
> control for GPU.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile         |  2 +-
>  drivers/clk/mediatek/clk-mt8188-mfg.c | 47 +++++++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 4a599122f761..a0fd87a882b5 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -86,7 +86,7 @@ obj-$(CONFIG_COMMON_CLK_MT8186) += clk-mt8186-mcu.o clk-mt8186-topckgen.o clk-mt
>  obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o \
>                                    clk-mt8188-peri_ao.o clk-mt8188-infra_ao.o \
>                                    clk-mt8188-cam.o clk-mt8188-ccu.o clk-mt8188-img.o \
> -                                  clk-mt8188-ipe.o
> +                                  clk-mt8188-ipe.o clk-mt8188-mfg.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-mfg.c b/drivers/clk/mediatek/clk-mt8188-mfg.c
> new file mode 100644
> index 000000000000..57b0afb5f4df
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-mfg.c
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +//
> +// Copyright (c) 2022 MediaTek Inc.
> +// Author: Garmin Chang <garmin.chang@mediatek.com>
> +
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +#include <dt-bindings/clock/mediatek,mt8188-clk.h>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +static const struct mtk_gate_regs mfgcfg_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_MFG(_id, _name, _parent, _shift)                          \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &mfgcfg_cg_regs, _shift,    \
> +                      &mtk_clk_gate_ops_setclr, CLK_SET_RATE_PARENT)
> +
> +static const struct mtk_gate mfgcfg_clks[] = {
> +       GATE_MFG(CLK_MFGCFG_BG3D, "mfgcfg_bg3d", "top_mfg_core_tmp", 0),

Are you sure the parent isn't "mfg_ck_fast_ref"?

ChenYu
