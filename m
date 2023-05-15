Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74E37C77B7D
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 14:03:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239353AbjEOODq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 10:03:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238764AbjEOODo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 10:03:44 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B12472690
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 07:03:10 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-50bc0117683so22733725a12.1
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 07:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684159383; x=1686751383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=z0DiisSo683m3i0CtQ3yQWMKcJ8Co/s5M4sF/kacxHs=;
        b=hIyeq/mPeDlCaya/kKezu+rqFTtatpC901dim+Ujyz0g+bz8yMHx4Jweh8MWvJZUjH
         yxQZBWKvDb9Nd78PTR+MC0aQ7cdvDHA1qL7l/4O0Y1vY5l2zPPEC1CPZipLEiy6b4+sX
         Er7K2alvATSLEQg2fLhPYB7m9WiATe4qBtyAI85iCsGAQif6VVjOoRwHGIkk2dIvwccb
         6xiZ0lD9KINRaxe/n1yPwz661NcQJSWI1CEdL1Cws6WQf1h+KfmD/U1zOAaYGXD94fuI
         OxngoTY4F28ujeYCUR3tWoUjyYYEPmj0hC4zc+RtbR4IvUVKCEH0yl6SEkRsclVMZQPC
         bK6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684159383; x=1686751383;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z0DiisSo683m3i0CtQ3yQWMKcJ8Co/s5M4sF/kacxHs=;
        b=CEoKsfZS/DA7dmQJtk3ViO0+51rp1lhw7xVAMerKfAmHF+GfW9sJydUO5ELaG4wWgE
         QU2byc24achPrU3zqr4Y/CGpts3zXq3gwhXbnomuWHV3g29/QU/U9rQJROf7sJ72EfbF
         gpaFssBso40qwoDTkbSQuQG0Fz3xTzSKCyQ3B7DV7AIHmu1smlL78W5btZEeeSlz1McE
         lKZsm8B25q8Ln4cxDsTnMUJYpXNtS/D1xw+3f7cCZHvyVvsI+CKF/H9RZyVYAPn5NFXp
         em1kcso7Sx97uAh0KIJch98F1GJa+EaSI0iHTNnbsw8MJRBSdoEmwy00jXEOYlOlZTPd
         6ZHQ==
X-Gm-Message-State: AC+VfDzT57TffRNa0pCkE1GGL8ARoxaWYmORZ+//RIsW0aB6Ir5JLO7I
        I8clXdgxCUiYqSZaM4gvnXCUKA==
X-Google-Smtp-Source: ACHHUZ6jy8PlGoDXknS54H8Fbgy6cRaFw0JExzPbUPci3eXrUJzDLcT1vD+HtAvXFBb0dXQeDs8qDQ==
X-Received: by 2002:a05:6402:61a:b0:506:82b7:10c3 with SMTP id n26-20020a056402061a00b0050682b710c3mr26792321edv.41.1684159382974;
        Mon, 15 May 2023 07:03:02 -0700 (PDT)
Received: from blmsp ([2001:4090:a246:80f3:8aa8:d43a:eac2:eb38])
        by smtp.gmail.com with ESMTPSA id h21-20020aa7c615000000b0050bcaedc299sm7329847edq.33.2023.05.15.07.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 07:02:23 -0700 (PDT)
Date:   Mon, 15 May 2023 16:01:53 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Message-ID: <20230515140153.ppjl4zyshscvcbuu@blmsp>
References: <20230511133226.913600-1-msp@baylibre.com>
 <8603c2b2-2a5b-48f6-9b08-9b3b518b716b@gmail.com>
 <aa383909-7a03-eb24-3a61-397f2a6adb54@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aa383909-7a03-eb24-3a61-397f2a6adb54@collabora.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, May 15, 2023 at 01:49:54PM +0200, AngeloGioacchino Del Regno wrote:
> Il 12/05/23 13:51, Matthias Brugger ha scritto:
> > 
> > 
> > On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
> > > The given operations are inverted for the wrong registers which makes
> > > multiple of the mt8365 hardware units unusable. In my setup at least usb
> > > did not work.
> > > 
> > > Fixed by swapping the operations with the inverted ones.
> 
> ...with the not inverted ones, you mean!

Actually now I am not sure how to express it correctly, maybe I should
have just left that sentence out of the commit message.

I meant replacing the no_setclr_inv with no_setclr for TOP0 and no_setclr with
no_setclr_inv for TOP1/2.

Best,
Markus

> 
> Anyway,
> 
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> > > 
> > > Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
> > > Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to
> > > mtk_gate clocks")
> > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > 
> > > ---
> > >   drivers/clk/mediatek/clk-mt8365.c | 6 +++---
> > >   1 file changed, 3 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
> > > index 6b4e193f648d..6d785ec5754d 100644
> > > --- a/drivers/clk/mediatek/clk-mt8365.c
> > > +++ b/drivers/clk/mediatek/clk-mt8365.c
> > > @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
> > >   #define GATE_TOP0(_id, _name, _parent, _shift)            \
> > >       GATE_MTK(_id, _name, _parent, &top0_cg_regs,        \
> > > -         _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > > +         _shift, &mtk_clk_gate_ops_no_setclr)
> > >   #define GATE_TOP1(_id, _name, _parent, _shift)            \
> > >       GATE_MTK(_id, _name, _parent, &top1_cg_regs,        \
> > > -         _shift, &mtk_clk_gate_ops_no_setclr)
> > > +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > >   #define GATE_TOP2(_id, _name, _parent, _shift)            \
> > >       GATE_MTK(_id, _name, _parent, &top2_cg_regs,        \
> > > -         _shift, &mtk_clk_gate_ops_no_setclr)
> > > +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
> > >   static const struct mtk_gate top_clk_gates[] = {
> > >       GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
> 
> 
