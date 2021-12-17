Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D097C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 17 Dec 2021 08:21:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233779AbhLQIVy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Dec 2021 03:21:54 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:45350
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233775AbhLQIVx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Dec 2021 03:21:53 -0500
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 9EF163FFDB
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 08:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1639729311;
        bh=xfmZvtdVL4Nqs/cnkKhKrTzxRXy+hfPyDSZiWdGZz7I=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=U/nMHyDa1jkKhZJ1AIVtnYFZ+KxBdPcU0/dLq/NBPNvaIbRNaStql0+hEtUUDG3vF
         UnFoU4fcfglS9HR8SVJBJR2MR1im49jKfY+gwqqs/92Bd7tmto9NpXRo9Nhp2LZUL+
         o85FmdXuVexbkmvi3KIS7TvAxDZ8dTjP9tga9R/5OJLzFx3BU1soOXtT8sbu6N3Btn
         qSno9g5n77lEqKNHDVD3xMTuMnlgQBkL09zwWlmEDoTLX2YrXJ0lgaW92/sDuMu/Zr
         Xn/J/XniPflCrDebNMJFpH4BzWpkyEU2jdnQgk4jvdkNq982buSWYMZGkX1PBjrABM
         OlDILNsf8yRuw==
Received: by mail-lf1-f69.google.com with SMTP id m2-20020a056512014200b0041042b64791so739316lfo.6
        for <linux-clk@vger.kernel.org>; Fri, 17 Dec 2021 00:21:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=xfmZvtdVL4Nqs/cnkKhKrTzxRXy+hfPyDSZiWdGZz7I=;
        b=EX0sEWWatVy6SdLXja0w+hkvC4cRhboQ8ZVkmAUP993CwEl7WovFEwKalF2mMFYSIy
         L14EpcXX+JdbvlyGCwhtesIiUmvDN3kelfY3rHbHLhD9buz04tDZ30ULWdwYx9xt2SWn
         pZDPTVk2c/08t6UfU7Ps9Dhsn9zb43Jr/tgUnHDlFgHOIBhagqAk35F6YRkwrBtKb3OS
         B0z8ll8D2Ym/ef4wMLCEwBhebwKuABclsHFNanEIjDP8XfR9AuxExjs6oKT78JLRqQTV
         we/CQEKXrvlcPOq5kvEfWw+xfECy3WLyAKGFBmVDsX3M5bl4lPaFKsv/+3PlT05iu1Rr
         zJnw==
X-Gm-Message-State: AOAM532ZZ1gtwiDp9naOQAxb01iJKTGcgFeNcdhMEROdMSWXJyaQXIa8
        mU5eBAkYFsL4ssDWyWFiASZnXYMBNzEQ3dcF61EfK2YEiiOJeJ2ZdwENUGrSFnzeJpSLVl5W/qW
        iybcDOGWwK2cvbbEelR4dJUsoM3QxJ2hDQ0wRUQ==
X-Received: by 2002:a05:6512:3c9e:: with SMTP id h30mr1919901lfv.212.1639729311088;
        Fri, 17 Dec 2021 00:21:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwfMYzlQckD0Wb0EtQqx2AZ0wkcSDj7w3Z/nn8EeyMb/BCnVstW2Dbq/zvfD5jISNkS6mUEQA==
X-Received: by 2002:a05:6512:3c9e:: with SMTP id h30mr1919870lfv.212.1639729310766;
        Fri, 17 Dec 2021 00:21:50 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id a24sm119818lff.207.2021.12.17.00.21.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Dec 2021 00:21:49 -0800 (PST)
Message-ID: <73c5a527-2d5d-8524-b067-f9128055ff10@canonical.com>
Date:   Fri, 17 Dec 2021 09:21:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/7] arm64: dts: exynos: Add initial Exynos850 SoC support
Content-Language: en-US
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Jaewon Kim <jaewon02.kim@samsung.com>,
        Chanho Park <chanho61.park@samsung.com>,
        David Virag <virag.david003@gmail.com>,
        Youngmin Nam <youngmin.nam@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Hao Fang <fanghao11@huawei.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20211215160906.17451-1-semen.protsenko@linaro.org>
 <20211215160906.17451-7-semen.protsenko@linaro.org>
 <8c1dbcda-ce01-81c9-b34a-f64b6f61c868@canonical.com>
 <CAPLW+4ndeokx3WiYaK_3ooe0J+BQe8Dx7QCecA7Deowk0AdxnA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <CAPLW+4ndeokx3WiYaK_3ooe0J+BQe8Dx7QCecA7Deowk0AdxnA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/12/2021 20:40, Sam Protsenko wrote:
> On Wed, 15 Dec 2021 at 18:47, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>

(...)

>>> +             serial0 = &serial_0;
>>> +             serial1 = &serial_1;
>>> +             serial2 = &serial_2;
>>> +             i2c0 = &i2c_0;
>>> +             i2c1 = &i2c_1;
>>> +             i2c2 = &i2c_2;
>>> +             i2c3 = &i2c_3;
>>> +             i2c4 = &i2c_4;
>>> +             i2c5 = &i2c_5;
>>> +             i2c6 = &i2c_6;
>>> +             i2c7 = &hsi2c_0;
>>> +             i2c8 = &hsi2c_1;
>>> +             i2c9 = &hsi2c_2;
>>> +             i2c10 = &hsi2c_3;
>>> +             i2c11 = &hsi2c_4;
>>> +     };
>>> +
>>> +     arm-pmu {
>>> +             compatible = "arm,cortex-a55-pmu";
>>> +             interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 90 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 92 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,
>>> +                          <GIC_SPI 111 IRQ_TYPE_LEVEL_HIGH>;
>>> +             interrupt-affinity = <&cpu0>, <&cpu1>, <&cpu2>, <&cpu3>,
>>> +                                  <&cpu4>, <&cpu5>, <&cpu6>, <&cpu7>;
>>> +     };
>>> +
>>> +     /* Main system clock (XTCXO); external, must be 26 MHz */
>>> +     oscclk: clock-oscclk {
>>> +             compatible = "fixed-clock";
>>> +             clock-output-names = "oscclk";
>>> +             #clock-cells = <0>;
>>> +     };
>>> +
>>> +     /* RTC clock (XrtcXTI); external, must be 32.768 kHz */
>>
>> This clock is usually provided by PMIC, so instead I expect updating
>> s2mps11-clk driver. It's not correct to mock it with fixed-clock, but in
>> some cases might be needed. Then I would need an explanation and maybe a
>> TODO note.
>>
>> I wonder if we already discussed this...
>>
> 
> Don't really remember discussing that. That's actually something new
> for me :) I was planning to add PMIC support as a part of separate
> activity later, it might not be so easy: S2MPU12 uses I3C connection.
> And RTC clock is not handled even in downstream kernel. So I'll have
> to implement that by PMIC datasheet. I'll keep some TODO comment for
> now, hope it's ok with you?

Assuming it is really coming from the PMIC (should be visible in the
board schematics), it should be using s2mps11-clk. I am fine with
keeping fixed-clock now + TODO note, but please move it to the board
DTS. It's not the property of the SoC.

> 
>>> +     rtcclk: clock-rtcclk {> +               compatible = "fixed-clock";
>>> +             clock-output-names = "rtcclk";
>>> +             #clock-cells = <0>;
>>> +     };
>>> +


Best regards,
Krzysztof
