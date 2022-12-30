Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5F75C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Dec 2022 06:42:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbiL3Gmy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Dec 2022 01:42:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229663AbiL3Gmy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Dec 2022 01:42:54 -0500
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43D4186A7
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 22:42:51 -0800 (PST)
Received: by mail-vs1-xe30.google.com with SMTP id 128so20462905vsz.12
        for <linux-clk@vger.kernel.org>; Thu, 29 Dec 2022 22:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XrpQaBNpbz5C7gEc30JXJD4ksBAoVukkRs4REF7J3cA=;
        b=ieXRxqKlr8oyA7r8oWv5vNjeFdB1A3ZleV0nsNDeN+cCb+ZLeuFA5X93VFGh/jXSpy
         8vhLveMu+xVU3utEC/s5ogI75eX3T82AglX1Uu2BHmrdqEb5fqhkuelWB5l3GEOzeI0i
         GFlJcKDDe2AAgKzGmoaCY8hHz4nCxh5d6ERJQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XrpQaBNpbz5C7gEc30JXJD4ksBAoVukkRs4REF7J3cA=;
        b=FIfMKldTpJ29KepTHLKSgz9/z8e8pMzY5u0ZXdXp4SBbszY0/98A2VA75PzrkBmYPK
         W5SVA4wFwaGdm8nsGHzEbQbbpLGm2tDdC+8s2iN1E8h3Ajtd2iKZ39XNm45oVU7Pf3km
         L6YZC9JS/4igkuyK4EwiCllw3HfbUazkNNC+arOAHzFc9HySqtOAT8TSLRnf2kTCdYcR
         yriL0Yg7BLIGLXOInyWihQOW208ChcnKKQnj5Yeqef/QJBhGw1hkHzl47W9Zqe0e0YtV
         HcNuZSvFjvWmfjmnK/2VjgW1LBThjfg+o/RdAJIkmIRMHEFbmzFdf2+fosytouEWMSR5
         2Spg==
X-Gm-Message-State: AFqh2kr9FONui3occC4tVI1lCBmQEY8GhHXMVRs8DwhKJwMRxmXm79dx
        g1YHdCxypEpCWFu/1Zniq5khl7Bz44xFzuUt+a1mlg==
X-Google-Smtp-Source: AMrXdXvrIUXju3J24bym43P+d+BGgTRL65FUNwwpDeRTxYGdxEQI/sLV9PJ9RkGhzNeKQ2VL0EKFXN2ejtTMxQEBC1c=
X-Received: by 2002:a05:6102:3d9f:b0:3c4:4918:80c with SMTP id
 h31-20020a0561023d9f00b003c44918080cmr2656935vsv.9.1672382570811; Thu, 29 Dec
 2022 22:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20221223094259.87373-1-angelogioacchino.delregno@collabora.com> <20221230061309.16643-1-miles.chen@mediatek.com>
In-Reply-To: <20221230061309.16643-1-miles.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Fri, 30 Dec 2022 14:42:39 +0800
Message-ID: <CAGXv+5HqLc2xsz6b_d5hrPiAu363aMcJkQrqX32ukA2pcsj6kQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/23] MediaTek clocks cleanups and improvements
To:     Miles Chen <miles.chen@mediatek.com>
Cc:     angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        devicetree@vger.kernel.org, fparent@baylibre.com,
        ikjn@chromium.org, johnson.wang@mediatek.com,
        jose.exposito89@gmail.com, kernel@collabora.com,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com,
        nfraprado@collabora.com, pablo.sun@mediatek.com,
        rex-bc.chen@mediatek.com, robh+dt@kernel.org, ryder.lee@kernel.org,
        sam.shih@mediatek.com, sboyd@kernel.org, weiyi.lu@mediatek.com,
        y.oudjana@protonmail.com, yangyingliang@huawei.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Dec 30, 2022 at 2:13 PM Miles Chen <miles.chen@mediatek.com> wrote:
> > Changes in v2:
> >  - Moved dt-bindings CLK_DUMMY to clk-mtk.h instead
> >
> >
> > This series performs cleanups and improvements on MediaTek clock
> > drivers, greatly reducing code duplication (hence also reducing
> > kernel size).
> >
> > There would be a lot to say about it, but summarizing:
> >
> > * Propagates struct device where possible in order to introduce the
> >   possibility of using Runtime PM on clock drivers as needed,
> >   possibly enhancing reliability of some platforms (obviously, this
> >   will do nothing unless power-domains are added to devicetree);
> >
> > * Cleans up some duplicated clock(s) registration attempt(s): on
> >   some platforms the 26M fixed factor clock is registered early,
> >   but then upon platform_driver probe, an attempt to re-register
> >   that clock was performed;
> >
> > * Removes some early clock registration where possible, moving
> >   everything to platform_driver clock probe;
> >
> > * Breaks down the big MT8173 clock driver in multiple ones, as it's
> >   already done with the others, cleans it up and adds possibility
> >   possibility to compile non-boot-critical clock drivers (for 8173)
> >   as modules;
> >
> > * Extends the common mtk_clk_simple_probe() function to be able to
> >   register multiple MediaTek clock types;
> >
> > * Removes duplicated [...]_probe functions from multiple MediaTek SoC
> >   clock drivers, migrating almost everything to the common functions
> >   mtk_clk_simple_probe();
> >
> > * Adds a .remove() callback, pointing to the common mtk_clk_simple_remove()
> >   function to all clock drivers that were migrated to the common probe;
> >
> > * Some more spare cleanups here and there.
> >
> > All of this was manually tested on various Chromebooks (with different MTK
> > SoCs) and no regression was detected.
> >
> > Cheers!
>
> I tested this v2 series on mt6779 and mt8192 without any problem.

Please give Tested-by. :)
