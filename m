Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E85C4708D
	for <linux-clk@archiver.kernel.org>; Fri,  9 Dec 2022 08:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiLIIHC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Dec 2022 03:07:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230037AbiLIIHA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Dec 2022 03:07:00 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4EDBC5B86D
        for <linux-clk@vger.kernel.org>; Fri,  9 Dec 2022 00:06:59 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so5848782lfv.5
        for <linux-clk@vger.kernel.org>; Fri, 09 Dec 2022 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3Vs+1WI1y3virfX5xKwzsGtAygi7nWt3LxEdPgxueY=;
        b=DM5mZnd9ChTGZazpZvbX3e2l/bSIy8PL3KnAU66pl2Mfhb5SEXRPyiA10Yy551uzlb
         EOeuefI7JelhJ8rQiCN7k4Tfit64IT+e0l4Ogz/6o7AAabwZYURpj47g+c9gnYl9I0Oe
         vCN3ibG7BdaKeZjiaKw+H84K2YdS89F7JvDj8G0VUJCVusbvlGQ2lMYtOPjvoZIRlHcd
         ZJc7GUf76vBS+oqzcwb9tLbcQvI+Y8b+5blVdAmO9hx1Hls4iAebc6zDqlKPIAf66rIT
         afLcrMgZ9/SYJYQJmOV18QjU7k700yKlWfMuK9TPM/ZmtJWyoY9TbOUb+/LEVRpPifyS
         8v/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3Vs+1WI1y3virfX5xKwzsGtAygi7nWt3LxEdPgxueY=;
        b=KjCPtVXnHcDvYUFjZVJm5BppWwVbtwTVZ/as+Dtqusqk3V3WDK8d4os5pX6Sknw5uw
         h2gTD9IYK/vbsTjoiBnqokZDitxNgeH7aCsaTTJxpiRj/eL+h2UiUKMeL8O0+8m9QEQE
         hRNgBR7a1c+7XbNmmTZpiRhBw36DLQTd/pQ5FV9t9DjyXMq80e3PcfKYu3EwFXGYaelt
         Gpl1s0ebZGyEjpCKT3Zt5hNjIWT2klEuwui1vjUm9YJ9pmILRyIpmg+FFyuNF6Wt3I2P
         OiIhJJQJ6zQG9rmNn0y8CN6ItqBH0RszDAcWpqEu3KMm9QtibX1jDRr65WotfYiBn9fj
         iMtQ==
X-Gm-Message-State: ANoB5pkc/f+b6Xqdk+MmyFg3Y0n/PmnOK66Cvf1R7ZO4JVoRs9psbxrq
        dlC8W1FbygOGlHIWl3shgmomOA==
X-Google-Smtp-Source: AA0mqf6UBTJgYTJ9mm2nM5Oa6/8gKG5B2r0fumHwhHHSaESXxoQhfvm9fGBSLzqAfFkdEtVurXaPzA==
X-Received: by 2002:a05:6512:1508:b0:4a4:68b9:6094 with SMTP id bq8-20020a056512150800b004a468b96094mr1979487lfb.31.1670573217565;
        Fri, 09 Dec 2022 00:06:57 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id q25-20020ac25a19000000b00494978b0caesm152032lfn.276.2022.12.09.00.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Dec 2022 00:06:57 -0800 (PST)
Message-ID: <15cb7a77-4308-15f0-4669-7a2673b4abcb@linaro.org>
Date:   Fri, 9 Dec 2022 09:06:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v3 3/9] dt-bindings: PCI: renesas,pci-rcar-gen2:
 'depends-on' is no more optional
Content-Language: en-US
To:     Herve Codina <herve.codina@bootlin.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
References: <20221207162435.1001782-1-herve.codina@bootlin.com>
 <20221207162435.1001782-4-herve.codina@bootlin.com>
 <36895e49-aea5-3676-e7df-78b30277e6a0@linaro.org>
 <20221208100530.137fa8b7@bootlin.com>
 <8dfb5b8a-766a-14ec-16d4-74fdd9f7d622@linaro.org>
 <20221208165101.584e4b92@bootlin.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208165101.584e4b92@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/12/2022 16:51, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Thu, 8 Dec 2022 10:46:32 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 08/12/2022 10:05, Herve Codina wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, 8 Dec 2022 09:26:41 +0100
>>> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
>>>   
>>>> On 07/12/2022 17:24, Herve Codina wrote:  
>>>>> The 'depends-on' property is set in involved DTS.
>>>>>
>>>>> Move it to a required property.
>>>>>
>>>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>>>> ---
>>>>>  Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml | 1 +    
>>>>
>>>> This should be squashed with previous patch. There is no point to add
>>>> property and immediately in the next patch make it required. Remember
>>>> that bindings are separate from DTS.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>  
>>>
>>> I though about make dtbs_check in case of git bisect.  
>>
>> And what would this commit change? In Git you will have
>> 1. dt-bindings: PCI: renesas,pci-rcar-gen2: Add depends-on for RZ/N1 SoC
>> family
>> 2. dt-bindings: PCI: renesas,pci-rcar-gen2: 'depends-on' is no more optional
>>
>> so what is the difference for git bisect?
> 
> Well, today, I have:
> 1. dt-bindings: Add depends-on
> 2. dts: Add depends-on
> 3. dt-bindings: Move depends-on to mandatory

What does it mean "I have"? Patches on mailing list? But we talk about
Git and I wrote you bindings are DTS are not going the same tree.

> 
> If I squash dt-bindings commits, I am going to have:
>   1. dt-bindings: Add mandatory depends-on
>   2. dts: Add depends-on
> or
>   1. dts: Add depends-on
>   2. dt-bindings: Add mandatory depends-on

And how does it matter? Anyway it goes separate trees.

> 
> I have not tested but if I used only the first commit in each
> case (git bisect):

It's not bisectable anyway, you cannot make it bisectable within one
release.

> In the first case, dtbs_check is probably going to signal the
> missing 'depends-on' property on dts.
> In the second case, dtbs_check is probably going to signal the
> not described 'depends-on' property present in dts.

And why is that even a problem?

Best regards,
Krzysztof

