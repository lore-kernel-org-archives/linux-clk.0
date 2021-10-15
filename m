Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 345A2C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 15:17:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1864D60555
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 15:17:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhJOPTJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 11:19:09 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:43650
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240914AbhJOPTI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Oct 2021 11:19:08 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B9E3F3FFFC
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 15:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1634311020;
        bh=A2xRSLDn+GhG8RBB0+GQ4sM4IDnz7hUAS1woxYIrfJE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=N2O0qZpKNHWsbXN1aHOieW7EEt6v+doGPI7JGM9QNA46VrpLAudngK5taA90S6uVo
         /xOUeM+oCLn2OZYLnPVzpjjIc1HrbIMgFbtBhmhCp2+dGIsW41nSPUIOUaZRwhuvQd
         rwo91yM+SqKk8mO6fJDChkttjzRDl5zhhaV82pKGAdB6jsbgmwEyuyfraHJjdN2bAD
         JcjZ5ix8oUurS5Q1g5PmCS6oWOWf0vxMqxxglEj28Jm51wE67Gnc5dgwIvDZlFQjnY
         B/Ds6n3lemyS5Eg8BdhCk6GDb81L1weFwAOgoEDWjnnKFfgxoiotmRRBIAqzkI72eB
         un3Fd3IND1yOw==
Received: by mail-lf1-f71.google.com with SMTP id g10-20020a05651222ca00b003fda3f05c17so6968119lfu.11
        for <linux-clk@vger.kernel.org>; Fri, 15 Oct 2021 08:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A2xRSLDn+GhG8RBB0+GQ4sM4IDnz7hUAS1woxYIrfJE=;
        b=GLTezGHlDJkl7zZrshRGl6+2C6IUA9SMSJtTwyuhMe8i9bWirHzDOYI3cVj+4gGfMQ
         mLpGsMWBexL3t32ZN1l8qYDDgNhoIGu4JsN25sqhrPXkTjPwsBz0Oq48galtrnlTmoRW
         Kn/pYG8Kc/c9ZyS3OdMnC1jkzleGPn7+QGtiLK0OU+9q3XVKF3cLPY6BJAyzSbPirLXX
         NFPBotrynwn8P6dqS1rQnYnbsKSd0CtXSK3Z7ag65yxeITu5ZVoOLb4KuEUEzXv6CARa
         Z8LXdLXlvUiSoHTKxHPvzHq+qsOJ4ZTiso4BYqXK0uaeCXIa1O1+lIYJuyYD3m1dPILE
         ScSw==
X-Gm-Message-State: AOAM5313oftUr1kjm8BhziWVMds1KotbW3OpQ6i6ugicdUDVE7YHIPYQ
        7uioh8jLPFeKsrdF+NO3VkKLEw3VhK3PRpvaUBpnMDZjFAJKLySx7lHqYRdz9fX/tRK9AZCbt4c
        tVX2fPkxMbMp9l1ibMbRMkJTgdpyvfffHVRhDCA==
X-Received: by 2002:ac2:5a47:: with SMTP id r7mr11438036lfn.125.1634311020126;
        Fri, 15 Oct 2021 08:17:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxgbalGksCrrqLeyJ7FhYJ7uHnfTnCD7DKIrKlOMIJbl3ErSR6MX7+nLoWnG+LxFGflOYWU0w==
X-Received: by 2002:ac2:5a47:: with SMTP id r7mr11438022lfn.125.1634311019983;
        Fri, 15 Oct 2021 08:16:59 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id z6sm581083ljc.112.2021.10.15.08.16.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Oct 2021 08:16:59 -0700 (PDT)
Subject: Re: [PATCH] clk: samsung: Remove meaningless __init and extern from
 header files
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, cw00.choi@samsung.com,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, m.szyprowski@samsung.com
References: <CGME20211015151438eucas1p1a784b8fb6bc20b01d4b1ec3634359df5@eucas1p1.samsung.com>
 <20211015151425.29743-1-s.nawrocki@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <531f5bd4-efa2-1583-4bbf-38f57e0b641c@canonical.com>
