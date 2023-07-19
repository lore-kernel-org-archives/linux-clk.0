Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A34FEB64DA
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jul 2023 14:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230028AbjGSOTY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jul 2023 10:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGSOTX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jul 2023 10:19:23 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FD19C5
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 07:19:22 -0700 (PDT)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ADBB23F438
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 14:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1689776357;
        bh=GQssMG4sr5GfDopggRQSgpxYtYsDKGG3T/Izx89s/GE=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=H7XvEt01IsviDwFPs8HZGGJziEXp/uu23LMcw7QmoEozkz5oxDvCmSjvFTWPPoi3A
         UsLguEBvWUVEwYXUa+ZxPKW1a93tSCIx/N0/ZGzDQwQt2WP+B3S3r3MzB0FBrSHGzj
         VAOprKq9KigsK4NmMkijIG9vTvz60PM/Wctq+siV0HIvl3CsrPXHH9K/Ox0CPWJS62
         bSn+UUrz/0aX5aU0ZwTobDT46bzYWQisHuIRtKGSzbSVZav8XktBUXnqWteg64dFbM
         eT5mFtP2M6V9FV/FbJsQjDhEnT2j6t6wRjb0XDlMlH6njMjcqfzqgrc2um/8MIcft6
         UKSz/zTHfZSkQ==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-635e244d063so59608856d6.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Jul 2023 07:19:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689776355; x=1690381155;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQssMG4sr5GfDopggRQSgpxYtYsDKGG3T/Izx89s/GE=;
        b=d8KACRsvwFV03ff0GPiaH0/byR8BnHZ711U5aIsVtqYvA0VpN4FhhGRe5Bz9M6Mnu/
         HOy5Yf/+0fUmJ5Wk2ynxuw2NwihtuNuL8D6rOdsck9To6hgNhwXIOaSukM8sX0+UT860
         3uoebsh+KCN6H9KzL3ta/aS6ybyQTH4o1m8ZGI/ou0UDfMUIxMTX/8YCDIXttjBXEcHk
         Xt9y0Zs8CzuvT+bbWiE4zvOOsFH3vR+UWgsEJ0F4LoSne3jd0Qf4FGeukfQ0+aflq0uF
         jiLBt9Hh0YwjRjqLtKSTV5gNyyoa46Po8IdS5AFzeYpDazciAH+hR+5ionacRZkAjxuo
         nyxQ==
X-Gm-Message-State: ABy/qLbdesrvvHtNCViFluiiaSqQv9QUUbO2o6TxdL8FMeWJcxKIi6Wq
        ldYhmMGousQC6kOUco4/ets6axYchkh2SaGgoVHTZVgSO+titf+vl977bSql13gBxsiSnmrqBI/
        Bv+A8juu0yWLZ9EI9ZlEjOU2mt8Lt8/0lyNCEY6SvGZ4ykVPya+LyXw==
X-Received: by 2002:a05:622a:1043:b0:403:e841:58cf with SMTP id f3-20020a05622a104300b00403e84158cfmr7250698qte.10.1689776355277;
        Wed, 19 Jul 2023 07:19:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF6ArzibyjU/HIAo8zVRkK4K5uiAaxY67dwKUBWu+e77t8a+bRUMd76ruBG00lvDGu4BDbxlfoFwop3e5WhMrI=
X-Received: by 2002:a05:622a:1043:b0:403:e841:58cf with SMTP id
 f3-20020a05622a104300b00403e84158cfmr7250684qte.10.1689776355066; Wed, 19 Jul
 2023 07:19:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230717210356.2794736-1-samuel.holland@sifive.com> <20230717210356.2794736-2-samuel.holland@sifive.com>
In-Reply-To: <20230717210356.2794736-2-samuel.holland@sifive.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Wed, 19 Jul 2023 16:18:59 +0200
Message-ID: <CAJM55Z9B6atT_t4321kOCGWoeqLxe+ZBsJDr4BeV1byaeYw5fw@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: sifive: Allow building the driver as a module
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Conor Dooley <conor.dooley@microchip.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yang Li <yang.lee@linux.alibaba.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 19 Jul 2023 at 10:07, Samuel Holland <samuel.holland@sifive.com> wrote:
>
> This can reduce the kernel image size in multiplatform configurations.

I don't mind this, but booting without this driver also means there is
no uart for debug output or any other peripheral until the kernel gets
to the initrd to load the driver. Does the earlycon console work all
the way until we reach the initrd? Otherwise I can't imagine many
scenarios where configuring this as a module is desirable.

> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  drivers/clk/sifive/Kconfig       | 2 +-
>  drivers/clk/sifive/sifive-prci.c | 8 +++-----
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> index 2322f634a910..49597d95602e 100644
> --- a/drivers/clk/sifive/Kconfig
> +++ b/drivers/clk/sifive/Kconfig
> @@ -10,7 +10,7 @@ menuconfig CLK_SIFIVE
>  if CLK_SIFIVE
>
>  config CLK_SIFIVE_PRCI
> -       bool "PRCI driver for SiFive SoCs"
> +       tristate "PRCI driver for SiFive SoCs"
>         default ARCH_SIFIVE
>         select RESET_CONTROLLER
>         select RESET_SIMPLE
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index e317f3454e93..8c67d1a7c8df 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -7,6 +7,7 @@
>  #include <linux/clkdev.h>
>  #include <linux/delay.h>
>  #include <linux/io.h>
> +#include <linux/module.h>
>  #include <linux/of_device.h>
>  #include "sifive-prci.h"
>  #include "fu540-prci.h"
> @@ -618,9 +619,6 @@ static struct platform_driver sifive_prci_driver = {
>         },
>         .probe = sifive_prci_probe,
>  };
> +module_platform_driver(sifive_prci_driver);
>
> -static int __init sifive_prci_init(void)
> -{
> -       return platform_driver_register(&sifive_prci_driver);
> -}
> -core_initcall(sifive_prci_init);

Maybe also add the MODULE_AUTHOR() and MODULE_DESCRIPTION() macros
while you're at it.

> +MODULE_LICENSE("GPL");
> --
> 2.40.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
