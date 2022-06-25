Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98D32C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 25 Jun 2022 08:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232233AbiFYIgT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 25 Jun 2022 04:36:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231923AbiFYIgS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 25 Jun 2022 04:36:18 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C16931347
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 01:36:17 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id k127so4505411pfd.10
        for <linux-clk@vger.kernel.org>; Sat, 25 Jun 2022 01:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3G45Ha3MPAdx2Dfi/T7nhMmV+ZP9SJFb+X3NtmPtjsU=;
        b=nrwBrx8VMTuqaHQvQy41rutAX09/iP7ZitjiewlGC/aCrp6Lso6Vg+qYSCmc9CWlAc
         Jn0KDrwl1qMJJTJCCLZp1HSN6Q2Le9XQRLLW9TqMlkkPXery2H9cHjaITSoEHRMy5GEU
         MBEAgFxoC/+LypJJKZU22oVQrfKeNXUStg/JCqXOMqt78I5RiAbhNNZHa8XkORd6fDnd
         Ul6xSJUpnPQBzRPkMW4xPhqAwEm6YOuu7Jh7sPE84KUPlc++VmmhEBGvIO8CxzIlcddp
         9Dgbl+MmtaV0dcGc9YbFnbieMJLSiGcjILXsHGUBd6sHar8/4YxTP69auSg2i5ylBjPb
         uspA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3G45Ha3MPAdx2Dfi/T7nhMmV+ZP9SJFb+X3NtmPtjsU=;
        b=WqXvm0EYuO3ZthPOY+flZEEbQHtyidyzJsfSeZUQNQ2MZ1ZLaMbKpLavp/ARYMTxcm
         yt/Xnr4Nj7qdscp/bKb3aSHvZkQ5f+2EyUaZ3QcRSpFgubx5eCjrVy4etoe1rqO3P89c
         NChL5J/IxkR0usFYcEgYVFH7JgdGpb+nLYt8PslcHLLls4UiqwDLcEHvFazGUUjZxHHW
         BXDS3s8lHmSBvlR+QHaXoPwEoiJGc3uuqr6how5JwaKSo36hqw58upNgmAdZOvyzaflI
         4faCNZPTc2tLm4sRFOV1qJ8/yALbmhzEIbOftw0llGd0mZ8t8B1h/plns8+bb1glBIYl
         OlCA==
X-Gm-Message-State: AJIora8TCiw+m3a0sBmIEOw6VOyJuX7CjdJJCmfamDK0IqbJBgPKX2pa
        yzj49R6i6NEhn32iVtAtzax4PawqZRGsljV9dwU=
X-Google-Smtp-Source: AGRyM1uACz4brVUWA3kGx2xAzWmaK2fK3UnketOPqWVkrn+YSSGox3npCBY1tn2BHbrQJrIWoLyrFiPzz1kLAiuvSzc=
X-Received: by 2002:a63:8549:0:b0:40d:2864:efff with SMTP id
 u70-20020a638549000000b0040d2864efffmr2806826pgd.146.1656146176482; Sat, 25
 Jun 2022 01:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220624103809.4167753-1-windhl@126.com>
In-Reply-To: <20220624103809.4167753-1-windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Sat, 25 Jun 2022 16:36:04 +0800
Message-ID: <CA+H2tpEZ6GNYjZ669w4yxK7EPm8bk_uRdq+6-5Z95FpPy4S8nA@mail.gmail.com>
Subject: Re: [PATCH] clk/sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     mturquette@baylibre.com, Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Liang,

On Fri, Jun 24, 2022 at 6:39 PM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_out() for refcount balance.
>
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  these bugs are found in 5.19rc2
>  these bugs are confirmed not fixed by lore.kernel.org
>  these bugs are compiled tested in 5.19rc2 with at91_dt_defconfig
>
>  drivers/clk/sprd/common.c | 16 +++++++++++-----
>  1 file changed, 11 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index d620bbbcdfc8..08c1d7a9ec8b 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -41,35 +41,41 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>  {
>         void __iomem *base;
>         struct device *dev = &pdev->dev;
> -       struct device_node *node = dev->of_node;
> +       struct device_node *node = dev->of_node, *np;
>         struct regmap *regmap;
>
> +       np = of_get_parent(dev->of_node);
>         if (of_find_property(node, "sprd,syscon", NULL)) {
>                 regmap = syscon_regmap_lookup_by_phandle(node, "sprd,syscon");

Why not to call of_node_put() in this function?
He returns an error and it is his responsibility to clean up
everything he used, right?

-Orson

>                 if (IS_ERR(regmap)) {
>                         pr_err("%s: failed to get syscon regmap\n", __func__);
> +                       of_node_put(np);
>                         return PTR_ERR(regmap);
>                 }
> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> -                          "syscon")) {
> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> +       } else if (of_device_is_compatible(np, "syscon")) {
> +               regmap = device_node_to_regmap(np);
>                 if (IS_ERR(regmap)) {
> +                       of_node_put(np);
>                         dev_err(dev, "failed to get regmap from its parent.\n");
>                         return PTR_ERR(regmap);
>                 }
>         } else {
>                 base = devm_platform_ioremap_resource(pdev, 0);
> -               if (IS_ERR(base))
> +               if (IS_ERR(base)) {
> +                       of_node_put(np);
>                         return PTR_ERR(base);
> +               }
>
>                 regmap = devm_regmap_init_mmio(&pdev->dev, base,
>                                                &sprdclk_regmap_config);
>                 if (IS_ERR(regmap)) {
> +                       of_node_put(np);
>                         pr_err("failed to init regmap\n");
>                         return PTR_ERR(regmap);
>                 }
>         }
>
> +       of_node_put(np);
>         sprd_clk_set_regmap(desc, regmap);
>
>         return 0;
> --
> 2.25.1
>
