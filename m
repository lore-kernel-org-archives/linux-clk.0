Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6111BEB64D9
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jul 2023 20:54:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbjGFUyX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 6 Jul 2023 16:54:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjGFUyW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Jul 2023 16:54:22 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 292381999
        for <linux-clk@vger.kernel.org>; Thu,  6 Jul 2023 13:54:20 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6ef64342aso18160611fa.3
        for <linux-clk@vger.kernel.org>; Thu, 06 Jul 2023 13:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688676858; x=1691268858;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7RSaQ9WlKcAwcelHXRKRPMrm8csU9PL5No77SGAzfpQ=;
        b=JUqQ0v/649BZi/7gvHg9AngNzQdko5dlikegW9BhFCFX8oTYJtR2wgz8NX/Ma9PmFl
         kLtS5wTQVS2xadlnlXmllORS9K9lkcwtcxuy/KRmHEl/UbK2v5vkLpXxmoeZlLCgsvNH
         bAXxQkll+hlPkpd5K2cqXGqFm1spuDbCuMVAfR2YLXP/8Z+Sfu1zIhVMKz/h5WRn7uaY
         y7Lsmke+S+4mbEqGSZFPlUZH+bF+O4Gf35Vca/SiNNqW8YzsXtoCO4LOFaIql/8xHT+r
         Qm49Ff8Et9Pqz6BdYfMHSasbFEdAX4lza2Gr/dx7m/qRwITcEYcM/vAikVoFOvMZOwJV
         2vmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688676858; x=1691268858;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7RSaQ9WlKcAwcelHXRKRPMrm8csU9PL5No77SGAzfpQ=;
        b=hbX/1rVnAvp2/mhSS+/xb1U4WNDZ7jWP45YoVVVCI0CFYaoTho4MqYfgwU9FIdPPoX
         6isaRq7Y8CwPOhxIg/XdGqTPxgD2coKqoPan7J0L+MWy5dmniVfPiAQwRLvHMtDY5PUM
         YS2XFih/co3395YrzySzMr18V8yesXYgt1S++slQLn4QWrLBa+KKCsuC5A21Y7KLM0SD
         pNO7n4lf87jQvVFbpFFf8TyDQ806pZZlN7hWLwPJXDI42mQC/ls++W36lZX+3NPjpEXZ
         NGYUuL/FalX3H+SJ6sKRvWbLJKI+wgXTc6i/Uy+aP4kKYmJxp6M4VEKBV5y1aCvNH9aT
         OXog==
X-Gm-Message-State: ABy/qLYBnuSsQMiEeh2ejOySCitDrhNceu2fSCmUtsGq/yAKhk60UamH
        WDH5Mj+e+cTnwycbsCwkXcSDmA==
X-Google-Smtp-Source: APBJJlEOE7hxfi9AL1aP//s6s/PqKmJrmLwuwd5C2ZlB/pqsJhwHkYt8V/oS5kn34MeHKn3FzqQXlw==
X-Received: by 2002:a2e:9896:0:b0:2b6:9909:79bd with SMTP id b22-20020a2e9896000000b002b6990979bdmr1909986ljj.24.1688676858175;
        Thu, 06 Jul 2023 13:54:18 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id z22-20020a05651c023600b002b6de6deb5asm483574ljn.2.2023.07.06.13.54.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 13:54:17 -0700 (PDT)
Message-ID: <b7853d31-0330-591f-2cea-7aa2a7d7c51e@linaro.org>
Date:   Thu, 6 Jul 2023 22:54:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] clk: qcom: gcc-sc8280xp: Allow PCIe GDSCs to enter
 retention state
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     Johan Hovold <johan@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        johan+linaro@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230706140842.18059-1-manivannan.sadhasivam@linaro.org>
 <ZKbM4vLpk_T3cGWC@hovoldconsulting.com>
 <34b300ea-072a-5c70-904f-db85ff963f3a@linaro.org>
Content-Language: en-US
In-Reply-To: <34b300ea-072a-5c70-904f-db85ff963f3a@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 6.07.2023 16:40, Konrad Dybcio wrote:
> On 6.07.2023 16:17, Johan Hovold wrote:
>> On Thu, Jul 06, 2023 at 07:38:42PM +0530, Manivannan Sadhasivam wrote:
>>> With the minimal system suspend support in place for the PCIe driver that
>>> keeps the interconnect path voted, the ALWAYS_ON flag can now be dropped.
>>>
>>> Also, the PWRSTS_RET_ON flag should be used to allow the GDSCs to enter the
>>> retention state when the parent domain get's turned off during system
>>> suspend.
>>>
>>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>>> ---
>>>
>>> Changes in v2:
>>>
>>> * Changed the patch from simple revert to changing the ALWAYS_ON flag to
>>>   PWRSTS_RET_ON.
>>>
>>>  drivers/clk/qcom/gcc-sc8280xp.c | 10 +++++-----
>>>  1 file changed, 5 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
>>> index 04a99dbaa57e..c59b0f91c87d 100644
>>> --- a/drivers/clk/qcom/gcc-sc8280xp.c
>>> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
>>> @@ -6786,7 +6786,7 @@ static struct gdsc pcie_2a_gdsc = {
>>>  		.name = "pcie_2a_gdsc",
>>>  	},
>>>  	.pwrsts = PWRSTS_OFF_ON,
>>> -	.flags = VOTABLE | ALWAYS_ON,
>>> +	.flags = VOTABLE | PWRSTS_RET_ON,
>>>  };
>>
>> This is not correct either. PWRSTS_RET_ON is a pwrsts mask...
> This + please rebase atop that:
> 
> https://lore.kernel.org/linux-arm-msm/20230620-topic-sc8280_gccgdsc-v2-0-562c1428c10d@linaro.org/
Moreover, I tried a similar patch out.

Johan's v6.4 branch + the patchset I linked + removing ALWAYS_ON from gcc
(so keeping PWRSTS_OFF_ON) and PCIe survives a wakeup-s2idle-wakeup cycle.

I am however running with clk_ignore_unused, so I don't know how this
impacts the RPMh system suspend situation.

Konrad

> 
> Konrad
>>
>> Johan
