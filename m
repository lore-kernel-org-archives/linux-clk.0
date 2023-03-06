Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C3C6C678D4
	for <linux-clk@archiver.kernel.org>; Mon,  6 Mar 2023 14:36:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbjCFOg6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Mar 2023 09:36:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230504AbjCFOgz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Mar 2023 09:36:55 -0500
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 204E2B46C
        for <linux-clk@vger.kernel.org>; Mon,  6 Mar 2023 06:36:20 -0800 (PST)
Received: by mail-ed1-x532.google.com with SMTP id k10so15507853edk.13
        for <linux-clk@vger.kernel.org>; Mon, 06 Mar 2023 06:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678113308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LVEoV2e9JxxVuffMnk5zPqnGKqMmb25URoKT4WzdzCk=;
        b=Nb8c7ev2IA1SH4QtZdfFCC04Z7JlwXFJPjlQXUJ5fpBftQR//be8jeOSu5SHL+kgvm
         vCnaFqF/ib+OYrColMepbohcBy5TPRk1rGv2I2xwLxGdN2vuwQ9iVngc6K18aggLeEeK
         Pk+ho0abMLBdkujVfEkkrfjWCKLD+ezWMoGjSutLAKJHND8Qv95owevYWs+TxvjKdzzz
         bn5jSvrNLgA7uhHNTjjVZQ9tqRBwwBV50DvIcgEK6yqiZoKTb352Nd1nmaCg+BhTL/2/
         hGNxkX82ZmtV0JPMUuP/AeCaG2EEuVW3oYKnkwYlA97m5itILpf9t4pqXMWWYd8T+dfV
         ZzSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678113308;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LVEoV2e9JxxVuffMnk5zPqnGKqMmb25URoKT4WzdzCk=;
        b=jhGCfGkX++vkYKVm5LETALskxTGpEOUd8pUtjQFJTrv/sOOX0qWylgP/K5P4KjxkQu
         qnmnOa1id6LE9iLOuj/oFrgWv1TwFzmitND6X2pdAhBO+i+YBQ+Vfjz4vXQ7HQYYkShr
         tmD0EVJkUNr3Sk6Y2vxhK4Oz/XzTBqZyQZQPXUo+55s5h4La4+wX5gqnd03p3kHZ6Oeb
         n1BdVkkz/XRfLG/s/wHseP+XTIIwYvjfboDgXC0R9jei6zdi0T2m+N1iMCHjJhx9W9RT
         BNyVFyLT/slUnFYIHAnyei+gWJeRy+WwtmbGbbHIp0EHCjSl5oqnR+7sgPdZ/6228Iod
         vioA==
X-Gm-Message-State: AO0yUKX5de9LptWAN3smez9+eQFKDcZnLcYlfbjqa+ijkOM8GWZ3n/oV
        hYpk1wGC1FQb+NcXUTJm66yjLg==
X-Google-Smtp-Source: AK7set+4UvM4WeEld9d1MulJogMXnAMeCG6KRrVaYnMJvULGkXtdKx6KbJfIVfvtsaFwQiGlh6VYcQ==
X-Received: by 2002:a17:907:701:b0:8f3:f976:ac13 with SMTP id xb1-20020a170907070100b008f3f976ac13mr14099986ejb.10.1678113307986;
        Mon, 06 Mar 2023 06:35:07 -0800 (PST)
Received: from ?IPV6:2a02:810d:15c0:828:c1e7:5006:98ac:f57? ([2a02:810d:15c0:828:c1e7:5006:98ac:f57])
        by smtp.gmail.com with ESMTPSA id uk19-20020a170907ca1300b008cecb8f374asm4634653ejc.0.2023.03.06.06.35.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 06:35:07 -0800 (PST)
Message-ID: <7cbc24bf-6920-c75f-effc-fd9d827ca324@linaro.org>
Date:   Mon, 6 Mar 2023 15:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/6] clk: samsung: Extract parent clock enabling to
 common function
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     Tomasz Figa <tomasz.figa@gmail.com>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230223041938.22732-1-semen.protsenko@linaro.org>
 <20230223041938.22732-6-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230223041938.22732-6-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/02/2023 05:19, Sam Protsenko wrote:
> Extract parent clock enabling from exynos_arm64_register_cmu() to
> dedicated function.
> 
> Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
> Changes in v3:
>   - Rebased on top of latest soc/for-next tree
>   - Added Marek's Acked-by tag
> 
> Changes in v2:
>   - Rebased on top of latest soc/for-next tree
>   - Improved English in kernel doc comment
>   - Added clk_prepare_enable() return value check
>   - Added exynos_arm64_enable_bus_clk() check in
>     exynos_arm64_register_cmu()
>   - Changed the commit message to reflect code changes
> 
>  drivers/clk/samsung/clk-exynos-arm64.c | 51 ++++++++++++++++++--------
>  1 file changed, 35 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/samsung/clk-exynos-arm64.c b/drivers/clk/samsung/clk-exynos-arm64.c
> index b921b9a1134a..2aa3f0a5644e 100644
> --- a/drivers/clk/samsung/clk-exynos-arm64.c
> +++ b/drivers/clk/samsung/clk-exynos-arm64.c
> @@ -56,6 +56,37 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
>  	iounmap(reg_base);
>  }
>  
> +/**
> + * exynos_arm64_enable_bus_clk - Enable parent clock of specified CMU
> + *
> + * @dev:	Device object; may be NULL if this function is not being
> + *		called from platform driver probe function
> + * @np:		CMU device tree node
> + * @cmu:	CMU data
> + *
> + * Keep CMU parent clock running (needed for CMU registers access).
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +static int __init exynos_arm64_enable_bus_clk(struct device *dev,
> +		struct device_node *np, const struct samsung_cmu_info *cmu)
> +{
> +	struct clk *parent_clk;
> +
> +	if (!cmu->clk_name)
> +		return 0;
> +
> +	if (dev)
> +		parent_clk = clk_get(dev, cmu->clk_name);
> +	else
> +		parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> +
> +	if (IS_ERR(parent_clk))
> +		return PTR_ERR(parent_clk);
> +
> +	return clk_prepare_enable(parent_clk);
> +}
> +
>  /**
>   * exynos_arm64_register_cmu - Register specified Exynos CMU domain
>   * @dev:	Device object; may be NULL if this function is not being
> @@ -72,23 +103,11 @@ static void __init exynos_arm64_init_clocks(struct device_node *np,
>  void __init exynos_arm64_register_cmu(struct device *dev,
>  		struct device_node *np, const struct samsung_cmu_info *cmu)
>  {
> -	/* Keep CMU parent clock running (needed for CMU registers access) */
> -	if (cmu->clk_name) {
> -		struct clk *parent_clk;
> -
> -		if (dev)
> -			parent_clk = clk_get(dev, cmu->clk_name);
> -		else
> -			parent_clk = of_clk_get_by_name(np, cmu->clk_name);
> -
> -		if (IS_ERR(parent_clk)) {
> -			pr_err("%s: could not find bus clock %s; err = %ld\n",
> -			       __func__, cmu->clk_name, PTR_ERR(parent_clk));
> -		} else {
> -			clk_prepare_enable(parent_clk);
> -		}
> -	}
> +	int err;
>  
> +	err = exynos_arm64_enable_bus_clk(dev, np, cmu);
> +	if (err)
> +		panic("%s: could not enable bus clock\n", __func__);

The error handling is changed and not equivalent. I would say that we
could still try to boot even if this failed, so kernel should not panic.
Maybe the parent clock is enabled by bootloader.

Best regards,
Krzysztof

