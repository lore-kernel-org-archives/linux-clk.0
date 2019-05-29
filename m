Return-Path: <SRS0=s3ie=T5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF01C28CC0
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 12:50:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CB293205ED
	for <linux-clk@archiver.kernel.org>; Wed, 29 May 2019 12:50:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fo1s04OM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726516AbfE2Mu3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 May 2019 08:50:29 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:44076 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726104AbfE2Mu3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 May 2019 08:50:29 -0400
Received: by mail-lj1-f195.google.com with SMTP id e13so2287368ljl.11;
        Wed, 29 May 2019 05:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y/GjW0ggTr+KDX5N1qvSh09429RppJ4FAnZ8i4WBnhY=;
        b=Fo1s04OMp+eFPrWrP1AbzDVpYhsfTrEJzNw2UnF8XZs4eMkMJ1jXUwBdKd0vdglyH5
         Cz2SByoPwre6bVExbfWGTwdTLHPQYK9CtIMOzDzbSlZGSq4L3qOASARaA4Jex+uSyrKY
         zYGwLVO/ClM9QTjLU+2kmN+m9cuBQj4gQcHYni3G5gdJwwFysC2aV6Ptz0JUBrH2zxNO
         hL7chCs/AP30bnDzOh+pSH66dQ34Xp1x7PazS+ns7Hiqt1UrEvZHrVgaKfok6eQqpGvg
         JSLuRdnOgPE8OEtC8gOBbRR/351gL5oBJBIWP9IoQ1TP5tknLTg2L0DunfMi6ufJFngV
         w+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y/GjW0ggTr+KDX5N1qvSh09429RppJ4FAnZ8i4WBnhY=;
        b=UNfnYoNEje8EqLhH8KfmAbqRc52Yo1HlOxu5B59Lc9GgAxig+7lfOliakVbOqVG0eS
         V0D72qendgzzRXFqVDNrvP23h34iMoUzjjxmPa9J87adoo4LEwUk1JJ54sid/a70bdfr
         wUjf/VefPxAzW1tEYpE07vGKn6Nfoq0/ayX9mGUlBE2YPuZjNlI8NDSQ6ljPBDv+o7Fu
         cCrSrrYi7naJ6SGXCgmE1Iam3OasphxfCibZ4+r70o4I5caF9HaEmDw5XjXlo5kvB/uE
         J52wbfME13KMEQ5eFYg4gRTOm5urzdankhs+MOXM9YUxpIyu8fZ13baYX4r4vbMVl++6
         LbEw==
X-Gm-Message-State: APjAAAXGa1a/jgUplCrOpmclDE56bZcFe1dOVNizZQt25tFNCcf9xgVv
        Q50+0H/rJ2+dD6MkqtDpFZ4=
X-Google-Smtp-Source: APXvYqwRjJQjY7ixX0sxWEjupCb/IAECR01S9LEOiDFrhg1gvxe+Qd7Qxpq7qkk3ohQI57Gk8nusvw==
X-Received: by 2002:a2e:89cc:: with SMTP id c12mr60915243ljk.90.1559134226037;
        Wed, 29 May 2019 05:50:26 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id 20sm3452950ljw.7.2019.05.29.05.50.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 05:50:24 -0700 (PDT)
Subject: Re: [PATCH V4 7/8] clk: tegra: Remove the old emc_mux clock for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-8-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6651442d-d501-9363-ff95-988e1a4a3982@gmail.com>
Date:   Wed, 29 May 2019 15:49:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529082139.5581-8-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

