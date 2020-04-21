Return-Path: <SRS0=UvOF=6F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4446EC54FCC
	for <linux-clk@archiver.kernel.org>; Tue, 21 Apr 2020 14:05:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CC98206B9
	for <linux-clk@archiver.kernel.org>; Tue, 21 Apr 2020 14:05:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gBwYA42K"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726780AbgDUOFc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Apr 2020 10:05:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726628AbgDUOFc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Apr 2020 10:05:32 -0400
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com [IPv6:2607:f8b0:4864:20::e42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02EEFC061A10
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2020 07:05:31 -0700 (PDT)
Received: by mail-vs1-xe42.google.com with SMTP id 184so8465970vsu.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Apr 2020 07:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=be+Vc7xAZCr9Ahzwagy0wNJ1CV7ApQx8T+7Py7ZdjNQ=;
        b=gBwYA42KhR9bSnokVesIaERlD/XOFBta05NQJCMc8PglMAis4wqWMUKb4s+Wd9DSVz
         2wX98j0Rb8tWT0+oKFWO01C5DwY9/NubX8+nLILBTZJCkNevY+cnvqu1Y4F+D4HoESsd
         oa0L8CJoC796UzDIfdyUfxEC5R7xU8yrScI1CzoXtncrIeu6yK79vwXAdX2Lmwjpr+ME
         /23BkW+VYuAc84TdpindwSWUl2d3P3mh8niWzOW0ZUEAK7Bzew2vkyFI6aeQlOt6K6Op
         B0QMf0T76n2DbqHfTuLjo8Vn6ug8Ruos6yJ4cMNEfSdGBlDs4cp5D4B+IHduFSgapmCA
         mpHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=be+Vc7xAZCr9Ahzwagy0wNJ1CV7ApQx8T+7Py7ZdjNQ=;
        b=T6UlV+kU2BcJxiek8grfr5A9CSziabcVnLhZhwsDQuiSymcKyTXGN1EoCQS9oadJq1
         6gfGx8zOLjO/O23xOvCH0IIzq/1P+yMveX5qdMoBwF1CypwITH60wyQGSU1hbqv5smuU
         Uvy6vV7UzwejH1cyTVsDpP/y73+iNyZZZ8o78QTVGFmtprw5O2Uu5+MwlHPk5ou9u9Vh
         +MzK3UXwH2gpHHZerd7QoM+BaUy1YAWpDtBqknS3euqQoBNwLZpQO2ia2EHxvapxh4EC
         bDrOc8fyVKoXEuFUZEMwlltobHLZ1fE2Jguxo22s8buHqpOGtZ4PvjuvEnEQeubW0TX+
         wYdw==
X-Gm-Message-State: AGi0PuYGSurOKyIyAGrcvHHGNpQbQZq/ScqQ6jm3Udp75wN6XhgnS4BD
        HEGPJi8ykKzp5WCIh91KNbOk2zF2XE+qN7FQmMjyiFyI
X-Google-Smtp-Source: APiQypLs3Snj8EJSeZBgRwIyen5KSmd5DxEjSyGrzGJzVxK0ot19ligIs3sOjcHBff9en12Ea3bsG2F9tYJE2CgfHAg=
X-Received: by 2002:a67:8b46:: with SMTP id n67mr4834888vsd.35.1587477931040;
 Tue, 21 Apr 2020 07:05:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200409064416.83340-1-sboyd@kernel.org> <20200409064416.83340-7-sboyd@kernel.org>
In-Reply-To: <20200409064416.83340-7-sboyd@kernel.org>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Tue, 21 Apr 2020 16:04:54 +0200
Message-ID: <CAPDyKFqpS=wke5Y=rTeq3+8bQyacVHcbWnBwG5pxsJ4hPys+9g@mail.gmail.com>
Subject: Re: [PATCH v2 06/10] mmc: meson-mx-sdio: Depend on OF_ADDRESS and not
 just OF
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        kbuild test robot <lkp@intel.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 9 Apr 2020 at 08:44, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Making COMMON_CLK a visible option causes the sparc allyesconfig to fail
> to build like so:
>
>    sparc64-linux-ld: drivers/mmc/host/meson-mx-sdio.o: in function `meson_mx_mmc_remove':
>    meson-mx-sdio.c:(.text+0x70): undefined reference to `of_platform_device_destroy'
>    sparc64-linux-ld: drivers/mmc/host/meson-mx-sdio.o: in function `meson_mx_mmc_probe':
>    meson-mx-sdio.c:(.text+0x9e4): undefined reference to `of_platform_device_create'
>    sparc64-linux-ld: meson-mx-sdio.c:(.text+0xdd4): undefined reference to `of_platform_device_destroy'
>
> This is because the implementation of of_platform_device_destroy() is
> inside an #ifdef CONFIG_OF_ADDRESS section of drivers/of/platform.c.
> This driver already depends on OF being enabled, so let's tighten that
> constrain a little more so that it depends on OF_ADDRESS instead. This
> way we won't try to build this driver on platforms that don't have this
> function.
>
> Reported-by: kbuild test robot <lkp@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

I don't have the complete picture here, can I just apply this a fix to
my mmc tree?

Kind regards
Uffe

> ---
>  drivers/mmc/host/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 3a5089f0332c..31b2a8826b30 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -409,7 +409,7 @@ config MMC_MESON_MX_SDIO
>         tristate "Amlogic Meson6/Meson8/Meson8b SD/MMC Host Controller support"
>         depends on ARCH_MESON || COMPILE_TEST
>         depends on COMMON_CLK
> -       depends on OF
> +       depends on OF_ADDRESS
>         help
>           This selects support for the SD/MMC Host Controller on
>           Amlogic Meson6, Meson8 and Meson8b SoCs.
> --
> Sent by a computer, using git, on the internet
>
