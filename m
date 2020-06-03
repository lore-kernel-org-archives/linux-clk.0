Return-Path: <SRS0=Wk/U=7Q=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 506C5C433E0
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 14:04:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B962206A2
	for <linux-clk@archiver.kernel.org>; Wed,  3 Jun 2020 14:04:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AzaodNJg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgFCOER (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Jun 2020 10:04:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725833AbgFCOER (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Jun 2020 10:04:17 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B877C08C5C0;
        Wed,  3 Jun 2020 07:04:16 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s1so2915875ljo.0;
        Wed, 03 Jun 2020 07:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O6mpNiafUZcG8Fhsf6HGMpDE9adAt7StKtXsaBM0T+Q=;
        b=AzaodNJg3VOQsiRKHbO9Hv77PErwygfjIXwX/tZEOBvMuWgNon7cmaNX9ap58Ub6sy
         xv65blgx6PJMU1TF8Y646ZifjYkZMRqUCWALOcIfkiQyX/WQzFUH7ID8r8/4M4m1Y7XT
         aGi/EgZAKKgWtJNghfbufOtb4i2MFsFtVYN8BmjtMm+mjDU2WNqDDcCslw1yrJtMz+wl
         BdNj8TovUnYjP6JU7pQGq0FUVeG9Z6ByEOEW/oLszVatQulUqTbMUVX5wtDmwOeyrMUp
         ZwaGO3xDdWtdXqS/e9cAVemIum5KxR+IRHqTtE0d3GAdKmO7EgS5Bxsx/evWOzarvseR
         8AUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O6mpNiafUZcG8Fhsf6HGMpDE9adAt7StKtXsaBM0T+Q=;
        b=gnFUuSTjVNT8i7Rt1+nvGCNXsUZgWMrTcTqWRKa0Pa9rKMBvyYA3ioes76S0NsIuao
         nrK7AOk2ff2X9MTFT8v5l2gNMFwLHSEQSKWi6VAKZ1xUVef/S6zud63m5CLDo1SmsjnZ
         O/tK+vb0xn1GU80qm7m6H2Sj18c6hkZZXrlkMvU6ZS9HxoROZHnkxj7irt67HMUmWHjZ
         1CcFRHHfkxNIEtToR272hXYX4cgVOiO1WihRTRsDVR8imT885kauMf3Kia/CDMx9Q5uD
         pRmObH1bCxRBQR4oDUBt3rEaOa1DbtOPvHkxCeEDHVKwWJ0TE9LUy5E8S1j26epUWApa
         I3cg==
X-Gm-Message-State: AOAM533sXe4R8sx+44UnJCAHypKmttfa9mSOxxgehxMC5vQubiupNEJ4
        +E2KP3v5PiDJ/OaL5ABPXhhxm58w
X-Google-Smtp-Source: ABdhPJwIHwZbtDzrrkI6X6CYF0aYFzM9eU5acE44LyeiwdNt+9wuEMC8oGiskmYOBKVFbcAlxv47rg==
X-Received: by 2002:a2e:8747:: with SMTP id q7mr1973693ljj.459.1591193054336;
        Wed, 03 Jun 2020 07:04:14 -0700 (PDT)
Received: from [192.168.2.145] (109-252-173-94.dynamic.spd-mgts.ru. [109.252.173.94])
        by smtp.googlemail.com with ESMTPSA id a15sm489634ljn.105.2020.06.03.07.04.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jun 2020 07:04:13 -0700 (PDT)
Subject: Re: [PATCH 2/2] clk: tegra: Always program PLL_E when enabled
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        LABBE Corentin <clabbe@baylibre.com>,
        linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20200603111923.3545261-1-thierry.reding@gmail.com>
 <20200603111923.3545261-2-thierry.reding@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <0433a4b9-f5a4-e92f-7101-cbc4e1e6ef8d@gmail.com>
Date:   Wed, 3 Jun 2020 17:04:12 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200603111923.3545261-2-thierry.reding@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

03.06.2020 14:19, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Commit bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> added checks to avoid enabling PLLs that have already been enabled by
> the bootloader. However, the PLL_E configuration inherited from the
> bootloader isn't necessarily the one that is needed for the kernel.
> 
> This can cause SATA to fail like this:
> 
>     [    5.310270] phy phy-sata.6: phy poweron failed --> -110
>     [    5.315604] tegra-ahci 70027000.sata: failed to power on AHCI controller: -110
>     [    5.323022] tegra-ahci: probe of 70027000.sata failed with error -110
> 
> Fix this by always programming the PLL_E. This ensures that any mis-
> configuration by the bootloader will be overwritten by the kernel.
> 
> Fixes: bff1cef5f23a ("clk: tegra: Don't enable already enabled PLLs")
> Reported-by: LABBE Corentin <clabbe@baylibre.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk-pll.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-pll.c b/drivers/clk/tegra/clk-pll.c
> index 583d2ac61e9e..b2d39a66f0fa 100644
> --- a/drivers/clk/tegra/clk-pll.c
> +++ b/drivers/clk/tegra/clk-pll.c
> @@ -1601,9 +1601,6 @@ static int clk_plle_tegra114_enable(struct clk_hw *hw)
>  	unsigned long flags = 0;
>  	unsigned long input_rate;
>  
> -	if (clk_pll_is_enabled(hw))
> -		return 0;
> -
>  	input_rate = clk_hw_get_rate(clk_hw_get_parent(hw));
>  
>  	if (_get_table_rate(hw, &sel, pll->params->fixed_rate, input_rate))
> 

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
