Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2BEC43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 12:39:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233087AbiF3Mjz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 08:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230400AbiF3Mjz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 08:39:55 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08663EAA1
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 05:39:53 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id t17-20020a1c7711000000b003a0434b0af7so1602866wmi.0
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 05:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=references:user-agent:from:to:subject:date:in-reply-to:message-id
         :mime-version;
        bh=onRz6HZZnK4M7+ORgggWPl/MQlI1fIzsNo7EEmBZFMo=;
        b=rwPOEUPpi00yrOztls7Amc71uxI4Q1cDElwcX6WcIHSm0ZOnys2/cUj0IvY3lF/BKM
         4Dop1ldY/+2qWtf9HQzU4tIvoHtQ1+coXQ+L3q6CntYNwwMFWMe9iVfYE4H4x8A3vpcb
         taYG8q9C3O2RhWzenLvazoqsFGzIWAnrHxhGuUHrQCbo7dCxvlihv6MFR01lJkAA1q0M
         G7Zd8aUY0rdyFt1o/8U+WvpAIILALLjAdJX6NXUKiFIaES4z4StXm3roocypHrs3UATJ
         h7hcKerTENNntf2hdq2g45YOPv6tG44X4SaGhLsDyDZKNJ3OIlP2dbEmfcWrxr8cewO+
         zcIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:references:user-agent:from:to:subject:date
         :in-reply-to:message-id:mime-version;
        bh=onRz6HZZnK4M7+ORgggWPl/MQlI1fIzsNo7EEmBZFMo=;
        b=R3ZAowCEVBWHqJbyovAhCGSBO7sOh3pyRSqZ1J5OrDtR94Qvs9IgPYYFgLt2I8V9Ag
         tfu0vN3amXpNISXGIFiSL602PYOOfxRiuJv7nwp7P4JoYroOgTZduPsPsZvs57Y47+Kk
         NbRexZwFa9Vk7JLb5ZfLHJKlno7sWSM4ItZYujpNtMtVGZrUQD0QscoFBFGsz46uUg89
         QDOa0klvsgfBU4dbjvNyVBOqyCCJ5VsHfE1LiRICCjG2UjDv26lmcbNlthHPyRzWWctF
         2A4FoBPKg9uz/imKXjKp85y+AGe0kFecDg4WyyiSdnx2EncurEG5M5EIKqaWqR9i5y26
         1aOg==
X-Gm-Message-State: AJIora9kkHwLDvfj+hQdbTUYYpIS9xELeFZ4zL6m36P0wd+TGTXxIsP/
        jp+XQ1ebuA244IDM4IeDKTyXOg==
X-Google-Smtp-Source: AGRyM1uDPuEgJ73woaDaCJHLrpV66ANxzGEMftnF6AYV61hYSzuklfYUug9eA21Gb8TxzECBGGzh7A==
X-Received: by 2002:a05:600c:3ba7:b0:3a0:5831:57f0 with SMTP id n39-20020a05600c3ba700b003a0583157f0mr11832717wms.206.1656592792305;
        Thu, 30 Jun 2022 05:39:52 -0700 (PDT)
