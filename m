Return-Path: <SRS0=0ksy=RL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E81FC43381
	for <linux-clk@archiver.kernel.org>; Fri,  8 Mar 2019 06:20:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5AE0D2081B
	for <linux-clk@archiver.kernel.org>; Fri,  8 Mar 2019 06:20:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GapW1JLa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbfCHGUj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Mar 2019 01:20:39 -0500
Received: from mail-qt1-f193.google.com ([209.85.160.193]:39753 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726039AbfCHGUj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Mar 2019 01:20:39 -0500
Received: by mail-qt1-f193.google.com with SMTP id o6so20099297qtk.6
        for <linux-clk@vger.kernel.org>; Thu, 07 Mar 2019 22:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R+gdPO7fY5tTH/m3FxX3K7mDEJi/gpdfcz2YIq3CUUg=;
        b=GapW1JLaJ6exck5zqur7H9xa6LmAY04nZ3nBYz09k36u0oV7tN2jIGNBTpqtrCPbdT
         cXLy7gjRYRVxbcX52KBPEgSDcEEEKEcudHSbHZvpKpN5kHIhhQwtEFiaUX/dVqnucA+T
         054dUzDhQbEo9zz9G+XjSUcx5vUkoOvzrtNOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R+gdPO7fY5tTH/m3FxX3K7mDEJi/gpdfcz2YIq3CUUg=;
        b=D/OC6HIybSmrnD/6osK/SoVi+rj0O0haOqr1j2KwcsFDkmZF/W9lYhIjI2COoIujD3
         duF/wgvfffACzuuPoqRmDYsAyoijO7T5B1vZfFF0XqbniycpceKLAvmTkduY/47Sw+Nf
         QcrXrfZsu3tYY3ga1xOmItGUrhrtq2QoZ+IAOWlANt8rN0dR/+7lK678Yg3yJGRcKUyb
         ZvbUTxZIDI5Mv36zAgy6XmEWTnwIv3Nxe3Sii61PrzasUHIWEaEnaNolVkJjMG5Pp8co
         mqPLI5weTH2X6EwVtKciucrxk4UeO/N58VcLnrc2E11gxUQ1mDyS4nls/S1zdMNrf5Iv
         Fgtg==
X-Gm-Message-State: APjAAAWoLBhkpfAY4n5Oi7s+JYjzJoCi0aw4UnWKS89F9fhPm7CissWu
        HvTrqRiB0Qy6KOunpih8baUK2qESe9ecT9uEt+vwxA==
X-Google-Smtp-Source: APXvYqycuNUCRTBMw9eqN926FLE+mJ/TQF1vIviboDCHHH8v9eqqiQH8JnCbme63zJLHB4w3GjItufwI04c64KSxwIA=
X-Received: by 2002:ac8:3015:: with SMTP id f21mr664920qte.144.1552026038286;
 Thu, 07 Mar 2019 22:20:38 -0800 (PST)
MIME-Version: 1.0
References: <20190305050546.23431-1-weiyi.lu@mediatek.com> <20190305050546.23431-5-weiyi.lu@mediatek.com>
In-Reply-To: <20190305050546.23431-5-weiyi.lu@mediatek.com>
From:   Nicolas Boichat <drinkcat@chromium.org>
Date:   Fri, 8 Mar 2019 14:20:27 +0800
Message-ID: <CANMq1KDciN76ZRL7kLPWM--3sHNi3bbjV86Sixm4R=QUKwrx1A@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] clk: mediatek: Add configurable pcwibits and fmin
 to mtk_pll_data
To:     Weiyi Lu <weiyi.lu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh@kernel.org>,
        James Liao <jamesjj.liao@mediatek.com>,
        Fan Chen <fan.chen@mediatek.com>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        srv_heupstream <srv_heupstream@mediatek.com>,
        stable@vger.kernel.org, Owen Chen <owen.chen@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Mar 5, 2019 at 1:06 PM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> From: Owen Chen <owen.chen@mediatek.com>
>
> 1. pcwibits: The integer bits of pcw for plls is extend to 8 bits,
>    add a variable to indicate this change and
>    backward-compatible.
> 2. fmin: The pll freqency lower-bound is vary from 1GMhz to

Minor nit: frequency (Stephen I guess you could fix that when applying...)

>    1.5Ghz, add a variable to indicate platform-dependent.
>
> Signed-off-by: Owen Chen <owen.chen@mediatek.com>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Acked-by: Sean Wang <sean.wang@kernel.org>

Reviewed-and-tested-by: Nicolas Boichat <drinkcat@chromium.org>

> ---
>  drivers/clk/mediatek/clk-mtk.h |  2 ++
>  drivers/clk/mediatek/clk-pll.c | 15 +++++++++++----
>  2 files changed, 13 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
> index f83c2bbb677e..11b5517903d0 100644
> --- a/drivers/clk/mediatek/clk-mtk.h
> +++ b/drivers/clk/mediatek/clk-mtk.h
> @@ -214,8 +214,10 @@ struct mtk_pll_data {
>         unsigned int flags;
>         const struct clk_ops *ops;
>         u32 rst_bar_mask;
> +       unsigned long fmin;
>         unsigned long fmax;
>         int pcwbits;
> +       int pcwibits;
>         uint32_t pcw_reg;
>         int pcw_shift;
>         const struct mtk_pll_div_table *div_table;
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 18842d660317..67aaa3082d9b 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -32,6 +32,8 @@
>  #define AUDPLL_TUNER_EN                BIT(31)
>
>  #define POSTDIV_MASK           0x7
> +
> +/* default 7 bits integer, can be overridden with pcwibits. */
>  #define INTEGER_BITS           7
>
>  /*
> @@ -68,12 +70,15 @@ static unsigned long __mtk_pll_recalc_rate(struct mtk_clk_pll *pll, u32 fin,
>                 u32 pcw, int postdiv)
>  {
>         int pcwbits = pll->data->pcwbits;
> -       int pcwfbits;
> +       int pcwfbits = 0;
> +       int ibits;
>         u64 vco;
>         u8 c = 0;
>
>         /* The fractional part of the PLL divider. */
> -       pcwfbits = pcwbits > INTEGER_BITS ? pcwbits - INTEGER_BITS : 0;
> +       ibits = pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BITS;
> +       if (pcwbits > ibits)
> +               pcwfbits = pcwbits - ibits;
>
>         vco = (u64)fin * pcw;
>
> @@ -170,9 +175,10 @@ static void mtk_pll_set_rate_regs(struct mtk_clk_pll *pll, u32 pcw,
>  static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
>                 u32 freq, u32 fin)
>  {
> -       unsigned long fmin = 1000 * MHZ;
> +       unsigned long fmin = pll->data->fmin ? pll->data->fmin : (1000 * MHZ);
>         const struct mtk_pll_div_table *div_table = pll->data->div_table;
>         u64 _pcw;
> +       int ibits;
>         u32 val;
>
>         if (freq > pll->data->fmax)
> @@ -196,7 +202,8 @@ static void mtk_pll_calc_values(struct mtk_clk_pll *pll, u32 *pcw, u32 *postdiv,
>         }
>
>         /* _pcw = freq * postdiv / fin * 2^pcwfbits */
> -       _pcw = ((u64)freq << val) << (pll->data->pcwbits - INTEGER_BITS);
> +       ibits = pll->data->pcwibits ? pll->data->pcwibits : INTEGER_BITS;
> +       _pcw = ((u64)freq << val) << (pll->data->pcwbits - ibits);
>         do_div(_pcw, fin);
>
>         *pcw = (u32)_pcw;
> --
> 2.18.0
>
