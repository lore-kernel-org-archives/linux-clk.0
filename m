Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE41EC61DA4
	for <linux-clk@archiver.kernel.org>; Sat, 18 Feb 2023 14:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjBROze (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 18 Feb 2023 09:55:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229577AbjBROzb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 18 Feb 2023 09:55:31 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD4D818B21
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 06:55:29 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id t19so2731692edi.13
        for <linux-clk@vger.kernel.org>; Sat, 18 Feb 2023 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVLRzXREQ+19fFs4Pc7mcjHjxtT7x8ggG7HENOjDxNg=;
        b=J/tvudzLLml7HurgL4Skxujt0BfWSAZikHpxyEzg/oLlKbA/7VrefQN0zhtzRtDRjM
         s7waRZc5aqFiLJ8X+8vN9JYZdYJDGPjP6SlsDwK9F5f67RZsbA52Ro6sG/vaFZmDND86
         j12TsRgfN6rcd6YqkzsmjT5m33l22siYXjYlEPzQ8QtfXA5kZdOnlirO0toGRTts/s6D
         EpWSa1EaOm0h4bbjf8qu6fIitg4maKVxmj2NGyTKVs/LIT6GgFRlWefbRq8p0X68Hv78
         XZ+4Uo4yDbuYYtrtEVmwywWtZKsXT2OYPyc+GkJAUI3YEWxQxr85H5oY89BGRCtRyAMU
         M3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iVLRzXREQ+19fFs4Pc7mcjHjxtT7x8ggG7HENOjDxNg=;
        b=nuISdFCG40y0DoXOmNiP6aCJ7C2oTjfL8j246H3EM7Ojqy29FdwjNKBJ2p5sfA55WH
         0h7qMOOFvyB50OoWpz11uJiEy2c/EC4lBlNLfKwWMQdu5WRpM2sRBvPdUTIYnzdevLd6
         ua5Oe/47QlHe02BWFOmeYx0wEG5SiFON3YE9I0eJjRMqio7cREPYzbrYHz4KjtJjbP2z
         TEL4ofra8t18D5uH4SfebtL68yEyhj2KE2o43UjQ0DdclbV+V1KJI6Lh7GoskbluXfOs
         8qqXMkvuUOH55+EyOboFYll+QZw7Uo6zZ9ErTmq4XKOZ1/Zbdj6eXSZ0KnYQMvHxPUTy
         tAWw==
X-Gm-Message-State: AO0yUKXQ5opMNW2+xUjmQIQG4Q7+upauga1Nm7KTGK0FZtrOg2rXTagN
        eg9ZMdwI96gKIXMGJdrIcL/DlQ==
X-Google-Smtp-Source: AK7set+o+3+5itFIzexy/ZcNCze7tMCBX9222/c9vkPLuQ7XzbbxCzFEcxKBDAOO5XZYry+Sq1kOWw==
X-Received: by 2002:a17:907:98d2:b0:8b2:3eb6:8661 with SMTP id kd18-20020a17090798d200b008b23eb68661mr5633482ejc.8.1676732128340;
        Sat, 18 Feb 2023 06:55:28 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id lo10-20020a170906fa0a00b008b1550a289fsm3461187ejb.34.2023.02.18.06.55.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 18 Feb 2023 06:55:27 -0800 (PST)
Message-ID: <a3217699-7b23-35e6-84b2-fe9e52158481@linaro.org>
Date:   Sat, 18 Feb 2023 15:55:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add StarFive JH7110 system
 clock and reset generator
Content-Language: en-US
To:     Conor Dooley <conor@kernel.org>
Cc:     Conor Dooley <conor.dooley@microchip.com>,
        Hal Feng <hal.feng@starfivetech.com>,
        linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Emil Renner Berthing <emil.renner.berthing@canonical.com>,
        linux-kernel@vger.kernel.org
References: <Y6tSWB2+98a8k9Qw@spud>
 <5cf0fe71-fd17-fb28-c01e-28356081ba76@starfivetech.com>
 <Y+5z8skN2DuvxDEL@spud>
 <68e61f28-daec-ce72-726a-1fffe8e94829@starfivetech.com>
 <Y+8x/KSujhgNLAd6@wendy>
 <d3b06d0b-ff17-ebab-bae5-e1ec836fe667@starfivetech.com>
 <Y++B43uCnPQlRYFi@wendy> <dcba75b5-7b62-35aa-6836-5d5edd785002@linaro.org>
 <Y++q9ln8P3XegqfN@spud> <41e4f293-99eb-f157-b4a9-3d00b15f4652@linaro.org>
 <Y/CztNs6laTzttrI@spud>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <Y/CztNs6laTzttrI@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/02/2023 12:17, Conor Dooley wrote:
> Hey Krzysztof,
> 
> On Sat, Feb 18, 2023 at 11:20:30AM +0100, Krzysztof Kozlowski wrote:
>> On 17/02/2023 17:27, Conor Dooley wrote:
>>> On Fri, Feb 17, 2023 at 04:47:48PM +0100, Krzysztof Kozlowski wrote:
>>>> On 17/02/2023 14:32, Conor Dooley wrote:
>>>>>>>> Yes, it is.
>>>>>>>
>>>>>>> Which would then make GMAC1 RGMII RX optional, rather than required?
>>>>>>
>>>>>> If thinking in this way, I must say yes, it is optional. But actually
>>>>>> GMAC1 RGMII RX feeds gmac1_rx by default. 
>>>>>> For a mux, it usually works if you populate only one input to it.
>>>>>> Does it mean all the other inputs are optional? And how can we define
>>>>>> which input is required?
>>>>>
>>>>> I'm not sure, that is a question for Krzysztof and/or Rob.
>>>>
>>>> That's a long thread, please summarize what you ask. Otherwise I have no
>>>> clue what is the question.
>>>
>>> Sorry. I tried to preserve the context of the conversation the last time
>>> I cropped it so that things would be contained on one email.
>>>
>>> For me at least, I am wondering how you convey that out of a list of
>>> clock inputs (for example a, b, c, d) that two of the clocks are inputs
>>> to a mux and it is only required to provide one of the two (say b & c).
> 
> You skipped this part which was what I was trying to ask you about.

Yeah, I skipped a lot because there was one big thread with a question:
what do you think? Sorry, I will not dig 8 emails thread to figure out
which question is to me and which is not...

> Do you know how to convey this situation, or is it even possible to
> express those rules?

oneOf:
 - clock-names:
     minItems: 3
     items:
       - a
       - b
       - c
       - d
 - clock-names:
     items:
       - a
       - b
       - d

or maybe:
 - clock-names:
     minItems: 3
     items:
       - a
       - b
       - enum: [c, d]
       - d


> 
>>>> Does the mux works correctly if clock input is not connected? I mean,
>>>> are you now talking about real hardware or some simplification from SW
>>>> point of view?
>>>
>>> I'm coming at this from an angle of "is a StarFive customer going to show
>>> up with a devicetree containing dummy fixed-clocks to satisfy dtbs_check
>>> because they opted to only populate one input to the mux".
>>> I don't really care about implications for the driver, just about
>>> whether the hardware allows for inputs to the mux to be left
>>> un-populated.
>>
>> Whether hardware allows - not a question to me.
> 
>> BTW, this is rather question coming from me...
> 
> I don't understand what you mean by this, sorry.

You said to a letter addressed to me "whether the hardware allows for
...". Why would you ask me about hardware I know nothing about? That was
my question - I am asking - whether hardware allows it or not. Then
write bindings depending on that.

Best regards,
Krzysztof

