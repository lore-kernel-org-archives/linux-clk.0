Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77D2BC43381
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 10:36:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F1472310F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jan 2021 10:36:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbhAFKgm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Jan 2021 05:36:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726216AbhAFKgl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Jan 2021 05:36:41 -0500
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA6B4C06134C
        for <linux-clk@vger.kernel.org>; Wed,  6 Jan 2021 02:36:01 -0800 (PST)
Received: by mail-pg1-x52b.google.com with SMTP id g15so1943543pgu.9
        for <linux-clk@vger.kernel.org>; Wed, 06 Jan 2021 02:36:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L1cnw9R84EcEuAFdK1gfbZr56hSK67LYzd81NwtsrhE=;
        b=kVWP/wme3R43+nk50jvq2W8wtGsaGw8tt8AOLznBqaA1DqI6V6QfeiFaDbHXeQ00OO
         e+tkHQF+hkuv60KBtm2Yg1ALnf9EGmpWGgjinLNB9nAAqpFnLfkxefN5GzaQDeov/DUD
         +tlI5ThdjJiK2FMt7EM/n+p5nPySuLyju2C4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L1cnw9R84EcEuAFdK1gfbZr56hSK67LYzd81NwtsrhE=;
        b=n+iQ7S9eJCS9O4uQgrKFMb30S8mug4wwB6epfYPHpqWf86bolomVQJMshF4lzfSlNL
         TWCbS2ucE5BzUR/vSasRORPtsXlOZTzlxUCa7XvKxa7c0EA4/nSdTbW/Ews9YQvULfRM
         Az0y3g5HyDvYDNDIpq1FTsthpu0TcpiPYoAgXORDOF5UGOlZO+tRnyckwf9vcZGeK+uS
         JFnQ6mvEmQXHKA8K4q3eIm7cv0hQiEDhrSh7pkRWaOv1GpvP5gVE+qjPvE7Q0cSJQleU
         4lRQSq5wXC1rDURmsnCm24DVBdm5JUnqzJdQku1CeGZXhGs7rsLXVpxmso+K8ymqd9qV
         jXXQ==
X-Gm-Message-State: AOAM532q0R4kWWiRMsMsgPZ4KK0XiO8tXsdS65HrKfmjUPWdiS2eRKOz
        j0b9EUVbjCf1A/RpflUW0spoE731TlALBdOiizQ7Gg==
X-Google-Smtp-Source: ABdhPJwQotc5tTnS5l/MtLNrzr2++ahdfA3h44+Jt2jOSMPGuXsyacnypQTKNZfqRAmEOf4NC9M6sNI8OmJyKB6pDlo=
X-Received: by 2002:a63:1a48:: with SMTP id a8mr3889041pgm.257.1609929361226;
 Wed, 06 Jan 2021 02:36:01 -0800 (PST)
MIME-Version: 1.0
References: <1608642587-15634-1-git-send-email-weiyi.lu@mediatek.com> <1608642587-15634-8-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1608642587-15634-8-git-send-email-weiyi.lu@mediatek.com>
From:   Ikjoon Jang <ikjn@chromium.org>
Date:   Wed, 6 Jan 2021 18:35:50 +0800
Message-ID: <CAATdQgC42v+yj29df+CbP=6grhS-YMaw01NsCZBHmDJJ8zBt4A@mail.gmail.com>
Subject: Re: [PATCH v6 07/22] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        open list <linux-kernel@vger.kernel.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 22, 2020 at 9:12 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> In fact, the en_mask is a combination of divider enable mask
> and pll enable bit(bit0).
> Before this patch, we enabled both divider mask and bit0 in prepare(),
> but only cleared the bit0 in unprepare().
> In the future, we hope en_mask will only be used as divider enable mask.
> The enable register(CON0) will be set in 2 steps:
> first is divider mask, and then bit0 during prepare(), and vice versa.
> But considering backward compatibility, at this stage we allow en_mask
> to be a combination or a pure divider enable mask.
> And then we will make en_mask a pure divider enable mask in another
> following patch series.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

> ---
>  drivers/clk/mediatek/clk-pll.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index f440f2cd..11ed5d1 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -238,6 +238,7 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>         u32 r;
> +       u32 div_en_mask;
>
>         r = readl(pll->pwr_addr) | CON0_PWR_ON;
>         writel(r, pll->pwr_addr);
> @@ -247,10 +248,15 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>         writel(r, pll->pwr_addr);
>         udelay(1);
>
> -       r = readl(pll->base_addr + REG_CON0);
> -       r |= pll->data->en_mask;
> +       r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
>         writel(r, pll->base_addr + REG_CON0);
>
> +       div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +       if (div_en_mask) {
> +               r = readl(pll->base_addr + REG_CON0) | div_en_mask;
> +               writel(r, pll->base_addr + REG_CON0);
> +       }
> +
>         __mtk_pll_tuner_enable(pll);
>
>         udelay(20);
> @@ -268,6 +274,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  {
>         struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>         u32 r;
> +       u32 div_en_mask;
>
>         if (pll->data->flags & HAVE_RST_BAR) {
>                 r = readl(pll->base_addr + REG_CON0);
> @@ -277,8 +284,13 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>
>         __mtk_pll_tuner_disable(pll);
>
> -       r = readl(pll->base_addr + REG_CON0);
> -       r &= ~CON0_BASE_EN;
> +       div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +       if (div_en_mask) {
> +               r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
> +               writel(r, pll->base_addr + REG_CON0);
> +       }
> +
> +       r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
>         writel(r, pll->base_addr + REG_CON0);
>
>         r = readl(pll->pwr_addr) | CON0_ISO_EN;
> --
> 1.8.1.1.dirty
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
