Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F9E5C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  6 Dec 2021 08:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239240AbhLFIaI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 6 Dec 2021 03:30:08 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:37792
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S239233AbhLFIaI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Dec 2021 03:30:08 -0500
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 60E7B3F317
        for <linux-clk@vger.kernel.org>; Mon,  6 Dec 2021 08:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1638779199;
        bh=I2YDk0JOf4YFbZyBoWvQAoknXKPERCVo9tXi68CgMpY=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=RpOF7i37XbOuskO6HE8DM0eB3mVQEMY3YXboXl3VHmuxibVZEEvINto88z7rs/6Pp
         22leEeNz7HyX4inh1/3rU03Nyf5vAdqTewJ2XDRJ/zmC5UjOn5WK1dZ4mwr4SRsdgD
         ed9tKxInpvgvtA7zCPOHVbX/bz3bsBCdU1sX8x7BKkjU6OLmRHuUI0GCEVP0iJYS8z
         39YWd8gp5M9rvh+Syuw7Gc2N8V0rvWhDbQWPLQr5ch2kW0g3YnIulZB8rsd6wEQuYG
         oJOqBU0NxEcAm/zImbZcn8oU56Jx/+H5ge19IroKgqnuaBK+Y8fLCFwLaiLav5Wrda
         lvTAFdCznvgRw==
Received: by mail-lj1-f199.google.com with SMTP id i14-20020a2e864e000000b00218a2c57df8so3127175ljj.20
        for <linux-clk@vger.kernel.org>; Mon, 06 Dec 2021 00:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=I2YDk0JOf4YFbZyBoWvQAoknXKPERCVo9tXi68CgMpY=;
        b=LhnXBrgdOntNVcK1Z3YXHR71FoUX0gzmZHvJzwwWaRTYrTuisW76pNJsz4nThj1G8S
         qkXs1Gqm/xbn0Owa4JE1XUYvtQTXxaSrOl4A8DjlzWsitybxg7sWBmHFkgmghDwZDCrz
         fDWMnKHqcREF0XgueKgSiUYLc5Woym3JI9Cb24d3feEPxMR32YxwhgfpGA1hXbZU/pq8
         WgZh62ry2RsZcwz8uqg9/X7DHZIDFEamGivuDiZ1NO9OmqRPO9faRUeJsmoMchijAGwF
         eA4R0Cs2UMlcJF6SQxjaLdn8L2QetA8WeKWmcAPu/MkzQJgDpgB+NTgPYh0TwCX5vf1a
         p/8A==
X-Gm-Message-State: AOAM530p9e038ioAjf1qv18xrR44kanYNOreJu247AKmAKCSHQkgoZy7
        A2XvAgZN3fqqyaGThyRJZ+Lf7gzcSdpa1aEb3RnPic2ObbJz/Rz9UrHYhU43+gIjQsDn/Z4jshz
        zQt/xMsSmJdjAgNi2k+HDP8SSqhdrHS1g0jdqjw==
X-Received: by 2002:a2e:9510:: with SMTP id f16mr34952316ljh.409.1638779198521;
        Mon, 06 Dec 2021 00:26:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNPrUMZzOnnm8zdAwzMDd+aJHk6yZF25LQGSg+8qkRDFotnn5BIFf+o11O8VA5y3oY+fctIg==
X-Received: by 2002:a2e:9510:: with SMTP id f16mr34952248ljh.409.1638779197628;
        Mon, 06 Dec 2021 00:26:37 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id k15sm1298650lfe.15.2021.12.06.00.26.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Dec 2021 00:26:37 -0800 (PST)
Message-ID: <e9a07956-86d4-ae96-a641-020b3d85c51c@canonical.com>
Date:   Mon, 6 Dec 2021 09:26:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/6] arm64: dts: exynos: Add initial device tree support
 for Exynos7885 SoC
