Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A553C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 19:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230223AbiECTUl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 15:20:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238334AbiECTUl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 15:20:41 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C4313FBE1;
        Tue,  3 May 2022 12:17:05 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6C5D581DB4;
        Tue,  3 May 2022 21:17:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1651605423;
        bh=keYZUlqPUwSjGnRacWuGKyac0t8AfObaM6EAB9Qpqrw=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=bDt4grz5Zb0qssNI8ei9lvS24qK+gZ8PYLd9SppaGaTbumYlEg2h2IOhpJlLBTqVq
         yMuyWlp7pBKYPaachFCa3hw4V9xL4/ToVpPfLjasakYOOG6POvjDJP7BRcAKrb5vlx
         8RG5Wu0HPMD2z0LLxHobxuRBVgnjxMqN/J5f/dg2HXImjXgvQUSqnPDR/XtNG+bYpl
         nXM3U+Q19dbdToDl5NleHDgk9C9qaqWS+VDEs1HysAkf+8O3Q1+DekbW7/Tn6mBeZ+
         7dmUk0fha83p4ifDhJW0KIL/97rKH4ffA6q/XSQ4U3rs/V06btJGM2TNkGHyLhRilU
         duCAI8Vsh/29Q==
Message-ID: <16cbc79d-3a32-62e1-ae69-424ff403291e@denx.de>
Date:   Tue, 3 May 2022 21:17:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Content-Language: en-US
From:   Marek Vasut <marex@denx.de>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Arnd Bergmann <arnd@arndb.de>
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
 <20220217222328.7F7B3C340E8@smtp.kernel.org>
 <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de>
 <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de>
 <20220312050419.2AB91C340EE@smtp.kernel.org>
 <00479d7f-1124-de8b-d125-40f8139331f1@denx.de>
 <20220315235220.B005FC340E8@smtp.kernel.org>
 <51ca4586-5bcf-923d-43f9-7bf0b8dcb79d@denx.de>
In-Reply-To: <51ca4586-5bcf-923d-43f9-7bf0b8dcb79d@denx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/16/22 12:30, Marek Vasut wrote:
> On 3/16/22 00:52, Stephen Boyd wrote:
>> Quoting Marek Vasut (2022-03-12 02:26:17)
>>> On 3/12/22 06:04, Stephen Boyd wrote:
>>>> Quoting Marek Vasut (2022-03-09 12:54:35)
>>>>> On 2/21/22 01:58, Marek Vasut wrote:
>>>>>> On 2/17/22 23:23, Stephen Boyd wrote:
>>>>>>
>>>>>>> I see that there isn't any more 'clock-critical' in the kernel's 
>>>>>>> dts so
>>>>>>> I wonder if we would be able to get rid of that function or at least
>>>>>>> hollow it out and see if anyone complains. Either way, what is the
>>>>>>> actual problem trying to be solved? If the crystal oscillator 
>>>>>>> isn't used
>>>>>>> anywhere in the kernel why are we registering it with the clk 
>>>>>>> framework?
>>>>>>
>>>>>> The problem is the other way around -- the SoC clock IPs often have a
>>>>>> couple of general purpose clock routed to various SoC IO pins, those
>>>>>> clock can be used for any purpose, and those are already 
>>>>>> registered with
>>>>>> kernel clock framework. Some devices save on BoM and use those 
>>>>>> general
>>>>>> purpose clock to supply clock networks which are otherwise not
>>>>>> interacting with the kernel, like some CPLD for example. Since 
>>>>>> from the
>>>>>> kernel point of view, those clock are unused, the kernel can turn 
>>>>>> those
>>>>>> clock OFF and that will make the entire device fail.
>>>>>>
>>>>>> So this critical-clocks property permits marking clock which must not
>>>>>> ever be turned OFF accordingly.
>>>>>
>>>>> How can we proceed here ?
>>>>
>>>> Why are we registering the clks with the framework on device that are
>>>> saving on BoM and using them outside of the kernel. What is the use of
>>>> kernel memory for struct clk_core that aren't ever used?
>>>
>>> Those clock may be used to supply a device in DT on another hardware
>>> using the same SoC.
>>>
>>> Take e.g. this random git grep result:
>>>
>>> arch/arm/boot/dts/imx7d-remarkable2.dts
>>> / {
>>>     wifi_pwrseq {
>>>       ...
>>>       clocks = <&clks IMX7D_CLKO2_ROOT_DIV>;
>>>       ...
>>>     };
>>> };
>>>
>>> This IMX7D_CLKO2_ROOT_DIV is one such general purpose clock output. In
>>> the aforementioned case, it is used to supply 32 kHz clock to a WiFi
>>> chip, i.e. it has a consumer in DT. These clock are registered by the
>>> platform clock driver:
>>>
>>> drivers/clk/imx/clk-imx7d.c
>>>
>>> But those clock can also be used to supply e.g. CPLD which has no other
>>> connection to the SoC but the clock. That is where it needs this
>>> critical-clocks property. Because then there is no consumer in DT. So
>>> the kernel will now think the clock are not used and will turn them off
>>> after boot, thus e.g. crashing such platform.
>>>
>>> So in the later case, the DT would contain the following to avoid the 
>>> crash:
>>> &clks {
>>>     critical-clocks = <IMX7D_CLKO2_ROOT_DIV>;
>>> };
>>
>> Got it. Why, in the latter case, would we register the clk with the clk
>> framework?
> 
> Because those clock may be both critical and have other consumers which 
> can be fully described in DT, i.e. a combination of the two 
> aforementioned use cases.
> 
> The CLK_IS_CRITICAL flag does not imply the clock can only supply single 
> device, rather the CLK_IS_CRITICAL flag indicates the clock must not 
> ever be turned off. The clock can still supply multiple devices, some of 
> them described in DT, some of them not.
> 
> If you were to unregister the clock from clock framework if they are 
> critical, you wouldn't be able to handle the aforementioned use case.
> 
>> I can see that they're "critical" in the sense that there's
>> no consumer node in DT and we want to make sure that nothing turns it
>> off.
> 
> There may be other consumers in DT, we _only_ want to make sure the 
> clock are never turned off, ever.
> 
> The "no consumers in DT" and "never turn clock off" are orthogonal.
> 
>> But it's also wasteful to even register the clk with the kernel
>> because no device is using it. It feels like we need a property like
>> 'clock-dont-register' which is very simiilar to 'protected-clocks'.
>> There's already a binding for 'protected-clocks' so maybe that should be
>> reused and the definition of what the property means can be flexible to
>> handle the various use cases. The cases would be first this one here
>> where a clock doesn't matter because nobody uses it and second how it is
>> used on qualcomm SoCs where they have blocked access to certain clk
>> registers in the firmware so that the system crashes if we try to
>> read/write those clk registers.
>>
>> The dt-binding can be reworded as "the OS shouldn't use these clks" and
>> then the implementation can skip registering those clks with the
>> framework.
> 
> See above, I don't think not registering the critical clock is the right 
> approach.

It has been another month and half, I got no further feedback here. I 
sent V2 with further updated commit message, got no feedback either. I 
re-sent V2 and got no feedback either.

How can we proceed ?
