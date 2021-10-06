Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FCAEC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 12:45:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F55B61130
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 12:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238471AbhJFMrT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 08:47:19 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:49492
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231277AbhJFMrT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 08:47:19 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7EA7D3F32F
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 12:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633524326;
        bh=XsesgrQqzWwogTU+5boSP+pFMfuw8qiwr/ZK6i/vNzY=;
        h=To:Cc:References:From:Subject:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=ZKJ/vqzIjO2ualA2Mj5kGzu7xvWMHnvUe/Ic1vcPnpI69MfBecgeP8kqTKjjU+Lkv
         JFqysaIMAQ8ybursugLolhje9Vn8VQ+i/6gDR0hAE533ra2szgiR05zlBAhbFu5qqi
         qKlaf2SOrTLinHeLceb17n8pUsCWvekpPXaPRb5nR8PSLDkOLohD1+fGypv8z6cjfD
         Eknu9YuB/BCFcKQ5vruYYX/A21R2u15zPTrv4d3jWz5h6J15pCLT2UeWKj7HIg9luR
         +CBHvH39hjZ3VVSCw9bn7X+dwytcAtqmlfiqkLdi+9QyRV3lfHSdajVZvmQHf6qlJY
         jg5trjueoNwrQ==
Received: by mail-lf1-f70.google.com with SMTP id x7-20020a056512130700b003fd1a7424a8so1895737lfu.5
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 05:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:to:cc:references:from:subject:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XsesgrQqzWwogTU+5boSP+pFMfuw8qiwr/ZK6i/vNzY=;
        b=YjNP1xbbliwqnghk+VTbNS8EhKyyM1GbQ/FtSqFpK5ovLos/v8tTqiARcpvr1Xa2WA
         sqiiIpmWcOGym4INbruxN/CLbj2FPjBjvfYDYNF3lEoZ9kJRHAiYqkPumuGDPaUGCxnd
         FYZNnjuXR4vzN7XUFivQfS5i62nCrm4iOsKk39IV9cNJmEqIlsupyHL/Rwwottj8ph/e
         taC9tetQUrR0tv1YRP3jkIN4SRkFyPV31chWXGKVZhNUOpA8/X69ye+gXKVnfUx9HNkL
         v41t3M3LahsSvah9zDkUjC5eJcW1cU87576as9VD1qlPP7ZmYOtjDXTv4ER6ERLpnpVl
         6bWw==
X-Gm-Message-State: AOAM533hvslRH4Z516WtHCfI2VyOyF3gXw6u4QG/hGW0iDwUxHN+apZo
        0429fSMcil0SjVfMiW8buQk2UM6bix/6Txxg3/C5IpJHhZSRUJewl6tGTKZBpEiyLnOuzMdL2y+
        UYByK/5zeLWs3NN7de71s7tnFWzxjU89eSB0b0A==
X-Received: by 2002:a19:c518:: with SMTP id w24mr9149093lfe.125.1633524325887;
        Wed, 06 Oct 2021 05:45:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyhGwDOSL2mxsXWubM939Ug6u/kgMcn1i/hSf09VP/mwWAUSK8G8MbnL95dBRJZRC7RBA9iSQ==
X-Received: by 2002:a19:c518:: with SMTP id w24mr9149071lfe.125.1633524325615;
        Wed, 06 Oct 2021 05:45:25 -0700 (PDT)
Received: from [192.168.0.20] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id c2sm1248767lfi.277.2021.10.06.05.45.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Oct 2021 05:45:25 -0700 (PDT)
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc:     =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20210914155607.14122-1-semen.protsenko@linaro.org>
 <CGME20210914155621eucas1p18e0f1f50fe42af4f8048ed88507219ed@eucas1p1.samsung.com>
 <20210914155607.14122-2-semen.protsenko@linaro.org>
 <b44e1c4a-5abc-7a27-e9ae-d4645d04527a@samsung.com>
 <CAPLW+4=cL00WxQpobovE3Jo62RijOpqwYNAF8TJHXQTdGxNHHg@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH 1/6] clk: samsung: Enable bus clock on init
