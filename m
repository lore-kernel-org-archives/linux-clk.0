Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 777DDC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 15 Jun 2022 21:55:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348711AbiFOVzX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Jun 2022 17:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347869AbiFOVzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Jun 2022 17:55:22 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71A203A183;
        Wed, 15 Jun 2022 14:55:21 -0700 (PDT)
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7CF8B832C3;
        Wed, 15 Jun 2022 23:55:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1655330118;
        bh=ywi/0Sq1Bu/r9uMBoIg5oMNOPuyy0BBvzLaMepmdL8c=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Tr/PR2GeDqtzVQzPYFB+s8sFcE4ioPPOyocc3vCPiYoy2MdhT7lAQdN5c4M4gx/jK
         Srko7LiLft8w83pnye/f1B5UxqxqJzHPEN9b7ZLBnhVUCMgvnXMArnsCMj9VaymxAy
         tbfyUwi23OtLeXdSsdFJ98sZBROsBpJ+PR+wakCFbYq2Ycv4pWOX9LtdpYBKQ4vxwM
         7Pafpig5lLkZkdDUSa9EmP9+U59ATXLwRfwbmuwmEeIfOy1WZqE37CSLTMh7kQJs+2
         9SCp5kqMPHxbJvOmktl1rlqvjbjAllLMF8P3TF0e30wRRSsi9JsGm7KyJpzn46C7wE
         kIgc/cCXylsuQ==
Message-ID: <edbfccf3-0723-b570-1315-a0951b530a66@denx.de>
Date:   Wed, 15 Jun 2022 23:55:17 +0200
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
From:   Marek Vasut <marex@denx.de>
In-Reply-To: <20220615201027.DFCC3C3411A@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6/15/22 22:10, Stephen Boyd wrote:
> Quoting Marek Vasut (2022-05-17 16:59:18)
>> diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> index f2ea53832ac63..d7f7afe2cbd0c 100644
>> --- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> +++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
>> @@ -169,6 +169,22 @@ a shared clock is forbidden.
>>   Configuration of common clocks, which affect multiple consumer devices can
>>   be similarly specified in the clock provider node.
>>   
>> +==Critical clocks==
>> +
>> +Some platforms require some clocks to be always running, e.g. because those
>> +clock supply devices which are not otherwise attached to the system. One
>> +example is a system where the SoC serves as a crystal oscillator replacement
>> +for a programmable logic device. The critical-clocks property of a clock
>> +controller allows listing clock which must never be turned off.
>> +
>> +   clock-controller@a000f000 {
>> +        compatible = "vendor,clk95;
>> +        reg = <0xa000f000 0x1000>
>> +        #clocks-cells = <1>;
>> +        ...
>> +        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
> 
> Historically "critical" is overloaded in the clk framework. We should
> avoid using that name. What does "critical" even mean?

It means those clock must not be turned off, but there is no consumer 
described in DT.

> Instead I'd prefer "always-on-clocks" here, so we can indicate that
> these clks should always be on. It would also parallel the property in
> the regulator framework.

This property name is derived from protected-clock which you introduced. 
I think it would be better to stay consistent within the clock framework 
property names ?
