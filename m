Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A30A3C4320A
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 09:56:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92A4361378
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 09:56:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbhHWJ5S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 05:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbhHWJ5R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 05:57:17 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2E29C061760
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 02:56:34 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i28so36783313lfl.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 02:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DwLkafPCzacBVSHpjjdAUPEKJJ43SzqoH9OLBe2Mi0Q=;
        b=YgVAPvpVDcLUGJH7iZ2jc6W5WnbjynjOndiFSG7jVPMrplKFg+JDXHJhkyQF7kbk8B
         V6rT6v/4xnK8XbooWVgrkmK/ZpHk3T/XZcFcbe9fRpNkbXsEEVu2+kU0i+vOqdmAGrke
         NFb9pPkz+mcDPBNyDoG1fm8qwfBDEnqlEcB6s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DwLkafPCzacBVSHpjjdAUPEKJJ43SzqoH9OLBe2Mi0Q=;
        b=TDxrrN0hqeDwzUziV4jth0btBG2mS5+Gxf8omSpoGhDj8B/YBE/COCpwV90JHGEYuu
         Id4d0yoyAujPV4iLlln+lPlzciUayWP+cBSU9Uu39ozuBtRCvS6nnli2wjQ/JN5pfMWf
         nnmbzUrigPhYJswXCtGLxLh1tnvtfBPv02THwERDBcahSmAERld/Bom+qH3mYkuBWxvG
         bSyPBdlTqMF7lK3/CjFP8ZEAJwCDAKUIa5QtiW3wVkpxoBe3uabjHOxJI05zfV961prQ
         tR2P2eyXGcmWqDI70Tg5lsPxDlQtt+IdrZRWEMtB8nWuqNyWEjbaE4snbi4HptP9iALj
         6hzA==
X-Gm-Message-State: AOAM532zGRAbTc0+02gszmfdTVKNEpx9E8s1cZIDE+0uc0cgq5qoANCu
        HkzvrcbvTGCvr7pyskMg7dYnah74VsbEIDij62PDmA==
X-Google-Smtp-Source: ABdhPJyTMTEV40CeyBrnNkz402YWpL8znfz4DOOREIuAtTkANyhl+dbk7fSjMPr6NTPWNX8sb5dYEJPaEB9iHIKK5bY=
X-Received: by 2002:a05:6512:3b98:: with SMTP id g24mr16898362lfv.276.1629712593296;
 Mon, 23 Aug 2021 02:56:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com>
 <20210820111504.350-7-chun-jie.chen@mediatek.com> <CAGXv+5FVGQkR=OpyBA7rjE0sLLqVoTpgHJuG8YDaCnWFCdDM8A@mail.gmail.com>
In-Reply-To: <CAGXv+5FVGQkR=OpyBA7rjE0sLLqVoTpgHJuG8YDaCnWFCdDM8A@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 17:56:22 +0800
Message-ID: <CAGXv+5E2G-OBwQyKdMVavw5hTNQsNe7v=yHc720csxOchV9wpA@mail.gmail.com>
Subject: Re: [v2 06/24] clk: mediatek: Add MT8195 apmixedsys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
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

On Mon, Aug 23, 2021 at 5:21 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Fri, Aug 20, 2021 at 7:20 PM Chun-Jie Chen
> <chun-jie.chen@mediatek.com> wrote:
> >
> > Add MT8195 apmixedsys clock controller which provides Plls
> > generated from SoC 26m and ssusb clock gate control.
> >
> > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > ---
> >  drivers/clk/mediatek/Kconfig                 |   8 +
> >  drivers/clk/mediatek/Makefile                |   1 +
> >  drivers/clk/mediatek/clk-mt8195-apmixedsys.c | 145 +++++++++++++++++++
> >  3 files changed, 154 insertions(+)
> >  create mode 100644 drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> > index 576babd86f98..7ba1f4118e0d 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -580,6 +580,14 @@ config COMMON_CLK_MT8192_VENCSYS
> >         help
> >           This driver supports MediaTek MT8192 vencsys clocks.
> >
> > +config COMMON_CLK_MT8195
> > +        bool "Clock driver for MediaTek MT8195"
> > +        depends on ARM64 || COMPILE_TEST
> > +        select COMMON_CLK_MEDIATEK
> > +        default ARM64
> > +        help
> > +          This driver supports MediaTek MT8195 basic clocks.
>
> Since we will have all clocks under the same Kconfig option, please
> drop the word "basic".
>
> > +
> >  config COMMON_CLK_MT8516
> >         bool "Clock driver for MediaTek MT8516"
> >         depends on ARCH_MEDIATEK || COMPILE_TEST
> > diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> > index 15bc045f0b71..d4157cfca865 100644
> > --- a/drivers/clk/mediatek/Makefile
> > +++ b/drivers/clk/mediatek/Makefile
> > @@ -80,5 +80,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
> >  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> > +obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o
> >  obj-$(CONFIG_COMMON_CLK_MT8516) += clk-mt8516.o
> >  obj-$(CONFIG_COMMON_CLK_MT8516_AUDSYS) += clk-mt8516-aud.o
> > diff --git a/drivers/clk/mediatek/clk-mt8195-apmixedsys.c b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> > new file mode 100644
> > index 000000000000..253eb30b22d4
> > --- /dev/null
> > +++ b/drivers/clk/mediatek/clk-mt8195-apmixedsys.c
> > @@ -0,0 +1,145 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)

I actually only requested the files related to DT bindings, which includes
`Documentation/device-tree/bindings/*` and `include/dt-bindings/*`, be dual
licensed.

I'm not sure dual licensing the actual driver code makes sense, or is
even valid, since this calls into existing GPL-2.0 code. But I am not
a lawyer.


ChenYu

> > +//
> > +// Copyright (c) 2021 MediaTek Inc.
> > +// Author: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > +
> > +#include "clk-gate.h"
> > +#include "clk-mtk.h"
> > +
> > +#include <dt-bindings/clock/mt8195-clk.h>
> > +#include <linux/of_device.h>
> > +#include <linux/platform_device.h>
> > +
> > +static const struct mtk_gate_regs apmixed_cg_regs = {
> > +       .set_ofs = 0x8,
> > +       .clr_ofs = 0x8,
> > +       .sta_ofs = 0x8,
> > +};
> > +
> > +#define GATE_APMIXED(_id, _name, _parent, _shift)                      \
> > +       GATE_MTK(_id, _name, _parent, &apmixed_cg_regs, _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > +
> > +static const struct mtk_gate apmixed_clks[] = {
> > +       GATE_APMIXED(CLK_APMIXED_PLL_SSUSB26M, "pll_ssusb26m", "clk26m", 1),
> > +};
> > +
> > +#define MT8195_PLL_FMAX                (3800UL * MHZ)
> > +#define MT8195_PLL_FMIN                (1500UL * MHZ)
> > +#define MT8195_INTEGER_BITS    8
> > +
> > +#define PLL(_id, _name, _reg, _pwr_reg, _en_mask, _flags,              \
> > +                       _rst_bar_mask, _pcwbits, _pd_reg, _pd_shift,    \
> > +                       _tuner_reg, _tuner_en_reg, _tuner_en_bit,       \
> > +                       _pcw_reg, _pcw_shift, _pcw_chg_reg,             \
> > +                       _en_reg, _pll_en_bit) {                         \
>
> Nit: Even for macro definitions, you could align the lines to the opening
> parenthesis. That would give you more room. And it would make it slightly
> easier to read.
>
> Otherwise,
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
>
> [...]
