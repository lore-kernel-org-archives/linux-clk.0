Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE4AC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 08:37:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229933AbiJCIhv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Oct 2022 04:37:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229680AbiJCIh3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Oct 2022 04:37:29 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E20CD26AF9
        for <linux-clk@vger.kernel.org>; Mon,  3 Oct 2022 01:10:43 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 25so5181416lft.9
        for <linux-clk@vger.kernel.org>; Mon, 03 Oct 2022 01:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=eXaFPG7O71TlrjOlyZgGAeCaZ3F/ycTE/sXbYYMHuP4=;
        b=s0+mIKAvUZEvgmgonEKww5oPbahGRopc2Ay2dsYHArohjvVRoIxDLBNTbFSDkDNDXt
         ebiPS4clUrUS3Wdmjh2C5RSfJO5Mlhwtrtrdcu+MANzvmG1mVvyxfV8aq1cWYjXR+uhE
         35IoRjevMIDr+7ZhEfsLcKm4Z77TaNk6MuV9uyxqPjx7khT7eVLF0YFGY49ZGCfeFdKP
         YIDKdf7y9lTC9Ri7SUtlv73ZL+NZEo9iCIYLtnKppVZO2uWs9ANQA074RGa8SEqVI/WD
         Xagx0aJ+I2/pIZaAbHdL0zPUZUv/HNMQ+cJB7j8Pi3G9XTtNMd0geqpYPKOKc8eQOxX+
         RP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=eXaFPG7O71TlrjOlyZgGAeCaZ3F/ycTE/sXbYYMHuP4=;
        b=Lem7o0qBo4DKUN9bmonuclw6+9hoJuDu5eYzs73ylEv80SMfi7eI4fOLFk67Lygl76
         3pJxbfFctCSbDaIBo1YNjMsNy6VWYi7hKjvYPSDPYWMPYCgm9jNg4Kbjt8TOr5SZTvdF
         c1IRHm5/H58AFV6VilolRrdjdJbfjRFQLvZriOKImtETo3l7pOtPMs7eQS4lOl0n4MeK
         m1urgdpcSUaynj+Lbeyrkh6pbffPcI0v88lENdhITFCD6nXODEICBLV6L6WPXkdf7fTM
         yQF/phXuClx70rNu/ZweTSMKz8sgfWj9nZqaocr1K+XDmR7YKfMKk0IKBFjyVVtcfhNe
         jVSg==
X-Gm-Message-State: ACrzQf0n7ipLdoFHO93+83xnDOtH7Hi2M9LPIJ4HyCYkEFaFfNw630Go
        1S4hFyZKzbu5EMWgnzukRJpmPQ==
X-Google-Smtp-Source: AMsMyM6OUuWc/dvFQ91BsYOtDLcPcqIILG+nZHW3JX1+gH9U/Do7kht0fCrlWvHjdr3d6j3nqLECrw==
X-Received: by 2002:a19:ee0a:0:b0:497:a2e3:a9dc with SMTP id g10-20020a19ee0a000000b00497a2e3a9dcmr6601344lfb.96.1664784641239;
        Mon, 03 Oct 2022 01:10:41 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g22-20020a05651222d600b0048aa9d67483sm1351778lfu.160.2022.10.03.01.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Oct 2022 01:10:40 -0700 (PDT)
Message-ID: <f611237f-0401-9e3c-3a21-79b33141bb51@linaro.org>
Date:   Mon, 3 Oct 2022 10:10:38 +0200
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <57989d3e-a186-1d67-cff9-6a059f94ebd3@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/10/2022 09:58, Michal Simek wrote:
> 
> 
> On 10/3/22 09:23, Krzysztof Kozlowski wrote:
>> On 03/10/2022 09:15, Michal Simek wrote:
>>>>> And this is new IP. Not sure who has chosen similar name but this targets
>>>>> Xilinx Versal SOCs. Origin one was targeting previous families.
>>>>
>>>> Do we need a whole new schema doc?
>>>
>>> It is completely new IP with different logic compare to origin one.
>>>
>>>>
>>>> It is not ideal to define the same property, xlnx,nr-outputs, more than
>>>> once. And it's only a new compatible string.
>>>
>>> I can't see any issue with using dt binding for xlnx,clocking-wizard.yaml
>>>
>>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
>>
>> So we already have out of staging document:
>> devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 
> in 6.1 yes.
> 
>>
>> and author wants to add one more:
>> devicetree/bindings/clock/xlnx,clk-wizard.yaml
> 
> as I said it is completely different IP which requires complete different driver 
> but IP designers choose similar name which is out of developer control.
> 
>>
>> Shall we expect in two years, a third document like:
>> devicetree/bindings/clock/xlnx,clk-wzrd.yaml
>> ?
> 
> Developer definitely doesn't know. If new SoC requires for the same purpose 
> different IP with completely different driver is something out of developer 
> control. As of today I am not aware about such a requirement and need and 
> personally I can just hope that if they need to do such a change they will be 
> able to keep current SW driver compatible with new HW IP.

Then please start naming them reasonable, not two (and in future
x-times) the same names for entirely different blocks. And by name I
mean compatible, filename and device name.

>>> also for this IP if that's fine with you.
>>> Only xlnx,speed-grade can be defined for previous IP which is easy to mark.
>>
>> That old binding also explained nr-outputs as "Number of outputs".
>> Perfect... :(
> 
> Anyway if description should be improved let's just do it. I just want to get 
> guidance if we should update current dt binding for similar IP or just create 
> new one as this one is trying to do.

IMHO, new binding is extremely confusing. We already have support for
devices named "xlnx,clocking-wizard" and now you add exactly the same
(clk=clocking) with almost the same properties, named
"xlnx,clk-wizard-1.0". For a different IP?

How anyone (even Xilinx' customer) can understand which block is for
what if they have exactly the same name and (almost) the same
properties, but as you said - these are entirely different IP?

Best regards,
Krzysztof