Message-ID: <eb582eb0-f281-1795-9584-fccc60147261@canonical.com>
Date:   Wed, 6 Oct 2021 14:45:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=cL00WxQpobovE3Jo62RijOpqwYNAF8TJHXQTdGxNHHg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 06/10/2021 13:18, Sam Protsenko wrote:
> On Wed, 15 Sept 2021 at 15:51, Sylwester Nawrocki
> <s.nawrocki@samsung.com> wrote:
>>
>> Hi,
>>
>> On 14.09.2021 17:56, Sam Protsenko wrote:
>>> By default if bus clock has no users its "enable count" value is 0. It
>>> might be actually running if it's already enabled in bootloader, but
>>> then in some cases it can be disabled by mistake. For example, such case
>>> was observed when dw_mci_probe() enabled bus clock, then failed to do
>>> something and disabled that bus clock on error path. After that even
>>> attempt to read the 'clk_summary' file in DebugFS freezed forever, as
>>> CMU bus clock ended up being disabled and it wasn't possible to access
>>> CMU registers anymore.
>>>
>>> To avoid such cases, CMU driver must increment the ref count for that
>>> bus clock by running clk_prepare_enable(). There is already existing
>>> '.clk_name' field in struct samsung_cmu_info, exactly for that reason.
>>> It was added in commit 523d3de41f02 ("clk: samsung: exynos5433: Add
>>> support for runtime PM"). But the clock is actually enabled only in
>>> Exynos5433 clock driver. Let's mimic what is done there in generic
>>> samsung_cmu_register_one() function, so other drivers can benefit from
>>> that `.clk_name' field. As was described above, it might be helpful not
>>> only for PM reasons, but also to prevent possible erroneous clock gating
>>> on error paths.
>>>
>>> Another way to workaround that issue would be to use CLOCK_IS_CRITICAL
>>> flag for corresponding gate clocks. But that might be not very good
>>> design decision, as we might still want to disable that bus clock, e.g.
>>> on PM suspend.
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  drivers/clk/samsung/clk.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>>> index 1949ae7851b2..da65149fa502 100644
>>> --- a/drivers/clk/samsung/clk.c
>>> +++ b/drivers/clk/samsung/clk.c
>>> @@ -357,6 +357,19 @@ struct samsung_clk_provider * __init samsung_cmu_register_one(
>>>
>>>       ctx = samsung_clk_init(np, reg_base, cmu->nr_clk_ids);
>>>
>>> +     /* Keep bus clock running, so it's possible to access CMU registers */
>>> +     if (cmu->clk_name) {
>>> +             struct clk *bus_clk;
>>> +
>>> +             bus_clk = __clk_lookup(cmu->clk_name);
>>> +             if (bus_clk) {
>>> +                     clk_prepare_enable(bus_clk);
>>> +             } else {
>>> +                     pr_err("%s: could not find bus clock %s\n", __func__,
>>> +                            cmu->clk_name);
>>> +             }
>>> +     }
>>> +
>>>       if (cmu->pll_clks)
>>>               samsung_clk_register_pll(ctx, cmu->pll_clks, cmu->nr_pll_clks,
>>>                       reg_base);
>>
>> I would suggest to implement runtime PM ops in your driver instead, even though
>> those would initially only contain single clk enable/disable. Things like
>> the clk_summary will work then thanks to runtime PM support in the clk core
>> (see clk_pm_runtime_* calls).
> 
> Can you please elaborate more? I don't see how adding PM ops would
> solve the problem I'm trying to address, which is keeping core bus
> clocks always running. For example, I'm looking at clk-exynos5433.c
> implementation, which enables bus clock on resume path:
> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> static int __maybe_unused exynos5433_cmu_resume(struct device *dev)
> {
>     ...
>     clk_prepare_enable(data->clk);
>     ...
> }
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> 
> But that resume operation won't be called on driver init, because it
> configures runtime PM like this:

The device will get suspended (like you say) till the first usage, which
will resume it and thus make the clock enabled.

> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> static int __init exynos5433_cmu_probe(struct platform_device *pdev)
> {
>     ...
>     /*
>      * Enable runtime PM here to allow the clock core using runtime PM
>      * for the registered clocks. Additionally, we increase the runtime
>      * PM usage count before registering the clocks, to prevent the
>      * clock core from runtime suspending the device.
>      */
>     pm_runtime_get_noresume(dev);
>     pm_runtime_set_active(dev);
>     pm_runtime_enable(dev);
>     ...
>     pm_runtime_put_sync(dev);
>     ...
> }
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> 
> When I tried to implement the same in my driver, only suspend function
> is called during kernel startup.
> 
> Anyway, even clk-exynos5433.c driver (which also implements PM ops)
> does the same for core bus clocks:
> 
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> static int __init exynos5433_cmu_probe(struct platform_device *pdev)
> {
>     ...
>     if (info->clk_name)
>         data->clk = clk_get(dev, info->clk_name);
>     clk_prepare_enable(data->clk);
>     ...
> }
> <<<<<<<<<<<<<<<< cut here >>>>>>>>>>>>>>>>
> 
> So it looks like separate feature to me. Not sure how that can be
> implemented only by adding PM ops. Also, my board lacks PM support in
> upstream kernel right now, so I probably won't be able to test PM ops
> if I implement those, that's why I decided to skip it for now.

In general you need runtime PM to make a proper clock driver. You can
skip it, just like most of our early drivers skipped it, including
Exynos7, but it's not good in the long run. You might later hit for
example imprecise aborts when enumerating clocks (/sys/kernel/debug/clk)
or power domains.

To me it is fine with skipping runtime PM, but using platform driver now
seems good choice. When writing the code, use rather Exynos5433 as an
example, not Exynos7. The former was extensively developed and used for
mainline. The latter was only part of rather early bringup of platform
and lacks several features/drivers/DT.


Best regards,
Krzysztof
