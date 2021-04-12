Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5958AC43617
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 09:31:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1078E61241
	for <linux-clk@archiver.kernel.org>; Mon, 12 Apr 2021 09:31:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239647AbhDLJbe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Apr 2021 05:31:34 -0400
Received: from mail-vk1-f169.google.com ([209.85.221.169]:44856 "EHLO
        mail-vk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240962AbhDLJZH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Apr 2021 05:25:07 -0400
Received: by mail-vk1-f169.google.com with SMTP id r196so2712183vkd.11;
        Mon, 12 Apr 2021 02:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4SHMD1oGY2Yw0vxxws1zV6FhECO5igomD0LqhlWJBF8=;
        b=U9rJIP1Z42ohACpM92IwMW0zGBMherp+60Ss/2DKTq0no3192Joz6L4q1pdqsQzerI
         dObVJayqOWX54jJehgD0QPNsHkSx/R8vTh+NhwObvqF5AjkSK15zBr/PRdYeQthsy9Fl
         tdxLnuWK55JJairDk5I3NMF7OqVUcukme17LDaAcESd9MBebhezMekafENCYg5hi9oOs
         0yC+z5xnrL+hdrF2CMa91+/lw0xzbBSlSMDwA5HnQ47K4kBJ12f9tPbYRGwxTVhaWc1g
         Niq9i0MeA6RCbzyTYiCLicD9NO/wLmPYgN9tjrwVrKkL5dXTq9/GlNi4vuADqJ1qGxt6
         RJ/w==
X-Gm-Message-State: AOAM5324wF/NT9Jy1laVWdRm6r+1wAjLcCLO7XBo1HL23ztuGcAa+h9U
        CLLwjksHpuLheHUEfaXR9A5/2IAVeoLMayOIDlE=
X-Google-Smtp-Source: ABdhPJz6H4I3RfTPV/+7eF6tq81iKBSPmhvjZbF2f9wIdDzpLsNpwUoIjlx4y7xBgY5IurLpS5eDhYdCxqR8sPk+a3g=
X-Received: by 2002:a1f:2502:: with SMTP id l2mr18469108vkl.5.1618219488852;
 Mon, 12 Apr 2021 02:24:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210409095150.2294437-1-yebin10@huawei.com>
In-Reply-To: <20210409095150.2294437-1-yebin10@huawei.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 12 Apr 2021 11:24:37 +0200
Message-ID: <CAMuHMdUBS2wk7pSC2+8rxsf_-ixMB30FwODDZsH6QE0-QGx=Qg@mail.gmail.com>
Subject: Re: [PATCH -next] clk: renesas: r8a77970: Use DEFINE_SPINLOCK() for spinlock
To:     Ye Bin <yebin10@huawei.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hulk Robot <hulkci@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ye,

On Fri, Apr 9, 2021 at 11:43 AM Ye Bin <yebin10@huawei.com> wrote:
> spinlock can be initialized automatically with DEFINE_SPINLOCK()
> rather than explicitly calling spin_lock_init().
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Ye Bin <yebin10@huawei.com>

Thanks for your patch, which looks correct to me.

> --- a/drivers/clk/renesas/r8a77970-cpg-mssr.c
> +++ b/drivers/clk/renesas/r8a77970-cpg-mssr.c
> @@ -47,7 +47,7 @@ enum clk_ids {
>         MOD_CLK_BASE
>  };
>
> -static spinlock_t cpg_lock;
> +static DEFINE_SPINLOCK(cpg_lock);

I think a better fix would be to start using the common cpg_lock, by #including
rcar-cpg-lib.h.

>
>  static const struct clk_div_table cpg_sd0h_div_table[] = {
>         {  0,  2 }, {  1,  3 }, {  2,  4 }, {  3,  6 },
> @@ -212,8 +212,6 @@ static int __init r8a77970_cpg_mssr_init(struct device *dev)
>         if (error)
>                 return error;
>
> -       spin_lock_init(&cpg_lock);
> -
>         cpg_pll_config = &cpg_pll_configs[CPG_PLL_CONFIG_INDEX(cpg_mode)];
>
>         return rcar_gen3_cpg_init(cpg_pll_config, CLK_EXTALR, cpg_mode);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
