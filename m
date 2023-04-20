Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B13FBC7EE25
	for <linux-clk@archiver.kernel.org>; Thu, 20 Apr 2023 09:37:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjDTJhT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Apr 2023 05:37:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234041AbjDTJgp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Apr 2023 05:36:45 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1ED585266
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 02:36:28 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2a8bb726210so3795991fa.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Apr 2023 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681983386; x=1684575386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hfsZM67OXbAlzVD+uHneuvtJvIsoB/dlohyx55svOjw=;
        b=mMrxmnCh6cK34iMsXHT6we3TE3HE2XWlq8fH3NKmU0GnJbuuDmkuKeN18CGlJCP2+G
         GkWDOm6egtzIZD4q1hutug9vMuk9ScjgB/G6l5Idnsk3aAAhgYEh3KEs8avXsCB1WwPm
         1Dy0IYNMwOZMlEDqWU2+Byj7r6VeeVqC/O9afOWGvSDQdHQfnRSIg3WkpYIDgHX4B40e
         qsyr/l/Zur5+MXYi7ubHKJq4hQ+gh/IoBjMf+qVXzvqJkYkp3lFXGdmXcI8vz165n3di
         +dZ/jID2kuWv15n82fKrgHWEEuD2yr23jpgpOyq+6V7CuG/5EK6Wp+TvyS9wCxGhITQr
         Xx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681983386; x=1684575386;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hfsZM67OXbAlzVD+uHneuvtJvIsoB/dlohyx55svOjw=;
        b=Zqcg9gAXSyNBKkSHrOUsh9LjMIdOLrIhsEPLhi50cp5Z7Aupr0YBVUw7DHcLEUeAxF
         8F/k/LVGt4ca0mBKr64dS3Kta9+Lnhfqs1EJNvzhLfVGJJCHrYtrbIg3r5bSiYCgXHEN
         NUT0yCb91LpyRlLBaACr5T7RJlLSroDICowxkHUM3HxeizHYG1Gb3URBGyXZ24C8H42T
         XfLuZNDL5pyG2orOPYx0dl6dcsaWh722qqUH1vQkcc3hRtPCDZMnyItgVL348r5isKVk
         TCcUKQoabrKBjBw+ODrXacbovDgN99R8oiq6theyB+7/AkuhPsy/kgieMPUgyJy/bjIS
         B+Tg==
X-Gm-Message-State: AAQBX9cWakPYUgHmqewlmFqNprELDddAroJU0cQPjqvN6i4zL0dHM/B+
        72K0iz7qiSCCZKzImg4uzbE0fw==
X-Google-Smtp-Source: AKy350ai9s+joKTQe7jfoz4hBNP9alfMfO6WPChONY+2B39f63l8Q02pLjKEKfzsAR5R+3/qer65/w==
X-Received: by 2002:a05:6512:481:b0:4ed:c8ba:df9e with SMTP id v1-20020a056512048100b004edc8badf9emr305180lfq.63.1681983386212;
        Thu, 20 Apr 2023 02:36:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id i20-20020ac25234000000b004eb07f5cde6sm155791lfl.297.2023.04.20.02.36.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 02:36:25 -0700 (PDT)
Message-ID: <6175f709-8c88-6ec3-4c31-cac9f2440b52@linaro.org>
Date:   Thu, 20 Apr 2023 11:36:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH RFT v2 00/14] SMD RPMCC sleep preparations
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <66c41caf-bf21-61af-c6e4-52b34b69c1ce@linaro.org>
 <ZEDwLB3RwT6mHIu4@gerhold.net>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZEDwLB3RwT6mHIu4@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 20.04.2023 09:56, Stephan Gerhold wrote:
> On Thu, Apr 20, 2023 at 03:50:16AM +0200, Konrad Dybcio wrote:
>> On 8.03.2023 22:35, Konrad Dybcio wrote:
>>> Keepalive clocks for other platforms were gathered by digging in old
>>> downstream kernels, please give them a test.
>> I have an implementation of rpmcc-within-icc ready(ish) locally. Turns out
>> some SoCs need a keepalive (19.2MHz, active-only) vote on clocks that
>> are NOT governed by interconnect.. So before we can disable clocks,
>> both will need to be implemented.. ugh... I was hoping we could avoid
>> having it in rpmcc..
>>
> 
> Can you give an example? Which clocks are affected on which SoC?
msm8998/sdm660 and PNoC

Konrad
> 
> Thanks,
> Stephan
