Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58B06C49EA2
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 07:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39EBA613CA
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 07:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbhFQH1o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 03:27:44 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:37871 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229580AbhFQH1o (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 03:27:44 -0400
Received: by mail-vk1-f179.google.com with SMTP id l194so170072vkl.4;
        Thu, 17 Jun 2021 00:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zuMKieSKmxG8G6e6NnP+NFsUXpSpwVQagRUZS8Xpj8k=;
        b=I9uHIsCd6ondXROIgg49yhGYOV2GftdPVe6DTFuRw8UcuxxmFCOKDPobFWMPXLQG4q
         2Yzs+VwMS3pKGm1bwAanoWgMJs7p0g4kZBKF7Rq8o7MuAuYmyXd2OKFpQVG+IKPLbFf4
         kve/Ordw8ewvuXr3YxYZrNTZ4+7y1lzm/2fwt/ZUvDGzh2RXzdZOqS/HGOmANJ3U7gRP
         CojbMmacP6jAbCnW/rFwfWqqIY1tfTkCn3MhrUSlMUeOHRDVIOl1LDdM5CF/BV2y4pWu
         bHOV1GMwYByfc8dluLZA+MQu9Qnyt/NxFgyHwun+IBYvBq0KPVXusCrm5tBGdtVuVNFQ
         Mbtg==
X-Gm-Message-State: AOAM531imwkhloaIumr7/xOmhmhmm/YFYKKc6JdZmAkw26/zwV54Rnh5
        ZjGovSr7it71hGH3yRgzsUyAz3UR95OocNukyGPYRxO6/Ww=
X-Google-Smtp-Source: ABdhPJzvCpVvadOl5WBHs+OiHYrT1fMnEQBf7jr+r1np8fr/EHlXA1Fd1ytjxUmUwLxpeLdoTw49gmUR6k1uT3/63L8=
X-Received: by 2002:a1f:9505:: with SMTP id x5mr2913477vkd.6.1623914736731;
 Thu, 17 Jun 2021 00:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <1623896524-102058-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1623896524-102058-1-git-send-email-yang.lee@linux.alibaba.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 17 Jun 2021 09:25:25 +0200
Message-ID: <CAMuHMdX53h16UuaC8VobKX20_3dQS1Ve+3a8oqX-oYeT6vTi5w@mail.gmail.com>
Subject: Re: [PATCH -next v2] clk: renesas: fix return value and unused assignment
To:     Yang Li <yang.lee@linux.alibaba.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jun 17, 2021 at 4:22 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
> Currently the function returns NULL on error, so exact error code is lost.
> This patch changes return convention of the function to use ERR_PTR()
> on error instead.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.15.

> --- a/drivers/clk/renesas/renesas-rzg2l-cpg.c
> +++ b/drivers/clk/renesas/renesas-rzg2l-cpg.c
> @@ -182,8 +182,7 @@ static unsigned long rzg2l_cpg_pll_clk_recalc_rate(struct clk_hw *hw,
>
>         pll_clk = devm_kzalloc(dev, sizeof(*pll_clk), GFP_KERNEL);
>         if (!pll_clk) {
> -               clk = ERR_PTR(-ENOMEM);
> -               return NULL;
> +               return ERR_PTR(-ENOMEM);
>         }

I'll drop the curly braces while applying.

>
>         parent_name = __clk_get_name(parent);

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