Received: from localhost (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id l10-20020a5d560a000000b0021b9270de3csm20415757wrv.10.2022.06.30.05.39.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 05:39:51 -0700 (PDT)
References: <20220628141038.168383-1-windhl@126.com>
User-agent: mu4e 1.6.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     narmstrong@baylibre.com, mturquette@baylibre.com, sboyd@kernel.org,
        khilman@baylibre.com, martin.blumenstingl@googlemail.co,
        linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org,
        windhl@126.com
Subject: Re: [PATCH v2] clk: meson: Hold reference returned by of_get_parent()
Date:   Thu, 30 Jun 2022 14:29:30 +0200
In-reply-to: <20220628141038.168383-1-windhl@126.com>
Message-ID: <1jbkua1g15.fsf@starbuckisacylon.baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue 28 Jun 2022 at 22:10, Liang He <windhl@126.com> wrote:

> We should hold the reference returned by of_get_parent() and use it
> to call of_node_put() for refcount balance.
>
> Fixes: 88e2da81241e ("clk: meson: aoclk: refactor common code into dedicated file")
> Fixes: 6682bd4d443f ("clk: meson: factorise meson64 peripheral clock controller drivers")
> Fixes: bb6eddd1d28c ("clk: meson: meson8b: use the HHI syscon if available")

Fixing different commits with a single one is not going to make stable
backport easy. I would prefer if you could submit a patch for each
fixes/driver.

Not blocking for a v3 but worth considering after looking at the number
of drivers making the same mistake:
* make a syscon function to deal with of_get_parent(),
  syscon_node_to_regmap() and of_node_put() instead of duplicating the
  code everywhere.
* Propose a coccinelle script to detect/fix this in the future

>
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  changelog:
>  
>  v2: change the name of 'tp', change the title format, keep reverse christmas tree
>  v1: hold reference returned by of_get_parent()
>
>  v1-link: https://lore.kernel.org/all/20220624102719.4166125-1-windhl@126.com/
>
>  Patched files have been compiled test in 5.19rc2.
>
>
>  drivers/clk/meson/meson-aoclk.c | 5 ++++-
>  drivers/clk/meson/meson-eeclk.c | 5 ++++-
>  drivers/clk/meson/meson8b.c     | 5 ++++-
>  3 files changed, 12 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index 27cd2c1f3f61..434cd8f9de82 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -38,6 +38,7 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  	struct meson_aoclk_reset_controller *rstc;
>  	struct meson_aoclk_data *data;
>  	struct device *dev = &pdev->dev;
> +	struct device_node *np;
>  	struct regmap *regmap;
>  	int ret, clkid;
>  
> @@ -49,7 +50,9 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  	if (!rstc)
>  		return -ENOMEM;
>  
> -	regmap = syscon_node_to_regmap(of_get_parent(dev->of_node));
> +	np = of_get_parent(dev->of_node);
> +	regmap = syscon_node_to_regmap(np);
> +	of_node_put(np);
>  	if (IS_ERR(regmap)) {
>  		dev_err(dev, "failed to get regmap\n");
>  		return PTR_ERR(regmap);
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index 8d5a5dab955a..0e5e6b57eb20 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -18,6 +18,7 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  {
>  	const struct meson_eeclkc_data *data;
>  	struct device *dev = &pdev->dev;
> +	struct device_node *np;
>  	struct regmap *map;
>  	int ret, i;
>  
> @@ -26,7 +27,9 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  		return -EINVAL;
>  
>  	/* Get the hhi system controller node */
> -	map = syscon_node_to_regmap(of_get_parent(dev->of_node));
> +	np = of_get_parent(dev->of_node);
> +	map = syscon_node_to_regmap(np);
> +	of_node_put(np);
>  	if (IS_ERR(map)) {
>  		dev_err(dev,
>  			"failed to get HHI regmap\n");
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8f3b7a94a667..827e78fb16a8 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -3792,12 +3792,15 @@ static void __init meson8b_clkc_init_common(struct device_node *np,
>  			struct clk_hw_onecell_data *clk_hw_onecell_data)
>  {
>  	struct meson8b_clk_reset *rstc;
> +	struct device_node *parent_np;
>  	const char *notifier_clk_name;
>  	struct clk *notifier_clk;
>  	struct regmap *map;
>  	int i, ret;
>  
> -	map = syscon_node_to_regmap(of_get_parent(np));
> +	parent_np = of_get_parent(np);
> +	map = syscon_node_to_regmap(parent_np);
> +	of_node_put(parent_np);
>  	if (IS_ERR(map)) {
>  		pr_err("failed to get HHI regmap - Trying obsolete regs\n");
>  		return;

