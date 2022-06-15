Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683EEC43334
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 08:25:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240275AbiFOIZk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 04:25:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232170AbiFOIZj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 04:25:39 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3BBB237C2
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 01:25:37 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id bg6so21829461ejb.0
        for <linux-clk@vger.kernel.org>; Wed, 15 Jun 2022 01:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=42THmoY9ZwUf7E9pXMyKG0cEp/ni0i9p0WfpREB2n10=;
        b=IzXbdm+MSDrAUM/lNjl81RFo6yj1cN4/UWpTi2VyoC8cuXokTBY/XslJ6f8EgwlHHR
         Nqv+vLJCcvriZm89d5qLtZ9vWefp92+txsJV3xA0TJKJRWaBC0X0xB7n8kwB+ZjvEjFd
         UwuD1M6X9yi0TmtYRspTDQSK/ydvBdHIkBXUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=42THmoY9ZwUf7E9pXMyKG0cEp/ni0i9p0WfpREB2n10=;
        b=GefgzUifPrHz/1EtBi8xR4C80EyrVzo82kDPaqpMc33IM1rD8vEXnD1nCrYBGAYHv3
         B4Ytfm6T9ksPFefbjXPngbEBUP4TxfuIksPYE9HqQGV/WTsV/qmFLpm3rI7wjo3/0Mq3
         xKDe3/yuzFnX0KUhsz5PIskPltdYhXGfcAzE2g8u08g8wiwzAhmk5F6EhGVzEcZF8095
         C9bf72YIOgu6n1X09nQBVeWwzRJUuBvnZ/h9Lq/UrMjlTCx4Wswo/XgylD2r9VBCPZDh
         J3Dk/lEd1mQav8h6Ue8WpwwoTf+4Vy8y/xQH0gJ6WgpHlg6QaM5QltypF96SZrbbNSwJ
         V5OA==
X-Gm-Message-State: AJIora81f5jidMn507k9moTz44KikyjEcaSm5BSTvg32Pkuqw+aFhTPT
        4b9blHF8SfIvP0g1wAF0bSrF8rENEpYc3a/BAZ0FPjZMbruuJA==
X-Google-Smtp-Source: ABdhPJzwhpiEvPHgnYKirBM5dhwCXY18u70ilKxIbysLJLQFgRqgBSktW8XVTVC7cX35FBuWGfmGK84g72VBIQQ80rQ=
X-Received: by 2002:a17:906:a10e:b0:6f3:e70b:b572 with SMTP id
 t14-20020a170906a10e00b006f3e70bb572mr7595326ejy.546.1655281536262; Wed, 15
 Jun 2022 01:25:36 -0700 (PDT)
MIME-Version: 1.0
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 15 Jun 2022 16:25:25 +0800
Message-ID: <CAGXv+5G9j_XVhuH2XO8g0YQn=NT3Typ0OYkKtr7qHkZM9XKpwQ@mail.gmail.com>
Subject: Dealing with temporary clock parents for PLL consumers?
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        matthias.bgg@kernel.org
Cc:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        LAKML <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi everyone,

As part of getting Panfrost to support devfreq on MediaTek SoCs, we've
been trying to internalize PLL consumer reparenting during PLL
reconfiguration into the clock drivers. This was previously done by
the individual clock consumer hardware drivers, Panfrost in this case.

I posted some patches for temporarily reparenting PLL consumers while the
PLL is reconfigured on MediaTek platforms [1]. This is based on a similar
mechanism in the Allwinner sunxi-ng clock driver. This works OK for the
MT8183, but as Angelo recently discovered, there are complications for
MT8192 and MT8195 due to how the clock tree is.

On MT8183, the clock tree for the GPU looks like this:

  <XTAL>     ----------------\
  <GPU PLL>  ------- <gate>--\\ <mux> --> GPU
  <stable PLL 1>  -- <gate>--//
  <stable PLL 2>  -- <gate>--/

Since we temporarily reparent the GPU to the XTAL, everything is OK.

On MT8192 / MT8195, the clock tree is more complicated with a fast mux:
(same parent with different dividers omitted)

  <GPU PLL>  <gate> ----------------------------\
                                                 \
  <XTAL>     ---------------\                     <fast mux> --> GPU
  <stable PLL 1> -- <gate> --- <mux> -- <gate> --/
  <stable PLL 2> -- <gate> -/

As shown, we now have a gate in the temporary clock parent (the other side
of the fast mux) that needs to be ungated. The question is how do we deal
with this, since the temporary muxing away from the GPU PLL is done without
updating the clk core's view of the clock tree.

Angelo and I discussed various solutions:

a) We could mark it as a critical clock so that it's always ungated,
   but that seems a bit heavy handed.

b) (by me) Add clk_prepare_enable() / clk_disable_unprepare() calls in
   the clk notifier that handles the temporary muxing. This might trip
   up the clk core in unexpected ways.

c) (by Angelo) Tie the temporary clock parent to the GPU's power domain.
   This means the clock is only enabled when the GPU is in use. I think
   this is a bit hackish though.

d) Add support for such a mechanism to the clock core. I assume this is
   a common requirement across platforms, as PLLs tend to overshoot when
   being reconfigured on the fly, and can cause glitches in their consumers.

We'd like to get opinions from folks about:

1. Whether (b) is acceptable from the clk subsystem's perspective.
2. Whether (c) is acceptable in the platform maintainer's view.
3. Whether there is interest in (d), assuming it is doable.


Thanks
ChenYu

[1] https://lore.kernel.org/linux-mediatek/20220523085923.1430470-1-wenst@chromium.org/
