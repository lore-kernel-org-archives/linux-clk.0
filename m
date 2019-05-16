Return-Path: <SRS0=duwI=TQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EF45C04AAF
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 14:39:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3529C20675
	for <linux-clk@archiver.kernel.org>; Thu, 16 May 2019 14:39:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IdxVHb24"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727071AbfEPOjK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 May 2019 10:39:10 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:53819 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726717AbfEPOjK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 May 2019 10:39:10 -0400
Received: by mail-it1-f193.google.com with SMTP id m141so6519481ita.3;
        Thu, 16 May 2019 07:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=xjgQ/5X3nhrZ86421UVwW1lVuND3Gcl5hfZAZ30U0CU=;
        b=IdxVHb24lDGecKqfp1SzFkQQ8z3y8s7JBR4btUXPBetSjyhmnwGj9u+fdTmj1arlyU
         A45G5b/Pd2oMh1t/Uy+Vo2DigWlaGNmCNsHIttoRjTYo9xABusepfHDoX/M0k7oqtod0
         k1HgH5Qk78gkg4tD06vO9v/9vyn4PpvB0OQwc4Xlssy6TLpSQIOT9CQ7T0mez+tAAvzv
         /Tg317ygwAG5GUDn2Vr6mR1qTZgEnFJBsaE/sbVNL5JDqF1k0rrRe8bFtIdYHoYaG4Wx
         beF9+dr0iqKJrtP3O3ZQ8dlfwc6SsRhfCoA7SYaOdoE67SerAZiW+KhxjB5tayWtjDIz
         IKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xjgQ/5X3nhrZ86421UVwW1lVuND3Gcl5hfZAZ30U0CU=;
        b=K5TioRgjPW3kKDOQcF3BRIYpiQpWWw8V5RE6udbNqqiNKZm5NRzupADj2ZBI1f7/3P
         oSf/djHaHooTjmZfGQzeVLudNlywFLtieufJjdJ7atVDzBqod4/BkIGqNvEadPxxjNXe
         u94cr/urBLLgwELMiKxP82Wj70j58UU+RE22FjLK8a537oJpIoHrHN8IV+ovffi2ZqhI
         XF6eqpLWg6/79g962bUz/ZRrJEcBeTBlzwSicItle3HXEDTK5W6wmMYSmqfCzC2L3CVq
         XxSjM8RL7xu9/zYv4x7gQaXo33EyUicH3AWDYVEnjG2PKLQuEkKv7PD9h8wKR2+E6eaD
         QtGA==
X-Gm-Message-State: APjAAAWu7nk7Z1VuMogi3OMHFcCyrJcCD5Vbcqfjb4HISJZTv+9EVNNE
        +pi5tNrMOOV8uxHSx8LzuEg=
X-Google-Smtp-Source: APXvYqxzHgxzhYqjIbY6HnOMlBWoOVhZoq+onDurYBO0wD4B5R9FAHkMnoXc4RXRRabsenlpzpo35g==
X-Received: by 2002:a24:3f85:: with SMTP id d127mr12911999ita.38.1558017549373;
        Thu, 16 May 2019 07:39:09 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id j81sm1942592itj.26.2019.05.16.07.39.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 16 May 2019 07:39:08 -0700 (PDT)
Subject: Re: [PATCH V3 1/8] dt-bindings: memory: tegra: Add external memory
 controller binding for Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190510084719.18902-1-josephl@nvidia.com>
 <20190510084719.18902-2-josephl@nvidia.com>
 <fd68f906-79b4-6eda-b1fa-abaf3b4c6a12@gmail.com>
 <63360b18-6a17-ab3f-6c54-6e11e24885d0@nvidia.com>
 <c3909c66-5aa4-161b-98d4-02ad20e02c88@gmail.com>
 <f1e4ab1e-11b9-ba65-20b8-35c6459d2410@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1a5b539a-03bb-c326-8ba2-56ea8de97237@gmail.com>
Date:   Thu, 16 May 2019 17:39:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <f1e4ab1e-11b9-ba65-20b8-35c6459d2410@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

