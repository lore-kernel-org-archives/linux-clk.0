Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC5AC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  7 Dec 2021 19:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231778AbhLGTE2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 7 Dec 2021 14:04:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240804AbhLGTE1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Dec 2021 14:04:27 -0500
Received: from mail-ua1-x92c.google.com (mail-ua1-x92c.google.com [IPv6:2607:f8b0:4864:20::92c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0298BC061756
        for <linux-clk@vger.kernel.org>; Tue,  7 Dec 2021 11:00:56 -0800 (PST)
Received: by mail-ua1-x92c.google.com with SMTP id 30so224933uag.13
        for <linux-clk@vger.kernel.org>; Tue, 07 Dec 2021 11:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XUW31wASrpej0TIE+YgQ7k+2lttAbs6gSJFGK6RBLPs=;
        b=KotoaVRcY7w9F5qPYhg8uT5YU7vXM9Nap2d+E1Jj1bxEtOYIf9ruXQ2RAO0t2oh1Lx
         w1kS4gQlcV9cDX0SNOXlr102ieZAo7dWvX6DG4HYvRvBteqXn+BEqg240XGceQWaoTVE
         DCCPrFe/J/E5/oWvBD53iiUij4SwsK1uBtxB1d6Olh2xg74wAlivLavVKKltnXLE0SHT
         1qUkOGdgwae3JKT9EC7iLcVsFbHX7Q3ZeyNwsEfuTFZYHsT6aDnQTw/qeOq7dzDcpSUo
         dzAscOhwDrMuPGwa/hjXZ2imTvQxdzS7Q4UvbKsiAh2ygvo0cIqjg3oztvLwmNrGuAbe
         TgDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XUW31wASrpej0TIE+YgQ7k+2lttAbs6gSJFGK6RBLPs=;
        b=X+zrxe7FTag/JKo7IELaJ1APwh/QPJoKZga/yvlHVxb5D7G5IaEy+/ESt5LfAUvMvf
         2IwyP5+MhsYavvQFr7FBVf5Yz0OorO/KtF6d+uvxpapG3vSEiAOR85iPLkxD4n9LDQTp
         A7yFtnwqZjc4SChwLw/76pc4IpXqtx+PlOL6xWlbKAz0M4gR3yLiJbctmu7TXO1/t2Rt
         ndmDkhaJd/Js4SJVMeAwIsB33iYUBBx5JxGMH13Qs8t3qx7DRT33dTE7znKI1Vh3TxnB
         OH9bqSnG1/PtnUv2ZLyUjsSZUEIGP3fhGSGUOD6HbFxlE3RHbXvyoRpiwLzrcwWDKXv7
         W7Bg==
X-Gm-Message-State: AOAM531oIjxZzzB27r+gA9OOgaw3Hqcz7DAp+BFuZenWR/2VF/9fzmYO
        OPElD6kjDrJtiqkgPMuO7GoTpjOdiobJ/m66HYNguA==
X-Google-Smtp-Source: ABdhPJzv2fTwd3ja4cBNvXF6S3n5jGC34sPus7OnJwNyYndFTy2ncbXaEU8Qldo0qciKxLX0Ic5B597EeLxHxyLu55o=
X-Received: by 2002:a67:3382:: with SMTP id z124mr46939269vsz.57.1638903656074;
 Tue, 07 Dec 2021 11:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20211206153124.427102-1-virag.david003@gmail.com> <20211206153124.427102-6-virag.david003@gmail.com>
In-Reply-To: <20211206153124.427102-6-virag.david003@gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Tue, 7 Dec 2021 21:00:44 +0200
Message-ID: <CAPLW+4kSDHUsvHo0njykTTRGqaAehRt6MXdJF73OzR47avOm9Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] clk: samsung: clk-pll: Add support for pll1417x
To:     David Virag <virag.david003@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 6 Dec 2021 at 17:32, David Virag <virag.david003@gmail.com> wrote:
>
> pll1417x is used in Exynos7885 SoC for top-level integer PLLs.
> It is similar enough to pll0822x that practically the same code can
> handle both. The difference that's to be noted is that when defining a
> pl1417x PLL, the "con" parameter of the PLL macro should be set to the
> CON1 register instead of CON3, like this:
>
>     PLL(pll_1417x, CLK_FOUT_SHARED0_PLL, "fout_shared0_pll", "oscclk",
>         PLL_LOCKTIME_PLL_SHARED0, PLL_CON0_PLL_SHARED0,
>         NULL),
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Signed-off-by: David Virag <virag.david003@gmail.com>
> ---
> Changes in v2:
>   - Nothing
>
> Changes in v3:
>   - Nothing
>
> Changes in v4:
>   - Added R-b tag by Krzysztof Kozlowski
>
>  drivers/clk/samsung/clk-pll.c | 1 +
>  drivers/clk/samsung/clk-pll.h | 1 +
>  2 files changed, 2 insertions(+)
>
> diff --git a/drivers/clk/samsung/clk-pll.c b/drivers/clk/samsung/clk-pll.c
> index 83d1b03647db..70cdc87f714e 100644
> --- a/drivers/clk/samsung/clk-pll.c
> +++ b/drivers/clk/samsung/clk-pll.c
> @@ -1476,6 +1476,7 @@ static void __init _samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>                 else
>                         init.ops = &samsung_pll35xx_clk_ops;
>                 break;
> +       case pll_1417x:

I wonder why this switch have a bunch of fall through cases, but none
marked with "fallthrough;" line, and both checkpatch and "make" turn
blind eye on that? Anyway, I guess it's ok as is, just an observation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>

>         case pll_0822x:
>                 pll->enable_offs = PLL0822X_ENABLE_SHIFT;
>                 pll->lock_offs = PLL0822X_LOCK_STAT_SHIFT;
> diff --git a/drivers/clk/samsung/clk-pll.h b/drivers/clk/samsung/clk-pll.h
> index a739f2b7ae80..c83a20195f6d 100644
> --- a/drivers/clk/samsung/clk-pll.h
> +++ b/drivers/clk/samsung/clk-pll.h
> @@ -32,6 +32,7 @@ enum samsung_pll_type {
>         pll_2550xx,
>         pll_2650x,
>         pll_2650xx,
> +       pll_1417x,
>         pll_1450x,
>         pll_1451x,
>         pll_1452x,
> --
> 2.34.1
>
