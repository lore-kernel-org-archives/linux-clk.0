Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C868DC56201
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 16:54:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BDD7241A6
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 16:54:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="g7/8AdqS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727845AbgKSQya (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 11:54:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727832AbgKSQy3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 11:54:29 -0500
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 334F7C0613CF
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 08:54:28 -0800 (PST)
Received: by mail-wm1-x341.google.com with SMTP id a65so7377435wme.1
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2020 08:54:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=references:user-agent:from:to:cc:subject:in-reply-to:message-id
         :date:mime-version;
        bh=Pre/mXleRxkWrV0zeNG0MiK2Np2Ars6+gluS8m2UbzM=;
        b=g7/8AdqSbQsYEb9PUFTQ3a3KOsoPIGOnDcq14sdK6ToattoRbUIp4WXQKg/G+WTjcK
         af7mAQoNFyw7U7o6oGkqeIGfewuaG99mpUJm2HVwDoprkbyhzYP8TenSkuhqpVU2qkAn
         vAM4PNqL9rkct1SUe100jL4kqUBYLlJg2X67Naf7aGnKM9BqD2+u3TxwCumGD+OHHVmg
         ZxdXk/p/bUL06npXmaDf6GV2OTfGK92XZnOFrENqag/3MbX7AeOQGrmntKp6W7Pir2+j
         qPK5C9md2NgLS8HoDR/UH2r1sQgjQNeWyZuuEK/hgQHBmZd3/7Zaj00XwNDEIgtmMDJ2
         OWBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:references:user-agent:from:to:cc:subject
         :in-reply-to:message-id:date:mime-version;
        bh=Pre/mXleRxkWrV0zeNG0MiK2Np2Ars6+gluS8m2UbzM=;
        b=RdiomaW9PUPXlECXafLij8VGnJKtnC2l/HXJDpJk3e67yMwJeCNMCsmm5QsJQYXofm
         VQ6vuEJbvww7BzF74iBOckLDVnzWlbzWj7awkMVuEBJd0989+deOUF8bw+4tjq/WDUsC
         EuyLbYv65nRFDgYkEx7nzbkDGbEsbmqTfCMwnVElEzC7gkid9Tc9Obr0PI4LSbB2bvYY
         Ks5DFvN6XnJO0OmUG4cfkTCb4UYo23YxInJQ37V6ixBk/68ZhLXlTgAl007G5zcxKq5H
         b2LHFNtymzy+klKC8oIQrEnzKuhXAbaPQdOHmXoxsPYrO56GaiejVEtX6HSIMGYlLjPC
         6awQ==
X-Gm-Message-State: AOAM531Lp02OQmJU5i8z6QRLQmdlOfsBAgXZMosiFYwizKKZMIsY+Y6a
        wFE6mG6bmPmUVFjwe2vD3c6gZWLKKXYjm7Qq
X-Google-Smtp-Source: ABdhPJxxUNXKIBO762a9SwT38SgZCkHpkCUxcBFb9WWH4YVWzZb7Cns7uSo2RyvgGhLK7wjqYHzUwg==
X-Received: by 2002:a7b:ce0e:: with SMTP id m14mr5399583wmc.111.1605804866804;
        Thu, 19 Nov 2020 08:54:26 -0800 (PST)
Received: from localhost (253.35.17.109.rev.sfr.net. [109.17.35.253])
        by smtp.gmail.com with ESMTPSA id k16sm534051wrl.65.2020.11.19.08.54.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 08:54:26 -0800 (PST)
References: <20201118191405.36798-1-khilman@baylibre.com>
User-agent: mu4e 1.4.10; emacs 27.1
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Kevin Hilman <khilman@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Cc:     linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v2] clk: meson: enable building as modules
In-reply-to: <20201118191405.36798-1-khilman@baylibre.com>
Message-ID: <1jtutl8eym.fsf@starbuckisacylon.baylibre.com>
Date:   Thu, 19 Nov 2020 17:54:25 +0100
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Wed 18 Nov 2020 at 20:14, Kevin Hilman <khilman@baylibre.com> wrote:

> Make it possible to build all clk drivers as modules, but default
> remains built-in.
>
> No functional changes.
>
> Signed-off-by: Kevin Hilman <khilman@baylibre.com>
> Acked-by: Stephen Boyd <sboyd@kernel.org>

Applied

