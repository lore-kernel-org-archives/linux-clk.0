Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0689AC636CC
	for <linux-clk@archiver.kernel.org>; Tue,  7 Feb 2023 09:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjBGJcW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Feb 2023 04:32:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231192AbjBGJcV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2023 04:32:21 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9732C10407
        for <linux-clk@vger.kernel.org>; Tue,  7 Feb 2023 01:32:20 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id o1so5435974ioo.10
        for <linux-clk@vger.kernel.org>; Tue, 07 Feb 2023 01:32:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cRXSfd6e9716QbppzdgQ8z2xt//jsIISZELh4l/6gtY=;
        b=lIrS0gys+CPEeNt7gbULOHl5XLVA7zCvVI8f8ECN/dloKVAvCwUpD2rarVvcO1aD4f
         faW+Y6iNT7EWppoj0jjbibXOj/UqQgTBWfIYR1uCzOS8kDjRoe9pItP+5SxGfZsYe/+L
         zwfdkdkY7cZY26FZdFrVLWOQbPiAPNTYrARag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cRXSfd6e9716QbppzdgQ8z2xt//jsIISZELh4l/6gtY=;
        b=BoFbrLWRVSiSDeshkGMF1eD4+ivB8YAor014aPKy/effJAESNNg4cIOeF8reU+YnU1
         BSlzth3R5ElCogQQSuFK7Ufv3OXMGEfIgQS97IMmGuKKUnk1+WCRikVuJOmtYnBp0/LD
         SwRJHMQ37C4Hf+Nc2Rfz8vV4MBQtXt4sIYwMA9nlK49/b2nkqCJt++oMrq2oWQnf+DEL
         oxOpmgEeJy+90H0hhQCxvtrqVx0xi7FRCtHxf6MN4KlyX1kY7JRh185IjSf9uBc0PxmJ
         EMjUg/FYuhj2sJzbkoH7oe2TwcygcNgVIwbW6EqebWvEVWNmpVTmlW4S/EitQ5wV7leI
         fXoA==
X-Gm-Message-State: AO0yUKVX/CYV1deFdhvEqzdVgyN52Ujz3VFZo8SDZbS7VMOf3K96s4o0
        6UiZu7hzo6Sw21I+47hx97RKL31s4xEr81eodxLhAw==
X-Google-Smtp-Source: AK7set9Yo867+ovcrV9dNzgN5dLXUt67stBygvDeLPD+B7i0BJvL5wMfCmAdIR47VbCIvhkfwWyVVrGHJIPgVUdApbU=
X-Received: by 2002:a02:cacf:0:b0:3a9:6f3a:4b55 with SMTP id
 f15-20020a02cacf000000b003a96f3a4b55mr2255989jap.6.1675762339979; Tue, 07 Feb
 2023 01:32:19 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-12-angelogioacchino.delregno@collabora.com>
 <CAGXv+5EvYq9eJkfvrEt-LEN0ODt-_tQ+wiAK-BjKeSi6VCDzEA@mail.gmail.com> <0cf002b1-73ca-29c4-6e6d-5b0a54d356de@collabora.com>
In-Reply-To: <0cf002b1-73ca-29c4-6e6d-5b0a54d356de@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Tue, 7 Feb 2023 17:32:08 +0800
Message-ID: <CAGXv+5EtwpkUz0euDpaQC45JBH+vSwJs5EKisE+y5px-3c8K7A@mail.gmail.com>
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

On Tue, Feb 7, 2023 at 5:14 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 07/02/23 08:12, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> In preparation for migrating all other mt8365 clocks to the common
> >> mtk_clk_simple_probe(), move apmixedsys clocks to a different file.
> >> While at it, use the builtin_platform_driver() macro for it.
> >
> > `git diff --color-moved=dimmed-zebra --color-moved-ws=ignore-all-space`
> > agrees this is mostly a code move.
> >
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/clk/mediatek/Makefile                |   2 +-
> >>   drivers/clk/mediatek/clk-mt8365-apmixedsys.c | 164 +++++++++++++++++++
> >>   drivers/clk/mediatek/clk-mt8365.c            | 142 ----------------
> >
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> >
> > But see below.
> >
> >>   3 files changed, 165 insertions(+), 143 deletions(-)
> >>   create mode 100644 drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> >>
> >> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> >> index 3c7dd19cdddf..b004a47026d4 100644
> >> --- a/drivers/clk/mediatek/Makefile
> >> +++ b/drivers/clk/mediatek/Makefile
> >> @@ -112,7 +112,7 @@ obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
> >>                                     clk-mt8195-venc.o clk-mt8195-vpp0.o clk-mt8195-vpp1.o \
> >>                                     clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o \
> >>                                     clk-mt8195-apusys_pll.o
> >> -obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o
> >> +obj-$(CONFIG_COMMON_CLK_MT8365) += clk-mt8365.o clk-mt8365-apmixedsys.o
> >>   obj-$(CONFIG_COMMON_CLK_MT8365_APU) += clk-mt8365-apu.o
> >>   obj-$(CONFIG_COMMON_CLK_MT8365_CAM) += clk-mt8365-cam.o
> >>   obj-$(CONFIG_COMMON_CLK_MT8365_MFG) += clk-mt8365-mfg.o
> >> diff --git a/drivers/clk/mediatek/clk-mt8365-apmixedsys.c b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> >> new file mode 100644
> >> index 000000000000..6f0fdf92bbd2
> >> --- /dev/null
> >> +++ b/drivers/clk/mediatek/clk-mt8365-apmixedsys.c
> >> @@ -0,0 +1,164 @@
> >> +// SPDX-License-Identifier: GPL-2.0-only
> >> +/*
> >> + * Copyright (c) 2022 MediaTek Inc.
> >> + * Copyright (c) 2023 Collabora Ltd.
> >> + */
> >> +
> >> +#include <dt-bindings/clock/mediatek,mt8365-clk.h>
> >> +#include <linux/clk.h>
> >
> > like in the MT2712 patch, this could be clk-provider.h .
> > Or maybe we should do a pass of header cleanup? There's a bunch left
> > over from the conversion from |struct clk| to |structk clk_hw|, and
> > then migration to mtk_clk_simple_probe.
> >
> > What do you think?
> >
>
> I'm more for a separated pass of header cleanup, honestly...

I'm OK with that. Or maybe someone notices as does drive-by cleanups.
