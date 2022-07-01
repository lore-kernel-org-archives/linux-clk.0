Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C651C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 00:15:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231566AbiGAAPg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 20:15:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229810AbiGAAPg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 20:15:36 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 471BD396BA
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 17:15:35 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id r1so802565plo.10
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 17:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OmXd4zO8KTEmuxgoyZu7qWt54mbJvvQvUS/Whs7BaDY=;
        b=SMQW//3O/zpkih/dZQODLoXRdk8ATbOOBGK5XaUk0lLMUwD9pr5NGD/ySGtIDGlSio
         ykoMsGKzzgLcar0+ruvVOLeMxlecujijZDs7VRGyfnUpQIsQdYBO/LCsBSonMAQ9WAJT
         1ZNKC97TOF9WPU9U/UdOxR6bQS8s+zcRQ6xPrrfas51ykWGWGL/misdvxcQ3htW3Xlgn
         31YHMH+Zvq5kcmhEf5TdpVQTT7+WZUaoaflPldjavZnjU7P6a4neUE8rqbm/CdhtYg+p
         1kv1sni9ZqEeq2lpelVOnMQcDo4UcRWfcSsZpBshS1wxy3AG0pK9JM116QREPnOvfA+4
         1zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OmXd4zO8KTEmuxgoyZu7qWt54mbJvvQvUS/Whs7BaDY=;
        b=Sf5o0hfDwoFjOsoSH6n/QTb5zCnTHpV9uGshtd/xXbkBWTi2NoI3Ndq0FxD+vJaQnw
         oxBO4oahjd/8DZHJKK5jYz5hpsorISkkodLQaKs+xs97cYJBtG16AArsTnLoaACqRoQi
         Mzgmwbf/clTNuY/JSsgoMjvFXVyYPc7XZvf2hlvrD7Uv1D0+2vDfgKlyXxal2wuCxRqj
         MZnvPH5RbW+iW1n9muXkR2NurpQ1SVb0ZJxhkaD7+ZGv6K3xC9ZKkwuCAEWfesA3+9Ab
         IeD3CfgiH4hjQMNhjovI9w1gvlLCifl8i/kVLYoav5dbPX098p87vhxjiIdYO2gttlbU
         zMeA==
X-Gm-Message-State: AJIora+/918oZUP3Az36EofvHMWcEfcAhabe3wY2/q13PQtI86wy5MX+
        HCyFdk3SHxmWQynKKjE3KtFgqohVXU8lDfq3qg8=
X-Google-Smtp-Source: AGRyM1sln+cYWfyAm0wg6eSAr4VrJVJWMS3MPeGZCrZfQB+ZESKl9J3aU+UaJSRnpXDxJmTa8EDnxfKq4Q3L2UFcXcM=
X-Received: by 2002:a17:90a:760e:b0:1ec:83e0:3ae1 with SMTP id
 s14-20020a17090a760e00b001ec83e03ae1mr14512065pjk.25.1656634534846; Thu, 30
 Jun 2022 17:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220628135230.166601-1-windhl@126.com>
In-Reply-To: <20220628135230.166601-1-windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Fri, 1 Jul 2022 08:15:23 +0800
Message-ID: <CA+H2tpH1hN1AJ=6vVGQXw6bZ7xQDbzXdaEV_OqWMnw+UxQKCkg@mail.gmail.com>
Subject: Re: [PATCH v2] clk: sprd: Hold reference returned by of_get_parent()
To:     Liang He <windhl@126.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Lyra Zhang <zhang.lyra@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Liang,

On Tue, Jun 28, 2022 at 9:54 PM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_out() for refcount balance.

typo. s/out/put

>
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
>
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>
>  v2: minimize the effective range of of_get_parent() advised by Orson
>  v1: hold reference returned by of_get_parent()
>
>  v1-link: https://lore.kernel.org/all/20220624103809.4167753-1-windhl@126.com/
>
>  Patched file has been compiled test in 5.19rc2.
>
>  drivers/clk/sprd/common.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)
>
> diff --git a/drivers/clk/sprd/common.c b/drivers/clk/sprd/common.c
> index d620bbbcdfc8..d85ba80c5931 100644
> --- a/drivers/clk/sprd/common.c
> +++ b/drivers/clk/sprd/common.c
> @@ -50,23 +50,28 @@ int sprd_clk_regmap_init(struct platform_device *pdev,
>                         pr_err("%s: failed to get syscon regmap\n", __func__);
>                         return PTR_ERR(regmap);
>                 }
> -       } else if (of_device_is_compatible(of_get_parent(dev->of_node),
> -                          "syscon")) {
> -               regmap = device_node_to_regmap(of_get_parent(dev->of_node));
> -               if (IS_ERR(regmap)) {
> -                       dev_err(dev, "failed to get regmap from its parent.\n");
> -                       return PTR_ERR(regmap);
> -               }
>         } else {
> -               base = devm_platform_ioremap_resource(pdev, 0);
> -               if (IS_ERR(base))
> -                       return PTR_ERR(base);
> -
> -               regmap = devm_regmap_init_mmio(&pdev->dev, base,
> -                                              &sprdclk_regmap_config);
> -               if (IS_ERR(regmap)) {
> -                       pr_err("failed to init regmap\n");
> -                       return PTR_ERR(regmap);
> +               struct device_node *np = of_get_parent(dev->of_node);

move the declaration of "np" to the beginning part without assigning any value.

> +
> +               if (of_device_is_compatible(np, "syscon")) {

There may be no need to split the origin structure of "if...else if...else".
How about the following method?

                    else if (of_device_is_compatible(np =
of_get_parent(dev->of_node), "syscon")
                        || (of_node_put(np), 0)) {

> +                       regmap = device_node_to_regmap(np);
> +                       of_node_put(np);
> +                       if (IS_ERR(regmap)) {
> +                               dev_err(dev, "failed to get regmap from its parent.\n");
> +                               return PTR_ERR(regmap);
> +                       }
> +               } else {
> +                       of_node_put(np);

This line would not be necessary then.

-Orson

> +                       base = devm_platform_ioremap_resource(pdev, 0);
> +                       if (IS_ERR(base))
> +                               return PTR_ERR(base);
> +
> +                       regmap = devm_regmap_init_mmio(&pdev->dev, base,
> +                                                          &sprdclk_regmap_config);
> +                       if (IS_ERR(regmap)) {
> +                               pr_err("failed to init regmap\n");
> +                               return PTR_ERR(regmap);
> +                       }
>                 }
>         }
>
> --
> 2.25.1
>
