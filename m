Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B180CC432BE
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 07:12:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E88760F35
	for <linux-clk@archiver.kernel.org>; Sat, 31 Jul 2021 07:12:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbhGaHM2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 31 Jul 2021 03:12:28 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:53468
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230107AbhGaHM1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 31 Jul 2021 03:12:27 -0400
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id E7EF63F107
        for <linux-clk@vger.kernel.org>; Sat, 31 Jul 2021 07:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1627715539;
        bh=hN6QfGvmrSwTg4tA4I3radaavpm+Sqfgu2IG+IjJCBU=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=B0PAP61XUWJZhkjQiJoFJ6o2+qyJG6f+RbTMjUZ+8LptRgw/A340uWzzIkCh2ZIA6
         clw14io+hbIdgN7k7OEGBZ3ntQq+43eecoMqzqMTkhEVJbJ0WzdP06UimgNTVINHQn
         Aui4gWYVpuRPy2v9LfjcG6G/05xOfpjDaP69dFKpdAtcIEEAHpxuODK2BlJfg09a1u
         pVoa70KGHRP3MmzBPPOApkiSE0XT8dYcVtNaLifH5YnbvgGjPF3aQro4XKTfOQpTmB
         yFFcDA1kHzCg4CKw8msRIYJ+ICR0I8MFXQ8q40MEbI+O5m3u9wrrLlZqA2LcTCpgTa
         BuUQQwE2YQPLw==
Received: by mail-ej1-f72.google.com with SMTP id q19-20020a1709064cd3b02904c5f93c0124so3704522ejt.14
        for <linux-clk@vger.kernel.org>; Sat, 31 Jul 2021 00:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hN6QfGvmrSwTg4tA4I3radaavpm+Sqfgu2IG+IjJCBU=;
        b=KQO+JZbCSBEow4JPirJTYyvh0EhkLMA/axyknysxEEX6RkZvOhpS929aDjESY9/VvC
         Mo8fOeYrby1ln/X1zeAx4GiM+1I7ZOi/0N3Xf0faxyCLP119+3C4lHN7lt3iIckUnBNh
         K6P74ZGfaBEclQFg6b0t7z41KlO0XD/up41ZMnwVjR38PsBSxdC3ku48Mol4+PUyu6zT
         OgExi4b/iEac/jgU5VGKzCSI721ILdPFRj4CyaD+Cfgg3bf2WutiVL/iNvkEU+jthmQm
         ZHbaM5fvEQV5vM+J3TMLyN3mLyr1cuPhcTO62I6GL6yn2KaAgo120Wf1dzoYnX0rgtdd
         vq2A==
X-Gm-Message-State: AOAM531bRDaMwwqWCWG+3YZ2ozEm4siDBZuI3noa0+aXYIUgMKrFq85W
        QceXCgv+a36MASU7qbafAbNVaXT0uVOlUKkbOp2zWJmGi1hGREyt/yNyPVD6/GZrBX7Tbm9gJAJ
        eIrGq76KHIcgkC/OiadBdjSmstY3D27HRGPn6+Q==
X-Received: by 2002:a50:da0e:: with SMTP id z14mr7925683edj.73.1627715537253;
        Sat, 31 Jul 2021 00:12:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzM+J4ApxUWFlgbSwRrJJR8tujps6FaXF0fw5qP1Ypyvp7qxb82ntIhvndqLnHetlhetnI/Qw==
X-Received: by 2002:a50:da0e:: with SMTP id z14mr7925659edj.73.1627715537087;
        Sat, 31 Jul 2021 00:12:17 -0700 (PDT)
Received: from [192.168.8.102] ([86.32.47.9])
        by smtp.gmail.com with ESMTPSA id l2sm1339054ejg.37.2021.07.31.00.12.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jul 2021 00:12:16 -0700 (PDT)
