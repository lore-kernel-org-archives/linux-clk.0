Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D7EC6369E
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 03:55:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5293524671
	for <linux-clk@archiver.kernel.org>; Wed, 18 Nov 2020 03:55:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Rm8kt3Vp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727336AbgKRDzH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Nov 2020 22:55:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727226AbgKRDzH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Nov 2020 22:55:07 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76C23C0613D4
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 19:55:07 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id d17so269304plr.5
        for <linux-clk@vger.kernel.org>; Tue, 17 Nov 2020 19:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NF71P8SL20XuWGpve1Ss/ZaRaSfeH/zBmcqp/hYzjCw=;
        b=Rm8kt3VpI/aWCK8QuAXnBlKQgakkQESmJbYWI+EwQjN3Yhd6FbRj4gxVQKNgjbSmbZ
         aAQ47/Wg+l6lGrGnnOQJJ5+KfsqV0N6Ud4/ecG9Xz1eQi65hzeq14Ct5S68NUsWhGwJX
         3LPYA5gpgSwVClpU/N+5JpD4zCu629F+y6UQ8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NF71P8SL20XuWGpve1Ss/ZaRaSfeH/zBmcqp/hYzjCw=;
        b=tfSZFtjDJVYdE7m0ACFfqFqNRfLu787tNHwV+Og5itjI9HyxIdCbUvLJGHJa82YMjL
         +EOb2QNCnRiWTN2vUoW9kS9fdayfw3Gfzl5HQbyxiyppXw1DHq36LMVE5sXbFabvUR5A
         PZO/lcKSTkalQbRAMdIu5R5vArHRGm4STxkdEAxtghMDEfB6FUVGQzMuq6E5iNgvtuLy
         wykHRhzYOyxFiQ9ihPpgQTShqCOayZQFn8Tw8Cr6uB6BuiGK6khGGg2yuAlhsGmdgQ0S
         s/Jf+37aW0ViASHlVBiTM0PjZgfxXqkuRYJUhZi0xNqEaG001Y+74UdKFJRLq+9aUbnt
         3aLw==
X-Gm-Message-State: AOAM533xzydZNGNDa93H/FSoZ6CUpFMQe49pJs4dq4wYxdGjftvEwYgQ
        Ohoy2Imc9TgYuUB+bGVTMHYTGQ==
X-Google-Smtp-Source: ABdhPJwrYH4odcpeAEWrzKDSnTEwhm/OO88XM2k1g4IF7+ohxJxegV50JUMuGHCnQDzpm2sHh6Ng3g==
X-Received: by 2002:a17:902:a705:b029:d6:e486:ef6 with SMTP id w5-20020a170902a705b02900d6e4860ef6mr2890732plq.0.1605671706956;
        Tue, 17 Nov 2020 19:55:06 -0800 (PST)
Received: from chromium.org ([2401:fa00:1:b:f693:9fff:fef4:a8fc])
        by smtp.gmail.com with ESMTPSA id 131sm7798031pfw.117.2020.11.17.19.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 19:55:06 -0800 (PST)
Date:   Wed, 18 Nov 2020 11:55:02 +0800
From:   Ikjoon Jang <ikjn@chromium.org>
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Yingjoe Chen <yingjoe.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 07/24] clk: mediatek: Fix asymmetrical PLL enable and
 disable control
Message-ID: <20201118035502.GB1049148@chromium.org>
References: <1604887429-29445-1-git-send-email-weiyi.lu@mediatek.com>
 <1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604887429-29445-8-git-send-email-weiyi.lu@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Nov 09, 2020 at 10:03:32AM +0800, Weiyi Lu wrote:
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

I have a question on this: Are there any possible problems on controlling
divider_en and bit0 at the same time? Or is this only for cleanups?

If mtk_pll_data::en_mask is not allowed to control with bit0 together,
I guess register_pll() also needs to check en_mask::bit0 is cleared?

> 
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
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
>  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>  	u32 r;
> +	u32 div_en_mask;
>  
>  	r = readl(pll->pwr_addr) | CON0_PWR_ON;
>  	writel(r, pll->pwr_addr);
> @@ -247,10 +248,15 @@ static int mtk_pll_prepare(struct clk_hw *hw)
>  	writel(r, pll->pwr_addr);
>  	udelay(1);
>  
> -	r = readl(pll->base_addr + REG_CON0);
> -	r |= pll->data->en_mask;
> +	r = readl(pll->base_addr + REG_CON0) | CON0_BASE_EN;
>  	writel(r, pll->base_addr + REG_CON0);
>  
> +	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +	if (div_en_mask) {
> +		r = readl(pll->base_addr + REG_CON0) | div_en_mask;
> +		writel(r, pll->base_addr + REG_CON0);
> +	}
> +
>  	__mtk_pll_tuner_enable(pll);
>  
>  	udelay(20);
> @@ -268,6 +274,7 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  {
>  	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
>  	u32 r;
> +	u32 div_en_mask;
>  
>  	if (pll->data->flags & HAVE_RST_BAR) {
>  		r = readl(pll->base_addr + REG_CON0);
> @@ -277,8 +284,13 @@ static void mtk_pll_unprepare(struct clk_hw *hw)
>  
>  	__mtk_pll_tuner_disable(pll);
>  
> -	r = readl(pll->base_addr + REG_CON0);
> -	r &= ~CON0_BASE_EN;
> +	div_en_mask = pll->data->en_mask & ~CON0_BASE_EN;
> +	if (div_en_mask) {
> +		r = readl(pll->base_addr + REG_CON0) & ~div_en_mask;
> +		writel(r, pll->base_addr + REG_CON0);
> +	}
> +
> +	r = readl(pll->base_addr + REG_CON0) & ~CON0_BASE_EN;
>  	writel(r, pll->base_addr + REG_CON0);
>  
>  	r = readl(pll->pwr_addr) | CON0_ISO_EN;
> -- 
> 1.8.1.1.dirty
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
