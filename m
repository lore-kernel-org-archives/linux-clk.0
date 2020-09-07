Return-Path: <SRS0=Y9Ae=CQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E1AC433E2
	for <linux-clk@archiver.kernel.org>; Mon,  7 Sep 2020 16:08:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EE6F72145D
	for <linux-clk@archiver.kernel.org>; Mon,  7 Sep 2020 16:08:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="V+/+cxJ2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729914AbgIGQIA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Sep 2020 12:08:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729826AbgIGQFt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Sep 2020 12:05:49 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2399BC061573
        for <linux-clk@vger.kernel.org>; Mon,  7 Sep 2020 09:05:48 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id m1so12860886ilj.10
        for <linux-clk@vger.kernel.org>; Mon, 07 Sep 2020 09:05:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2YNH7orOHt08+yKQJLjaMtOTfyyp0xF6Fs1etZL+bHo=;
        b=V+/+cxJ23jlTHZSidq42rKHPp74ha5NEqxBN/sAaIX0NzKXxvRR3DCaTk2LL6w69vX
         hp5dk3EcV6CyVydHsSCgL9GkxgMgaKzHVf8naeiZiz/RkVdtAW7CS/EzUO5rYvpKTQ7d
         Iq/n3cjiz8XIiwEAmilNEQzhUGBq/TScPvJ2cScLfCMtY1PoIhpgOEyO3/OP9f5mqNhY
         gjp08yumv3i0LiNqXGmmzfqRvFdbRiRm3Wfpgn9cgn4XBkeIGKM5pYLbGLTSawomKagx
         QKQAZQduXFR9PMaAnPFn1qFTOp/KeSZYOHwK6RIqyNIqXXREmFTFsnmioNSiz/JFtWKM
         r6Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2YNH7orOHt08+yKQJLjaMtOTfyyp0xF6Fs1etZL+bHo=;
        b=ks1VvEfIIuKu6WvE1JrTGXWN0WOKRsKWmXQqiHnmT7jkrqEH3gGulwlzipTpGGvEa1
         UUSzeqjXbnPqUSO8tYp06d0rOkt2Iw41U1G7NNEGeEH/+U3f4G/a4wzmlxJ5PyIWT8E7
         xE0DN3+5xpCh6k+XCpKgAW1tbz9KPFwzt1VQJjxollFrt7+iqFd1FnAZHcZv61RAC4w2
         9CsmwF/pZFHAbShJOAVczKF0TIzyKXpkUjJcCJwSzONdnxGZNeGd32CbrTtiahUK1BYr
         VmKRR8PApucgZyR/F8j5mOAiarxx6mBN1WZ3s6FM8xtbxrDFMf/Cz5+Y3HGxNtQDv9Fv
         0voQ==
X-Gm-Message-State: AOAM5339GBT6mvRbPA+udrfUWjE+B9eUE6j0Mbg76d+wCdiPR0bTKYX9
        r7jhsKPTUSeOY8xZ2iuuUkMuBfN6Kmv6Ca27ALXNtA==
X-Google-Smtp-Source: ABdhPJy1SJ48pTuQ4hoOcMXqVi7KI0IYuGLLgOn6zubuNITr+5WPd1s2pbjpICAVAqJk1uA+zLCZu2U0jMg9eNYqPDM=
X-Received: by 2002:a92:d144:: with SMTP id t4mr8930571ilg.88.1599494747757;
 Mon, 07 Sep 2020 09:05:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200907125646.1946282-1-fparent@baylibre.com> <CAAOTY_9HYvxEygv-oz9wf+JjiSfp+Zn1u5okMftz3SncfK0G5A@mail.gmail.com>
In-Reply-To: <CAAOTY_9HYvxEygv-oz9wf+JjiSfp+Zn1u5okMftz3SncfK0G5A@mail.gmail.com>
From:   Fabien Parent <fparent@baylibre.com>
Date:   Mon, 7 Sep 2020 18:05:35 +0200
Message-ID: <CAOwMV_xEEt+m+LuL_3dF2J8rp4m4gn2T8AR5nGLi0sDoiOC=RQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: clock: mediatek: add bindings for MT8167 clocks
To:     Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc:     "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-clk@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, masahiroy@kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        CK Hu <ck.hu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
        mars.cheng@mediatek.com, macpaul.lin@mediatek.com,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        mtk01761 <wendell.lin@mediatek.com>,
        Owen Chen <owen.chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chun-Kuang,

> Why don't you add compatible of "mediatek,mt8167-mmsys"?

I forgot to remove 'mmsys' from the commit message. I decided to add
the documentation as part of the series that add support for MT8167 to
drivers/soc/mediatek/mtk-mmsys.c.

If you think it would be better to document it here I can add the
bindings in the V2.
