Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0786AC43334
	for <linux-clk@archiver.kernel.org>; Wed,  6 Jul 2022 03:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229485AbiGFDbr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Jul 2022 23:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41354 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229480AbiGFDbq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Jul 2022 23:31:46 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66A3017AB6
        for <linux-clk@vger.kernel.org>; Tue,  5 Jul 2022 20:31:45 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id p9so2447008plr.11
        for <linux-clk@vger.kernel.org>; Tue, 05 Jul 2022 20:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gJueGo8flGx+5yDFbXZSAsJnRn4qoWofo8d+nuszbO8=;
        b=We2dnNqbuW5m4ibKdbXBecay3cTR14VK5XS+omZ6tr2qa7jj2CT9J9Yl8lwLcs4IkN
         ZPS9rTYF79um+eFtpjDyalR0SowVDmt6a79kxrhxsGlA4pSIjHOOxn9Dj4g4TP7pJxVN
         zpjLTRkraXGJhu3saDDbcClUbOHmr8I+11TL1x7MXNjcXf+wg+oXux2Y0hPgXW8bNaKo
         SbCiOuj088zfgDU0by0rkW/d+XUggn2ox+u27c2qjPFko4SdX0pI42jBZQ0Ku/qP0RLF
         G4D0tX8IqHU40IoftaxgT2fAtj3Kl61ETB6vEuloDnyLxCFwU4oZxVy/G1wW84lI/QJC
         iAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gJueGo8flGx+5yDFbXZSAsJnRn4qoWofo8d+nuszbO8=;
        b=VhVB7tuTt5JcGpGM81ALWKphHrYFwBmyUvTQi+xlhRBnPrn6DSVsVhOIXMURwVO1XJ
         cKGrRAy5j7ImGX+tduLMYoAnWBBXqmwrAkQFZHMGbA3acffud14XcWbFkVCSqHQ70o/B
         uQp5Gqqnr3r5xofHhnHQIjGojkLbl6xQgWmSEXQVnKqMJMeHdR+HCI78MmcZCWtQbt53
         RY3Syoitk7HfRDg5FHeWT2CLcRECF0h82ni6/Vp1Q99vqY2c1m0yN6duREHr2YCO4pKM
         ARY+5t4nAzBwMTSVbbATDVNEk3H8qwY9SaJLC+LZyKOWBpvkuJabIljCx5IXxYLGuiDX
         bVrw==
X-Gm-Message-State: AJIora87cY0sM4TF5RHF/W9wd7aKYU7pxHHTra07dqp2auvHBGzGsWAZ
        t0kz1PeTKCPa0jG5RY5GSWdMM3W/RishGYnRbRE=
X-Google-Smtp-Source: AGRyM1v7oA0D4xJcYJN7/CHo3spFhAp6BoE3vt0dN6NvGJIM+XKhEKsMI5bsdcUdqN9KNc76bLL5GjLTeM3GYYrCpos=
X-Received: by 2002:a17:90b:3510:b0:1ec:c617:acd1 with SMTP id
 ls16-20020a17090b351000b001ecc617acd1mr47264873pjb.47.1657078304923; Tue, 05
 Jul 2022 20:31:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220704004729.272481-1-windhl@126.com>
In-Reply-To: <20220704004729.272481-1-windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Wed, 6 Jul 2022 11:31:33 +0800
Message-ID: <CA+H2tpF2eNSo9CrQaB3wAFQV-bDZOOFwOcGt-cqSOrgx87rdUA@mail.gmail.com>
Subject: Re: [PATCH v5] clk: sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Liang,

On Mon, Jul 4, 2022 at 8:47 AM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> Signed-off-by: Liang He <windhl@126.com>

Reviewed-by: Orson Zhai <orsonzhai@gmail.com>

Great job.
Thanks.

-Orson

> ---
>  changelog:
>
>  v5: fix bug reported by Chunyan and confirmed by Orson
>  v4: fix another bug in the same place, missing in v3
>  v3: (1) keep original 'if-else if-else' coding style adviesd by Orson
>      (2) fix typo in commit-log: of_node_out --> of_node_put
>  v2: minimize the effective range of of_get_parent() advised by Orson
>  v1: hold reference returned by of_get_parent()
>
>
>  drivers/clk/sprd/common.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index d620bbbcdfc8..24db1df09075 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -41,7 +41,7 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>  {
>         void __iomem *base;
>         struct device *dev = &pdev->dev;
> -       struct device_node *node = dev->of_node;
> +       struct device_node *node = dev->of_node, *np;
>         struct regmap *regmap;
>
>         if (of_find_property(node, "sprd,syscon", NULL)) {
> @@ -50,9 +50,10 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>                         pr_err("%s: failed to get syscon regmap\n", __func__);
>                         return PTR_ERR(regmap);
>                 }
> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> -                          "syscon")) {
> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> +       } else if (of_device_is_compatible(np = of_get_parent(node), "syscon")
> +               || (of_node_put(np), 0)) {
> +               regmap = device_node_to_regmap(np);
> +               of_node_put(np);
>                 if (IS_ERR(regmap)) {
>                         dev_err(dev, "failed to get regmap from its parent.\n");
>                         return PTR_ERR(regmap);
> --
> 2.25.1
>
