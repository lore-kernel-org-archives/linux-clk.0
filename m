Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED60FCCA47B
	for <linux-clk@archiver.kernel.org>; Thu, 14 Jul 2022 08:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiGNIJb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Jul 2022 04:09:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229895AbiGNIJa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jul 2022 04:09:30 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0806C2B19A
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 01:09:27 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id bx13so1280730ljb.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Jul 2022 01:09:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=eug4fwts06ljl3bIhOz7HlYGU3mc05ie4gAPEb/LZr8=;
        b=q9TvXr5zTpj+xu+3bRrE7S3Z45IY+DANlI/KHzaSL88ZBSqjQx7BHz9rdG2rkL5ZYS
         jTxizTW9LYqqBHwGNFgCubPKnnP+h9RRtMAGTSTZ5Fjw4Qp2xmFU3lwr6aitQecO3E8c
         +AUbokK37PRczpB+/U4JFeyl7+c3aM6zPODf8Qsm9DJ58279IQYXlr6cyDW0RmsqmId0
         OvwYycgi4Ock2+WZpt6cx+3z5IPZPeOXBXNOSHW8uqiDsVjEiax9SBsW/WZLERW4i0aA
         J0YJZcnksFOYkGSxlDzkdTMCI5b5TfN9WsPIwEB3vlfPI+XQczpXbTJ0/Sjl5TX4qwsG
         1FCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=eug4fwts06ljl3bIhOz7HlYGU3mc05ie4gAPEb/LZr8=;
        b=BjJMT+NlpGSjfhUeow664x0bkW/MOPXxwUlFBfXlzkyVVi7YhTtlwUMUh++ukuE2K5
         dw7n8eOPhuPLoyDZAEMzv4IqdED69BjtbB2lUjRTP2h2LFR0xh6m5pQ3OkK2z+U2h3SJ
         QOyesgNGVzridSAfPYvyNY8GeY+VJNpIfslJnuuKyQ1IGa4jA83n2iZK8cEtBUJBzZep
         5bzP8ykYJMfE2/0UWYbQgqR/ZC2/I8V9hi5IKHpODFvNRjGKkcxSUcnBlVDAGe9nPin7
         HcY79YaEjRFgIZjNylhlXKufFysXI30cz4AaXIo6OqFKptkP6QABCJZETDzo49lIBcDn
         cOhg==
X-Gm-Message-State: AJIora+vrsX9MiWhJJvu1MpDSVbsb8u4vKpiRcifojKe97ISLwDNWXp9
        WnpUC6P9+lVS7nFw6eRvNIhdvw==
X-Google-Smtp-Source: AGRyM1uNyTDieNyYglod7hULm/TGluwst3C+RtGk1MIeEE0gr+/XKgDr5Xn0Z802XbVUIS/v/JmC8w==
X-Received: by 2002:a2e:3606:0:b0:25d:9de6:629b with SMTP id d6-20020a2e3606000000b0025d9de6629bmr162045lja.339.1657786166289;
        Thu, 14 Jul 2022 01:09:26 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id f6-20020a0565123b0600b004785b66a9a4sm227687lfv.126.2022.07.14.01.09.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 01:09:25 -0700 (PDT)
Message-ID: <14e42eda-7eab-0570-b6c1-101722c8aa1e@linaro.org>
Date:   Thu, 14 Jul 2022 10:09:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
 <Ys85KUGnlXlUI+zE@builder.lan>
 <50ce334b-4c13-1eb3-0e6e-96c9ccee7e1d@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <50ce334b-4c13-1eb3-0e6e-96c9ccee7e1d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/07/2022 09:41, Dmitry Baryshkov wrote:
> On 14/07/2022 00:29, Bjorn Andersson wrote:
>> On Mon 20 Jun 06:07 CDT 2022, Dmitry Baryshkov wrote:
>>
>>> Add pxo/cxo clocks to the GCC device tree node.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> index 47b97daecef1..61e3ab0ebfd3 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> @@ -50,13 +50,13 @@ cpu-pmu {
>>>   	};
>>>   
>>>   	clocks {
>>> -		cxo_board {
>>> +		cxo_board: cxo_board {
>>
>> As requested by Krzysztof, please use clock-output-names to specify the
>> name of the clock, and rename the node "cxo-board-clk".
> 
> Actually I believe Krzysztof agreed (and acked) this change, as it 
> follows the example of existing boards.

Yeah, because this would be out of scope of this change. In the long
term fixing the node name would be still useful, because DTC W=2 complains.


Best regards,
Krzysztof
