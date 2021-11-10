Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB113C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Nov 2021 06:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAE0B6117A
	for <linux-clk@archiver.kernel.org>; Wed, 10 Nov 2021 06:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbhKJHCh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Nov 2021 02:02:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbhKJHCh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Nov 2021 02:02:37 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BF96C061766
        for <linux-clk@vger.kernel.org>; Tue,  9 Nov 2021 22:59:50 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id z34so3603020lfu.8
        for <linux-clk@vger.kernel.org>; Tue, 09 Nov 2021 22:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vdxDgkfSTqFGdQ9nDCOLn0v5httxiDKsh2lfCR5yWNY=;
        b=Dk3IOruuqqmTO1uvCBdJDOnwTShbARFlEa7a72kpdIZbwDpDv1/19K09eFtjI9d1Rp
         L7NgTo5zlaLhCJy3gxA1EFIPDpPmhlhWYAuJmRRXEYi7kKvZP0GnINLWmfQOtH+bAH0X
         1uk2w5BAryoSpP/Adl8gFAtAItfFwRQ7SO0eg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vdxDgkfSTqFGdQ9nDCOLn0v5httxiDKsh2lfCR5yWNY=;
        b=DGwG4km2G8d8SpdkGnYTuZkN/4s73bZRxcDxfC2OuEk2GJr/DA+lVGsDFDVH1W//5D
         k0WS0WUKRK8p2TkWHF5nid8ioZGb1ksB2X2dUT8IQGeVj3cDvwl+KZnAYVasNi1iIll5
         2QzpjAme/2IICsmn2+zMfwxkA1Di2KYO/XGRfDcY7/OkGvzv3QZZqngjVgak4kAPqoGp
         KTvYUBsZzCueZYQVZQKbUASt23uIUfKjl5FPR3mMo+tv0J17VhYZyu9jGggpOme4tjKg
         1WpBbCZNsNrr0hBSqcTAqBc39DN3pztgOt/gfRCbiAAmt0bBApw8fc0pIwdZoIfWr5kP
         4ELg==
X-Gm-Message-State: AOAM530bcSywruUy1rUcG6kFp0iwfuLeMRxPx69Skfhb/P4Zky8mEhQr
        HUm0qG0AcoojyGilxqXTYFub/lVyiybg8N2n2L0o2Q==
X-Google-Smtp-Source: ABdhPJzT5pYmXA23R9a52Ed4Op1U7q1rOPubOphl6Ca2rdZzbRShMNUyX0q+L+xsyqB0W6KpQBQgEilils07ZGIo96w=
X-Received: by 2002:ac2:4e09:: with SMTP id e9mr12444311lfr.308.1636527588591;
 Tue, 09 Nov 2021 22:59:48 -0800 (PST)
MIME-Version: 1.0
References: <20211110022258.2358-1-chun-jie.chen@mediatek.com>
In-Reply-To: <20211110022258.2358-1-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 10 Nov 2021 14:59:37 +0800
Message-ID: <CAGXv+5G5vnOuW46q7b7m6BDS+R4vCLJehrofjfv95uOFbwyzEg@mail.gmail.com>
Subject: Re: [v1] clk: mediatek: use en_mask as a pure div_en_mask
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
        srv_heupstream@mediatek.com,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Wed, Nov 10, 2021 at 10:23 AM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> We no longer allow en_mask to be a combination of
> pll_en_bit and div_en_mask, so remove pll_en_bit(bit0)
> from en_mask to make en_mask a pure en_mask that only
> used for pll dividers.

AFAICT this looks like it continues the work done in commit 7cc4e1bbe300
("clk: mediatek: Fix asymmetrical PLL enable and disable control") and
commit f384c44754b7 ("clk: mediatek: Add configurable enable control to
mtk_pll_data").

It would be nice if you could mention this in your commit log to provide
more context.

> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
> This patch is based on v5.15-rc7 and [1].
>
> [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=546235
You can now base this patch on Linus's tree as the latest changes have
been merged already.

> ---
>  drivers/clk/mediatek/clk-mt2701.c |  8 ++++----
>  drivers/clk/mediatek/clk-mt2712.c | 30 +++++++++++++++---------------
>  drivers/clk/mediatek/clk-mt6765.c | 20 ++++++++++----------
>  drivers/clk/mediatek/clk-mt6779.c | 24 ++++++++++++------------
>  drivers/clk/mediatek/clk-mt6797.c | 20 ++++++++++----------
>  drivers/clk/mediatek/clk-mt7622.c | 18 +++++++++---------
>  drivers/clk/mediatek/clk-mt7629.c | 12 ++++++------
>  drivers/clk/mediatek/clk-mt8135.c | 20 ++++++++++----------
>  drivers/clk/mediatek/clk-mt8167.c | 16 ++++++++--------
>  drivers/clk/mediatek/clk-mt8173.c | 28 ++++++++++++++--------------
>  drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
>  drivers/clk/mediatek/clk-mt8516.c | 12 ++++++------
>  drivers/clk/mediatek/clk-pll.c    | 12 ++++--------
>  13 files changed, 119 insertions(+), 123 deletions(-)

Code-wise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