16.05.2019 12:01, Joseph Lo пишет:
> On 5/15/19 9:50 PM, Dmitry Osipenko wrote:
>> 15.05.2019 10:17, Joseph Lo пишет:
>>> On 5/15/19 12:28 AM, Dmitry Osipenko wrote:
>>>> 10.05.2019 11:47, Joseph Lo пишет:
>>>>> Add the binding document for the external memory controller (EMC)
>>>>> which
>>>>> communicates with external LPDDR4 devices. It includes the bindings of
>>>>> the EMC node and a sub-node of EMC table which under the reserved
>>>>> memory
>>>>> node. The EMC table contains the data of the rates that EMC supported.
>>>>>
>>>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>>>> ---
>>>>> v3:
>>>>> - drop the bindings of EMC table
>>>>> - add memory-region and reserved-memory node for EMC table
>>>>> ---
>>>>>    .../nvidia,tegra210-emc.txt                   | 55
>>>>> +++++++++++++++++++
>>>>>    1 file changed, 55 insertions(+)
>>>>>    create mode 100644
>>>>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>>>
>>>>>
>>>>>
>>>>> diff --git
>>>>> a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>>>
>>>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>>>
>>>>>
>>>>> new file mode 100644
>>>>> index 000000000000..d65aeef2329c
>>>>> --- /dev/null
>>>>> +++
>>>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>>>
>>>>>
>>>>> @@ -0,0 +1,55 @@
>>>>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>>>>> +====================================================
>>>>> +
>>>>> +Device node
>>>>> +===========
>>>>> +Required properties :
>>>>> +- compatible : should be "nvidia,tegra210-emc".
>>>>> +- reg : physical base address and length of the controller's
>>>>> registers.
>>>>> +- clocks : phandles of the possible source clocks.
>>>>> +- clock-names : names of the possible source clocks.
>>>>> +- interrupts : Should contain the EMC general interrupt.
>>>>> +- memory-region : phandle to the reserved memory (see
>>>>> +
>>>>> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt)
>>>>> which
>>>>>
>>>>> +  contains a sub-node of EMC table.
>>>>> +- nvidia,memory-controller : phandle of the memory controller.
>>>>> +
>>>>> +Reserved memory node
>>>>> +====================
>>>>> +Should contain a sub-node of EMC table with required properties:
>>>>> +- compatible : should be "nvidia,tegra210-emc-table".
>>>>> +- reg : physical address and length of the location of EMC table.
>>>>> +
>>>>> +Example:
>>>>> +    reserved-memory {
>>>>> +        #address-cells = <2>;
>>>>> +        #size-cells = <2>;
>>>>> +        ranges;
>>>>> +
>>>>> +        emc_table: emc-table@8be00000 {
>>>>> +            compatible = "nvidia,tegra210-emc-table";
>>>>> +            reg = <0x0 0x8be00000 0x0 0x10000>;
>>>>> +            status = "okay";
>>>>> +        };
>>>>
>>>> You essentially moved the v1 binding into obscure and undocumented
>>>> blob,
>>>> ignoring previous review comments. This is a very odd move... please
>>>> explain what is going on.
>>>>
>>>
>>> Discussed with Thierry offline which way we prefer to pass the EMC table
>>> to the kernel. Some reasons below we decide to chose this one (via
>>> binary blob).
>>>
>>> - The EMC table is much bigger than the previous Tegra generations
>>> (LPDDR4 v.s. LPDDR2/3). It's harder to settle in the review process. And
>>> if there is a new fix of the table in the future, we'll need to go
>>> through that again.
>>
>> I don't think that this a very good excuse for not documenting the
>> blob's structure.
> 
> The blob's structure is in patch 4 now that we originally wanted to
> describe below. Basically, the content is the same.
> http://patchwork.ozlabs.org/patch/1084467/
> http://patchwork.ozlabs.org/patch/1063879/

I'm not asking about what exactly it is, but saying that every supported
blob structure version should be documented in my opinion, otherwise the
documentation is not really useful.
