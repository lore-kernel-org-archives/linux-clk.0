Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C542C54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 09:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236145AbjALJvs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 04:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239711AbjALJvT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 04:51:19 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA484186BC
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 01:47:04 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id bp15so27605037lfb.13
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 01:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v52ZT5Dn8ZjNQ+4UbgMztxg/QD2KxIsCHG92el7/AjM=;
        b=luvJKwraFmhJHB1d+2LxEw5Y346BtylFim51WTbD7ApW/LV/S6rpJduYMTq+4ML4zS
         f9zERst6gicx4wbpuzC+lnUKPhF84exmx7KkKmpYG1roqam4QhINeW0XZxAWDVDNLclG
         4yNa9Th6lG2n7rGU+1oJvSKQp9orZzL9YVhrc5zfGwAHC6AFPFrX0pFzSPHU4pRFUNRU
         kj7giu96yMDMe5ohMtiw3St3DjzTWehrLpvqOBKcc41EJW0x6grf0VW4DItKVMnK9G3e
         MPvo5LHoRnuZwU9hKPAgjSc45J1iz7q/NWjBR7zc4qzTTJ7RQxwzlsUEBbtIdoOA7f9S
         claA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v52ZT5Dn8ZjNQ+4UbgMztxg/QD2KxIsCHG92el7/AjM=;
        b=pHm+m0Rpj0VHfM1HvCTwfD8/FppF88FkWA47PEDyNHnKprHQS411+3lBDbPVXoAh/7
         Jix9zArMsj6NLi7T7TBrp4gH2exX653iJpVzgo/MmcePCRHgNnj369WJ1fyc2D8Fs3YS
         Qj55bhAKkBraf5OEtaFQKYhFjNclPGxYho+m9jF5bNpo1QhnAp6NguMWdKM/pOFoV/QJ
         mVmP86uhuT6r8UNF6WcjjwEIBP/sWWwDgEb+YTaEQfU43UnLAAssJdfcWMI1GaNmmSJE
         DQMKlyjioVVjxw5GR6wN25QmQJKN3rlJS8nmFOUDr6M52uC5X8TJPy69ZJkwi1uHOMSC
         isdA==
X-Gm-Message-State: AFqh2kqaGLTuy1ZxlSibtio+ydF8aBKg7ejFBV8fKdfKKTAfJH64LAXn
        WvGZpejD2DmIWQULc4tffqJaww==
X-Google-Smtp-Source: AMrXdXu+MSa0BMhmYhMdLuvTnQMsSSFUWVCb6sQstQKV7ytM8CA8fJWoSqioWXrNywDf0MCsNPgwhg==
X-Received: by 2002:a05:6512:110c:b0:4cc:a1a1:9aaf with SMTP id l12-20020a056512110c00b004cca1a19aafmr516956lfg.23.1673516823295;
        Thu, 12 Jan 2023 01:47:03 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id bi41-20020a0565120ea900b004cc7026d95asm3133647lfb.259.2023.01.12.01.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 01:47:02 -0800 (PST)
Message-ID: <6cccd502-3514-df72-ddea-1396ca6c5c76@linaro.org>
Date:   Thu, 12 Jan 2023 11:47:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 1/5] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-2-dmitry.baryshkov@linaro.org>
 <a0f77ba9-5d39-7253-dc83-1b5ac0a43adf@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <a0f77ba9-5d39-7253-dc83-1b5ac0a43adf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 12/01/2023 10:40, Krzysztof Kozlowski wrote:
> On 11/01/2023 20:57, Dmitry Baryshkov wrote:
>> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
>> between two CPU clusters. The CBF clock should follow the CPU
>> frequencies to provide enough bandwidth between clusters. Thus a single
>> driver implements both a clock and an interconnect to set the clock
>> rate.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,msm8996-cbf.yaml      | 53 +++++++++++++++++++
>>   1 file changed, 53 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>> new file mode 100644
>> index 000000000000..2080e1743b2e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-cbf.yaml
>> @@ -0,0 +1,53 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> 
> Dual license, please.

Ack, I'll fix it for v2. Do you have any other comments for the file itself?

-- 
With best wishes
Dmitry