Subject: Re: [PATCH 06/12] tty: serial: samsung: Add Exynos850 SoC data
To:     Sam Protsenko <semen.protsenko@linaro.org>
Cc:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Jiri Slaby <jirislaby@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Charles Keepax <ckeepax@opensource.wolfsonmicro.com>,
        Ryu Euiyoul <ryu.real@samsung.com>,
        Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
References: <20210730144922.29111-1-semen.protsenko@linaro.org>
 <20210730144922.29111-7-semen.protsenko@linaro.org>
 <5826bc3e-e9e8-a9bb-4541-21c1b944a60e@canonical.com>
 <CAPLW+4=yOETYdVWvG_YUzewRDg9wB1h+z4i3DRDxJQHeVgu1EQ@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <3b607569-e97a-9f1b-92a2-a28de5d0e6b6@canonical.com>
Date:   Sat, 31 Jul 2021 09:12:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAPLW+4=yOETYdVWvG_YUzewRDg9wB1h+z4i3DRDxJQHeVgu1EQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/07/2021 01:10, Sam Protsenko wrote:
> On Fri, 30 Jul 2021 at 19:05, Krzysztof Kozlowski
> <krzysztof.kozlowski@canonical.com> wrote:
>>
>> On 30/07/2021 16:49, Sam Protsenko wrote:
>>> Add serial driver data for Exynos850 SoC. This driver data is basically
>>> reusing EXYNOS_COMMON_SERIAL_DRV_DATA, which is common for all Exynos
>>> chips, but also enables USI init, which was added in previous commit:
>>> "tty: serial: samsung: Init USI to keep clocks running".
>>>
>>> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
>>> ---
>>>  drivers/tty/serial/samsung_tty.c | 13 +++++++++++++
>>>  1 file changed, 13 insertions(+)
>>>
>>> diff --git a/drivers/tty/serial/samsung_tty.c b/drivers/tty/serial/samsung_tty.c
>>> index 75ccbb08df4a..d059b516a0f4 100644
>>> --- a/drivers/tty/serial/samsung_tty.c
>>> +++ b/drivers/tty/serial/samsung_tty.c
>>> @@ -2814,11 +2814,19 @@ static struct s3c24xx_serial_drv_data exynos5433_serial_drv_data = {
>>>       .fifosize = { 64, 256, 16, 256 },
>>>  };
>>>
>>> +static struct s3c24xx_serial_drv_data exynos850_serial_drv_data = {
>>> +     EXYNOS_COMMON_SERIAL_DRV_DATA_USI(1),
>>> +     .fifosize = { 0, },
>>
>> This does not look correct. You rely on samsung,uart-fifosize property
>> but it is optional.
>>
> 
> Good point. I will replace fifosize elements (in patch series v2) with
> this code (the reasoning is below):
> 
>     .fifosize = { 256, 64, 64, 64 }
> 
> TRM mentions that USI block has configurable FIFO of 16/32/64/128/256
> byte. In vendor kernel they are setting default values in dtsi instead
> of driver, that's where fifosize = { 0 } appeared from. And in vendor
> dtsi they set 256 for serial_0 (USI UART instance), 64 for serial_1
> (CMGP0 UART instance) and 64 for serial_2 (CMGP1 UART instance). I
> tested 256 and 64 for serial_0 (which is used for serial console)
> 
> As for fifosize array elements count: though it's possible to
> configure up to 7 UARTs in Exynos850 (it has 5 USI blocks and 2 CMGP
> blocks, which can be configured as USIs), in a regular case it's only
> 3 UARTs (1 in USI and 2 in CMGP). This is how it's done in vendor's
> device tree, and I doubt someone is going to need more than 3 serials
> anyway, looks like very specific case for a mobile SoC. But
> CONFIG_SERIAL_SAMSUNG_UARTS_4=y is set by default when using arm64
> defconfig, and I'd like to keep minimal delta for this defconfig for
> now.
> 
> Hope you are ok with this?
> 

Yes, sounds good.


Best regards,
Krzysztof
