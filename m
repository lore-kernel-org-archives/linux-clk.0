Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45856C05027
	for <linux-clk@archiver.kernel.org>; Thu,  9 Feb 2023 03:46:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232290AbjBIDqm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 22:46:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232825AbjBIDqZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 22:46:25 -0500
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56A64234C2
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 19:46:24 -0800 (PST)
Received: by mail-vk1-xa32.google.com with SMTP id az37so327051vkb.2
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 19:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EmM543SraV9o9ha1YM1vALY7ObPvW/K+6GDnAjPWuvs=;
        b=hV2Bl2quJGDMv8WcOFW78Co3V9C483w8NksmhyOC0ub+Lk+KeZbdoh2ZshULAJ+HOc
         YXXeGCFF+CsnZwq2/BL6geEnM3BBMt+vwJVBxLsV2UTPXpoH62VG0t/4rGWXk2SJ+L2l
         hlr0e07DL0cmpVez+XpFQK74vEUpr2SrGye/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EmM543SraV9o9ha1YM1vALY7ObPvW/K+6GDnAjPWuvs=;
        b=TVNeRf6dGEbIp7FJdtQPz0zPkR3Ja9oVVSu53kI3SL1x0IOtMQdaou4rNAUBv8OyOV
         zi5zV0Uots1E0Tqc+rLQ5QzggTmcYyjUrwINVYwC78htfkw6zIstDAGUeVkrlihVHyqc
         JeuOTx1TTg36sYXNeuo0OMApXiM3B1sJ6ZZVYIQeimsamd59D29Qc2Soj/scjkVT7rzn
         dQQQ3pnLF5uWroBqoQ9N6DnUeWet+6a99HKq+LQEfJFS+j32qchi2b49OJj0Z2QT7OUW
         BoQKkqhC/p70CZRXRF2LV5+v3y+DFHzgnK1LdDqoVXZtilZ06ZTKhgBev2E5Axe6CFg0
         t/vg==
X-Gm-Message-State: AO0yUKXbkgLE+wWZL33RVOyqbY9ABmeJmuAWXG0rvpgH9hFelMFOLue7
        +ZvwBt5uOf/bo+xjYRfMn7MCXra3OKrCDy9kyJBEpA==
X-Google-Smtp-Source: AK7set/b/VaRTgbuyYYkPbkiLSlIY6vsoR42DhsiTFk3QMVSBVx/h84c6ihtp5HHzLDmT7LzEMygWe8zgKZdOPmQ0GY=
X-Received: by 2002:a1f:a6c5:0:b0:3e1:a2f7:8b2a with SMTP id
 p188-20020a1fa6c5000000b003e1a2f78b2amr2240269vke.18.1675914383329; Wed, 08
 Feb 2023 19:46:23 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
 <CAGXv+5HTP0cLGEQ+qkAt8nsOp5DqCOgPyAOJ66fF91SKX=hZvw@mail.gmail.com> <45f8e284-8d56-898b-0897-94c576e09c2c@collabora.com>
In-Reply-To: <45f8e284-8d56-898b-0897-94c576e09c2c@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 9 Feb 2023 11:46:12 +0800
Message-ID: <CAGXv+5FmmDx0Q_d17hv1gu+drfD12-vtgPoTpefExHGvdkcQyA@mail.gmail.com>
Subject: Re: [PATCH v1 35/45] clk: mediatek: Split MT8195 clock drivers and
 allow module build
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

On Wed, Feb 8, 2023 at 5:00 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/02/23 09:28, Chen-Yu Tsai ha scritto:
> > On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> >> option: there's no reason to do that, as it is totally unnecessary to
> >> build in all or none of them.
> >>
> >> Split them out: keep boot-critical clocks as bool and allow choosing
> >> non critical clocks as tristate.
> >
> > The power domain controller references vppsys*, vdecsys*, vdosys*, wpesys,
> > imgsys and camsys. I'd argue that this makes these clock drivers
> > semi-boot-critical. Maybe mfgcfg as well when we add the GPU?
>
> You don't need to power on additional power domains if you want to load modules
> from a ramdisk! :-)

Right.

> Besides, you caught me: mtk-pm-domains will be my next target after clocks...
> I don't like how it behaves in regard to probe deferrals. Specifically,
> I dislike the fact that you either register *all domains* or *none at all*
> (unless instantiating two different driver instances and that's ugly).

I don't really like it either, but is it possible to split probe deferrals?
I mean, if you skip a couple power domains because the clocks aren't
available, how do you come back to them?

And IIRC for a clock provider that is _not_ marked as disabled in the DT,
trying to fetch a clock from it would just give -EPROBEDEFER until
the provider is registered.

ChenYu

> >
> > They should be bundled together at the very least. The power domain
> > controller not probing disables all display and multimedia capabilities.
> >
> > Also wondering if we should have "default COMMON_CLK_MT8195" ...
> >
> > I suppose the same questions apply to other SoCs.
> >
> > ChenYu
>
>
