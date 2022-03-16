Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01770C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 11:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355319AbiCPLbY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 07:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355310AbiCPLbX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 07:31:23 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA9462DEE;
        Wed, 16 Mar 2022 04:30:08 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 5064B8215E;
        Wed, 16 Mar 2022 12:30:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647430206;
        bh=ZPmDR/Ynm3MLHvvDU+ZfVFYFYJBie/n9Ctm1/4lxxj4=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=ouSSk/bkojmLcK/tJHPl8xoXEELuIL11fSE3zW/+vM/7aVYSVtiTFlKAMmQRXXZEQ
         t6HXQ3B1R+5yNVaSaRuhbE/kT+S1E2ALW8ZEiONxS/6IQU8e3/O2/MKlUr57yIogV3
         xaKT0XN1l+T6URRJUoaqmwLpx4DrLxa7q9kvTcELoLbw+7FTBFe4KDJJ0BW/tfCNjC
         LEQpaUJhLn3Iubb8abQ0rNzk3ctIDSRhKzMy8/fEXOWfKBNnFO6JPMFgDTnIPTb+mB
         ZXsyDDWqd9/wi6hrCd0zBW/+7JnCIiwyOS5J94ClIB9E6OTqkcMA98SC1ARPzDGkBP
         X4U4MLyPvi+cw==
Message-ID: <51ca4586-5bcf-923d-43f9-7bf0b8dcb79d@denx.de>
Date:   Wed, 16 Mar 2022 12:30:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220215084412.8090-1-marex@denx.de>
 <20220215084412.8090-2-marex@denx.de>
 <20220217222328.7F7B3C340E8@smtp.kernel.org>
 <77c85470-5378-8c8b-8e5f-d57c83773ed6@denx.de>
 <4f1b946d-ee82-bd0e-c51e-100c23b87fdf@denx.de>
 <20220312050419.2AB91C340EE@smtp.kernel.org>
 <00479d7f-1124-de8b-d125-40f8139331f1@denx.de>
 <20220315235220.B005FC340E8@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220315235220.B005FC340E8@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 3/16/22 00:52, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-03-12 02:26:17)
>> On 3/12/22 06:04, Stephen Boyd wrote:
>>> Quoting Marek Vasut (2022-03-09 12:54:35)
>>>> On 2/21/22 01:58, Marek Vasut wrote:
>>>>> On 2/17/22 23:23, Stephen Boyd wrote:
>>>>>
>>>>>> I see that there isn't any more 'clock-critical' in the kernel's dts so
>>>>>> I wonder if we would be able to get rid of that function or at least
>>>>>> hollow it out and see if anyone complains. Either way, what is the
>>>>>> actual problem trying to be solved? If the crystal oscillator isn't used
>>>>>> anywhere in the kernel why are we registering it with the clk framework?
>>>>>
>>>>> The problem is the other way around -- the SoC clock IPs often have a
>>>>> couple of general purpose clock routed to various SoC IO pins, those
>>>>> clock can be used for any purpose, and those are already registered with
>>>>> kernel clock framework. Some devices save on BoM and use those general
>>>>> purpose clock to supply clock networks which are otherwise not
>>>>> interacting with the kernel, like some CPLD for example. Since from the
>>>>> kernel point of view, those clock are unused, the kernel can turn those
>>>>> clock OFF and that will make the entire device fail.
>>>>>
>>>>> So this critical-clocks property permits marking clock which must not
>>>>> ever be turned OFF accordingly.
>>>>
>>>> How can we proceed here ?
>>>
>>> Why are we registering the clks with the framework on device that are
>>> saving on BoM and using them outside of the kernel. What is the use of
>>> kernel memory for struct clk_core that aren't ever used?
>>
>> Those clock may be used to supply a device in DT on another hardware
>> using the same SoC.
>>
>> Take e.g. this random git grep result:
>>
>> arch/arm/boot/dts/imx7d-remarkable2.dts
>> / {
>>     wifi_pwrseq {
>>       ...
>>       clocks = <&clks IMX7D_CLKO2_ROOT_DIV>;
>>       ...
>>     };
>> };
>>
>> This IMX7D_CLKO2_ROOT_DIV is one such general purpose clock output. In
>> the aforementioned case, it is used to supply 32 kHz clock to a WiFi
>> chip, i.e. it has a consumer in DT. These clock are registered by the
>> platform clock driver:
>>
>> drivers/clk/imx/clk-imx7d.c
>>
>> But those clock can also be used to supply e.g. CPLD which has no other
>> connection to the SoC but the clock. That is where it needs this
>> critical-clocks property. Because then there is no consumer in DT. So
>> the kernel will now think the clock are not used and will turn them off
>> after boot, thus e.g. crashing such platform.
>>
>> So in the later case, the DT would contain the following to avoid the crash:
>> &clks {
>>     critical-clocks = <IMX7D_CLKO2_ROOT_DIV>;
>> };
> 
> Got it. Why, in the latter case, would we register the clk with the clk
> framework?

Because those clock may be both critical and have other consumers which 
can be fully described in DT, i.e. a combination of the two 
aforementioned use cases.

The CLK_IS_CRITICAL flag does not imply the clock can only supply single 
device, rather the CLK_IS_CRITICAL flag indicates the clock must not 
ever be turned off. The clock can still supply multiple devices, some of 
them described in DT, some of them not.

If you were to unregister the clock from clock framework if they are 
critical, you wouldn't be able to handle the aforementioned use case.

> I can see that they're "critical" in the sense that there's
> no consumer node in DT and we want to make sure that nothing turns it
> off.

There may be other consumers in DT, we _only_ want to make sure the 
clock are never turned off, ever.

The "no consumers in DT" and "never turn clock off" are orthogonal.

> But it's also wasteful to even register the clk with the kernel
> because no device is using it. It feels like we need a property like
> 'clock-dont-register' which is very simiilar to 'protected-clocks'.
> There's already a binding for 'protected-clocks' so maybe that should be
> reused and the definition of what the property means can be flexible to
> handle the various use cases. The cases would be first this one here
> where a clock doesn't matter because nobody uses it and second how it is
> used on qualcomm SoCs where they have blocked access to certain clk
> registers in the firmware so that the system crashes if we try to
> read/write those clk registers.
> 
> The dt-binding can be reworded as "the OS shouldn't use these clks" and
> then the implementation can skip registering those clks with the
> framework.

See above, I don't think not registering the critical clock is the right 
approach.
