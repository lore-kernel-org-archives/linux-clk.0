Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3C16C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Jul 2022 04:58:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231235AbiGAE6M (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Jul 2022 00:58:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbiGAE6J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Jul 2022 00:58:09 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82AA012E
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 21:58:07 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id r1so1287131plo.10
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 21:58:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gY0Ggj0gVc2fpcHO+oKyB8wUjDl2KOahldwI6RPDmmQ=;
        b=G0q9i36Ul5P19XS3EDjPEeFm6LJ+X+gmGkEmPWRk41zlTXtnsBp78ZZu8UBf+W2jJO
         P4YOwTjpgTpbEY3FMWoFDN2CKfvuMPH/UUnHZVs0eB2ko/D9aEMLMM6X4tuPVxBxOE4G
         OHIhgT3FOaRADCFychQQuLG6Comy44O6kJU1QpGI7uOxfDVdTJOn7nSAyK2XS3DBZkAC
         P2GnX34jX8YFUBULQJgTJspN0Gd8OaVPA6qC3ax4ALhHd4m+8ei+LbW4FE+8SmPLGOe0
         I4dM6pcjK4WwmoFp7PF+LnGN/ZnGb6UWOD8GAiy37Ty0K0zRhuUiFAV+Tc/E4X8lC/f0
         yG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gY0Ggj0gVc2fpcHO+oKyB8wUjDl2KOahldwI6RPDmmQ=;
        b=di2I+pPe1RkW3/01eAFG6s1Gg+ftwDaJVp8HEZ9kt2BCb2O9gIeBXQ4ZK7OokFeyYL
         Z4tot5+YU4jPwM2t3+/evfnuzinViGLvkIC/q8UNPIdIeuePAu3ltGXzVx9juCtMHnRG
         ipKcvOj9+fiYniLQ4VlwekmpWZMHC4mpd6Ls/+oBbEdtqQMVpHqLTkVOKGzvurmxB5Os
         BS41IKfT2QWe9Z2LyBnyeTaZDjbvaqWnRrbAJj2MzXNrWHC0h2rRyP16ZlglnFHO8uC8
         mVVoCLP5rin5ZneP2TwE6xbMtw9nEFgM3J9eC7E3c8xHJOkDGBLiaDrf8lJ64oACLimC
         lk+g==
X-Gm-Message-State: AJIora9ROQB4f6nmdOC819fKmCSb5RYnl8qi7gybRVEZGjmuZuUq/ATa
        L1JNL6ES7ADDHFY+LcuOBMhoFOsDJyBPT5XgJ1bfSJIc1FI=
X-Google-Smtp-Source: AGRyM1v/P1/KvBPrvSjCfUNnw5r6h/qPIiDF6xjqC1ocM4sGxjfvr0HcA2MBd7s8tkivoSJL0T/ns6S7Zw+bKDSKAng=
X-Received: by 2002:a17:903:18e:b0:16a:5f55:c4e with SMTP id
 z14-20020a170903018e00b0016a5f550c4emr18052975plg.33.1656651487062; Thu, 30
 Jun 2022 21:58:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220701024606.223438-1-windhl@126.com>
In-Reply-To: <20220701024606.223438-1-windhl@126.com>
From:   Orson Zhai <orsonzhai@gmail.com>
Date:   Fri, 1 Jul 2022 12:57:55 +0800
Message-ID: <CA+H2tpH62BC3skFiL4kHk=cURniwZZGuPWXs0QqzU2kRSCGiaw@mail.gmail.com>
Subject: Re: [PATCH v4] clk: sprd: Hold reference returned by of_get_parent()
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

On Fri, Jul 1, 2022 at 10:46 AM Liang He <windhl@126.com> wrote:
>
> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>
> Fixes: f95e8c7923d1 ("clk: sprd: support to get regmap from parent node")
> Signed-off-by: Liang He <windhl@126.com>

You are using the wrong patch number here.
Please re-send this patch with subject that begins with [PATCH V4] ...
and add Reviewed-by: Orson Zhai <orsonzhai@gmail.com>

Thanks.

-Orson

> ---
>  changelog:
>
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
> index d620bbbcdfc8..1b9c2aa0836f 100644
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
> +               regmap = device_node_to_regmap(np = of_get_parent(node));
> +               of_node_put(np);
>                 if (IS_ERR(regmap)) {
>                         dev_err(dev, "failed to get regmap from its parent.\n");
>                         return PTR_ERR(regmap);
> --
> 2.25.1
>
