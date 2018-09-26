Return-Path: <SRS0=Lp8A=MI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E79A1C43382
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9473321480
	for <linux-clk@archiver.kernel.org>; Wed, 26 Sep 2018 09:24:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9473321480
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbeIZPgH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Sep 2018 11:36:07 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:41122 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727352AbeIZPgH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Sep 2018 11:36:07 -0400
Received: by mail-ua1-f67.google.com with SMTP id f11-v6so3850562uaq.8;
        Wed, 26 Sep 2018 02:24:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0MMEVBkmvsBbwhqE5BnVUeqkN1NoUa2KgXRLwUfs9r4=;
        b=lajhzfWbixXkznj7omB9XqLL8ZBr+r8KqMRaB5v03j0jcDamg3zd46gR7/SvZrc4DV
         1a48iOieYoX9eRKyFyhKw+YbdN2ZsTUxXhL8uE9QtmrSmBKQfRJLlNLeKqFesa5fLmKh
         +MIUIPduBQmkYfxZdyjQBMpa+dp09hsFvSMmui6c3ivYamBE6ip1vpFHhLHfY6tKn2mT
         gnJwMWjCZ9mnRRCQYUZpZqH+ihVfXCHyWEM4eXk0ssEUuWNQz2rj/LrGKSMM34UQYkoh
         7QFGhx25Xk5A1eTowXFZwiBc1w0R6FiVmOYGWx4ll03uGuKPCppxoDwwRCldzPtCOV7G
         C2TA==
X-Gm-Message-State: ABuFfoi2f7xAhCAVWsikubrpLWa41J9i4gmy6iIkH355YV3z7mhoqE63
        6I4t+s2yBm3MNxLe9zy/228dVx39cFfbKtdaugY=
X-Google-Smtp-Source: ACcGV61wa7Zrf5b1QcRLDECrtnzBDq/YeB5vvNns603THw/NQW4RUFyTdoyqAl7nhQTaraXYnlPnE11/7UgGIEd+Ac0=
X-Received: by 2002:ab0:1e46:: with SMTP id n6-v6mr1477216uak.78.1537953844641;
 Wed, 26 Sep 2018 02:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20180924164937.36536-1-chris.brandt@renesas.com> <20180924164937.36536-2-chris.brandt@renesas.com>
In-Reply-To: <20180924164937.36536-2-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 26 Sep 2018 11:23:53 +0200
Message-ID:
 <CAMuHMdWhO0A6_wQR44QrB9TkOy6ka417cJN-9bkx8=_k=kfVAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] clk: renesas: cpg-mssr: Add early clock support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms+renesas@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180926092353.cBOnMCtjPItQ8GSfkd55JMRJCb2owaYY9hpAuouAlIk@z>

Hi Chris,

On Mon, Sep 24, 2018 at 6:50 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for SoCs that need to register core and module clocks early in
> order to use OF drivers that exclusively use macros such as
> TIMER_OF_DECLARE.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * List early clocks first
>  * Renamed early_priv to cpg_mssr_priv and make it static
>  * Always set cpg_mssr_priv(early_priv) because it is used for early and
>    non-early cases.
>  * of_iomap returns NULL on error, not negative number
>  * Removed various unnecessary comments
>  * Add __init to cpg_mssr_common_init
>  * fixed dev_set_drvdata was not being called for early drivers

Thanks for the update!
Works fine on R-Car Gen2 and Gen3.

> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c

> @@ -877,42 +879,43 @@ static const struct dev_pm_ops cpg_mssr_pm = {
>  #define DEV_PM_OPS     NULL
>  #endif /* CONFIG_PM_SLEEP && CONFIG_ARM_PSCI_FW */
>
> -static int __init cpg_mssr_probe(struct platform_device *pdev)
> +static int __init cpg_mssr_common_init(struct device *dev,
> +                                      struct device_node *np,
> +                                      const struct cpg_mssr_info *info)
>  {
> -       struct device *dev = &pdev->dev;
> -       struct device_node *np = dev->of_node;
> -       const struct cpg_mssr_info *info;
>         struct cpg_mssr_priv *priv;
>         unsigned int nclks, i;
> -       struct resource *res;
>         struct clk **clks;

In v1, you initialized clks to NULL, which was needed ...

>         int error;
>
> -       info = of_device_get_match_data(dev);
>         if (info->init) {
>                 error = info->init(dev);
>                 if (error)
>                         return error;
>         }
>
> -       priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +       priv = kzalloc(sizeof(*priv), GFP_KERNEL);
>         if (!priv)
>                 return -ENOMEM;
>
> +       priv->np = np;
>         priv->dev = dev;
>         spin_lock_init(&priv->rmw_lock);
>
> -       res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -       priv->base = devm_ioremap_resource(dev, res);
> -       if (IS_ERR(priv->base))
> -               return PTR_ERR(priv->base);
> +       priv->base = of_iomap(np, 0);
> +       if (!priv->base) {
> +               error = -ENOMEM;
> +               goto out_err;

... because else it's still uninitialized here ...
> +       }
>
>         nclks = info->num_total_core_clks + info->num_hw_mod_clks;
> -       clks = devm_kmalloc_array(dev, nclks, sizeof(*clks), GFP_KERNEL);
> -       if (!clks)
> -               return -ENOMEM;
> +       clks = kmalloc_array(nclks, sizeof(*clks), GFP_KERNEL);
> +       if (!clks) {
> +               error = -ENOMEM;
> +               goto out_err;
> +       }
>
> -       dev_set_drvdata(dev, priv);
> +       cpg_mssr_priv = priv;
>         priv->clks = clks;
>         priv->num_core_clks = info->num_total_core_clks;
>         priv->num_mod_clks = info->num_hw_mod_clks;
> @@ -923,16 +926,68 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
>         for (i = 0; i < nclks; i++)
>                 clks[i] = ERR_PTR(-ENOENT);
>
> +       error = of_clk_add_provider(np, cpg_mssr_clk_src_twocell_get, priv);
> +       if (error)
> +               goto out_err;
> +
> +       return 0;
> +
> +out_err:
> +       kfree(clks);

... and freed here.

> +       if (priv->base)
> +               iounmap(priv->base);
> +       kfree(priv);
> +
> +       return error;
> +}

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v4.20, with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