29.05.2019 11:21, Joseph Lo пишет:
> Remove the old emc_mux clock and don't use the common EMC clock
> definition. This will be replaced by a new clock defined in the
> EMC driver.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
> - make sure the behavior is compatible with case if the kernel still
>   uses the older DTB which doesn't have EMC node. And the MC and EMC
>   clock can still be registered successuflly.
> v3:
> - split to 3 patches from the previous version
> ---
>  drivers/clk/tegra/clk-tegra210.c | 42 ++++++++++++++++++++------------
>  1 file changed, 27 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index 1d52354820ca..8b209e8b5eaf 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -28,6 +28,7 @@
>  #include <dt-bindings/reset/tegra210-car.h>
>  #include <linux/iopoll.h>
>  #include <linux/sizes.h>
> +#include <soc/tegra/emc.h>
>  #include <soc/tegra/pmc.h>
>  
>  #include "clk.h"
> @@ -324,12 +325,6 @@ static unsigned long tegra210_input_freq[] = {
>  	[8] = 12000000,
>  };
>  
> -static const char *mux_pllmcp_clkm[] = {
> -	"pll_m", "pll_c", "pll_p", "clk_m", "pll_m_ud", "pll_mb", "pll_mb",
> -	"pll_p",
> -};
> -#define mux_pllmcp_clkm_idx NULL
> -
>  #define PLL_ENABLE			(1 << 30)
>  
>  #define PLLCX_MISC1_IDDQ		(1 << 27)
> @@ -2346,7 +2341,6 @@ static struct tegra_clk tegra210_clks[tegra_clk_max] __initdata = {
>  	[tegra_clk_i2c2] = { .dt_id = TEGRA210_CLK_I2C2, .present = true },
>  	[tegra_clk_uartc_8] = { .dt_id = TEGRA210_CLK_UARTC, .present = true },
>  	[tegra_clk_mipi_cal] = { .dt_id = TEGRA210_CLK_MIPI_CAL, .present = true },
> -	[tegra_clk_emc] = { .dt_id = TEGRA210_CLK_EMC, .present = true },
>  	[tegra_clk_usb2] = { .dt_id = TEGRA210_CLK_USB2, .present = true },
>  	[tegra_clk_bsev] = { .dt_id = TEGRA210_CLK_BSEV, .present = true },
>  	[tegra_clk_uartd_8] = { .dt_id = TEGRA210_CLK_UARTD, .present = true },
> @@ -2957,6 +2951,27 @@ static int tegra210_init_pllu(void)
>  	return 0;
>  }
>  
> +static const struct clk_div_table mc_div_table_tegra210[] = {
> +	{ .val = 0, .div = 2 },
> +	{ .val = 1, .div = 4 },
> +	{ .val = 2, .div = 1 },
> +	{ .val = 3, .div = 2 },
> +	{ .val = 0, .div = 0 },
> +};
> +
> +static void tegra210_clk_register_mc(const char *name,
> +				     const char *parent_name)
> +{
> +	struct clk *clk;
> +
> +	clk = clk_register_divider_table(NULL, name, parent_name,
> +					 CLK_IS_CRITICAL,
> +					 clk_base + CLK_SOURCE_EMC,
> +					 15, 2, CLK_DIVIDER_READ_ONLY,
> +					 mc_div_table_tegra210, &emc_lock);

This doesn't look right, you're mixing up the MC divider with the EMC
divider here. The MC clock is always sourced from EMC and there is only
one bit for the MC divider, the bit 16 MC_EMC_SAME_FREQ.

When EMC clock is divided down by 2 (bit 15 EMC_CLK_DIV2_EN), then the
clk-framework will take care of it by calculating the MC rate based on
the actual parent EMC rate.

> +	clks[TEGRA210_CLK_MC] = clk;
> +}
> +
>  static const char * const sor1_out_parents[] = {
>  	/*
>  	 * Bit 0 of the mux selects sor1_pad_clkout, irrespective of bit 1, so
> @@ -3040,15 +3055,12 @@ static __init void tegra210_periph_clk_init(void __iomem *clk_base,
>  			CLK_SOURCE_LA, 0);
>  	clks[TEGRA210_CLK_LA] = clk;
>  
> -	/* emc mux */
> -	clk = clk_register_mux(NULL, "emc_mux", mux_pllmcp_clkm,
> -			       ARRAY_SIZE(mux_pllmcp_clkm), 0,
> -			       clk_base + CLK_SOURCE_EMC,
> -			       29, 3, 0, &emc_lock);
> +	/* emc */
> +	clk = tegra210_clk_register_emc();
> +	clks[TEGRA210_CLK_EMC] = clk;
>  
> -	clk = tegra_clk_register_mc("mc", "emc_mux", clk_base + CLK_SOURCE_EMC,
> -				    &emc_lock);
> -	clks[TEGRA210_CLK_MC] = clk;
> +	/* mc */
> +	tegra210_clk_register_mc("mc", "emc");
>  
>  	/* cml0 */
>  	clk = clk_register_gate(NULL, "cml0", "pll_e", 0, clk_base + PLLE_AUX,
> 

You should leave the common tegra_clk_register_mc() usage as-is and only
s/emc_mux/emc/ in the argument.

-- 
Dmitry
