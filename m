Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9ADCC48BE0
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 07:54:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99B3F613BA
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 07:54:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230467AbhFKH4S convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 03:56:18 -0400
Received: from hostingweb31-40.netsons.net ([89.40.174.40]:55337 "EHLO
        hostingweb31-40.netsons.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229733AbhFKH4R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 03:56:17 -0400
Received: from [77.244.183.192] (port=63938 helo=[192.168.178.41])
        by hostingweb31.netsons.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <luca@lucaceresoli.net>)
        id 1lrbze-0000eL-75; Fri, 11 Jun 2021 09:54:18 +0200
Subject: Re: [PATCH 1/2] dt-bindings: clk: vc5: Add property for SD polarity
To:     Sean Anderson <sean.anderson@seco.com>, linux-clk@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210607154931.2491499-1-sean.anderson@seco.com>
 <eafea6ac-fbfd-3f42-93fa-edb8cdced3ea@lucaceresoli.net>
 <5ef31cbd-473c-0916-85ff-860012ac694d@seco.com>
From:   Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <a5c55357-e5e8-9e00-53cc-509e78fd6987@lucaceresoli.net>
Date:   Fri, 11 Jun 2021 09:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <5ef31cbd-473c-0916-85ff-860012ac694d@seco.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8BIT
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id: luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On 10/06/21 17:43, Sean Anderson wrote:
> 
> 
> On 6/10/21 5:05 AM, Luca Ceresoli wrote:
>> Hi Sean,
>>
>> On 07/06/21 17:49, Sean Anderson wrote:
>>> This property allows setting the SD/OE pin's polarity to active-high,
>>> instead of the default of active-low.
>>>
>>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
>>
>> Thanks.
>>
>>> +  idt,sd-active-high:
>>> +    $ref: /schemas/types.yaml#/definitions/flag
>>> +    description: SD/OE pin polarity is active-high
>>
>> I think the name "sd" is misleading.
> 
> I do as well. After sending this patch, I reviewed the documentation
> again and discovered that the functionality was not as clear as I
> initially thought.
> 
>> In the Renesas docs (which are very confusing on their own about this
>> topic) this bit is called "SP" -- *S*D/OE *P*olarity. But actually it
>> controls polarity of the SD/OE pin only if the pin is configured for
>> "OE" function:
>>
>>> SP bit = “SD/OE pin Polarity Bit”: Set the polarity of the SD/OE
>>> pin where outputs enable or disable. Only works with OE, not with SD.
>> (VC6E register and programming guide [0])
>>
>> As such I suggest you use either "sp" to keep the naming used in the
>> Renesas docs or "oe" as it actually controls OE polarity only. I do
>> prefer "sp" as it helps matching with the datasheets, but maybe adding a
>> little more detail in bindings docs to clarify, as in:
>>
>>   idt,sp-active-high:
>>     $ref: /schemas/types.yaml#/definitions/flag
>>     description: SD/OE pin polarity is active-high
>>                  (only works when SD/OE pin is configured as OE)
>>
>> BTW is it only me finding the "Shutdown Function" of [0] completely
>> confusing? Also, Table 24 has contradictory lines and missing lines. I'm
>> sending a request to Renesas support to ask them to clarify it all.
> 
> I rearranged the table to highlight which bits cause the output to
> become inactive:
> 
> SH    SP    OSn    OEn    SD/OE    OUT
> x    x    1    0    x    Active
> 0    0    1    1    0    Active
> 0    0    1    1    1    Inactive
> 0    1    1    1    0    Inactive
> 0    1    1    1    1    Active
> 1    0    1    1    0    Active
> 1    0    x    x    1    Shutdown
> 1    1    1    1    0    Inactive
> 1    1    x    x    1    Shutdown
> x    x    0    x    x    Inactive>
> This may be condensed to
> 
> SH    SP    SD/OE function for 0/1
> 0    0    Active/Inactive
> 0    1    Inactive/Active
> 1    0    Active/Shutdown
> 1    1    Inactive/Shutdown
> 
> According to the datasheet, the default settings are SH=0 and SP=0. So
> perhaps a good set of properties would be
> 
> idt,enable-shutdown:
>     Shutdown the device when the SD/OE pin is high. This would set
>     SH=1.
> idt,output-enable-active-high:
>     Disable output when the SD/OE pin is low. This would set SP=1.

Seems good.

-- 
Luca

