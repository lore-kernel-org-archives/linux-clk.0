Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FCFBC63709
	for <linux-clk@archiver.kernel.org>; Thu,  8 Dec 2022 09:46:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230361AbiLHJq4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Dec 2022 04:46:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230380AbiLHJqh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Dec 2022 04:46:37 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A4126F0CE
        for <linux-clk@vger.kernel.org>; Thu,  8 Dec 2022 01:46:36 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id s8so1202608lfc.8
        for <linux-clk@vger.kernel.org>; Thu, 08 Dec 2022 01:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JbJYjODEjro1RFdAuzwb2wjJ9qbMGZnpipEOMqi0I/0=;
        b=wSwCTtIanqUXWSPc0KxcMvgfz7n4H8KI2Uxk6yeWeRUPI0N7urywQW+Au5DGF6ywVK
         IXAzB0+orsU7wslEUAVg7Ay9wEwkz8SmCTk69kAwGuIHELMAHt3FoHsF4im0NqL8K06/
         RxTzKGkQcLxQyLrH55eXl/pgvWMbIy/TAi7d6YvGoo261/HSfr1f7LTF/RV6M4Kb7tGW
         RaPKKYeNxMWNdlNgXzSrWV99JpjmvFH81nYP9JiymaxvIYfO++vm9GdCEiYJi/xEoqiT
         PZc7C9q/Yyp98dry18TEUFJtafKPT8sPXa/SVSxY2p9yB21Fj4QmpphpHgRYVxdmqIX4
         8xNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JbJYjODEjro1RFdAuzwb2wjJ9qbMGZnpipEOMqi0I/0=;
        b=3qogGrB4s4UOQMX12k24raJPSfEnin8iAxYSQX9bied8eneA6DRSQlqftYMeleGkuB
         sXgGYZvz7htwu5mMmKt+FrP8AgN29d8aZ4GmwhZ7/YL9KP6Oa/P+Ir1GEwi3wu1j/T8T
         o5P9YrXsWJUHpN4ovTzfNeGzwvvDwUmi4ez3RrwMJF+hpIAZPK5PKBKMJq7Qr94AAs4K
         VCO0ObGiPQ/6VVpAFPzaGWBgZKr8s6fuq2H58T2eFEVE/nRtnUFGeMnNbF8jBPaMWmuD
         P8u7w+7lRA/5o2oWIQGHle39QVfa0GjRDnLdjSaZHrPp8GQTI003rf+Ebpx6zpSjBtYl
         uj+w==
X-Gm-Message-State: ANoB5pkqJe+MepvVilimY1qTjaq9MLIaHazxyHTCot3C41f4FHoqD+gB
        /am6AaM0N10CdKsSpwu7Zi8SjA==
X-Google-Smtp-Source: AA0mqf5hBvoUq0DJmDGm6rvtOlEM6uybZlaFXaOwx4rvv/c2CPN/lkieaUTh7DCyPEd6A5RVF74mNw==
X-Received: by 2002:a05:6512:258b:b0:4b5:a5c7:3289 with SMTP id bf11-20020a056512258b00b004b5a5c73289mr193233lfb.8.1670492794696;
        Thu, 08 Dec 2022 01:46:34 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id s5-20020a056512314500b004b56a8d9e90sm1826596lfi.116.2022.12.08.01.46.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Dec 2022 01:46:34 -0800 (PST)
Message-ID: <8dfb5b8a-766a-14ec-16d4-74fdd9f7d622@linaro.org>
Date:   Thu, 8 Dec 2022 10:46:32 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221208100530.137fa8b7@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/12/2022 10:05, Herve Codina wrote:
> Hi Krzysztof,
> 
> On Thu, 8 Dec 2022 09:26:41 +0100
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> 
>> On 07/12/2022 17:24, Herve Codina wrote:
>>> The 'depends-on' property is set in involved DTS.
>>>
>>> Move it to a required property.
>>>
>>> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
>>> ---
>>>  Documentation/devicetree/bindings/pci/renesas,pci-rcar-gen2.yaml | 1 +  
>>
>> This should be squashed with previous patch. There is no point to add
>> property and immediately in the next patch make it required. Remember
>> that bindings are separate from DTS.
>>
>> Best regards,
>> Krzysztof
>>
> 
> I though about make dtbs_check in case of git bisect.

And what would this commit change? In Git you will have
1. dt-bindings: PCI: renesas,pci-rcar-gen2: Add depends-on for RZ/N1 SoC
family
2. dt-bindings: PCI: renesas,pci-rcar-gen2: 'depends-on' is no more optional

so what is the difference for git bisect?

> 
> But, ok I will squash or perhaps remove completely this commit.
> It introduces a DT compatibility break adding a new mandatory
> property (raised by Rob on cover letter review).
> Is this compatibility break can be acceptable ?

Requiring property in bindings as a fix for something which was broken
is ok. But this is independent of Linux drivers, which should not stop
working.

Best regards,
Krzysztof

