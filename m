Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7110C6FD1D
	for <linux-clk@archiver.kernel.org>; Tue, 21 Mar 2023 07:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229991AbjCUHRO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 Mar 2023 03:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjCUHRN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 Mar 2023 03:17:13 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 618AD3E09E
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 00:16:53 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id ek18so55926489edb.6
        for <linux-clk@vger.kernel.org>; Tue, 21 Mar 2023 00:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679383012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GD9sWoGachnVcnj7BiD284LKFFQ2JluoRM5HPqQ7YTQ=;
        b=XYOn21GvwINhYxCcRgPUmrD7vtp46gwQAWmpOq1R54xEtk8Y6GvWpfoUIoO2X+3nLz
         WNGrxF9rZi0xnIotOO3PStbgvqK0hQ62BOOKx2lgmJdGD70ay3riYFIIwHqZl15c/TR0
         dm7NM8MU1ap1yAITcZmEgYWXogP/FVrE0QoAmVGcW/9WvJMgHOK/lqkWeSI6g3mKLQCU
         cGDMO/ifAWqdAw+D0BjXFVTXF1fPlFQaNtbn9qS54U9fO/mtfnIClZYVoI6+gmeomW0Q
         oRZa+oMDVaCybu5hkz3mzc7X21MZpUzgRgfOZjetuFTT22nRk1SHRriN/Fs8kI2QhpnW
         iAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679383012;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GD9sWoGachnVcnj7BiD284LKFFQ2JluoRM5HPqQ7YTQ=;
        b=7jWuCw+YbQBahmVzTpuR2zAPaTFa5TvtlHo0PhB2NI0YmatELZ2TJeGVGA1A4QMHnb
         KTYKJ58YRyB81eGEwH301hrmgqUIsgYf4V6ZR0V1ZOqMDlkbuVdDeq9qQ4U8/QYM7um6
         8OJJAARidheMdis6k5SQcfV42Sw8bxUjA7WG8+TuIlzZij97ybdasjp6Hezv3JV7MApY
         cJ9fj3CXuZ0hdxfGVQismHy5w33iay78ksaYgmNywO/0t6YQ07u1lxO0mx9p3KKcUfg7
         mEvIebNa3vzUg5gPetgiyrANmhAlF2jBBZJr2LukjqHSruN0i6dtN7xQGB5Z6iq/0Pq4
         odKw==
X-Gm-Message-State: AO0yUKXnEljC0TKG8Ao6pRcIhHuIJdbh6+Epn7rTv4Kwf1Hw9x1b7Fb9
        8DhIToBLw9sIA2qTBNt4TCw67g==
X-Google-Smtp-Source: AK7set8Gbxjh1zagzPuehxDmVk/F28LJB4nNhEO+htLGAF1/Jf5T1CQyEoPitbT9G8mBMwfU8TMvgA==
X-Received: by 2002:a17:906:2286:b0:931:1ccb:7360 with SMTP id p6-20020a170906228600b009311ccb7360mr1894222eja.39.1679383011716;
        Tue, 21 Mar 2023 00:16:51 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:2142:d8da:5ae4:d817? ([2a02:810d:15c0:828:2142:d8da:5ae4:d817])
        by smtp.gmail.com with ESMTPSA id g20-20020a1709061e1400b00930f5ecbd8fsm5418454ejj.219.2023.03.21.00.16.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 00:16:51 -0700 (PDT)
Message-ID: <0ece990e-fd81-856a-bd0e-8a2572448aa3@linaro.org>
Date:   Tue, 21 Mar 2023 08:16:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 1/9] dt-bindings: clock: add mtmips SoCs system
 controller
Content-Language: en-US
To:     Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc:     linux-clk@vger.kernel.org, linux-mips@vger.kernel.org,
        tsbogend@alpha.franken.de, john@phrozen.org,
        linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
        devicetree@vger.kernel.org, arinc.unal@arinc9.com
References: <20230321050034.1431379-1-sergio.paracuellos@gmail.com>
 <20230321050034.1431379-2-sergio.paracuellos@gmail.com>
 <5f295438-8334-d374-2ae6-2a385ffb317d@linaro.org>
 <CAMhs-H_dSgcPNQVusHWVvztYHptOxSJ_o7G0eU9=M1C7RXdsVw@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAMhs-H_dSgcPNQVusHWVvztYHptOxSJ_o7G0eU9=M1C7RXdsVw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/03/2023 08:00, Sergio Paracuellos wrote:
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - ralink,mt7620-sysc
>>
>> Since you decided to send it before we finish discussion:
>> NAK - this is already used as mediatek
> 
> Sorry, there was too much stuff commented so I preferred to clean up
> all of them while maintaining the compatibles with the ralink prefix
> instead since that was where the current discussion was at that point.

You did not even wait for me to send feedback on this, in old thread.

> 
>>
>>> +          - ralink,mt7620a-sysc
> 
> As I have said, this one exists:
> 
> arch/mips/ralink/mt7620.c:      rt_sysc_membase =
> plat_of_remap_node("ralink,mt7620a-sysc");

And why do you ignore others which have mediatek?

> 
> 
>>> +          - ralink,mt7628-sysc
>>
>> Same here.

Same problem.

>>
>>> +          - ralink,mt7688-sysc
>>
>> I expect you to check the others.
> 
> I can change others to mediatek but that would be a bit weird, don't you think?

No, I expect to have mediatek where the model is already used with
mediatek prefix.



Best regards,
Krzysztof

