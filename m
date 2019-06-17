Return-Path: <SRS0=KwYV=UQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4260FC31E59
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 10:32:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1A4262084D
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jun 2019 10:32:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="Xkz+egEt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfFQKcw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jun 2019 06:32:52 -0400
Received: from hqemgate14.nvidia.com ([216.228.121.143]:6371 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726091AbfFQKcw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jun 2019 06:32:52 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5d076c530000>; Mon, 17 Jun 2019 03:32:51 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 17 Jun 2019 03:32:51 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 17 Jun 2019 03:32:51 -0700
Received: from [10.21.132.148] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 17 Jun
 2019 10:32:49 +0000
Subject: Re: [PATCH 1/3] clk: tegra: Do not warn unnecessarily
To:     Thierry Reding <thierry.reding@gmail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC:     Peter De Schrijver <pdeschrijver@nvidia.com>,
        Alex Frid <afrid@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
References: <20190613161225.2531-1-thierry.reding@gmail.com>
From:   Jon Hunter <jonathanh@nvidia.com>
Message-ID: <cad0866c-3667-8a17-8351-222e3cca73cb@nvidia.com>
Date:   Mon, 17 Jun 2019 11:32:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613161225.2531-1-thierry.reding@gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL103.nvidia.com (172.20.187.11) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1560767572; bh=sgUi3SjZ1T5o88iiK/A31ZDmOrHPfKalXGMR/PxBLHc=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=Xkz+egEtKsrF6ab4spRleRS5+4UXWYQmoOqaccMl1LRFoXWGTFke3pa66fbnFAbhb
         5vdl30vX61VV//AIT3q/xV/ACCTBfSYZpLssRucEEUfoBoFGL+MHUkl1Mj1Lf+WrI2
         VwnnvKPvCj+cj8A46+F+8Mowj+CCaylywBhjBC5OJ0CA0hGwJbreQhWRtjQOAbkqzV
         n3vkMgKif63n4RSrel9bojwiKv4C0wbiuBg3c2U+twBQMpTRYLdXHAi14Nd3zHRjDi
         oQHrkODHhmxiw/Ai9BcX0ODLFrGmqNmYSQWMZ/yF7QcmHYU5lgfLZ6fZMeHk8zhxza
         xGXr26bCh51+g==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 13/06/2019 17:12, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> There is no need to warn if the reference PLL is enabled with the
> correct defaults. Only warn if the boot values don't match the defaults.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-tegra210.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
> index e1ba62d2b1a0..4904ac4a75db 100644
> --- a/drivers/clk/tegra/clk-tegra210.c
> +++ b/drivers/clk/tegra/clk-tegra210.c
> @@ -984,8 +984,6 @@ static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
>  	pllre->params->defaults_set = true;
>  
>  	if (val & PLL_ENABLE) {
> -		pr_warn("PLL_RE already enabled. Postponing set full defaults\n");
> -
>  		/*
>  		 * PLL is ON: check if defaults already set, then set those
>  		 * that can be updated in flight.
> @@ -1012,6 +1010,9 @@ static void tegra210_pllre_set_defaults(struct tegra_clk_pll *pllre)
>  		writel_relaxed(val, clk_base + pllre->params->ext_misc_reg[0]);
>  		udelay(1);
>  
> +		if (!pllre->params->defaults_set)
> +			pr_warn("PLL_RE already enabled. Postponing set full defaults\n");
> +
>  		return;
>  	}

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
