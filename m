Return-Path: <SRS0=g5s0=TP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A01A5C04E53
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 13:51:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6686E20881
	for <linux-clk@archiver.kernel.org>; Wed, 15 May 2019 13:51:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaHZE40a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfEONvQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 May 2019 09:51:16 -0400
Received: from mail-it1-f193.google.com ([209.85.166.193]:52827 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725953AbfEONvP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 May 2019 09:51:15 -0400
Received: by mail-it1-f193.google.com with SMTP id q65so196840itg.2;
        Wed, 15 May 2019 06:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p/y8JRassq6ldagHFCRqos7/WsoBIbYVcLzev7Ry3W8=;
        b=KaHZE40aR03wi9RLD9spGr5b93BbQ5DubEQrkywFhVa/nXaUR1JKUW8uo9C3F/L4cf
         5GRSuGcX6WUjHS72cONwr20aOHsj/qpk/0knlB/TCTMnD1u7F6+VB8A+388jl/AUuEd0
         pF3fcsHPPc7HU3fF/KFu01x7DWvRFlJwiPbmtlAdUKaRERF9t06ihbQnLpa1TRBADuae
         R+upDTYboIUgtTjOb4E77GIR9OBSjlu/SO2YVW33vbZLBY5HF+1+b/mJAUgjp9QlcZlJ
         Sf1SVNMNjb4Gm3WPRdniVtcdObc/IQyzSBx3W1+HfnGYWQq9MwMYQp7GpfUEh22jkXg4
         kmmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p/y8JRassq6ldagHFCRqos7/WsoBIbYVcLzev7Ry3W8=;
        b=YRc8Teo8NlUcmksobpM3nPQi0LLgzao7UYYSLIp+6qExbYisLM9Fyan6nBGWnEFLal
         C7PJ9VZNWuBS5E/St4D+e1T7hXeGCrDWeq0uY1aR3/sJ8VD03BPQVyixAXgVKtAYrkjQ
         /Xu8Y5OHThleKoPtTkfWBXdRxLTt1YTl4pXt42Tp0VZqGCjiVet9fivQxkJvwxzoPAXo
         /r0P+aQNZW72iasIDCRVXQiMk+TSH9XdYKvtbtPGMCIazGE0NSVs7dFvbdytXnz1Gu3o
         LQV16Xp7wsTeaIFuogquuvY6Kp5FdfGPgKGNac9e4vbxrxPFy964bcH2ngPrfYU14fOp
         bfFg==
X-Gm-Message-State: APjAAAVz4Lucposd2PDI4r+08nl8rbNI41d+7etR5daemDYfxIv3sq4/
        7rGaUcRDLcuXOEgBUIzqNTY=
X-Google-Smtp-Source: APXvYqyUdVq7O/jGC2ASOLVYVe+9UfE6Gezo9Pbls9Qhpg3DCNcoBRXv/sg0AXqtNZTG2PeckYWVYg==
X-Received: by 2002:a02:c8da:: with SMTP id q26mr28090176jao.0.1557928274570;
        Wed, 15 May 2019 06:51:14 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id q16sm615991ior.75.2019.05.15.06.51.11
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 06:51:13 -0700 (PDT)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c3909c66-5aa4-161b-98d4-02ad20e02c88@gmail.com>
Date:   Wed, 15 May 2019 16:50:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <63360b18-6a17-ab3f-6c54-6e11e24885d0@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

15.05.2019 10:17, Joseph Lo пишет:
> On 5/15/19 12:28 AM, Dmitry Osipenko wrote:
>> 10.05.2019 11:47, Joseph Lo пишет:
>>> Add the binding document for the external memory controller (EMC) which
>>> communicates with external LPDDR4 devices. It includes the bindings of
>>> the EMC node and a sub-node of EMC table which under the reserved memory
>>> node. The EMC table contains the data of the rates that EMC supported.
>>>
>>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>>> ---
>>> v3:
>>> - drop the bindings of EMC table
>>> - add memory-region and reserved-memory node for EMC table
>>> ---
>>>   .../nvidia,tegra210-emc.txt                   | 55 +++++++++++++++++++
>>>   1 file changed, 55 insertions(+)
>>>   create mode 100644
>>> Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>
>>> new file mode 100644
>>> index 000000000000..d65aeef2329c
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/memory-controllers/nvidia,tegra210-emc.txt
>>>
>>> @@ -0,0 +1,55 @@
>>> +NVIDIA Tegra210 SoC EMC (external memory controller)
>>> +====================================================
>>> +
>>> +Device node
>>> +===========
>>> +Required properties :
>>> +- compatible : should be "nvidia,tegra210-emc".
>>> +- reg : physical base address and length of the controller's registers.
>>> +- clocks : phandles of the possible source clocks.
>>> +- clock-names : names of the possible source clocks.
>>> +- interrupts : Should contain the EMC general interrupt.
>>> +- memory-region : phandle to the reserved memory (see
>>> + 
>>> Documentation/devicetree/bindings/reserved-memory/reserved-memory.txt) which
>>>
>>> +  contains a sub-node of EMC table.
>>> +- nvidia,memory-controller : phandle of the memory controller.
>>> +
>>> +Reserved memory node
>>> +====================
>>> +Should contain a sub-node of EMC table with required properties:
>>> +- compatible : should be "nvidia,tegra210-emc-table".
>>> +- reg : physical address and length of the location of EMC table.
>>> +
>>> +Example:
>>> +    reserved-memory {
>>> +        #address-cells = <2>;
>>> +        #size-cells = <2>;
>>> +        ranges;
>>> +
>>> +        emc_table: emc-table@8be00000 {
>>> +            compatible = "nvidia,tegra210-emc-table";
>>> +            reg = <0x0 0x8be00000 0x0 0x10000>;
>>> +            status = "okay";
>>> +        };
>>
>> You essentially moved the v1 binding into obscure and undocumented blob,
>> ignoring previous review comments. This is a very odd move... please
>> explain what is going on.
>>
> 
> Discussed with Thierry offline which way we prefer to pass the EMC table
> to the kernel. Some reasons below we decide to chose this one (via
> binary blob).
> 
> - The EMC table is much bigger than the previous Tegra generations
> (LPDDR4 v.s. LPDDR2/3). It's harder to settle in the review process. And
> if there is a new fix of the table in the future, we'll need to go
> through that again.

I don't think that this a very good excuse for not documenting the
blob's structure.

> - Because it's LPDDR4 we want to support here, to support higher rates,
> the devices have must be gone through the training process, which is
> done in the firmware. Which means We already have the table somewhere in
> the memory and kernel can just re-use that. No need to convert them back
> to DT and pass to the kernel. This is much easier to maintain in the
> future if there is something needs to fix.
> - With the mechanism above, we don't need to maintain the huge EMC table
> in the DT file like below.
> http://patchwork.ozlabs.org/patch/1063886/
> http://patchwork.ozlabs.org/patch/1063889/

The blob's EMC table contains stuff specific to downstream kernel, hence
it's a not very re-usable downstream software ABI mixed with HW
description that you're bringing into upstream. This is not very
welcomed, although I don't see it as a big problem if you'll state that
all clearly in the commit message with a solid explanation why it is the
best possible option.

> And sorry, maybe it's not clear at that moment, but I did mention that
> we want to go with the new method (via binary blob) in the previous review.
> Please see http://patchwork.ozlabs.org/patch/1084467/

Okay. It will be better if the discussion happened publicly, at least I
hope that Rob is involved in it.
