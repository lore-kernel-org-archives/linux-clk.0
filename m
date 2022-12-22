Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 141BFC001B2
	for <linux-clk@archiver.kernel.org>; Thu, 22 Dec 2022 10:44:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230014AbiLVKoT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Dec 2022 05:44:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235029AbiLVKoS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Dec 2022 05:44:18 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3349418B15
        for <linux-clk@vger.kernel.org>; Thu, 22 Dec 2022 02:44:17 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id m29so2100590lfo.11
        for <linux-clk@vger.kernel.org>; Thu, 22 Dec 2022 02:44:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CKoTdtVMqmk/FQkPYk1zIuQnbeZQZJIlbUEh2ppiwm4=;
        b=f/0ikqnITIxET4ZhVCuSY4rImkWCueaT68Nbvcs22Ksldw+sDH1sd9PKpstscMvmTt
         hYBSqtGX0Vtw6e+iDenk/RuM82vIMi8DrHpkGMFTJZopxurJ/8xmUS6ztLusQcuTlrPf
         zS4Da3EHGNLRmOO0kSo+QAsd/bmva5PdSf9+FmF4RLjIhpHdhR8bsp0sl/TheDXvWw0C
         34CF75KSbylZ4AeyIIzZ5qzsontMRXiw6MRyoWhSThFoVDcl71ZuIfJTXeGWCWEzb9dz
         BYqvScyiR+eAmb9CLMLPfZfGZzrYJQUHxSFE54GPcZRupcvGFDkFeWmLOHMacmH26qbA
         l1kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CKoTdtVMqmk/FQkPYk1zIuQnbeZQZJIlbUEh2ppiwm4=;
        b=w69Hqoq+SSRx84ezXgVgbJJvQpFrUqzLAL9uLLlMB9y1uDOHZ50ggyI/NH0ltPxdab
         mLtVYL0ClvF9IPtSmGQ6V0VkMqXK4rcp9iUV1S5CpXxQiJVetkWfYw5Nf4haCqHOq+Zm
         ah4C0VzjWSozbupjaIr/k8zJtqLQbVfBNmfCJ69CdMgazW0ulRgHQPNzEi2D2i/8u5ly
         ZPbpJp3tEHqwI4X8+WVa5b22f2IxSOhAG7QWUAOVU7oM9GkAI4eqPq0CeJb8Vx1dYjqB
         qvr5oxrynVB7MCVwDyGBgH2CwyjYilko3zVLODmOio2R+ibk3lb7XfdSxfKRvd0vpzL6
         4ETA==
X-Gm-Message-State: AFqh2kpIERXN5l1ZOusS8gCgwqKnKHpRhPczD8Jaus48Jg+GQTuflIVb
        i39jxphXHjp2XMGDCjQ/uHKhYA==
X-Google-Smtp-Source: AMrXdXvYLzQffCt7nO5knfenTpVWX2ktxwfEZ3fuXtQ2OLFluSuTbS75oEGRtcHNzUguIzb7Bcc+CA==
X-Received: by 2002:ac2:455c:0:b0:4b0:1b30:34a1 with SMTP id j28-20020ac2455c000000b004b01b3034a1mr1719394lfm.29.1671705855590;
        Thu, 22 Dec 2022 02:44:15 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c13-20020a19654d000000b004bc1dd05351sm28872lfj.206.2022.12.22.02.44.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 02:44:15 -0800 (PST)
Message-ID: <60e388df-cd03-3e88-e9c5-460ebdde29c5@linaro.org>
Date:   Thu, 22 Dec 2022 11:44:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] clk: qcom: lpasscc: Add resets for SC7280 audioreach
 clock controller
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        swboyd@chromium.org, agross@kernel.org, andersson@kernel.org,
        robh+dt@kernel.org, broonie@kernel.org, quic_plai@quicinc.com,
        krzysztof.kozlowski+dt@linaro.org, konrad.dybcio@somainline.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_rohkumar@quicinc.com
References: <1671618061-6329-1-git-send-email-quic_srivasam@quicinc.com>
 <1671618061-6329-3-git-send-email-quic_srivasam@quicinc.com>
 <efde6373-f788-5c0c-4712-7b9caf7ad3d4@linaro.org>
 <e7edd629-986f-3e64-f9db-5ee68cf4e6f3@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e7edd629-986f-3e64-f9db-5ee68cf4e6f3@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/12/2022 14:18, Srinivasa Rao Mandadapu wrote:
> 
> On 12/21/2022 4:09 PM, Krzysztof Kozlowski wrote:
> Thanks for your time Krzysztof!!!
>> On 21/12/2022 11:21, Srinivasa Rao Mandadapu wrote:
>>> The clock gating control for TX/RX/WSA core bus clocks would be required
>>> to be reset(moved from hardware control) from audio core driver. Thus
>>> add the support for the reset clocks in audioreach based clock driver.
>>>
>>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>>> ---
>>>   drivers/clk/qcom/lpasscc-sc7280.c | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>
>>> diff --git a/drivers/clk/qcom/lpasscc-sc7280.c b/drivers/clk/qcom/lpasscc-sc7280.c
>>> index 5c1e17b..d81d81b 100644
>>> --- a/drivers/clk/qcom/lpasscc-sc7280.c
>>> +++ b/drivers/clk/qcom/lpasscc-sc7280.c
>>> @@ -12,10 +12,12 @@
>>>   #include <linux/regmap.h>
>>>   
>>>   #include <dt-bindings/clock/qcom,lpass-sc7280.h>
>>> +#include <dt-bindings/clock/qcom,lpassaudiocc-sc7280.h>
>> These are bindings for different device.
> 
> They are not exactly for different device. It's for same device with 
> ADSP enabled platforms.
> 
> Basically lpassaudiocc-sc7280.c and lpasscorecc-sc7280.c are for legacy 
> path.
> 
> lpasscc-sc7280.c is for ADSP based AudioReach Solution.

I see two different devices:
lpasscc@3000000
clock-controller@3300000

clock inputs and outputs are different, so it does not look like for
same device.

Best regards,
Krzysztof

