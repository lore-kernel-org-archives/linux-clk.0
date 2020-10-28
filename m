Return-Path: <SRS0=XeJu=EE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=BAYES_00,DATE_IN_PAST_06_12,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2593C388F7
	for <linux-clk@archiver.kernel.org>; Thu, 29 Oct 2020 01:22:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6013420796
	for <linux-clk@archiver.kernel.org>; Thu, 29 Oct 2020 01:22:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="II7y2sOO"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728159AbgJ1WEz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbgJ1WBr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Oct 2020 18:01:47 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED12C0613CF
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 15:01:48 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id n5so1032918ile.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Oct 2020 15:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z2nv8ieGjS37fi1b03zMseQoHKsRO+D/JXqI8/WM/lg=;
        b=II7y2sOO4VBMYCA8hvox5v3rLsbjjK+ou6Wgnt6+3iHcpCSwOMEyDXIgGkXoT99fbl
         L4S+W94x43NMy8AhMMFEFxUbPf6VxLU6vVJ4V/dnEPIY3iyrqijWlNa6gtC6UsAt1F4y
         rFgaskObCDEblL5aTglXYq15v9S1R69bZWSOSlREpM6g8neG4WGYk3JPzGzs+EXjG/Gb
         NH/X3uC5QaXqb1bsS3s27HpvpOkfyfBCiHKYKJ4yi9AjOteWgzlPxAIFbRslJvXinP0O
         9U2uOEo/TpsTI4M/2a6VrRGYVOxx1TD4hfaW+zQ8N/MayGM7tDgmoUx/Zyrr5yoMShl5
         WkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z2nv8ieGjS37fi1b03zMseQoHKsRO+D/JXqI8/WM/lg=;
        b=uBWzVKc8pooTsLs/xXN0lKYvggj36REEzkC3pGFuRNx7rBb+p9gInrWyF9SLNvC6+k
         GkS9H+MxrsBo+Z8NUEFAXrOvkjNnWgjbMpyBdpUnGwydO4UZYsYxgkfjEsCT1z5hRpIl
         gmIyAQIORmr+XdyIx6ExkTW6i43psPoXR2k9swTQJUH6Sa5Civ2WZ4XlXew8hy8nPPc+
         1gXFBBYJSrRWv+KyIrvBH4Ee+bClAUzSL+lnN9bF5haiK/XGutuSJhAZXJdPyk0bqB0O
         6M42Fj2ZWuciGJLkrnj/oBAXuGTxPbrYOjcKPmHXkPfKZZr3UcrPSfAb6W8LSjmnNE6p
         z69Q==
X-Gm-Message-State: AOAM532dyPQ8Kc85lIqrbohHxt0fEH3nOph2/WIB5iE8H5iEipWXDYe5
        NNomLbfwKqfd5u1oD/GQrQv/WwZqNxMyOiMJ/rWSEEec7Xc=
X-Google-Smtp-Source: ABdhPJz9PfM0Rg/BH/F/zTz+sEmqFR7fWaO1laj/CwdbRYwjhOTCkMQkThF45nzYh2RLYxT9cR9T15lxpMj5YrhhpnU=
X-Received: by 2002:a92:d8cb:: with SMTP id l11mr5348907ilo.88.1603880868118;
 Wed, 28 Oct 2020 03:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com> <1603371365-30863-11-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1603371365-30863-11-git-send-email-weiyi.lu@mediatek.com>
From:   Fabien Parent <fparent@baylibre.com>
Date:   Wed, 28 Oct 2020 11:27:36 +0100
Message-ID: <CAOwMV_xh0=D+sEDZM4AOqid6XtGCenyjdzm=Go77DBaiuwe1Lg@mail.gmail.com>
Subject: Re: [PATCH 10/12] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT8183
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com,
        linux-kernel <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Weiyi,

The clock driver for MT8167 has been merged in v5.10-rc1. Can you also
apply the change to that driver.
Thank you

Fabien

On Fri, Oct 23, 2020 at 2:44 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> remove pll_en_bit(bit0) from en_mask to make en_mask a pure en_mask
> that only used for pll dividers.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 5046852..608108c 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1121,34 +1121,34 @@
>  };
>
>  static const struct mtk_pll_data plls[] = {
> -       PLL_B(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0x00000001,
> +       PLL_B(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0,
>                 HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0204, 24, 0x0, 0x0, 0,
>                 0x0204, 0, 0, armpll_div_table),
> -       PLL_B(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x0210, 0x021C, 0x00000001,
> +       PLL_B(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x0210, 0x021C, 0,
>                 HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0214, 24, 0x0, 0x0, 0,
>                 0x0214, 0, 0, armpll_div_table),
> -       PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0290, 0x029C, 0x00000001,
> +       PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0290, 0x029C, 0,
>                 HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0294, 24, 0x0, 0x0, 0,
>                 0x0294, 0, 0),
> -       PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0x00000001,
> +       PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0,
>                 HAVE_RST_BAR, BIT(24), 22, 8, 0x0224, 24, 0x0, 0x0, 0,
>                 0x0224, 0, 0),
> -       PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0230, 0x023C, 0x00000001,
> +       PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0230, 0x023C, 0,
>                 HAVE_RST_BAR, BIT(24), 22, 8, 0x0234, 24, 0x0, 0x0, 0,
>                 0x0234, 0, 0),
> -       PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0x00000001,
> +       PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0,
>                 0, 0, 22, 8, 0x0244, 24, 0x0, 0x0, 0, 0x0244, 0, 0,
>                 mfgpll_div_table),
> -       PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000001,
> +       PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0,
>                 0, 0, 22, 8, 0x0254, 24, 0x0, 0x0, 0, 0x0254, 0, 0),
> -       PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0260, 0x026C, 0x00000001,
> +       PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0260, 0x026C, 0,
>                 0, 0, 22, 8, 0x0264, 24, 0x0, 0x0, 0, 0x0264, 0, 0),
> -       PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0270, 0x027C, 0x00000001,
> +       PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0270, 0x027C, 0,
>                 HAVE_RST_BAR, BIT(23), 22, 8, 0x0274, 24, 0x0, 0x0, 0,
>                 0x0274, 0, 0),
> -       PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000001,
> +       PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0,
>                 0, 0, 32, 8, 0x02A0, 1, 0x02A8, 0x0014, 0, 0x02A4, 0, 0x02A0),
> -       PLL(CLK_APMIXED_APLL2, "apll2", 0x02b4, 0x02c4, 0x00000001,
> +       PLL(CLK_APMIXED_APLL2, "apll2", 0x02b4, 0x02c4, 0,
>                 0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
>  };
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
