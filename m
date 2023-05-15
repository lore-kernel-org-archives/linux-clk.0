Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5206FC7EE22
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 10:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240413AbjEOKFx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 06:05:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240396AbjEOKFW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 06:05:22 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02454212D
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 03:04:45 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so19200230a12.2
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684145084; x=1686737084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XyEboodinoETFVIKDJ6MaTczEBVanL7D2yaqefiBb6w=;
        b=agNiLDnOYfkL2mCqKdqZSIiw70w52wrUzYgCUEB9n9qAUNdE3IdkTCGecuhuqmqtw8
         VbBnHMCmBZqIlWOujTG6Va8H4lYgd6yZCw8Hpsh1WMRMi6sWR9CV5Zz+PI9y7w66//fg
         arIWFcrfvMNI6tXxJfu9CJuqzfVPCCJXSFfujf2SlRVkcOVZzEbpj9uL91ebQdwYdGGG
         CbwgZp8Xda1ViZ6vvEebMUxYDF/F4JOxw/58B/jGCB4h0Cjhl291HV4z/BwINGd3eH5u
         3xWWfX6QvTTqZC9ircJRO5wuJMvJNb1rKfZ4JR+EFQndEWL5x+zFeDnzajqWMyvorZ5x
         c4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684145084; x=1686737084;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XyEboodinoETFVIKDJ6MaTczEBVanL7D2yaqefiBb6w=;
        b=bZYaHmKjy0of+LmFXFBkt64ZPTQuZm06L9jzgR6DKf4EfT+qs5v3h1LdjWFnHY5jpN
         Esf/P+HTPqyRYoRFqtnGFJftheTWtAVGOVLHWleNH2OLS89BU1qqWCFCf3kndBl2BQiY
         pBpwvtGM2f6PknYNuHUh4lATwcigjxhlTwpEfG8wojN9dbC1GM0EkoVhGeyt06298tLA
         j/yX35hPW8ud4APUlF/9PpKOy7+bOTI9VKbPxIDYnpfufEJJZChi1GP/pYQoeGEcBJo/
         +dWSeNyI/PiY5JgYW2q1w0itJKuLeNKywkGbtGhft5lSogAN1bO4hl6FPJagT80i3NH6
         t0+Q==
X-Gm-Message-State: AC+VfDxR80w7Z6A/UefA8YEanlGyGQE0yQWo5BgSCI9iSGUvwQNNFqX5
        HccsjD7/2WWHCxHEoRMz8kc7Cw==
X-Google-Smtp-Source: ACHHUZ5HNnM1GF9ntlgBSWxnLUIuD7ee0ze5RiVw+zE9WMPn5mg3W9l+AOnJxUyQYhNRbGifB0Mx6Q==
X-Received: by 2002:a50:ec8a:0:b0:50b:c275:6c56 with SMTP id e10-20020a50ec8a000000b0050bc2756c56mr26793165edr.16.1684145084277;
        Mon, 15 May 2023 03:04:44 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:6470:25b8:7c2d:1992? ([2a02:810d:15c0:828:6470:25b8:7c2d:1992])
        by smtp.gmail.com with ESMTPSA id s15-20020a056402164f00b0050d56dffc93sm7229454edx.12.2023.05.15.03.04.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 May 2023 03:04:43 -0700 (PDT)
Message-ID: <0b0c8f9f-bbb0-16e9-1556-eb2ac8cf1981@linaro.org>
Date:   Mon, 15 May 2023 12:04:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 1/4] dt-bindings: clock: document Amlogic S4 SoC PLL
 clock controller
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230515031557.31143-1-yu.tu@amlogic.com>
 <20230515031557.31143-2-yu.tu@amlogic.com>
 <590560c9-4da6-bbd4-6aac-de57ab5403ba@linaro.org>
 <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8c6ad0a9-7820-c7a2-bd3b-1eee87d96728@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/05/2023 09:35, Yu Tu wrote:
> Hi Krzysztof,
> 	Thank you for your prompt reply.
> 
> On 2023/5/15 14:32, Krzysztof Kozlowski wrote:
>> On 15/05/2023 05:15, Yu Tu wrote:
>>> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
>>>
>>> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
>>
>> This is a friendly reminder during the review process.
>>
>> It looks like you received a tag and forgot to add it.
>>
>> If you do not know the process, here is a short explanation:
>> Please add Acked-by/Reviewed-by/Tested-by tags when posting new
>> versions. However, there's no need to repost patches *only* to add the
>> tags. The upstream maintainer will do that for acks received on the
>> version they apply.
>>
>> https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540
>>
>> If a tag was not added on purpose, please state why and what changed.
> 
> Yes. I don't know the process. So I need to add Reviewed-by: Rob Herring 
> <robh@kernel.org>. And resend V8?

Yes. I cannot add it top your emails.

Best regards,
Krzysztof