Date:   Fri, 15 Oct 2021 17:16:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211015151425.29743-1-s.nawrocki@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/10/2021 17:14, Sylwester Nawrocki wrote:
> Remove useless __init atrribute and unneeded extern qualifier in function
> declarations in header files.
> 
> Signed-off-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
> ---
>  drivers/clk/samsung/clk-cpu.h |  2 +-
>  drivers/clk/samsung/clk.h     | 34 +++++++++++++++++-----------------
>  2 files changed, 18 insertions(+), 18 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-cpu.h b/drivers/clk/samsung/clk-cpu.h
> index af74686db9ef..fd885d2bf74c 100644
> --- a/drivers/clk/samsung/clk-cpu.h
> +++ b/drivers/clk/samsung/clk-cpu.h
> @@ -62,7 +62,7 @@ struct exynos_cpuclk {
>  #define CLK_CPU_HAS_E5433_REGS_LAYOUT	(1 << 2)
>  };
>  
> -int __init exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
> +int exynos_register_cpu_clock(struct samsung_clk_provider *ctx,
>  			unsigned int lookup_id, const char *name,
>  			const struct clk_hw *parent, const struct clk_hw *alt_parent,
>  			unsigned long offset,
> diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
> index b23776d540eb..b46e83a2581f 100644
> --- a/drivers/clk/samsung/clk.h
> +++ b/drivers/clk/samsung/clk.h
> @@ -337,52 +337,52 @@ struct samsung_cmu_info {
>  	const char *clk_name;
>  };
>  
> -extern struct samsung_clk_provider *__init samsung_clk_init(
> +struct samsung_clk_provider * samsung_clk_init(
>  			struct device_node *np, void __iomem *base,
>  			unsigned long nr_clks);
> -extern void __init samsung_clk_of_add_provider(struct device_node *np,
> +void samsung_clk_of_add_provider(struct device_node *np,
>  			struct samsung_clk_provider *ctx);
> -extern void __init samsung_clk_of_register_fixed_ext(
> +void samsung_clk_of_register_fixed_ext(
>  			struct samsung_clk_provider *ctx,
>  			struct samsung_fixed_rate_clock *fixed_rate_clk,
>  			unsigned int nr_fixed_rate_clk,
>  			const struct of_device_id *clk_matches);
>  
> -extern void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
> +void samsung_clk_add_lookup(struct samsung_clk_provider *ctx,
>  			struct clk_hw *clk_hw, unsigned int id);
>  
> -extern void __init samsung_clk_register_alias(struct samsung_clk_provider *ctx,
> +void samsung_clk_register_alias(struct samsung_clk_provider *ctx,
>  			const struct samsung_clock_alias *list,
>  			unsigned int nr_clk);
> -extern void __init samsung_clk_register_fixed_rate(
> +void samsung_clk_register_fixed_rate(
>  			struct samsung_clk_provider *ctx,
>  			const struct samsung_fixed_rate_clock *clk_list,
>  			unsigned int nr_clk);
> -extern void __init samsung_clk_register_fixed_factor(
> +void samsung_clk_register_fixed_factor(
>  			struct samsung_clk_provider *ctx,
>  			const struct samsung_fixed_factor_clock *list,
>  			unsigned int nr_clk);
> -extern void __init samsung_clk_register_mux(struct samsung_clk_provider *ctx,
> +void samsung_clk_register_mux(struct samsung_clk_provider *ctx,
>  			const struct samsung_mux_clock *clk_list,
>  			unsigned int nr_clk);
> -extern void __init samsung_clk_register_div(struct samsung_clk_provider *ctx,
> +void samsung_clk_register_div(struct samsung_clk_provider *ctx,
>  			const struct samsung_div_clock *clk_list,
>  			unsigned int nr_clk);
> -extern void __init samsung_clk_register_gate(struct samsung_clk_provider *ctx,
> +void samsung_clk_register_gate(struct samsung_clk_provider *ctx,
>  			const struct samsung_gate_clock *clk_list,
>  			unsigned int nr_clk);
> -extern void __init samsung_clk_register_pll(struct samsung_clk_provider *ctx,
> +void samsung_clk_register_pll(struct samsung_clk_provider *ctx,
>  			const struct samsung_pll_clock *pll_list,
>  			unsigned int nr_clk, void __iomem *base);
> -extern void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
> +void samsung_clk_register_cpu(struct samsung_clk_provider *ctx,
>  		const struct samsung_cpu_clock *list, unsigned int nr_clk);
>  
> -extern struct samsung_clk_provider __init *samsung_cmu_register_one(
> +struct samsung_clk_provider *samsung_cmu_register_one(
>  			struct device_node *,
>  			const struct samsung_cmu_info *);
>  
>  #ifdef CONFIG_PM_SLEEP
> -extern void samsung_clk_extended_sleep_init(void __iomem *reg_base,
> +void samsung_clk_extended_sleep_init(void __iomem *reg_base,
>  			const unsigned long *rdump,
>  			unsigned long nr_rdump,
>  			const struct samsung_clk_reg_dump *rsuspend,
> @@ -397,13 +397,13 @@ static inline void samsung_clk_extended_sleep_init(void __iomem *reg_base,
>  #define samsung_clk_sleep_init(reg_base, rdump, nr_rdump) \
>  	samsung_clk_extended_sleep_init(reg_base, rdump, nr_rdump, NULL, 0)
>  
> -extern void samsung_clk_save(void __iomem *base,
> +void samsung_clk_save(void __iomem *base,
>  			struct samsung_clk_reg_dump *rd,
>  			unsigned int num_regs);

In such case, let's also drop the extern from Will's patch?


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Best regards,
Krzysztof
