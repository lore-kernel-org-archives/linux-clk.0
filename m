Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3034CC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 11:04:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0BDA56121E
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 11:04:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237262AbhHYLEw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 07:04:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237446AbhHYLEw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 07:04:52 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57A48C0613C1
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 04:04:06 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id h1so14679398ljl.9
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 04:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=T4YAOyuTVtWmKFXP1fnFuSrQjEEGt1C4H+Qcn92olKo=;
        b=odNI7TLRb3aHZPp3BUrD0u805rbZ9edZOpLRjwM/YUM6x/IpyvEH/spAkBAm9BhwAJ
         ncrooABd6iBVN2kvCsnccQQY+fYtU7E8JIC//iicXzJa7msZ4hBDBCPyXeo+YcTTwpqd
         EP/qnL6mbygnW1FaspPDnM3jSQjsm67LCPWA8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=T4YAOyuTVtWmKFXP1fnFuSrQjEEGt1C4H+Qcn92olKo=;
        b=aRYZrGU84q7X4pBAOfFRyQaD13bKfBv89+K9UAhGcQp0i5SVRynKcza82ReEw/i/u5
         40SXjWFMz9G1tifEgvZM4c6yceJp39b8F0Hdr6jC4+f9ju/djzF/AxV1cFobIVMcmQjF
         7zW0cwY64OfoNkIpZF8Z06AR2HeoAFtQxxH/vIy9uQBounZWKjFY7Z8geVk4/Te1WE6T
         SgbuGmAsx/ZY69mOS5CsvxpJmoGqQIwHZPsMEgqxrrFrigGTfZdK84GwIRHz8M9E3ymz
         41Yo2BzfVz1dWy/TDuvdA6rT7GAHn9wMUG+mZf3KteT0kOMQkrk2wq5p0tzlXREeT4iw
         L9Eg==
X-Gm-Message-State: AOAM5330zfMsaa04AzXab0IkmzVJ8mCn6F9FuFoyCp0FoNBvH/cakNu/
        plS2EBnSXf2lS5ICkWjEH7szBNI0ScOLdjOYzfoXRA==
X-Google-Smtp-Source: ABdhPJzMR4EdC2/IIuM4/O/+JwyD6+durdKjCC9rStMw22173RfTjRaqSozTN0C7rELH7ZR1GQxlB0lP90j/4sLCPsk=
X-Received: by 2002:a2e:7d0e:: with SMTP id y14mr35628784ljc.251.1629889444669;
 Wed, 25 Aug 2021 04:04:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-20-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-20-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 25 Aug 2021 19:03:53 +0800
Message-ID: <CAGXv+5FuLTw9jmXEifkfKKYiN-vur3jBbwZWjL5m8vTkoP6VMA@mail.gmail.com>
Subject: Re: [v2 19/24] clk: mediatek: Add MT8195 vencsys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:31 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vencsys clock controller which provide clock gate
> control for video encoder.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |  2 +-
>  drivers/clk/mediatek/clk-mt8195-venc.c | 69 ++++++++++++++++++++++++++
>  2 files changed, 70 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-venc.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 3c8c8cdbd3ef..82ffcc4f2c52 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -82,6 +82,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
>                                         clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
> -                                       clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o
> +                                       clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
>  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> diff --git a/drivers/clk/mediatek/clk-mt8195-venc.c b/drivers/clk/mediatek/clk-mt8195-venc.c
> new file mode 100644
> index 000000000000..10702a4ad5ff
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8195-venc.c
> @@ -0,0 +1,69 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +//
> +// Copyright (c) 2021 MediaTek Inc.
> +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> +
> +#include "clk-gate.h"
> +#include "clk-mtk.h"
> +
> +#include <dt-bindings/clock/mt8195-clk.h>
> +#include <linux/clk-provider.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mtk_gate_regs venc_cg_regs = {
> +       .set_ofs = 0x4,
> +       .clr_ofs = 0x8,
> +       .sta_ofs = 0x0,
> +};
> +
> +#define GATE_VENC(_id, _name, _parent, _shift)                 \
> +       GATE_MTK(_id, _name, _parent, &venc_cg_regs, _shift, &mtk_clk_gate_ops_setclr_inv)
> +
> +static const struct mtk_gate venc_clks[] = {
> +       GATE_VENC(CLK_VENC_LARB, "venc_larb", "top_venc", 0),
> +       GATE_VENC(CLK_VENC_VENC, "venc_venc", "top_venc", 4),
> +       GATE_VENC(CLK_VENC_JPGENC, "venc_jpgenc", "top_venc", 8),
> +       GATE_VENC(CLK_VENC_JPGDEC, "venc_jpgdec", "top_venc", 12),
> +       GATE_VENC(CLK_VENC_JPGDEC_C1, "venc_jpgdec_c1", "top_venc", 16),
> +       GATE_VENC(CLK_VENC_GALS, "venc_gals", "top_venc", 28),
> +};
> +
> +static const struct mtk_gate venc_core1_clks[] = {
> +       GATE_VENC(CLK_VENC_CORE1_LARB, "venc_core1_larb", "top_venc", 0),
> +       GATE_VENC(CLK_VENC_CORE1_VENC, "venc_core1_venc", "top_venc", 4),
> +       GATE_VENC(CLK_VENC_CORE1_JPGENC, "venc_core1_jpgenc", "top_venc", 8),
> +       GATE_VENC(CLK_VENC_CORE1_JPGDEC, "venc_core1_jpgdec", "top_venc", 12),
> +       GATE_VENC(CLK_VENC_CORE1_JPGDEC_C1, "venc_core1_jpgdec_c1", "top_venc", 16),
> +       GATE_VENC(CLK_VENC_CORE1_GALS, "venc_core1_gals", "top_venc", 28),

The two hardware blocks look the same. Are there any actual differences?
I am somewhat skeptical about using different compatible strings just
to provide different clock names. This is normally handled with
"clock-output-names" properties in the device tree.

ChenYu

> +};
> +
> +static const struct mtk_clk_desc venc_desc = {
> +       .clks = venc_clks,
> +       .num_clks = ARRAY_SIZE(venc_clks),
> +};
> +
> +static const struct mtk_clk_desc venc_core1_desc = {
> +       .clks = venc_core1_clks,
> +       .num_clks = ARRAY_SIZE(venc_core1_clks),
> +};
> +
> +static const struct of_device_id of_match_clk_mt8195_venc[] = {
> +       {
> +               .compatible = "mediatek,mt8195-vencsys",
> +               .data = &venc_desc,
> +       }, {
> +               .compatible = "mediatek,mt8195-vencsys_core1",
> +               .data = &venc_core1_desc,
> +       }, {
> +               /* sentinel */
> +       }
> +};
> +
> +static struct platform_driver clk_mt8195_venc_drv = {
> +       .probe = mtk_clk_simple_probe,
> +       .driver = {
> +               .name = "clk-mt8195-venc",
> +               .of_match_table = of_match_clk_mt8195_venc,
> +       },
> +};
> +builtin_platform_driver(clk_mt8195_venc_drv);
> --
> 2.18.0
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
