Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B661C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 10 Jan 2022 09:50:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243301AbiAJJup (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jan 2022 04:50:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243319AbiAJJuR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jan 2022 04:50:17 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB923C06173F
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 01:50:15 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id r9so23838402wrg.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Jan 2022 01:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=GW/bVu2+kXBYTZlCH9AQ9Gh0fDX6lkrwYZ5Hscb3yIA=;
        b=qqkhHRVWvzumJ3IzFq2mgLddtHTOxfol3w1Ib8H2xgg8BcsmUler9cPbnzFQ68IPMO
         O9WU4Yu29P9fYfwP8A7javvo+Isj7tbazIdAMdXRdsr5zOjhPKT5bImUf2ND2UxmjlFq
         +FMPELA+7djQ+lYOq0OvlK0odo6ZDAqwEvABeBwcA9HQZTn2o2j5NORCIOStx/uUQej0
         UE8Ld9VzoaB7yUnhhfWJZ8wgqRi89+ugaHNUTEALHdPIhBH0Y6tgmWtXsaZvbaOu9ach
         hfElwxIGnlelO4s2xMn/tz4y3cSPUYq9c6gY00kUsQKXb9P+xyfF3/NSJGie4anyAtPL
         eprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=GW/bVu2+kXBYTZlCH9AQ9Gh0fDX6lkrwYZ5Hscb3yIA=;
        b=sCHLceqzwKCi11Wh8q4E11quvzomGDHP/Y4eY7BTi9i7um66HZQGhlag8Rk6SP89k5
         dH+rQW6CUwmef4efCRvTpBC5HJjuP4wg4M7PC+zST95E4pHsbW3IEdIDFWW4pK44FdYF
         Nl4xy4oPAtLP1KQC96k2gUtftyYgfhIYOHFfhUHx1GwT9H9BpBlWoQP2KNICWAJs7boU
         6I94JoXSR0K08c0o7FrtSXB0QZ9Z5Y6KHmSlrsbzDfgIUtWQoFPNOeeviUEo1lR52eal
         OkCpx03D+zCLYWFlSr3CW3liwhXRw29TmxPYBywrWU4KKCTouuHSZyeJlqkiEHVjYt7m
         WP8Q==
X-Gm-Message-State: AOAM532qFZLkC8Zt1Ztcod0LO+nzHbwbpOoEzFJi7SoTkVN4ZfyWaDFY
        40R7mT7dABsWMjvQea8+4yBOkw==
X-Google-Smtp-Source: ABdhPJwKEEtsJSIRkBWU+cTOMlx2SmYEVmjRsJ5Fr3DlEgvojpCPqkgIt0V/g9eQvNDKqXU9+mtRhQ==
X-Received: by 2002:adf:f811:: with SMTP id s17mr11996637wrp.91.1641808214324;
        Mon, 10 Jan 2022 01:50:14 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id d5sm5946143wms.28.2022.01.10.01.50.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 01:50:13 -0800 (PST)
Date:   Mon, 10 Jan 2022 09:50:18 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, palmer@dabbelt.com,
        paul.walmsley@sifive.com, linux-clk@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
Message-ID: <YdwBWmF8OJYab7qS@google.com>
References: <20220107090715.2601-1-zong.li@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220107090715.2601-1-zong.li@sifive.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Please improve the subject line.

If this is a straight revert, the subject line should reflect that.

If not, you need to give us specific information regarding the purpose
of this patch.  Please read the Git log for better, more forthcoming
examples.

On Fri, 07 Jan 2022, Zong Li wrote:

> This commit reverts commit 487dc7bb6a0c ("clk: sifive: fu540-prci:
> Declare static const variable 'prci_clk_fu540' where it's used").
> For fixing W=1 kernel build warning(s) about ‘prci_clk_fu540’ defined
> but not used [-Wunused-const-variable=], the problem is that the C file
> of fu540 and fu740 doesn't use these variables, but they includes the
> header files.

What exactly does this patch fix?  Does it fix a build warning?

If so, please provide the line you are seeing.

> We could refine the code by moving the definition of these
> variables into fu540 and fu740 implementation respectively instead of
> common core code, then we could still separate the SoCs-dependent data
> in their own implementation.
> 
> Fixes: 487dc7bb6a0c ("clk: sifive: fu540-prci: Declare static
> const variable 'prci_clk_fu540' where it's used")

This should be on one line.

What exactly does it fix though?  Please provide more details.

What about the warning that this patch was designed to fix?  Doesn't
that return after this patch has been applied?

> Signed-off-by: Zong Li <zong.li@sifive.com>
> 
> ---
> Changed in v3:
>  - Rebase on v5.16-rc8
>  - Add fixes tag
> 
> Changed in v2:
>  - Move definition of variable to C file from header
> ---
>  drivers/clk/sifive/fu540-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu540-prci.h  |  6 +-----
>  drivers/clk/sifive/fu740-prci.c  |  6 +++++-
>  drivers/clk/sifive/fu740-prci.h  | 11 +----------
>  drivers/clk/sifive/sifive-prci.c |  5 -----
>  5 files changed, 12 insertions(+), 22 deletions(-)
> 
> diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
> index 29bab915003c..5568bc26e36f 100644
> --- a/drivers/clk/sifive/fu540-prci.c
> +++ b/drivers/clk/sifive/fu540-prci.c
> @@ -20,7 +20,6 @@
>  
>  #include <dt-bindings/clock/sifive-fu540-prci.h>
>  
> -#include "fu540-prci.h"
>  #include "sifive-prci.h"
>  
>  /* PRCI integration data for each WRPLL instance */
> @@ -87,3 +86,8 @@ struct __prci_clock __prci_init_clocks_fu540[] = {
>  		.ops = &sifive_fu540_prci_tlclksel_clk_ops,
>  	},
>  };
> +
> +struct prci_clk_desc prci_clk_fu540 = {
> +	.clks = __prci_init_clocks_fu540,
> +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> +};
> diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> index c220677dc010..931d6cad8c1c 100644
> --- a/drivers/clk/sifive/fu540-prci.h
> +++ b/drivers/clk/sifive/fu540-prci.h
> @@ -7,10 +7,6 @@
>  #ifndef __SIFIVE_CLK_FU540_PRCI_H
>  #define __SIFIVE_CLK_FU540_PRCI_H
>  
> -#include "sifive-prci.h"
> -
> -#define NUM_CLOCK_FU540	4
> -
> -extern struct __prci_clock __prci_init_clocks_fu540[NUM_CLOCK_FU540];
> +extern struct prci_clk_desc prci_clk_fu540;
>  
>  #endif /* __SIFIVE_CLK_FU540_PRCI_H */
> diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
> index 53f6e00a03b9..0ade3dcd24ed 100644
> --- a/drivers/clk/sifive/fu740-prci.c
> +++ b/drivers/clk/sifive/fu740-prci.c
> @@ -8,7 +8,6 @@
>  
>  #include <dt-bindings/clock/sifive-fu740-prci.h>
>  
> -#include "fu540-prci.h"
>  #include "sifive-prci.h"
>  
>  /* PRCI integration data for each WRPLL instance */
> @@ -132,3 +131,8 @@ struct __prci_clock __prci_init_clocks_fu740[] = {
>  		.ops = &sifive_fu740_prci_pcie_aux_clk_ops,
>  	},
>  };
> +
> +struct prci_clk_desc prci_clk_fu740 = {
> +	.clks = __prci_init_clocks_fu740,
> +	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu740),
> +};
> diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
> index 511a0bf7ba2b..5bc0e18f058c 100644
> --- a/drivers/clk/sifive/fu740-prci.h
> +++ b/drivers/clk/sifive/fu740-prci.h
> @@ -7,15 +7,6 @@
>  #ifndef __SIFIVE_CLK_FU740_PRCI_H
>  #define __SIFIVE_CLK_FU740_PRCI_H
>  
> -#include "sifive-prci.h"
> -
> -#define NUM_CLOCK_FU740	9
> -
> -extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
> -
> -static const struct prci_clk_desc prci_clk_fu740 = {
> -	.clks = __prci_init_clocks_fu740,
> -	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu740),
> -};
> +extern struct prci_clk_desc prci_clk_fu740;
>  
>  #endif /* __SIFIVE_CLK_FU740_PRCI_H */
> diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> index 80a288c59e56..916d2fc28b9c 100644
> --- a/drivers/clk/sifive/sifive-prci.c
> +++ b/drivers/clk/sifive/sifive-prci.c
> @@ -12,11 +12,6 @@
>  #include "fu540-prci.h"
>  #include "fu740-prci.h"
>  
> -static const struct prci_clk_desc prci_clk_fu540 = {
> -	.clks = __prci_init_clocks_fu540,
> -	.num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> -};
> -
>  /*
>   * Private functions
>   */

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