Content-Language: en-US
To:     David Virag <virag.david003@gmail.com>,
        Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211205153302.76418-1-virag.david003@gmail.com>
 <20211205153302.76418-7-virag.david003@gmail.com>
 <de24b968-f359-25bf-76d7-69328401f83d@canonical.com>
 <60f5c2e98e3a2048f86a79c3aa1ed945dc0cb4aa.camel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <60f5c2e98e3a2048f86a79c3aa1ed945dc0cb4aa.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/12/2021 19:14, David Virag wrote:
> On Sun, 2021-12-05 at 18:31 +0100, Krzysztof Kozlowski wrote:
> 
> [...]
> 
>>> +       fimc_is_mclk0_in: fimc_is_mclk0_in {
>>> +               samsung,pins = "gpc0-0";
>>> +               samsung,pin-function = <EXYNOS_PIN_FUNC_INPUT>;
>>> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>>> +               samsung,pin-drv = <2>;
>>> +       };
>>> +
>>> +       fimc_is_mclk0_out: fimc_is_mclk0_out {
>>> +               samsung,pins = "gpc0-0";
>>> +               samsung,pin-function = <EXYNOS_PIN_FUNC_OUTPUT>;
>>> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>>> +               samsung,pin-drv = <2>;
>>> +       };
>>> +
>>> +       fimc_is_mclk0_fn: fimc_is_mclk0_fn {
>>
>> I cannot get the point of these pin configurations - three groups
>> with
>> only function difference. How this would be used by the driver? Maybe
>> just keep the one really used. Same for others below.
>>
> 
> They seem to be changed in some cases by the FIMC-IS and/or Camera
> module drivers in the downstream kernel. I'm not exactly sure about why
> and how are they needed, as the code for FIMC-IS is quite large and
> it's not my priority to work on it right now. I can remove these
> configurations for now if that's okay, maybe I, or someone else will
> re-add it later if it's needed.
> 
>>
>>> +               samsung,pins = "gpc0-0";
>>> +               samsung,pin-function = <EXYNOS_PIN_FUNC_2>;
>>> +               samsung,pin-pud = <EXYNOS_PIN_PULL_NONE>;
>>> +               samsung,pin-drv = <2>;
>>> +       };
>>> +
> 
> [...]
> 
>>> +
>>> +       arm-pmu {
>>> +               compatible = "arm,armv8-pmuv3";
>>
>> Wrong compatible. Please use specific, although I don't know which
>> one
>> you have - 53 or 73... since you have two clusters, I would expect
>> two
>> PMUs, hmm....
> 
> I was thinking the same, but there's a problem: As I'm also guessing we
> have two PMUs for the a53 and a73 cores, we'd need to seperate it but I
> have no access to the documentation that would let me know which
> interrupts we would need for both of these PMUs. The downstream dts
> doesn't tell us anything specific in this case, and I have no idea how
> else am I supposed to know which interrupts are right without a TRM.
> 
> I'd be guessing either the 82, 83 or the 218, 219 interrupts would be
> the right one for the a73 cores, and I suspect that it should be 82 and
> 83, but I can't really confirm this.
> 
> Do you have any idea how to proceed in this case? Maybe there is a way
> to test which ones would be right?
> 
>>
>>> +               interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,

These are for cpu6 and cpu7, because they match the index in
"interrupt-affinity". cpu6 and cpu7 are a73 cores in your DTSI.

>>> +                            <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 97 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 99 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 218 IRQ_TYPE_LEVEL_HIGH>,
>>> +                            <GIC_SPI 219 IRQ_TYPE_LEVEL_HIGH>;

These are for a53, judging by affinity.

>>> +               interrupt-affinity = <&cpu6>,
>>> +                                    <&cpu7>,
>>> +                                    <&cpu0>,
>>> +                                    <&cpu1>,
>>> +                                    <&cpu2>,
>>> +                                    <&cpu3>,
>>> +                                    <&cpu4>,
>>> +                                    <&cpu5>;
>>> +       };
>>> +
> 
> [...]

Best regards,
Krzysztof
