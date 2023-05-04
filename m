Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAAC4C7EE21
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 11:01:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbjEDLBR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 07:01:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229606AbjEDLBP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 07:01:15 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2399C3A82
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 04:01:14 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-94ef0a8546fso51236466b.1
        for <linux-clk@vger.kernel.org>; Thu, 04 May 2023 04:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683198072; x=1685790072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvJ0uy6HEutfybQ9hXUZ0WTdfx2BPiN+lraEEYn0v8k=;
        b=L8DvdtYMZCKoa5b2u64jYvu195WXlh+lGno9oFN6EYpFYsEMQnMxrpYihXNTEKSQfd
         gCZEMZpQJIuXPQuhV5gX8ljxClIC8dm1kTc+5WhFO6Nu01MKMJRTP+NNNCU6YofDGBMY
         V/1uJsDfCZVlGJ1vVBwsqmP2Kg38Qcxn1FliaLaHHK+y/IvcZqiEHlTbtpCFFNHbUlVU
         QdMQseQDl32ZmVQLnoZpxen7LiywtiieNOnTt12F1Fks4WeX1kAYBq8XqqAa9efEGKo8
         v9c2JT3ev0yZa0wLMIJpBbQbMpjq74olpzlx+zmWzLP3JNYytOvGcuCqezR3ln4jZDfX
         O7gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683198072; x=1685790072;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvJ0uy6HEutfybQ9hXUZ0WTdfx2BPiN+lraEEYn0v8k=;
        b=kHEdBWcQcI6XpEWcEuRSupISgQKGqGKokSkLNdvvGDKPH/YkP+rSBcNunohmLXFCGU
         uergS3guVN5BomBdxvpVIFq0feT6qdIf+T+d4sQOl+MZIwa0C7mt6NNgOmEllPzgjgDE
         r0sWnaD58CqIBKAC1U373q3T4Buv8BrQhGzb/bt0HN1e2bFo7KeLL8RIzhfncW6bP9TL
         00RbvbnBShzIRN8fv1cIR/65wUQSPTQ193RaHNn7SgYpvAuc3ENfqd9eoKdU4gY4e72p
         d057jWyKRP33K+V3GBFgXXA4RN3C6SeeXjyouUWA3pbJ32gVN4vQFUS8HVuOOfL1N+VR
         wdZA==
X-Gm-Message-State: AC+VfDzbnuo8FH092r3XwzkMLxxQ9uY0xwUrc2inuhPYYa4CU0kglLsv
        zmlGSga5DWnj9kWOcbMf7HubpA==
X-Google-Smtp-Source: ACHHUZ6hvhyekVU+NPr1zEYkpDOImXg59GWPOs1lW78/gLNvIJeTQriFcfarF+KMexUWuBsi4In3ag==
X-Received: by 2002:a17:907:31ce:b0:94e:aa8e:b56e with SMTP id xf14-20020a17090731ce00b0094eaa8eb56emr5367364ejb.33.1683198072550;
        Thu, 04 May 2023 04:01:12 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id u13-20020a170906c40d00b0094aa087578csm18851613ejz.171.2023.05.04.04.01.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 04:01:11 -0700 (PDT)
Message-ID: <517aecda-681f-ce77-08df-97738a865f96@linaro.org>
Date:   Thu, 4 May 2023 13:01:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: imx: imx93: introduce clk_bypassed module parameter
Content-Language: en-US
To:     Peng Fan <peng.fan@nxp.com>, Greg KH <greg@kroah.com>,
        "Peng Fan (OSS)" <peng.fan@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>
Cc:     "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20230504085506.504474-1-peng.fan@oss.nxp.com>
 <2023050410-rejoin-vocation-8560@gregkh>
 <DU0PR04MB9417F9CBB5C9EE1FC85B10A2886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <b09998bc-9ff7-3a18-89af-9778521ab127@linaro.org>
 <DU0PR04MB941792F2EF3DB5ADB0B1A75A886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <DU0PR04MB941792F2EF3DB5ADB0B1A75A886D9@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/05/2023 11:34, Peng Fan wrote:
> 
> 
>> -----Original Message-----
>> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>> Sent: 2023年5月4日 17:31
>> To: Peng Fan <peng.fan@nxp.com>; Greg KH <greg@kroah.com>; Peng Fan
>> (OSS) <peng.fan@oss.nxp.com>; Rob Herring <robh+dt@kernel.org>;
>> krzysztof.kozlowski+dt@linaro.org
>> Cc: abelvesa@kernel.org; mturquette@baylibre.com; sboyd@kernel.org;
>> shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
>> festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>; linux-
>> clk@vger.kernel.org; linux-arm-kernel@lists.infradead.org; linux-
>> kernel@vger.kernel.org
>> Subject: Re: [PATCH] clk: imx: imx93: introduce clk_bypassed module
>> parameter
>>
>> On 04/05/2023 11:17, Peng Fan wrote:
>>> + DT maintainers.
>>>
>>>> Subject: Re: [PATCH] clk: imx: imx93: introduce clk_bypassed module
>>>> parameter
>>>>
>>>> On Thu, May 04, 2023 at 04:55:06PM +0800, Peng Fan (OSS) wrote:
>>>>> From: Peng Fan <peng.fan@nxp.com>
>>>>>
>>>>> With the clk names specified in clk_bypassed module parameter, give
>>>>> user an option to bypass the clk from managing them by Linux kernel.
>>>>
>>>> As I said on another email, no, please do not add new module
>>>> parameters for drivers, this is not the 1990s
>>>
>>> ok, but this is for boot, so only DT could be considered.
>>>
>>> But DT is to describe hardware, here I just wanna give user an option
>>> to bypass some clocks. Is it ok to add a DT property saying
>>> "fsl,imx93-bypass-clks = <IMX93_CLK_X>, <IMX93_CLK_Y>" ?
>>>
>>
>> I don't know what it is to "bypass some clocks". This does not look like
>> parameter for system at all.
> 
> Currently the linux clk driver registers all the clocks and manage them.
> But when M33 is running, M33 may not wanna linux to manage
> some clocks M33 is using. So I wanna linux not register those clocks
> that M33 will use.

Ask the one who designed such system that second processor pokes parts
of first processor... I assume if the clock controller is enabled in DTS
for Linux, then the Linux owns it. Otherwise how do you expect to handle
concurrent access to same registers from different processors?

And how are you going to decide which clocks should be managed by M33?
One firmware could want to play with one clock, other with everything...
Module parameter is not the way to deal with it.

Probably Ahmad's idea is the only one reasonable in your case, if you do
not have hypervisor.


Best regards,
Krzysztof

