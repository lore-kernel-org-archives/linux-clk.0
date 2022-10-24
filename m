Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50FC9C38A2D
	for <linux-clk@archiver.kernel.org>; Mon, 24 Oct 2022 23:49:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbiJXXtx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 24 Oct 2022 19:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbiJXXtT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 24 Oct 2022 19:49:19 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B10431182E
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:07:28 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id o5so7714619vsc.0
        for <linux-clk@vger.kernel.org>; Mon, 24 Oct 2022 15:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EcRp0GH5Esc6snP7VZR4xY25U16N2wvcVl6BzgZRJeE=;
        b=Rz792NgLGIt9O6goUOd/iW8LTGXrspz73YCmrZB+Up47bT7wDV4ZlERoSGu76oNU91
         aAI62iK++sU/HWObuMN2cxyUGpi0j8izoltf4IvsqM/IkAKGo2W4rjmqAeLlWi9mOcMf
         KfYrNN2PONwPUxRs/qenV6Mjka7riMeSpwBag=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcRp0GH5Esc6snP7VZR4xY25U16N2wvcVl6BzgZRJeE=;
        b=dWDOGlhMRvyfuXTr0pdg138TP6nsQHMJet4BoCsGCizRmDFPWmP5RteNuXlDPey5pe
         peO9nyva7NfzGRabDR5i2yi3485Gr5vpC4mxdO0MgTbW+pGzhsjEoJ+C469oapFJ13fM
         98hfXjIsGBAk04UuuCOxqMcSi23hN5xghbyZxOPaNeZ8QQUVRiXlO2fkmIMBpbkCWoB+
         1H2fqDhnEcGvLit653O69rdNqVK+RE3ZE5O//OT8OF3xFSac/TKMRRD/GB/3ua6w+mkv
         bGRZpXHSPquLlIFiLpEcTBRFiQnP61WmaaxGM+U1BiejS62zWmQTgDkz5poRuJdScFxa
         3vaw==
X-Gm-Message-State: ACrzQf3bdvJ2YmPuKQsM4QaU8R9hhtRuGcQz/XCxWfKzn3rKuk270gNv
        RVaguow2LsQc9JlLZcCFeN6DdG8nbwEI0t9PWkfVhA==
X-Google-Smtp-Source: AMsMyM7cxOfeBextqdk7aBE5SgrcTfc1CGSj3S0ktMl8h7EY71ngkdmETifGxNNJtvu+TcnOV/yL86UlEA0UACMkihI=
X-Received: by 2002:a05:6102:3ed5:b0:386:91a5:a246 with SMTP id
 n21-20020a0561023ed500b0038691a5a246mr20273302vsv.26.1666649206639; Mon, 24
 Oct 2022 15:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-6-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-6-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 24 Oct 2022 15:06:35 -0700
Message-ID: <CAGXv+5EwrRqNuqunzLHtRyZ+AMyO1DDwP01TC9CjbxHnRxbH0g@mail.gmail.com>
Subject: Re: [PATCH 05/10] clk: mediatek: mt8173: Drop flags for
 main/sys/univpll fixed factors
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
        miles.chen@mediatek.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, chun-jie.chen@mediatek.com,
        jose.exposito89@gmail.com, yangyingliang@huawei.com,
        msp@baylibre.com, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The main/sys/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/sys/univpll divider clocks, used by MUX clocks to provide
> different rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
