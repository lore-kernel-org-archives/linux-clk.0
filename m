Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CB2DC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 23:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347707AbiFOXm3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 19:42:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230172AbiFOXm3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 19:42:29 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C4701142;
        Wed, 15 Jun 2022 16:42:27 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id DEFCE83020;
        Thu, 16 Jun 2022 01:42:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655336546;
        bh=5CwPslvDyAXb6/YTrODUKY3RQjcZ0mb5JVP86q6JIp0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=oRcEzThbJWumH476iJ4WxEhDIlqlVL/uqKIbOo7/MXh2u9e2KMEPnQovp3pfo4hwb
         otbZx3Xp7qRMr3jWqzJREHZ4kiwRP/jagJDxD1IrCDvdw0dL1ewNTY8TaUlmCu7IuV
         XbrMea9f1NiSERXY9+4kv3AsmtyaANThQelVgg9R+bQjk/XL/ZfNehO+HYTkquvmQR
         7MXGSxbds/IZs9bZM67AVGOxovSTxE10HNnLUQ0E221pL/1dlyCJRCbnENEQOI6UR+
         OsPpB/8JfDw3QldLTowy0Vb+PkTjh3fpDhTEnz/Uh1zERfjqUaoFwb+9AU7x2BNX3A
         CsNxk0FxmKhPA==
Message-ID: <c9a04a45-d2df-5596-571e-08502fbb3709@denx.de>
Date:   Thu, 16 Jun 2022 01:42:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: Introduce 'critical-clocks'
 property
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
References: <20220517235919.200375-1-marex@denx.de>
 <20220615201027.DFCC3C3411A@smtp.kernel.org>
 <edbfccf3-0723-b570-1315-a0951b530a66@denx.de>
 <20220615222210.3D7F6C3411A@smtp.kernel.org>
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220615222210.3D7F6C3411A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/16/22 00:22, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-06-15 14:55:17)
>> On 6/15/22 22:10, Stephen Boyd wrote:
>>> Quoting Marek Vasut (2022-05-17 16:59:18)
>>>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> index f2ea53832ac63..d7f7afe2cbd0c 100644
>>>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>>>> @@ -169,6 +169,22 @@ a shared clock is forbidden.
>>>>    Configuration of common clocks, which affect multiple consumer devices can
>>>>    be similarly specified in the clock provider node.
>>>>    
>>>> +==Critical clocks==
>>>> +
>>>> +Some platforms require some clocks to be always running, e.g. because those
>>>> +clock supply devices which are not otherwise attached to the system. One
>>>> +example is a system where the SoC serves as a crystal oscillator replacement
>>>> +for a programmable logic device. The critical-clocks property of a clock
>>>> +controller allows listing clock which must never be turned off.
>>>> +
>>>> +   clock-controller@a000f000 {
>>>> +        compatible = "vendor,clk95;
>>>> +        reg = <0xa000f000 0x1000>
>>>> +        #clocks-cells = <1>;
>>>> +        ...
>>>> +        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
>>>
>>> Historically "critical" is overloaded in the clk framework. We should
>>> avoid using that name. What does "critical" even mean?
>>
>> It means those clock must not be turned off, but there is no consumer
>> described in DT.
> 
> So it means "always on".
> 
>>
>>> Instead I'd prefer "always-on-clocks" here, so we can indicate that
>>> these clks should always be on. It would also parallel the property in
>>> the regulator framework.
>>
>> This property name is derived from protected-clock which you introduced.
>> I think it would be better to stay consistent within the clock framework
>> property names ?
> 
> protected-clocks is based on assigned-clocks. There isn't a
> CLK_IS_PROTECTED flag. I'm not following your argument at all here,
> sorry.

critical-clock property name is based on protected-clock property name.

There is also no CLK_IS_ALWAYS_ON flag , but there is CLK_IS_CRITICAL 
flag . Sure, there is no CLK_IS_PROTECTED flag because the protected 
clock is implemented only by a single driver (qualcomm).

I think it makes sense to align the DT property name and the flag name, 
and the critical-clock is aligned with both other DT property names in 
the clock framework and the flag name.