> ---
> v2: drop G12A Kconfig fix, separated out into separate patch
>
>  drivers/clk/meson/Kconfig       | 6 +++---
>  drivers/clk/meson/axg-aoclk.c   | 5 ++++-
>  drivers/clk/meson/axg.c         | 5 ++++-
>  drivers/clk/meson/g12a-aoclk.c  | 5 ++++-
>  drivers/clk/meson/g12a.c        | 5 ++++-
>  drivers/clk/meson/gxbb-aoclk.c  | 5 ++++-
>  drivers/clk/meson/gxbb.c        | 5 ++++-
>  drivers/clk/meson/meson-aoclk.c | 4 ++++
>  drivers/clk/meson/meson-eeclk.c | 3 +++
>  9 files changed, 34 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index 034da203e8e0..a3417f82aa84 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -58,7 +58,7 @@ config COMMON_CLK_MESON8B
>  	  want peripherals and CPU frequency scaling to work.
>  
>  config COMMON_CLK_GXBB
> -	bool "GXBB and GXL SoC clock controllers support"
> +	tristate "GXBB and GXL SoC clock controllers support"
>  	depends on ARM64
>  	default y
>  	select COMMON_CLK_MESON_REGMAP
> @@ -74,7 +74,7 @@ config COMMON_CLK_GXBB
>  	  Say Y if you want peripherals and CPU frequency scaling to work.
>  
>  config COMMON_CLK_AXG
> -	bool "AXG SoC clock controllers support"
> +	tristate "AXG SoC clock controllers support"
>  	depends on ARM64
>  	default y
>  	select COMMON_CLK_MESON_REGMAP
> @@ -100,7 +100,7 @@ config COMMON_CLK_AXG_AUDIO
>  	  aka axg, Say Y if you want audio subsystem to work.
>  
>  config COMMON_CLK_G12A
> -	bool "G12 and SM1 SoC clock controllers support"
> +	tristate "G12 and SM1 SoC clock controllers support"
>  	depends on ARM64
>  	default y
>  	select COMMON_CLK_MESON_REGMAP
> diff --git a/drivers/clk/meson/axg-aoclk.c b/drivers/clk/meson/axg-aoclk.c
> index b488b40c9d0e..af6db437bcd8 100644
> --- a/drivers/clk/meson/axg-aoclk.c
> +++ b/drivers/clk/meson/axg-aoclk.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include "meson-aoclk.h"
>  #include "axg-aoclk.h"
>  
> @@ -326,6 +327,7 @@ static const struct of_device_id axg_aoclkc_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, axg_aoclkc_match_table);
>  
>  static struct platform_driver axg_aoclkc_driver = {
>  	.probe		= meson_aoclkc_probe,
> @@ -335,4 +337,5 @@ static struct platform_driver axg_aoclkc_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(axg_aoclkc_driver);
> +module_platform_driver(axg_aoclkc_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/axg.c b/drivers/clk/meson/axg.c
> index 13fc0006f63d..7ca7ea7345e5 100644
> --- a/drivers/clk/meson/axg.c
> +++ b/drivers/clk/meson/axg.c
> @@ -13,6 +13,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/module.h>
>  
>  #include "clk-regmap.h"
>  #include "clk-pll.h"
> @@ -1354,6 +1355,7 @@ static const struct of_device_id clkc_match_table[] = {
>  	{ .compatible = "amlogic,axg-clkc", .data = &axg_clkc_data },
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
>  static struct platform_driver axg_driver = {
>  	.probe		= meson_eeclkc_probe,
> @@ -1363,4 +1365,5 @@ static struct platform_driver axg_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(axg_driver);
> +module_platform_driver(axg_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/g12a-aoclk.c b/drivers/clk/meson/g12a-aoclk.c
> index 62499563e4f5..b52990e574d2 100644
> --- a/drivers/clk/meson/g12a-aoclk.c
> +++ b/drivers/clk/meson/g12a-aoclk.c
> @@ -12,6 +12,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/reset-controller.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include "meson-aoclk.h"
>  #include "g12a-aoclk.h"
>  
> @@ -461,6 +462,7 @@ static const struct of_device_id g12a_aoclkc_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, g12a_aoclkc_match_table);
>  
>  static struct platform_driver g12a_aoclkc_driver = {
>  	.probe		= meson_aoclkc_probe,
> @@ -470,4 +472,5 @@ static struct platform_driver g12a_aoclkc_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(g12a_aoclkc_driver);
> +module_platform_driver(g12a_aoclkc_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index b814d44917a5..66094bfec2cc 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -15,6 +15,7 @@
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/clk.h>
> +#include <linux/module.h>
>  
>  #include "clk-mpll.h"
>  #include "clk-pll.h"
> @@ -5370,6 +5371,7 @@ static const struct of_device_id clkc_match_table[] = {
>  	},
>  	{}
>  };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
>  static struct platform_driver g12a_driver = {
>  	.probe		= meson_g12a_probe,
> @@ -5379,4 +5381,5 @@ static struct platform_driver g12a_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(g12a_driver);
> +module_platform_driver(g12a_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/gxbb-aoclk.c b/drivers/clk/meson/gxbb-aoclk.c
> index e940861a396b..fce95cf89836 100644
> --- a/drivers/clk/meson/gxbb-aoclk.c
> +++ b/drivers/clk/meson/gxbb-aoclk.c
> @@ -5,6 +5,7 @@
>   */
>  #include <linux/platform_device.h>
>  #include <linux/mfd/syscon.h>
> +#include <linux/module.h>
>  #include "meson-aoclk.h"
>  #include "gxbb-aoclk.h"
>  
> @@ -287,6 +288,7 @@ static const struct of_device_id gxbb_aoclkc_match_table[] = {
>  	},
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, gxbb_aoclkc_match_table);
>  
>  static struct platform_driver gxbb_aoclkc_driver = {
>  	.probe		= meson_aoclkc_probe,
> @@ -295,4 +297,5 @@ static struct platform_driver gxbb_aoclkc_driver = {
>  		.of_match_table = gxbb_aoclkc_match_table,
>  	},
>  };
> -builtin_platform_driver(gxbb_aoclkc_driver);
> +module_platform_driver(gxbb_aoclkc_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 0a68af6eec3d..d6eed760327d 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -8,6 +8,7 @@
>  #include <linux/init.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
> +#include <linux/module.h>
>  
>  #include "gxbb.h"
>  #include "clk-regmap.h"
> @@ -3519,6 +3520,7 @@ static const struct of_device_id clkc_match_table[] = {
>  	{ .compatible = "amlogic,gxl-clkc", .data = &gxl_clkc_data },
>  	{},
>  };
> +MODULE_DEVICE_TABLE(of, clkc_match_table);
>  
>  static struct platform_driver gxbb_driver = {
>  	.probe		= meson_eeclkc_probe,
> @@ -3528,4 +3530,5 @@ static struct platform_driver gxbb_driver = {
>  	},
>  };
>  
> -builtin_platform_driver(gxbb_driver);
> +module_platform_driver(gxbb_driver);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/meson-aoclk.c b/drivers/clk/meson/meson-aoclk.c
> index bf8bea675d24..f0858fe789bc 100644
> --- a/drivers/clk/meson/meson-aoclk.c
> +++ b/drivers/clk/meson/meson-aoclk.c
> @@ -14,6 +14,8 @@
>  #include <linux/reset-controller.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of_device.h>
> +#include <linux/module.h>
> +
>  #include <linux/slab.h>
>  #include "meson-aoclk.h"
>  
> @@ -84,3 +86,5 @@ int meson_aoclkc_probe(struct platform_device *pdev)
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  		(void *) data->hw_data);
>  }
> +EXPORT_SYMBOL_GPL(meson_aoclkc_probe);
> +MODULE_LICENSE("GPL v2");
> diff --git a/drivers/clk/meson/meson-eeclk.c b/drivers/clk/meson/meson-eeclk.c
> index a7cb1e7aedc4..8d5a5dab955a 100644
> --- a/drivers/clk/meson/meson-eeclk.c
> +++ b/drivers/clk/meson/meson-eeclk.c
> @@ -9,6 +9,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/regmap.h>
> +#include <linux/module.h>
>  
>  #include "clk-regmap.h"
>  #include "meson-eeclk.h"
> @@ -54,3 +55,5 @@ int meson_eeclkc_probe(struct platform_device *pdev)
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>  					   data->hw_onecell_data);
>  }
> +EXPORT_SYMBOL_GPL(meson_eeclkc_probe);
> +MODULE_LICENSE("GPL v2");

