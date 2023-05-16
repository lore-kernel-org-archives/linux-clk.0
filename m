Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1411C77B7A
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 15:41:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233988AbjEPPlr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 11:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234012AbjEPPli (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 11:41:38 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BD0E6E91
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 08:41:31 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id 71dfb90a1353d-44fa6454576so5055033e0c.0
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 08:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1684251690; x=1686843690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUlgGwi/Bid+V+vNq0ihjnvnFHGXCmk1OrWz555v4NM=;
        b=PwfMKsdb+yRpZ4onFvCLkAE93SmlnNm0Ta3+o6TB28KIbmR8tK1ZYoO5t9fa4TfPDk
         lw9jaDL9fSmEFurrwzHmqYRCZPO8h/K8PRgP03l8Rpkpy/9kOa4cFt8n8j/IGa4PjN5e
         xe06l6ToYOPFrMKxW5ChRmmbw1TPJSTuq+KM+CMWNiIY1fnlHEq2AdRLU0uXN/ihPxLl
         D4LDqU8lNz6pSLUwB9xkU6A2/8AVlFvNoTVW4QYLQKPr6NwqWVxkKiNB3QSdLhGbe7dD
         zgCFO+ccPHibN/JBS4R/XtUiJFNonfUTYhe+mKZxY061UdbpsdpRUasBFCuuRG8NRtaP
         d4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684251690; x=1686843690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUlgGwi/Bid+V+vNq0ihjnvnFHGXCmk1OrWz555v4NM=;
        b=GYAckGtsVA36pfoez9humsyhkbqk/ZA+kwMHo6CKG/UpPCcU9mCwhGB7PDP8gx7t5x
         gjD1xnoPRTfQWR0GYTTLCrBhO6O22ho3JKlcrC1NoUx8V8cf7qLUVN+5jAtMz88zYu7E
         vYkoSh/glm63pocSPMmJYleMcWvi6OSEar3l3zQgNeuk0MMe7H9yjdPEreN+Njl7u1Ap
         GEWk/ktNftZqa06QtRllyRfKzaffdDIoBWomLmP6vMos2YX8877pidNTn64huM42gzGG
         ujgAMxBiV5SaCFppgjplegAlPEDBgEu56qRgJmMv0j6MFQtPthLHmD/X93CGFRPsn0g3
         D3Qw==
X-Gm-Message-State: AC+VfDyrqPZb5Ov/XMLr1HzMLkJWjVjOXlTJuc2htmpKKfXLyZk8ampt
        gZDPrntfY6LTpY3fY3i6jIkH4TLi3iNbdIqiAZR7/A==
X-Google-Smtp-Source: ACHHUZ7geFgnpKprltmekDwePERwLI1/NGr2YZczOVKccWMobKpDNL54KOiEZyFYlCUv/sA4Wmnqgjfv0BdhoMFOVIs=
X-Received: by 2002:a1f:bd47:0:b0:44f:cc25:2007 with SMTP id
 n68-20020a1fbd47000000b0044fcc252007mr12901502vkf.11.1684251690642; Tue, 16
 May 2023 08:41:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230516153109.514251-1-arnd@kernel.org> <20230516153109.514251-2-arnd@kernel.org>
In-Reply-To: <20230516153109.514251-2-arnd@kernel.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Tue, 16 May 2023 17:41:19 +0200
Message-ID: <CAMRc=MdHC=PPs2f3XXpRF5705553dXgVaVpN1kbRzypoeuOpRQ@mail.gmail.com>
Subject: Re: [PATCH 01/13] ARM: davinci: fix davinci_cpufreq_init() declaration
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     soc@kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Russell King <linux@armlinux.org.uk>,
        Hartley Sweeten <hsweeten@visionengravers.com>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 16, 2023 at 5:31=E2=80=AFPM Arnd Bergmann <arnd@kernel.org> wro=
te:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The davinci_cpufreq_init() declaration is only seen by its caller
> but not the definition:
>
> drivers/cpufreq/davinci-cpufreq.c:153:12: error: no previous prototype fo=
r 'davinci_cpufreq_init'
>
> Move it into the platform_data header that is already used an
> interface between the two places.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/mach-davinci/common.c                | 1 +
>  arch/arm/mach-davinci/common.h                | 6 ------
>  include/linux/platform_data/davinci-cpufreq.h | 6 ++++++
>  3 files changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm/mach-davinci/common.c b/arch/arm/mach-davinci/commo=
n.c
> index c1ce6b2a8d48..7bc7018688de 100644
> --- a/arch/arm/mach-davinci/common.c
> +++ b/arch/arm/mach-davinci/common.c
> @@ -11,6 +11,7 @@
>  #include <linux/etherdevice.h>
>  #include <linux/davinci_emac.h>
>  #include <linux/dma-mapping.h>
> +#include <linux/platform_data/davinci-cpufreq.h>
>
>  #include <asm/tlb.h>
>  #include <asm/mach/map.h>
> diff --git a/arch/arm/mach-davinci/common.h b/arch/arm/mach-davinci/commo=
n.h
> index b2a96cdf88da..010ba1df27b3 100644
> --- a/arch/arm/mach-davinci/common.h
> +++ b/arch/arm/mach-davinci/common.h
> @@ -55,12 +55,6 @@ extern void davinci_common_init(const struct davinci_s=
oc_info *soc_info);
>  extern void davinci_init_ide(void);
>  void davinci_init_late(void);
>
> -#ifdef CONFIG_CPU_FREQ
> -int davinci_cpufreq_init(void);
> -#else
> -static inline int davinci_cpufreq_init(void) { return 0; }
> -#endif
> -
>  #ifdef CONFIG_SUSPEND
>  int davinci_pm_init(void);
>  #else
> diff --git a/include/linux/platform_data/davinci-cpufreq.h b/include/linu=
x/platform_data/davinci-cpufreq.h
> index bc208c64e3d7..1ef91c36f609 100644
> --- a/include/linux/platform_data/davinci-cpufreq.h
> +++ b/include/linux/platform_data/davinci-cpufreq.h
> @@ -16,4 +16,10 @@ struct davinci_cpufreq_config {
>         int (*init)(void);
>  };
>
> +#ifdef CONFIG_CPU_FREQ
> +int davinci_cpufreq_init(void);
> +#else
> +static inline int davinci_cpufreq_init(void) { return 0; }
> +#endif
> +
>  #endif /* _MACH_DAVINCI_CPUFREQ_H */
> --
> 2.39.2
>

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
