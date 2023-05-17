Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04459C77B7F
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 07:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230130AbjEQHm7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 03:42:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229520AbjEQHm6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 03:42:58 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8A481BF
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 00:42:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-510b6a24946so809315a12.0
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 00:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684309375; x=1686901375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yo1I/1vDP3z13Q3ZEs/apavzcdIdkXn5Cb0/YZeUq7o=;
        b=KPBs9Hn8M/SBgyu7aMwH5VXCe4uD5a/cIVb3YGTROnrt2A0gJO0+6AZ4Jo6DDNtUgj
         eSza3U8S4yvl3xHxjllNps5yNPb+pc1oiJw63OeHecJnHcqUkJq7uozkIQv2G4oZqgc+
         KbCxMse40q4TbxWJhrX9gYY1NGtmIBvBf+mdgiMBYmeSHWZVpISG0TcBmY6A2li4L4j8
         Ojbqj6HrqXWeS+nALmACoPpSuIhO0iOqqsfBWDveCelIVb+cB5WonD9LholknQMXAK++
         J1+eeE4l6v3swThylhxGtLRzPI+lOF8a1fVp8vATmyGSfKlG+hu6I0RWmoSa9hrC44mU
         sW8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309375; x=1686901375;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yo1I/1vDP3z13Q3ZEs/apavzcdIdkXn5Cb0/YZeUq7o=;
        b=OrkGwV7KVi85RH43idjsGqtiC8iUoG+dxoObmlgv0EsmQ/m+CX8L+0TzTFtvy+1q6a
         ugUMuQ0Fz1C4a5S5U566+V/9GVv2NI1glHseeKkqGVi6Rmze51wbMim6hCK8oDMkHGx6
         RGqrYsvWpmJ6OLCEA5YhVyVF0mO342y0waet1lom/xchaWubAIBhFBdTyHu+8/HZxy1C
         BbyqPh02MBGMHGGixappv95BwZEPMwN2wJcUChCW4t/hvEo5aKTAljm9EyVWjd8ALvYH
         6wUdUyVfvCnfY3+AkDyo0+jHxSI7zZ7MDG3xlcp8ZKGzD/sXLFkd/5Zgi3m4NeNJQeWr
         ORHQ==
X-Gm-Message-State: AC+VfDwCsRNq+fTNBhO8FLwSmh7FwW+ncehbu8jWRCqQypqS2rYlYHfQ
        dEubFtNdQ+sshWbddy+4GhoGPA==
X-Google-Smtp-Source: ACHHUZ5Qs9iRKS/sNuzWVap6xMTWzTWQ1o6tT4BpdUrV2MV5ZU1nHgdx0wUzTZSHIwlRIqSR9RJ/LQ==
X-Received: by 2002:a17:907:7da9:b0:966:538f:843b with SMTP id oz41-20020a1709077da900b00966538f843bmr32467875ejc.77.1684309375398;
        Wed, 17 May 2023 00:42:55 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:c9ff:4c84:dd21:568d? ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id k18-20020a17090632d200b009661f07db93sm11841022ejk.223.2023.05.17.00.42.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 May 2023 00:42:54 -0700 (PDT)
Message-ID: <10a0c64c-1b56-a1fe-0f4e-3185cce18d1c@linaro.org>
Date:   Wed, 17 May 2023 09:42:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v3 09/10] ARM: dts: qcom-mdm9615: specify clocks for the
 lcc device
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
 <20230512211727.3445575-10-dmitry.baryshkov@linaro.org>
 <0954a80d-9151-4be3-dcee-e42ddc0b5300@linaro.org>
 <52005148-c0fb-8bf8-80b8-7c1077cced17@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <52005148-c0fb-8bf8-80b8-7c1077cced17@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 19:44, Dmitry Baryshkov wrote:
> On 13/05/2023 12:20, Krzysztof Kozlowski wrote:
>> On 12/05/2023 23:17, Dmitry Baryshkov wrote:
>>> Specify clocks used by the LCC device on the MDM9615 platform.
>>>
>>> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm/boot/dts/qcom-mdm9615.dtsi | 16 +++++++++++++++-
>>>   1 file changed, 15 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-mdm9615.dtsi b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> index b40c52ddf9b4..556abe90cf5b 100644
>>> --- a/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-mdm9615.dtsi
>>> @@ -39,7 +39,7 @@ cpu-pmu {
>>>   	};
>>>   
>>>   	clocks {
>>> -		cxo_board {
>>> +		cxo_board: cxo_board {
>>
>> Maybe it is possible now to change the node name to cxo-board-clk?
> 
> This would break compatibility with the possible drivers using 
> "cxo_board" sys name. It seems this is the last platform using old 
> bindings. Let's probably settle that for 6.6 I can go and rename all 
> fixed clock nodes. Would that work for you?
> 

Yes, sure.

Best regards,
Krzysztof

