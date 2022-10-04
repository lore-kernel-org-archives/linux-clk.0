Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FB6AC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  4 Oct 2022 11:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbiJDLA1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Oct 2022 07:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiJDLA0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Oct 2022 07:00:26 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8CFD15FD2
        for <linux-clk@vger.kernel.org>; Tue,  4 Oct 2022 04:00:24 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z4so20589479lft.2
        for <linux-clk@vger.kernel.org>; Tue, 04 Oct 2022 04:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=As8VC4kRCcVOEpYr0+WE1bmIucnYns5AZeR+jMjIK7U=;
        b=ojOmV9JQ5OSudT0slgyoB7gqQ6aCDxuMuLiILirsduMcGN8Jj9OHPSTaRsdzlrbUSv
         WkZ8F4J3ZitPS6ItOulMjBBLarxHGTC/zc+3bsR0qFwaTyvRnst514YuP5O+QJwbP4Nj
         5nz+P2/RFFsqt5APKvebHx/kRQ4Hrhr+uA62r59J2VidBEt0AiLsoAyMVspsgITnpMd5
         69o81qaGmDx7o4LESK2b7mrur4mtiC7fSpStHYZ3WB3V4blkN9Kyx4IldMGUhgAuY8/T
         PzyIewThTV8iFp7MgZb5bS9JWObcF+EEMk36ZAurVttKADHmQJbX1eV3kRUIsTDPqQx7
         15KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=As8VC4kRCcVOEpYr0+WE1bmIucnYns5AZeR+jMjIK7U=;
        b=mM+35r//9LVs1Yjbmc0YlG6mabbe5+0dYZfLF8/FN1j/DNcREbeaCz4vJgsYUOlTfC
         /u6Jd2ucrkkmrgQyYfpRi2bxt30XYRlL3qXMLXYXBjCMmICHmekgVd96hozaMoZ+8QNf
         tf3tTlxfS15goyvWEWD1LR85g6kP7JAbxMsMjN89WfJjMURbsUN6NCm3ErBOULOlozwB
         iFJ0mdLvGca5vd1p3xpc8meO/H4bOXg16v30psEVs9ZFd8451KXndbIVKMRXGE+1VI96
         wSg0PcGHKQfkEu6RnIY5N49xcDdqBzHDldgvrfHmJPJn5xoOaiQB02DAqhsO+dRrP4Mb
         ZC9g==
X-Gm-Message-State: ACrzQf38DL2UrMQcHJzdhuNyYQUfPn25pU2L+RvfP4ra/ItvoDhy7bb/
        T1lktakm/j/9Gqii3akkSag4NQ==
X-Google-Smtp-Source: AMsMyM6y2kIDSnlPLyOFvwKUyeGnlqMLznwv0i+jdECJhYxMvk8zqG8cKvdjG8d9nfiv1+3EMDgCQA==
X-Received: by 2002:a19:8c5e:0:b0:4a2:2d7b:eef with SMTP id i30-20020a198c5e000000b004a22d7b0eefmr4013913lfj.206.1664881223292;
        Tue, 04 Oct 2022 04:00:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id br32-20020a056512402000b00497aae401edsm1870787lfb.109.2022.10.04.04.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 04:00:22 -0700 (PDT)
Message-ID: <fcafff07-b526-bd3d-469f-0aebbb13c86c@linaro.org>
Date:   Tue, 4 Oct 2022 13:00:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] dt-bindings: clk: Add binding for versal clocking
 wizard
Content-Language: en-US
To:     Michal Simek <michal.simek@amd.com>, Rob Herring <robh@kernel.org>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
        linux-clk@vger.kernel.org, git@amd.com, devicetree@vger.kernel.org,
        krzysztof.kozlowski+dt@linaro.org, sboyd@kernel.org,
        mturquette@baylibre.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20220930080400.15619-1-shubhrajyoti.datta@amd.com>
 <20220930080400.15619-2-shubhrajyoti.datta@amd.com>
 <CAL_JsqLaqjZeZd3c-fd9f5m-4OCXgOZcOu+paik9FV_eno5sLg@mail.gmail.com>
 <afb3f19f-eb40-5453-a82b-295e06861f86@amd.com>
 <20220930213924.GA1079711-robh@kernel.org>
 <6e58837e-896c-7069-7913-2afb90af5e95@amd.com>
 <b495804c-cf04-4512-ac05-424eded46468@linaro.org>
 <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
 <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
 <e8507b3c-3dd5-9a65-8058-200b5a410da3@amd.com>
 <19bbea63-41d4-1b35-591e-1776eee1b2aa@linaro.org>
 <54652831-cdcc-7735-2b1b-66475ffce476@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <54652831-cdcc-7735-2b1b-66475ffce476@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/10/2022 17:27, Michal Simek wrote:
>>
>> Exactly. The names xlnx,clocking-wizard and xlnx,clk-wizard-1.0 are
>> therefore not specific enough and mixing different devices.
> 
> And just to be clear these IPs can be combined with systems where the main cpu 
> can be Microblaze. I have also seen some vendors mixing RISC-V with Xilinx IPs.
> 
> Please look below.
>>
>>> And because this is fpga world none is really describing programmable logic by
>>> hand because it would take a look a lot of time. That's why I created long time
>>> ago device-tree generator (DTG) which gets design data and based on it generate
>>> device tree description. Newest version is available for example here.
>>> https://github.com/Xilinx/device-tree-xlnx
>>> There is also newer version called system device tree generato
>>> https://github.com/Xilinx/system-device-tree-xlnx
>>>
>>> Because of this infrastructure user will all the time get proper compatible
>>> string which is aligned with IP catalog.
>>
>> I don't think so. Let's skip for now "clk" and "clocking" differences
>> and assume both are "clocking". You have then compatibles:
>>
>> xlnx,clocking-wizard and xlnx,clocking-wizard-1.0
>>
>> and you said these are entirely different blocks.
>>
>> There is no way this creates readable DTS.
> 
> And I really thank you for this discussion to do it properly and have proper 
> compatible string and description for this block.
> 
> Shubhrajyoti: please correct me if I am wrong.
> 
> All Xilinx SOCs have programmable logic aligned with FPGAs. Zynq is based 28nm,
> ZynqMP (Ultrascale MPSOC) is based on 16nm and Versal is based on 7nm.
> 
> I think these clocking IPs are using low level primitives available in PL logic.
> Which means there is connection to fpga/pl technology instead of SOC family and 
> main cpu.

Then maybe the compatibles (and device names) should have that fpga/pl
technology used to differentiate between them?

> It can be of course said that if this is ZynqMP SOC that IP A is used. The same 
> for Versal SOC. But for soft cores this can't be said.
> 
> Would it be better to reflect PL technology in compatible string?

Yes, although we might misunderstand what PL technology is. 28/16/7 nm
is the size of transistor or the process. Even two different processes
can use same type of technology, e.g. FinFET:
https://en.wikipedia.org/wiki/14_nm_process
https://en.wikipedia.org/wiki/10_nm_process

You could have very similar (or even the same) designs done in 28 nm and
16 nm. Does it mean these are entirely different devices? Not
necessarily... Maybe they are, maybe not, but is the size of process
differentiating? I actually don't know what's there in 28/16/7, I am
just saying that number alone might not mean different technology.
Programming API could be the same, inputs/outputs could be the same.
Just the size of transistor is different...

> 
> xlnx,clocking-wizard-vX.X (used now for ZynqMP and previous families)
> xlnx,clocking-wizard-7nm-vX.X (or find better name names which reflect PL logic 
> type)

Best regards,
Krzysztof

