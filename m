Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 297A2C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Oct 2022 00:52:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230507AbiJRAwH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Oct 2022 20:52:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230436AbiJRAvy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Oct 2022 20:51:54 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9398982A
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 17:51:48 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id u15so14040109oie.2
        for <linux-clk@vger.kernel.org>; Mon, 17 Oct 2022 17:51:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kali.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=++YEm2X3VpuQkbISsUK8GFhQZpmQpyZfoXHzrDKbz1o=;
        b=FVgkFmaH5sGeiw8duNFK9UsXWLj8kC1JBekA5Cj6dQZ1ludhryEMsAr6RzjdsK5HV2
         PBV3PUPaSsPwxpRgdbFMXYTgrO15rMM5PlPso9FoK6GNHKdSOFKfQFQsMmpW8r2rf+hA
         6ARbRWqT4FdIeeukuMTRCcYIm+TxyI1meXLyJP2UQZoK98htSDYda2KQ4xH/RhN+sA7q
         e/yYucYRrzQC7khDZW+2yu/va+tiiIsVYIYqmxDukkfZ6p4/a9JWrCN1raoepb2outp6
         Glts4V3KlsDCNJdp4V53rFKgio+URBj+osxPG6/Ciwr9m6F3VN9KHkfljkOrq8VklHox
         4khA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=++YEm2X3VpuQkbISsUK8GFhQZpmQpyZfoXHzrDKbz1o=;
        b=oRjUh6jRGY9Vtdoueu2mZnAo0QXdcSAD92T5YFVDsn4h1Bq5pm1nyeti35aK6VrNFq
         Ax6jhcpLQ7OUnwIxK2HV4IuMl3R9hIKwFN3AztnInfGyvwYXpDlMJkbll8LJPcwxHo0g
         6v9B5JOUxEmPuGA4caLq7GeQD2a6a8antzP3tgKruiqM44B55XO/4uMwzo/GXzHfMnQ8
         +cDj+9TGrQmT+pQOPZHiwSx+yv1c4MO+Id6fQOc21N981KkETUtzyMwQAx8MruGUdL7o
         fS3TdDO3fLUNjG+FrqZ6VkjZkJ5xt9ZqfbGOKxg3ZatK/18zoWLNNU+lwhNx2GHQ1VMa
         r8qQ==
X-Gm-Message-State: ACrzQf0K6OieSB6d7KGOcH/2FLg83Vu5jpFH4zWIpfmolkXc56EBP/Wr
        ReX5JHV8jrf0swOxnKqpxiHbAA==
X-Google-Smtp-Source: AMsMyM4CniTbhUJ1/68vEI9m58DAMK115zJlcpKJ7av3jsu3SBoMHOKICrjw9TiACHsFIxsIysePwQ==
X-Received: by 2002:a05:6808:30a4:b0:354:92c2:3978 with SMTP id bl36-20020a05680830a400b0035492c23978mr14461123oib.212.1666054307691;
        Mon, 17 Oct 2022 17:51:47 -0700 (PDT)
Received: from [192.168.11.16] (cpe-173-173-107-246.satx.res.rr.com. [173.173.107.246])
        by smtp.gmail.com with ESMTPSA id v24-20020a4ae058000000b00480ba1434a6sm3701639oos.34.2022.10.17.17.51.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Oct 2022 17:51:47 -0700 (PDT)
Message-ID: <bc96324f-c560-3baf-a771-beef6955a537@kali.org>
Date:   Mon, 17 Oct 2022 19:51:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 2/2] clk: qcom: Add SC8280XP display clock controller
Content-Language: en-US
From:   Steev Klimaszewski <steev@kali.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220926203800.16771-1-quic_bjorande@quicinc.com>
 <20220926203800.16771-3-quic_bjorande@quicinc.com>
 <a8bf3887-b4fb-1f60-14e4-998f71b84181@kali.org>
In-Reply-To: <a8bf3887-b4fb-1f60-14e4-998f71b84181@kali.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Round 2 because the patch is too long for the mailing lists, I hope it 
is okay to strip out a bit of the patch

On 10/17/22 6:09 PM, Steev Klimaszewski wrote:
> Hi Bjorn,
>
> On 9/26/22 3:38 PM, Bjorn Andersson wrote:
>> From: Bjorn Andersson <bjorn.andersson@linaro.org>
>>
>> The Qualcomm SC8280XP platform has two display clock controller
>> instances, add support for these. Duplication between the two
>> implementations is reduced by reusing any constant data between the two
>> sets of clock data.
>>
>> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
>> ---
>>
>> Changes since v1:
>> - Lowercased hex numbers
>> - Changed "DISP CC 0" in error print, to work for second dispcc as well.
>>
>>   drivers/clk/qcom/Kconfig           |    9 +
>>   drivers/clk/qcom/Makefile          |    1 +
>>   drivers/clk/qcom/dispcc-sc8280xp.c | 3218 ++++++++++++++++++++++++++++
>>   3 files changed, 3228 insertions(+)
>>   create mode 100644 drivers/clk/qcom/dispcc-sc8280xp.c
>>
Tested on Lenovo Thinkpad X13s

Tested-by: Steev Klimaszewski <steev@kali.org>

