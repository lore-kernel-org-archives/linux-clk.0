Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F62CC05027
	for <linux-clk@archiver.kernel.org>; Fri, 17 Feb 2023 07:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjBQHi6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Feb 2023 02:38:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229658AbjBQHi5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Feb 2023 02:38:57 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35B6859C9
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:38:56 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id k4so4708503vsc.4
        for <linux-clk@vger.kernel.org>; Thu, 16 Feb 2023 23:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=c30mjTplJEZCVESp0l+woRR+5rw1LWREDQPh7nVR91M=;
        b=jgBL5pLOWF0bt/V7p0vyAKPNedZTYjko/ej1YVM8IHMozlVAr/TRUr5SV8h+CDpvIP
         z1mRNrUl7+/DUrmCW5Hnv1bHsuioOdZ+F9451vgyWTCDs/gdjpIm21AVOHs/fMpMu4eB
         QzpPZtnXdVNV4kwv6LGjiV+kExHEcdG+cVU+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c30mjTplJEZCVESp0l+woRR+5rw1LWREDQPh7nVR91M=;
        b=KAenjrMGIsFpjYM6s0YmW/X5qViqQy3OQJq/DtsXn54XOuVd6kDNLtPCk37hXaUm/Z
         cT/R9k+TrBPfi2dL5kiTgL32kixmJ44dLRnKiJw62c4e5K3t7XGMsop09TA4T3vOdNN/
         scdSKi9ZnHxIu7vyQ+Iao9aEwsXwG9z2V5XWFsCAtFF7Gr1NU2D2gRLUeMIgg+89nDCQ
         Wnja6RvJ8J1ny8z5y9eqiGWfaHOcETo/Y0rEOjlJ8yzoZsVP/NVOmVqW889nLhr+rxYk
         9NszliqZFfkuDWuuRGZwrkKO5KIQvxcQPjDTKI0c3L2/+8zCG+UCnQSDBS5WmCcWthRj
         OhSQ==
X-Gm-Message-State: AO0yUKVqau59LiOC4nYJ0RR9FVGG7zczBtG7NT2dDUNxkpOiL8a6iLYe
        r5tMHu5TebaI/V2I6S4bUV1tRfqDL5uBdfx0OunsMg==
X-Google-Smtp-Source: AK7set+a/WKTyAayUh0Dmoeuwng+9YTTbcpU0sI9/QmluIB8LgvKUXYa8Ks+i/UTyvD+529Nrl36N5JZ+oj2i66+wKk=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1604164vso.60.1676619535343; Thu, 16 Feb
 2023 23:38:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-45-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-45-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 17 Feb 2023 15:38:44 +0800
Message-ID: <CAGXv+5EPU+SGhWmRCiZUNGR=JNBX71dybEq8FEZ-+CCrkHBaUA@mail.gmail.com>
Subject: Re: [PATCH v2 44/47] clk: mediatek: Split configuration options for
 MT8186 clock drivers
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
> When building clock drivers for MT8186, some may want to build in only
> some of them to, for example, get CPUFreq up faster, and some may want
> to leave out some clock drivers entirely as a machine may not need the
> Warp Engine or the camera ISP (hence, their clock drivers).
>
> Split the various clock drivers in their own configuration options,
> keeping MT8186 configuration options consistent with other MediaTek
> SoCs.
>
> While at it, also allow building the remaining clock drivers as modules
> by switching COMMON_CLK_MT8186 to tristate.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig  | 68 ++++++++++++++++++++++++++++++++++-
>  drivers/clk/mediatek/Makefile | 18 +++++++---
>  2 files changed, 80 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index 1497171a65ef..706a7cf86ce0 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -596,7 +596,7 @@ config COMMON_CLK_MT8183_VENCSYS
>           This driver supports MediaTek MT8183 vencsys clocks.
>
>  config COMMON_CLK_MT8186
> -       bool "Clock driver for MediaTek MT8186"
> +       tristate "Clock driver for MediaTek MT8186"
>         depends on ARM64 || COMPILE_TEST
>         select COMMON_CLK_MEDIATEK
>         select COMMON_CLK_MEDIATEK_FHCTL
> @@ -604,6 +604,72 @@ config COMMON_CLK_MT8186
>         help
>           This driver supports MediaTek MT8186 clocks.
>
> +config COMMON_CLK_MT8186_CAMSYS
> +       tristate "Clock driver for MediaTek MT8186 camsys"
> +       depends on COMMON_CLK_MT8186
> +       help
> +         This driver supports MediaTek MT8186 camsys and camsys_raw clocks.
> +
> +config COMMON_CLK_MT8186_IMGSYS
> +       tristate "Clock driver for MediaTek MT8186 imgsys"
> +       depends on COMMON_CLK_MT8186
> +       help
> +         This driver supports MediaTek MT8186 imgsys and imgsys2 clocks.
> +
> +config COMMON_CLK_MT8186_IMP_IIC_WRAP
> +       tristate "Clock driver for MediaTek MT8186 imp_iic_wrap"
> +       depends on COMMON_CLK_MT8186
> +       help
> +         This driver supports MediaTek MT8186 imp_iic_wrap clocks.
> +
> +config COMMON_CLK_MT8186_IPESYS
> +       tristate "Clock driver for MediaTek MT8186 ipesys"
> +       depends on COMMON_CLK_MT8186_IMGSYS

Same comments as MT8195 about the ordering and mentioning dependency
reasoning in the commit log.

ChenYu
