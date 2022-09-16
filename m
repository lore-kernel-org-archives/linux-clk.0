Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B58C54EE9
	for <linux-clk@archiver.kernel.org>; Fri, 16 Sep 2022 10:51:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230400AbiIPKvi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Sep 2022 06:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231560AbiIPKvQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Sep 2022 06:51:16 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5869B514C
        for <linux-clk@vger.kernel.org>; Fri, 16 Sep 2022 03:30:18 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id c2-20020a1c3502000000b003b2973dafb7so19570462wma.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Sep 2022 03:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=3pSSbYLsUZVphsAWzkeXxvJouGOGgPDa3BFZ6REzto4=;
        b=u8x/gpFB48PZ2CVbPWXd89tZdFwnU41LwIPsiCY6fWlNE61ORB4aaNwFhBQA33VcqJ
         1rgIMOQhIL7BpbiSm6SxOAE/Jhl4KPdFLkK7FhPlgpqCSTHYTooCLmsZV7fiUTeLtHuJ
         2seIzGcFeLlUWwQSb+NW+1vXI+SUydvOSe2zuKQToyp49RczDOykjMVp3jwsGLAosbIP
         7w4T+by5xnZok/pnf1td5ZEYjDmbBPDuPYoifV5mJMLDXZTbSDV+74i7zKIEHRQqTDEq
         2xcEEXblCkNKih7XRRRnX2mDclvu8bjKfACWz/Y5wXoyxbbW2BK1Vq2n8RLh20rPUIir
         toLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3pSSbYLsUZVphsAWzkeXxvJouGOGgPDa3BFZ6REzto4=;
        b=RQKXdTJWnsOxxdx+yXCUAglaj6a3YzQCLuvu1eIZxCCnZQRNRmCn5X65dUVo2tsPwP
         ax14HpvncTpJK5shgUCT6ByuflNLhJ/gOmglOLMLWIAmIpneANkYDyUdfccRycIYy5cg
         rHAxlXTOUbMNoWrcSNLe1fzggqUlrQIS3dZAZ67Hrw1mes7DOqaZliyGrNMq+Bax98Xm
         qBf1g4ElQE7c71Ls/sgbBVoaj+ZnQq1Db7ebr3NC9AQJvR033WiaB8VDVZeuclsiTN3v
         hUFpkzOkulpbCYd1MizvpkD2J87AWQAAoqlDswEMDEd1NAMSLcRhqSAtvM8pFan4sWmm
         JzOQ==
X-Gm-Message-State: ACrzQf2GGz0d8wTtSyxK3EswLFeHuIgh2/mq41FB08exa9/taF4b9QNX
        TlhsqImV5YMfgvXdTRBMHs8ehA==
X-Google-Smtp-Source: AMsMyM4OyQkKoo2fuhcDIb/EjBh2hnOfoU1+YHmTYRKnnONgZLG46VxZ2lyHsBWIqlwMI1WUY1go/w==
X-Received: by 2002:a7b:c417:0:b0:3b4:5c94:24c1 with SMTP id k23-20020a7bc417000000b003b45c9424c1mr2843337wmi.86.1663324215296;
        Fri, 16 Sep 2022 03:30:15 -0700 (PDT)
Received: from [10.119.22.201] ([89.101.193.73])
        by smtp.gmail.com with ESMTPSA id g17-20020a5d5551000000b00228e1e90822sm4679007wrw.112.2022.09.16.03.30.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Sep 2022 03:30:14 -0700 (PDT)
Message-ID: <66a057d4-8c52-6a64-c23f-ba4a4428efb5@linaro.org>
Date:   Fri, 16 Sep 2022 11:30:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] dt-bindings: firmware: imx: sync with SCFW kit
 v1.13.0
Content-Language: en-US
To:     Viorel Suman <viorel.suman@oss.nxp.com>
Cc:     Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Viorel Suman <viorel.suman@nxp.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220915181805.424670-1-viorel.suman@oss.nxp.com>
 <20220915181805.424670-2-viorel.suman@oss.nxp.com>
 <42e78db0-74f9-3098-0cf2-908092a0b594@linaro.org>
 <20220916101738.xn7xx7ipf7p5dbok@fsr-ub1664-116>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220916101738.xn7xx7ipf7p5dbok@fsr-ub1664-116>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/09/2022 11:17, Viorel Suman wrote:
> On 22-09-16 10:38:30, Krzysztof Kozlowski wrote:
>> On 15/09/2022 19:18, Viorel Suman (OSS) wrote:
>>> From: Viorel Suman <viorel.suman@nxp.com>
>>>
>>> Sync defines with the latest available SCFW kit version 1.13.0,
>>> may be found at the address below:
>>>
>>> https://www.nxp.com/webapp/Download?colCode=L5.15.32_2.0.0_SCFWKIT-1.13.0&appType=license
>>>
>>> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
>>> ---
>>>  include/dt-bindings/firmware/imx/rsrc.h | 299 ++++++++++++++++--------
>>>  1 file changed, 203 insertions(+), 96 deletions(-)
>>>
>>> diff --git a/include/dt-bindings/firmware/imx/rsrc.h b/include/dt-bindings/firmware/imx/rsrc.h
>>> index 43885056557c..a4c68f394986 100644
>>> --- a/include/dt-bindings/firmware/imx/rsrc.h
>>> +++ b/include/dt-bindings/firmware/imx/rsrc.h
>>> @@ -13,34 +13,38 @@
>>>   * never be changed or removed (only added to at the end of the list).
>>>   */
>>>  
>>> -#define IMX_SC_R_A53			0
>>> -#define IMX_SC_R_A53_0			1
>>
>> You cannot change binding constants... Aren't you breaking all possible
>> boards and users?
> 
> Hi Krzysztof,
> 
> There is a backward compatibility section added in the end of the patch,
> it follows the same approach as in SCFW kit v1.13.0:
> 
> +/*
> + * Compatibility defines for sc_rsrc_t
> + */
> +#define IMX_SC_R_A35                   IMX_SC_R_AP_2

Then it looks fine, except someone would need to compare/test the numbers...


Best regards,
Krzysztof
