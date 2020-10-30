Return-Path: <SRS0=Ewk5=EF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9C9C2D0A3
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 01:06:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A71432054F
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 01:06:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Scy580i0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725379AbgJ3BGC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Oct 2020 21:06:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725372AbgJ3BGB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Oct 2020 21:06:01 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CACC0C0613CF
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2020 18:06:01 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id f38so3797864pgm.2
        for <linux-clk@vger.kernel.org>; Thu, 29 Oct 2020 18:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=/Z9C0NVtKgSrCKgcBlAxi/Y4cKHhcTsj2/yM6HYHUek=;
        b=Scy580i0UHzZzXqkHZ4VHpmFPVGSr+3V3z2MUG8IpsUD/qjLEfZ8JPhV3xGmBI8O5S
         nKAOyE1LZONHVMjhWjEbKmy8oazjr2AtWgkt+e84l5jlPQd5Vt1TIpQhlGFrvZ1G+1xv
         c0ixxs8HyFBvEv2a+kWFMAOFunX2x3BkNDAmKpi0aQ+Ng7wAZcTqn2lp/V7llEMj3UMj
         mHWAdosv4SLDfaGDi0JymEAjUr6gCTTBC5hL7NjTDAECcr/lc/thWXohkRy9CE2mqYgo
         b26ARhCdEolBaX+mfuwNmFcmUbjpMMgez1NElEKbmBcDZKPjZgu8U0so0zPZzA1HM1Ig
         nGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=/Z9C0NVtKgSrCKgcBlAxi/Y4cKHhcTsj2/yM6HYHUek=;
        b=PXhCsUtpJC1FLM+KabX7Mgbmt2XcyDj0E/JIv8PtNh+Coo1diCD6rBkNFH7MP442YY
         nKArxOpUgNeJkk/wR1m+cdcA5YCVZA/FmQ9NyAL5iVdkADr5zQf0grKW7n6oBH4lDI0V
         +Sp7wwaLLsPNggxR2YMDvKCvG9bwy3PYVjasvBPkATPe/QgEtODWTaAX8o7Lan1xgTtB
         DaSF6ztqEI/xGX9cOEkhgYquBDlZA9hJyQreuSilevWNcrZH2RVC40Oi1eb7igferP7B
         0guiBNtmeD5U75RNWsZ0IU0HW+TMAC9oyCKt1ORVPg/wwc21v4NNe6A7DiqZPMPFX54n
         ppBw==
X-Gm-Message-State: AOAM530ii4+63kuzvML2amdgLFBBgotemNUfcEnLQDebQYtj0ACnNhQi
        vcsAK2hLos5BHvvgjIeHig4=
X-Google-Smtp-Source: ABdhPJxtkO5vv4fEW1dhs/ioJMQ6LO5YmjyCnxyFXmyAWrzC544nUV+moYBHMueIozV6ygGy1WrQ2w==
X-Received: by 2002:a17:90a:1b6e:: with SMTP id q101mr1895337pjq.79.1604019961245;
        Thu, 29 Oct 2020 18:06:01 -0700 (PDT)
Received: from Ryzen-9-3900X.localdomain (ip68-98-75-144.ph.ph.cox.net. [68.98.75.144])
        by smtp.gmail.com with ESMTPSA id u4sm3695189pgu.35.2020.10.29.18.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 18:06:00 -0700 (PDT)
Date:   Thu, 29 Oct 2020 18:06:00 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, sboyd@kernel.org,
        mturquette@baylibre.com, linux-imx@nxp.com, kernel@pengutronix.de,
        fabio.estevam@nxp.com, shawnguo@kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 03/11] clk: imx: scu: add two cells binding support
Message-ID: <20201030010600.GA2760@Ryzen-9-3900X.localdomain>
References: <1596009618-25516-1-git-send-email-aisheng.dong@nxp.com>
 <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596009618-25516-4-git-send-email-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 29, 2020 at 04:00:10PM +0800, Dong Aisheng wrote:
> This patch implements the new two cells binding for SCU clocks.
> The usage is as follows:
> clocks = <&uart0_clk IMX_SC_R_UART_0 IMX_SC_PM_CLK_PER>
> 
> Due to each SCU clock is associated with a power domain, without power
> on the domain, the SCU clock can't work. So we create platform devices
> for each domain clock respectively and manually attach the required domain
> before register the clock devices, then we can register clocks in the
> clock platform driver accordingly.
> 
> Note because we do not have power domain info in device tree and the SCU
> resource ID is the same for power domain and clock, so we use resource ID
> to find power domains.
> 
> Later, we will also use this clock platform driver to support suspend/resume
> and runtime pm.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This patch breaks allmodconfig.

$ make -skj"$(nproc)" ARCH=arm CROSS_COMPILE=arm-linux-gnueabi- distclean allmodconfig drivers/clk/imx/
In file included from ./include/linux/device.h:32,
                 from ./include/linux/of_platform.h:9,
                 from drivers/clk/imx/clk-scu.c:11:
./include/linux/device/driver.h:290:1: warning: data definition has no type or storage class
  290 | device_initcall(__driver##_init);
      | ^~~~~~~~~~~~~~~
./include/linux/platform_device.h:258:2: note: in expansion of macro 'builtin_driver'
  258 |  builtin_driver(__platform_driver, platform_driver_register)
      |  ^~~~~~~~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: note: in expansion of macro 'builtin_platform_driver'
  545 | builtin_platform_driver(imx_clk_scu_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~~
./include/linux/device/driver.h:290:1: error: type defaults to 'int' in declaration of 'device_initcall' [-Werror=implicit-int]
  290 | device_initcall(__driver##_init);
      | ^~~~~~~~~~~~~~~
./include/linux/platform_device.h:258:2: note: in expansion of macro 'builtin_driver'
  258 |  builtin_driver(__platform_driver, platform_driver_register)
      |  ^~~~~~~~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: note: in expansion of macro 'builtin_platform_driver'
  545 | builtin_platform_driver(imx_clk_scu_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: warning: parameter names (without types) in function declaration
In file included from ./include/linux/device.h:32,
                 from ./include/linux/of_platform.h:9,
                 from drivers/clk/imx/clk-scu.c:11:
drivers/clk/imx/clk-scu.c:545:25: warning: 'imx_clk_scu_driver_init' defined but not used [-Wunused-function]
  545 | builtin_platform_driver(imx_clk_scu_driver);
      |                         ^~~~~~~~~~~~~~~~~~
./include/linux/device/driver.h:286:19: note: in definition of macro 'builtin_driver'
  286 | static int __init __driver##_init(void) \
      |                   ^~~~~~~~
drivers/clk/imx/clk-scu.c:545:1: note: in expansion of macro 'builtin_platform_driver'
  545 | builtin_platform_driver(imx_clk_scu_driver);
      | ^~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors
make[4]: *** [scripts/Makefile.build:283: drivers/clk/imx/clk-scu.o] Error 1
make[4]: Target '__build' not remade because of errors.
make[3]: *** [scripts/Makefile.build:500: drivers/clk/imx] Error 2
make[3]: Target '__build' not remade because of errors.
make[2]: *** [scripts/Makefile.build:500: drivers/clk] Error 2
make[2]: Target '__build' not remade because of errors.
make[1]: *** [Makefile:1799: drivers] Error 2
make[1]: Target 'drivers/clk/imx/' not remade because of errors.
make: *** [Makefile:335: __build_one_by_one] Error 2
make: Target 'distclean' not remade because of errors.
make: Target 'allmodconfig' not remade because of errors.
make: Target 'drivers/clk/imx/' not remade because of errors.

Cheers,
Nathan
