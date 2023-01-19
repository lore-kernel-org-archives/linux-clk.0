Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81E43C004D4
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 10:55:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230117AbjASKzy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:55:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbjASKzm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 05:55:42 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE95C6FF9D
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 02:55:25 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id r2so1447483wrv.7
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 02:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OL2qiG7BG+Y+okCVrqqLfEmaKTmCEe5urCOIZof2oQE=;
        b=lOp6CIgS4j1y8EXIlKoDydedjb1vk/G3W6gYBR6PTpV98lS1Fujx4XSQCf+9DqnqQa
         yTaKCkIVurYLBzPptQoJ1oZj7N+T7FgMmb0t72kc14Ms3gDSyvrTv3S5f2x133kwCSvt
         2COTYk2RZmVEJhkP/OncpXzTt0gFpXB5T2qk/ivWGA0+aAdOeDkicvhJbrwJxmYPyR0h
         sZ73b8AOHKZpGkp8GsZfDXGTW4EJdrWBDFgh8LAvGLWjaGKy6UV2bAXq+HINQSp2Y2IL
         7mtnOkDiDfi3SUQ2CR594CCHvsibHh+F4TcoAW7NX0dLjqZ/n5mM2jwJaOdZclW/XPW5
         6BJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OL2qiG7BG+Y+okCVrqqLfEmaKTmCEe5urCOIZof2oQE=;
        b=GE2ArXtS3y+8Tb2ExcYjeKCiyNsvCSIR8rIfP/zcgYwKlgY7KbpsaBH5pDzc7Zk/p3
         1dEsW023c2T27XIpoByU793+D5BsL0PcjwYzPP44Rn4Cc03Jz7l0B+XAV0HiiewM2L7B
         sq6DaIun6hExapH01PAdOPI1k21kIODL3t5nGyWANV0Qn8mxy5Gpm//Iy3YFBo222cec
         ILqL01VnKuFnnC+uKhdwAKZ+xALEvk9hd3EEYjsxSDaM2anQYbinJaw7VrdUCWuSipRR
         0v2Q5hr8RD4YArYiZdFQ2kJ0psgaKnszjESE/B2EBOPskTXe+/JZiG+bvsRogtTCxNjD
         tyeQ==
X-Gm-Message-State: AFqh2kr1pTcrLRchGbMD5QpnkqMoAG2yg0ZLm49oPracObr2oR6NHYbq
        Go2SHQ3JdblTwz/EUWPDuavI0Q==
X-Google-Smtp-Source: AMrXdXvanJMcHcsDudlV8RtY28WsWbNyRocTulOu3jhWmWVFsMoA1vY4nDbWX6yvACGpVYknd97Ivg==
X-Received: by 2002:adf:f60b:0:b0:2be:528:e348 with SMTP id t11-20020adff60b000000b002be0528e348mr8761264wrp.45.1674125724368;
        Thu, 19 Jan 2023 02:55:24 -0800 (PST)
Received: from [192.168.0.159] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d6647000000b002bbeb700c38sm28341704wrw.91.2023.01.19.02.55.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:55:23 -0800 (PST)
Message-ID: <776b67b2-2405-36f5-f072-78f33ae59fcc@linaro.org>
Date:   Thu, 19 Jan 2023 10:55:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] dt-bindings: clock: qcom,a53pll: drop operating-points-v2
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, fabien.parent@linaro.org
References: <20230113145859.82868-1-krzysztof.kozlowski@linaro.org>
 <e73ad320fafa1365e3506bbd4cc77d8d.sboyd@kernel.org>
 <063c5516-417d-7c21-b58f-a6552779a621@linaro.org>
 <705c78c1d0da18089419b064832d5fed.sboyd@kernel.org>
 <20230119031136.27vson2awemt3nkt@builder.lan>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230119031136.27vson2awemt3nkt@builder.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/01/2023 03:11, Bjorn Andersson wrote:
> On Wed, Jan 18, 2023 at 11:11:00AM -0800, Stephen Boyd wrote:
>> Quoting Krzysztof Kozlowski (2023-01-15 06:35:23)
>>> On 13/01/2023 21:28, Stephen Boyd wrote:
>>>> Quoting Krzysztof Kozlowski (2023-01-13 06:58:59)
>>>>> The CPU PLL clock node does not use OPP tables (neither driver).
>>>>
>>>> What device is qcom_a53pll_get_freq_tbl() operating on?
>>>
>>> On its own, internal table. While of course driver could be converted to
>>> operating-points-v2, no one did it within last 5 years, so why it should
>>> happen now?
>>>
>>
>> The property was added mid 2021 by Shawn[1], that's not 5 years ago. I
>> guess there were plans to add an OPP table that never happened[2]? Is
>> Shawn still working on this? If not, we should revert the OPP code out
>> of the driver.
>>
> 
> @Bryan, what do you think about this?

I'd be in favour of starting the CPR patchset instead, which depends on 
the opps.

I think @Fabien has been waiting on the core 8939 dtsi, I also think the 
dtsi is close enough to merge that we could reasonably initiate the CPR 
stuff.

---
bod
