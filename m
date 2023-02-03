Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FFFC63797
	for <linux-clk@archiver.kernel.org>; Fri,  3 Feb 2023 07:39:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232107AbjBCHjr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Feb 2023 02:39:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229785AbjBCHjq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Feb 2023 02:39:46 -0500
Received: from mail-vk1-xa34.google.com (mail-vk1-xa34.google.com [IPv6:2607:f8b0:4864:20::a34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3791B7D6F3
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 23:39:45 -0800 (PST)
Received: by mail-vk1-xa34.google.com with SMTP id s76so2149284vkb.9
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 23:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QZxWzb3yPLqGq6Yxix+GBrYa0mk3uS9zwEb67e98TQU=;
        b=R4yRal95vWUSAG5KfiUpIrJGkBDc00tzIhKtqbo7P14e8g2G8sHhMSE82H+DYlj7Q0
         FrnlFEZg+mALfvwZqyjJ1drf5a8d6yniYZHxohmPNuqeWNFtzexnnw1MuDiiv2XqRq+6
         506uXFAmLvFaopBcq4cjLseIGAwL0yXsz0HVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QZxWzb3yPLqGq6Yxix+GBrYa0mk3uS9zwEb67e98TQU=;
        b=pQJUR2LOT+LbW5PvRGscJwI9k0d4TB1SMKwthFazehvhxIDm/rIVklmr5IoQI3BKyj
         WZkxQxwj4pxtQe/PqRfeTzPLFad6Anb+IU7ky3t4n7Pq+b5X2wTgnnNgtIhuIHfbGahc
         r3HB4rv5JsptRNiQWwooP6LF+zPxmeVyAzRvrDbfAxjtcRkMFBTQZgsFsxUsZgpf6rLG
         Xs/Fvu++pS0fOHnl1/5dfOH5pbpVA5PRQzgaw4HXXbd3IIsaCTPljKL/v2I9LhJ3qobW
         uskyZMqYPN1RmGJ59rRvmphPYUP9/snZy3MjxeUgrh3dohm5ROfMSGlChkhAeLcChflK
         yn6Q==
X-Gm-Message-State: AO0yUKWZDwyDVZ3pZNH8h74MJ/IZgsNOPaYN+nDlLyqB0Bp1j/JSZFkF
        ZcaD2Rfg89ln39ISlaTPG2Vplt7I0yqE8s077hFH1g==
X-Google-Smtp-Source: AK7set+GgxBgT+BjAC93C+XgjP/ecVL4fdQCV19du01DsL5X7oKE27t5MzZ9k5TCaAt7gX05+mhLAXIYkjyFGXvWHuE=
X-Received: by 2002:ac5:c744:0:b0:3ea:94ea:110b with SMTP id
 b4-20020ac5c744000000b003ea94ea110bmr1316090vkn.22.1675409984392; Thu, 02 Feb
 2023 23:39:44 -0800 (PST)
MIME-Version: 1.0
References: <20230119124848.26364-1-Garmin.Chang@mediatek.com> <20230119124848.26364-20-Garmin.Chang@mediatek.com>
In-Reply-To: <20230119124848.26364-20-Garmin.Chang@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 3 Feb 2023 15:39:33 +0800
Message-ID: <CAGXv+5EW8DXXp+D_M1AU7ohrrbmU8e7eMwo5LpZb9FHWi7ELAw@mail.gmail.com>
Subject: Re: [PATCH v5 19/19] clk: mediatek: Add MT8188 adsp clock support
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

On Thu, Jan 19, 2023 at 9:02 PM Garmin.Chang <Garmin.Chang@mediatek.com> wrote:
>
> Add MT8188 adsp clock controller which provides clock gate
> control for Audio DSP.
>
> Signed-off-by: Garmin.Chang <Garmin.Chang@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile                 |  2 +-
>  .../clk/mediatek/clk-mt8188-adsp_audio26m.c   | 45 +++++++++++++++++++
>  2 files changed, 46 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 8befaedfdd3d..b56ae9bee1d8 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -89,7 +89,7 @@ obj-$(CONFIG_COMMON_CLK_MT8188) += clk-mt8188-apmixedsys.o clk-mt8188-topckgen.o
>                                    clk-mt8188-ipe.o clk-mt8188-mfg.o clk-mt8188-vdec.o \
>                                    clk-mt8188-vdo0.o clk-mt8188-vdo1.o clk-mt8188-venc.o \
>                                    clk-mt8188-vpp0.o clk-mt8188-vpp1.o clk-mt8188-wpe.o \
> -                                  clk-mt8188-imp_iic_wrap.o
> +                                  clk-mt8188-imp_iic_wrap.o clk-mt8188-adsp_audio26m.o
>  obj-$(CONFIG_COMMON_CLK_MT8192) += clk-mt8192.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_AUDSYS) += clk-mt8192-aud.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_CAMSYS) += clk-mt8192-cam.o
> diff --git a/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
> new file mode 100644
> index 000000000000..f91381a1316c
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
> @@ -0,0 +1,45 @@
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
> +static const struct mtk_gate_regs adsp_audio26m_cg_regs = {
> +       .set_ofs = 0x80,
> +       .clr_ofs = 0x80,
> +       .sta_ofs = 0x80,
> +};
> +
> +#define GATE_ADSP_FLAGS(_id, _name, _parent, _shift)           \
> +       GATE_MTK_FLAGS(_id, _name, _parent, &adsp_audio26m_cg_regs, _shift,             \
> +               &mtk_clk_gate_ops_no_setclr, CLK_IGNORE_UNUSED)

Why CLK_IGNORE_UNUSED?
