Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44A16C2D0E4
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03FDC22403
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="0hdfK3g9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726693AbgKUB3Z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Nov 2020 20:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725890AbgKUB3Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2020 20:29:25 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AFEFC0613CF
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2020 17:29:25 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id t8so9560746pfg.8
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2020 17:29:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=NTIUti1OpkmP1EJeSjOGSHTMPVhCrbNNUIn61ZG384k=;
        b=0hdfK3g94oTXJCO7jmp7feme5W90zhh8KAtY4W/xPC+Ibe6jZH2suPKRs191Ut85UR
         UjJ5PHVkzHLT0nD6DP3GgEliyuZ48VjcPkCX+QVWsbn6EWhZEqvXnjp/g8Etx/0xEhvl
         CmRGem/xk/JPkKj6IH5nf6odmNH3Rk5UrS2gXhR1YbNkHGDhsv9ONWrH+IyIFoHeYrLr
         dvADzjiSbrdp+8p7foWvwPYeloHAUcCdhowFqWObmHNbK4zU8GJcWHq+p1ZgMqgv3XRX
         edAbKn7A+QN1aJhxaEpOQpVp6JY/wyJoqntRngNj1JG0CT3WIaNLQK+ID5m9LUF9WO6N
         XMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=NTIUti1OpkmP1EJeSjOGSHTMPVhCrbNNUIn61ZG384k=;
        b=bH3g8Ae8R39dzr8StTIRKWNar9l+IBpQVxCjK5QR5AqK8XX6r54uF04S95FTGA8Xac
         UcEJ5QOZ4imL7rjg8SEyQERIzIm+qLwzp7UywFwHjxQ+Ulk/cnzoX4Q2ecn+G7LU9pip
         YAldmFPn05W+7LY6wdsAzsYkiHcB3quq7o5vwSfF3xJ7kawqoezoOxUDZFfPTWSIGJtm
         FoiCSKNXoAW1KfaCmUT6MWQBWKn3bFjTjosKdMzca917kWopNRWu+K+VNKk9NER+Aghn
         wfkvvRchucVlzGhtSiKcWthrq3G6BW01IuE/cIOzeUuR5klrSGRHTRwFlSMQLdxAWRYG
         QKOA==
X-Gm-Message-State: AOAM533HDfUhX3G49+SKv6q7VggF2+Bnmko8YO8scAQ49nPFrqEWm2aF
        DNdw3/cDLkVBGxrQR1m89tdUgA==
X-Google-Smtp-Source: ABdhPJwtPQZRmI58LwYU51aWQz3nyqvtfTqielZw6ubxzFmOwxLpqzzFzT/rB6dE8mPtjlTSgaLuBA==
X-Received: by 2002:a63:8149:: with SMTP id t70mr19717409pgd.80.1605922164501;
        Fri, 20 Nov 2020 17:29:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id s21sm4339168pgk.52.2020.11.20.17.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 17:29:23 -0800 (PST)
Date:   Fri, 20 Nov 2020 17:29:23 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 17:13:18 PST (-0800)
Subject:     Re: [PATCH v4 2/4] clk: sifive: Use common name for prci configuration
In-Reply-To: <20201111100608.108842-3-zong.li@sifive.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        zong.li@sifive.com, Pragnesh.patel@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     zong.li@sifive.com
Message-ID: <mhng-ca3ea720-b6b1-4b6e-a58f-43fadd7f1c18@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 11 Nov 2020 02:06:06 PST (-0800), zong.li@sifive.com wrote:
> Use generic name CLK_SIFIVE_PRCI instead of CLK_SIFIVE_FU540_PRCI. This
> patch is prepared for fu740 support.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Reviewed-by: Pragnesh Patel <Pragnesh.patel@sifive.com>
> ---
>  arch/riscv/Kconfig.socs     | 2 +-
>  drivers/clk/sifive/Kconfig  | 6 +++---
>  drivers/clk/sifive/Makefile | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 8a55f6156661..3284d5c291be 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -5,7 +5,7 @@ config SOC_SIFIVE
>  	select SERIAL_SIFIVE if TTY
>  	select SERIAL_SIFIVE_CONSOLE if TTY
>  	select CLK_SIFIVE
> -	select CLK_SIFIVE_FU540_PRCI
> +	select CLK_SIFIVE_PRCI
>  	select SIFIVE_PLIC
>  	help
>  	  This enables support for SiFive SoC platform hardware.
> diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
> index f3b4eb9cb0f5..ab48cf7e0105 100644
> --- a/drivers/clk/sifive/Kconfig
> +++ b/drivers/clk/sifive/Kconfig
> @@ -8,12 +8,12 @@ menuconfig CLK_SIFIVE
>
>  if CLK_SIFIVE
>
> -config CLK_SIFIVE_FU540_PRCI
> -	bool "PRCI driver for SiFive FU540 SoCs"
> +config CLK_SIFIVE_PRCI
> +	bool "PRCI driver for SiFive SoCs"
>  	select CLK_ANALOGBITS_WRPLL_CLN28HPC
>  	help
>  	  Supports the Power Reset Clock interface (PRCI) IP block found in
> -	  FU540 SoCs.  If this kernel is meant to run on a SiFive FU540 SoC,
> +	  FU540 SoCs. If this kernel is meant to run on a SiFive FU540 SoC,

This just removes the double-space.  Presumably in should also remove the
"FU540", as this clock driver will now function for multiple SiFive SOCs?

>  	  enable this driver.
>
>  endif
> diff --git a/drivers/clk/sifive/Makefile b/drivers/clk/sifive/Makefile
> index 627effe2ece1..fe3e2cb4c4d8 100644
> --- a/drivers/clk/sifive/Makefile
> +++ b/drivers/clk/sifive/Makefile
> @@ -1,4 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-y += sifive-prci.o
>
> -obj-$(CONFIG_CLK_SIFIVE_FU540_PRCI)	+= fu540-prci.o
> +obj-$(CONFIG_CLK_SIFIVE_PRCI)	+= fu540-prci.o

Probably best to rename the source file as well.
