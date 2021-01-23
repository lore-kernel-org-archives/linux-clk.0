Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7E3FC433E0
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jan 2021 04:08:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B0A86233EA
	for <linux-clk@archiver.kernel.org>; Sat, 23 Jan 2021 04:08:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726602AbhAWEII (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Jan 2021 23:08:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbhAWEIF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Jan 2021 23:08:05 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50709C06174A
        for <linux-clk@vger.kernel.org>; Fri, 22 Jan 2021 20:07:25 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id p15so5035068pjv.3
        for <linux-clk@vger.kernel.org>; Fri, 22 Jan 2021 20:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=dON7QD8aFGzRpIqb+Tlf1r6Mkw2jNplPmioEKOGnv+w=;
        b=Rw1ZI0eE5M9j6Wu2p+jalzplqBljeDlYPfVBwOahxpaBB5wYkXEttwVWD9vhrBv99/
         yIwC3T35XncJDrunRwdl2HwHrw2WjRKcqo7SsDrCXKZBPYSAaxaCzzWS91f/ActX0NtT
         skJecV3FGXmtOxXncyqeuKExn3/EfZpDU7GC6pHh159DhbPwp+5InkgmPAE89rjALTpk
         lftXpde6VUuwUoL19aHw7iiS2LBXCPn9XQ6jluQo6IxUI8YFNySfMjoKxszZnZe/3/JV
         7X77NyslJ/STxNQQMPGox6P3jTUtBePV+38/id0UMd95BhNZeE10omUt2qzogdS6WIHd
         7VSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=dON7QD8aFGzRpIqb+Tlf1r6Mkw2jNplPmioEKOGnv+w=;
        b=pQgcfNOjOP7xozfn6pqE6ZY5PWbHvTYOw2hFLeGqrOn7SXvFr3XHCz7kKdv6ixNFsN
         F++KVZXZs0MwBK3BNtvUSmsPmO+bIR5n9xnirDckAivPyYI6kTPGCmnyTQ8gxO9m2rlv
         28pYzmD7zK2Oyo3xZ5WON+DuD8Bhu8pAgr+sn3drY8J7TNa4YySZ/B1JQJ9xf9w9Kabj
         +/0ISzMK+SD0uvMpg921PZw+X4mYx1XGArexlRJJWm2JwHuS8TzMJlbq+GYNQC97fuOy
         MGWfMvdL3FQMHt36cERavY8jGSy1DLyE3C3G9T2PiRzKUDiSQ30AyZp/S1hCVO+ECwHl
         x4JA==
X-Gm-Message-State: AOAM532UcWR1UB4X0SQKEc+vM96d/PEgITBQQreqJ+vLjU9rmeE0PGm1
        wDu8DeqPgA4ID1Wh1hPl1htBqQ==
X-Google-Smtp-Source: ABdhPJzoaq2GQ8/QrNb0hZ0MH2zHECgO2n9hmVITWznWNeyg/UbEI/YhJ4oBApmjOOBA0QcOzAk6LA==
X-Received: by 2002:a17:902:e84e:b029:de:45bf:1296 with SMTP id t14-20020a170902e84eb02900de45bf1296mr2260599plg.49.1611374844612;
        Fri, 22 Jan 2021 20:07:24 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id 101sm10640260pjo.38.2021.01.22.20.07.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jan 2021 20:07:23 -0800 (PST)
Date:   Fri, 22 Jan 2021 20:07:23 -0800 (PST)
X-Google-Original-Date: Fri, 22 Jan 2021 19:58:36 PST (-0800)
Subject:     Re: [PATCH 06/20] clk: sifive: fu540-prci: Declare static const variable 'prci_clk_fu540' where it's used
In-Reply-To: <20210120093040.1719407-7-lee.jones@linaro.org>
CC:     lee.jones@linaro.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Pragnesh.patel@sifive.com, zong.li@sifive.com,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     lee.jones@linaro.org
Message-ID: <mhng-d13d3ca6-2ec1-4c56-a4a8-56faafe5569c@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 20 Jan 2021 01:30:26 PST (-0800), lee.jones@linaro.org wrote:
> Fixes the following W=1 kernel build warning(s):
>
>  drivers/clk/sifive/fu540-prci.h:16:35: warning: ‘prci_clk_fu540’ defined but not used [-Wunused-const-variable=]
>  drivers/clk/sifive/fu540-prci.h:16:35: warning: ‘prci_clk_fu540’ defined but not used [-Wunused-const-variable=]
>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> Cc: Pragnesh Patel <Pragnesh.patel@sifive.com>
> Cc: Zong Li <zong.li@sifive.com>
> Cc: linux-clk@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>  drivers/clk/sifive/fu540-prci.h  | 5 -----
>  drivers/clk/sifive/sifive-prci.c | 5 +++++
>  2 files changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> index c8271efa7bdc7..c220677dc0108 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -13,9 +13,4 @@
>
>  extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
>
> -static const struct prci_clk_desc prci_clk_fu540 = {
> -	.clks = __prci_init_clocks_fu540,
> -	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> -};
> -
>  #endif /* __SIFIVE_CLK_FU540_PRCI_H */
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index c78b042750e21..1490b01ce6290 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -12,6 +12,11 @@
>  #include "fu540-prci.h"
>  #include "fu740-prci.h"
>
> +static const struct prci_clk_desc prci_clk_fu540 = {
> +	.clks = __prci_init_clocks_fu540,
> +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> +};
> +
>  /*
>   * Private functions
>   */

This doesn't look like my sifive-prci.c, so I'm assuming it's against one of
the clock trees and therefor should go in over there.

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

Thanks!
