Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126ABC001B0
	for <linux-clk@archiver.kernel.org>; Wed,  5 Jul 2023 10:45:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232217AbjGEKp4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jul 2023 06:45:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231565AbjGEKpy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jul 2023 06:45:54 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAD691992
        for <linux-clk@vger.kernel.org>; Wed,  5 Jul 2023 03:45:40 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso10270118e87.0
        for <linux-clk@vger.kernel.org>; Wed, 05 Jul 2023 03:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688553938; x=1691145938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=afH05+mNL9NXRT0ismRmNFKD44Gsjdb+ZZXnpi2IESQ=;
        b=drJBBd1gad0btLgRml/j1/5tl/I2hFbU+EizLBQfc/kTcmEkHxBqC8h2qfcp2T58Wv
         fqPBItdsF0enfFAyKu5ok82TS4Nk6XFhJZw4QPc0nTfONc1yOWiODYz/H/EacfgN7RFY
         1OOujCiJroctwkrpbSiBO432Dn6mFyqmoYIUYMTGKLThEapJn90/a0Jk9D31z9JZgaDO
         WvVgMCDXbrradrPYgtjKsTgSFBmNXWKFNM8d0yMEw6iWSHe9Rg0J8pKcNPYaunuz6ckx
         OkB+2RM1EJPmuP8Ro4/w0U4CPsGJ4uwHEpeM/dIPaNQBy+wT3dT919/QIfHYnnu8P8Vn
         mf6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688553938; x=1691145938;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afH05+mNL9NXRT0ismRmNFKD44Gsjdb+ZZXnpi2IESQ=;
        b=FFgub/Yd6Onrrq9DZQktS7UMohRgdS8w9wQ/IZAW97SqiAnMdy2KiIfl1/LRrcHixO
         bF+IfYXUlYX0sx15Enah6TdGvO0uSXBNaa1/aMDXjWHBQTLjqWEikVcTQGaXqESQXGPV
         JpUby7Z694DTZ3Ms7IhURCdeo0Rsto+jhaMYfVikv1QbKe8fZc3jGWLxLWu5ExptLBna
         LkY3TcKWysV5gEDBfBwDJxNCKwgRksp46S+XLO1NZzKTTIcGAkF8NwsqU3lMtjYvRAQC
         OJSQygHjNW1mi5Y+zDsstKJTFpJdOspAHUZxUkGrhSeHW6WaNytXr89Mg4O/FETQwzaK
         vM3w==
X-Gm-Message-State: ABy/qLYBaNX2+4EM9XW28Dhhem72oQJIRKUR4fuD+rweh8IgiMYo4UaD
        omdAKcUJw7ogXizm2LdFp7Shmg==
X-Google-Smtp-Source: APBJJlHAO2RmWUgWBbFhvJJAWOUWj+3xKam9psNOtJ310qDSTbBHAIZCwxPkZIsJiWd10BpPCx5BBA==
X-Received: by 2002:a05:6512:3a8e:b0:4fb:8a90:396c with SMTP id q14-20020a0565123a8e00b004fb8a90396cmr13348059lfu.38.1688553938302;
        Wed, 05 Jul 2023 03:45:38 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y16-20020a197510000000b004fba5eb0a64sm2933153lfe.42.2023.07.05.03.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 03:45:37 -0700 (PDT)
Message-ID: <ae5a09e7-d008-0123-ab66-8f0806ad1c19@linaro.org>
Date:   Wed, 5 Jul 2023 12:45:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 4/7] clk: qcom: gcc-sc7180: Fix up gcc_sdcc2_apps_clk_src
Content-Language: en-US
To:     Taniya Das <quic_tdas@quicinc.com>,
        David Wronek <davidwronek@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        map220v <map220v300@gmail.com>
References: <20230704163848.169853-2-davidwronek@gmail.com>
 <20230704163848.169853-6-davidwronek@gmail.com>
 <9f06d400-be7b-6806-b055-8cc7f11db6ca@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <9f06d400-be7b-6806-b055-8cc7f11db6ca@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 5.07.2023 06:27, Taniya Das wrote:
> 
> 
> On 7/4/2023 10:01 PM, David Wronek wrote:
>> From: map220v <map220v300@gmail.com>
>>
>> Add the PARENT_ENABLE flag to prevent the clock from getting stuck at
>> boot.
>>
>> Fixes: 17269568f726 ("clk: qcom: Add Global Clock controller (GCC) driver for SC7180")
>> Signed-off-by: map220v <map220v300@gmail.com>
>> Signed-off-by: David Wronek <davidwronek@gmail.com>
>> ---
>>   drivers/clk/qcom/gcc-sc7180.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/qcom/gcc-sc7180.c b/drivers/clk/qcom/gcc-sc7180.c
>> index cef3c77564cf..49f36e1df4fa 100644
>> --- a/drivers/clk/qcom/gcc-sc7180.c
>> +++ b/drivers/clk/qcom/gcc-sc7180.c
>> @@ -651,6 +651,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>>           .name = "gcc_sdcc2_apps_clk_src",
>>           .parent_data = gcc_parent_data_5,
>>           .num_parents = ARRAY_SIZE(gcc_parent_data_5),
>> +        .flags = CLK_OPS_PARENT_ENABLE,
> 
> Could you please share what Stuck warnings are you observing?
My educated guess would be that the max frequency uses GPLL7, which
is either not enabled by default, or is shut down by unused clk
cleanup down the pipe.

Konrad
> 
>>           .ops = &clk_rcg2_floor_ops,
>>       },
>>   };
> 
