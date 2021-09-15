Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2FDAC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 08:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95B1061179
	for <linux-clk@archiver.kernel.org>; Wed, 15 Sep 2021 08:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236813AbhIOIWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Sep 2021 04:22:48 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:52540
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236796AbhIOIWr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Sep 2021 04:22:47 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3CE674017C
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 08:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631694088;
        bh=T9oBygJtDcSxynkt0eDMI4wk/aOKBmsP5WZcP0OudvE=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=Ywx/9rGUCRPEAySS0CABXhyg0v20hpLlc0leB3QXJoarh4wbWebdFAFaWeYq5uUOG
         SltSdba6Q/GouVyf7xOE2F9C6cDK2TcyWEUJbgpqq/X6i5Y/ouOjt55sbMLwriS2xf
         1YKtYM/78O2B/QJGhv5jsP36Z25r704SzpX5aLnbUrg9GI7UdyYpfObz5g1jsg0v8S
         mGsc2pBT6x69F0I6GFW3bpMFgQWiGiXy682iis2ah5P+iFApQnr5VSBWTEMh0uQDpb
         S60qvS+S8jKymEnm+shAvavOaqrBLg6ZBhCW9k++5QWKOUcPy6xITdEwJ6GeIQa/uS
         AJKqgo9wgpPxQ==
Received: by mail-ej1-f72.google.com with SMTP id q15-20020a17090622cf00b005c42d287e6aso1084348eja.18
        for <linux-clk@vger.kernel.org>; Wed, 15 Sep 2021 01:21:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=T9oBygJtDcSxynkt0eDMI4wk/aOKBmsP5WZcP0OudvE=;
        b=YMV90zZQsr8+IyA+PvIvpS2bjlCkIiQtkDPijCiYUoVD5JbKrZXrWNCz6NL0w4DHHK
         BTTvLlKzmd4P5n+4Fd8QQ6Nb/rElm3xBj73OLQPovLlRpfXAO5r/HIlV6Y/4c+5d/Ua+
         eviCXR5FezgRSJcJbm8WVXKUiay2gXkUqtrsjxpywMjKBv6uCWGEqtRIcPWlACuYkXYZ
         x6qMgyUj3ilo2oI2bQMHBlw/dH+vUzCEBiwqdy/Ub4tDJ2ieemDQw4PR5YWWr0SPBFmW
         y0bRYtgOduilDkzV0LJp3jH0yfJFrPbyzrNMBoXuBCvBs4iNNyAzl5hdRvQ/3IwrlXzM
         Xoyw==
X-Gm-Message-State: AOAM532XxqVZybuCHNV7zMLRRP/+9kaiSl7FFIj9EA4aW8d9UyRWz3ul
        TMQ6SSqCc4f8kvPyHpkTRuSRjYRcFUWb6F5pv60l/hAt6Nlx+dEc3m7iwhk2P9x6puIMp5CiWFy
        uQBcCgluKsPV3LpQBkmGaBbwxqW2LEBcPqVO9SA==
X-Received: by 2002:a17:907:2659:: with SMTP id ar25mr6434145ejc.541.1631694087330;
        Wed, 15 Sep 2021 01:21:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJHhAt+UC2TTt6eZKM2wmD48YPJlH69BUzCNHbTGNiVGA/qWWuPtGChl6QJ4B1hK5grd9Teg==
X-Received: by 2002:a17:907:2659:: with SMTP id ar25mr6434129ejc.541.1631694087157;
        Wed, 15 Sep 2021 01:21:27 -0700 (PDT)
Received: from [192.168.3.211] (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
        by smtp.gmail.com with ESMTPSA id n10sm5922155ejk.86.2021.09.15.01.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Sep 2021 01:21:26 -0700 (PDT)
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <20210914155607.14122-2-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <6ef3e9a3-77e7-48b7-cbcd-c13db50d0cd9@canonical.com>
Date:   Wed, 15 Sep 2021 10:21:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210914155607.14122-2-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/09/2021 17:56, Sam Protsenko wrote:
> By default if bus clock has no users its "enable count" value is 0. It
> might be actually running if it's already enabled in bootloader, but
> then in some cases it can be disabled by mistake. For example, such case
> was observed when dw_mci_probe() enabled bus clock, then failed to do
> something and disabled that bus clock on error path. After that even
> attempt to read the 'clk_summary' file in DebugFS freezed forever, as
> CMU bus clock ended up being disabled and it wasn't possible to access
> CMU registers anymore.
> 
> To avoid such cases, CMU driver must increment the ref count for that
> bus clock by running clk_prepare_enable(). There is already existing
> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
> support for runtime PM"). But the clock is actually enabled only in
> Exynos5433 clock driver. Let's mimic what is done there in generic
> samsung_cmu_register_one() function, so other drivers can benefit from
> that `.clk_name' field. As was described above, it might be helpful not
> only for PM reasons, but also to prevent possible erroneous clock gating
> on error paths.
> 
> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
> flag for corresponding gate clocks. But that might be not very good
> design decision, as we might still want to disable that bus clock, e.g.
> on PM suspend.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> ---
>  drivers/clk/samsung/clk.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
> index 1949ae7851b2..da65149fa502 100644
> --- a/drivers/clk/samsung/clk.c
> +++ b/drivers/clk/samsung/clk.c
> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>  
>  	ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
>  
> +	/* Keep bus clock running, so it's possible to access CMU registers */
> +	if (cmu->clk_name) {
> +		struct clk *bus_clk;
> +
> +		bus_clk = __clk_lookup(cmu->clk_name);
> +		if (bus_clk) {
> +			clk_prepare_enable(bus_clk);
> +		} else {
> +			pr_err("%s: could not find bus clock %s\n", __func__,
> +			       cmu->clk_name);
> +		}
> +	}
> +

Solving this problem in generic way makes sense but your solution is
insufficient. You skipped suspend/resume paths and in such case you
should remove the Exynos5433-specific code.

Best regards,
Krzysztof
