Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B3DC77B78
	for <linux-clk@archiver.kernel.org>; Wed, 26 Apr 2023 09:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240260AbjDZJlG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 26 Apr 2023 05:41:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240208AbjDZJlD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 26 Apr 2023 05:41:03 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5B5C30FF
        for <linux-clk@vger.kernel.org>; Wed, 26 Apr 2023 02:41:01 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-2f9b9aa9d75so4330589f8f.0
        for <linux-clk@vger.kernel.org>; Wed, 26 Apr 2023 02:41:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682502060; x=1685094060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l0HlQKjtrCG4t9Laax1peHQBsnSB+6tL9WVEGAE+OOs=;
        b=Si4R0bqGw8ryba+H6HT8knchCr77SaIdAb1m/MtVBv/Fd+tICJCDpE4t+cqU09xzAK
         yLW8ykbiYvfhm5sAX+B+Pf2w/bd12eINgi1PWoHvf27VnXcP1i4+FYpfThzhZU6RpvUX
         EwE1TjjFkP1MRWyWX7ClhkveQcmsryL+UO5JOmsrVwx4jWv8gXMs9w+3QOzHdIVIIjjy
         F+h1m7GqMMBthqylt/t75oqK5Pv5fIuTO6gIpUuiD1qMF7Q5YkA0Bfb2bv5twdG0M3W6
         dvpWEZxsAVZcqj6pMGNpNEY8w6q2CihkoclGJVJKFD9YBw8iWD7vqVT1TnWiNU04xQ5X
         c5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682502060; x=1685094060;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l0HlQKjtrCG4t9Laax1peHQBsnSB+6tL9WVEGAE+OOs=;
        b=ci2O9NYRuuGK72a/MB/O94qDTNRp/ccGC7/QSoLdgddT4p/xXUxzoJH2OBfK4pYko3
         8lvf/h/o43IYcyPL0xze6FDO3sW8HsWyFLqGxkulpSe0PYr60FgbCgoUppuaeH9qW/su
         DD0PbLjN0jQtn9cElz/DJmfLLHtGMdfUAdae5Rb38L42sGUsk+I8EiaZuQ0Oz1H+Gwpp
         fmcok/B8p7V9LFFKQACwVNH937esuqq6yY7IdevFJZ4RfmGv6iD79E6rzlngT9GZwa9M
         e0k1kkhPWCF+JQ5ZpqX2vhqmtmkzbV+hBN266CuOUqhEcQ0uaElbL+LZtjJKD6O/hbPG
         5c3A==
X-Gm-Message-State: AAQBX9dC/5aPJ9oEgB8zKyiTeJi9Kw2FMrEicRc3HQAz6RytwHktSLY1
        J3WejvgtaTNxiY68NNlIHtrEhA==
X-Google-Smtp-Source: AKy350b3pW/HrOu6B4SVq8LWVFzfaVnCkwPhUMbhB9f70EUAFLTokPNEavFCe/OBiIEfyBTbB5aMfg==
X-Received: by 2002:a5d:6808:0:b0:2f5:d0f:744a with SMTP id w8-20020a5d6808000000b002f50d0f744amr14025047wru.12.1682502060232;
        Wed, 26 Apr 2023 02:41:00 -0700 (PDT)
Received: from [172.23.2.152] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id j3-20020a5d5643000000b002e4cd2ec5c7sm15255929wrw.86.2023.04.26.02.40.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 02:40:59 -0700 (PDT)
Message-ID: <3040c836-4db8-7e7b-3ed4-6d71f0496cc5@linaro.org>
Date:   Wed, 26 Apr 2023 10:40:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH RFT v2 00/14] SMD RPMCC sleep preparations
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
References: <20230303-topic-rpmcc_sleep-v2-0-ae80a325fe94@linaro.org>
 <e3bd41d8-f0c5-6756-13bf-bf29c786ab5c@linaro.org>
 <c7802799ab91eb0a0862a934d3d35879.sboyd@kernel.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <c7802799ab91eb0a0862a934d3d35879.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 4/25/23 20:35, Stephen Boyd wrote:
> Quoting Konrad Dybcio (2023-04-20 08:57:53)
>>
>>> Konrad Dybcio (11):
>>>        dt-bindings: clock: qcom,rpmcc: Add a way to enable unused clock cleanup
>>>        clk: qcom: smd-rpm_ Make __DEFINE_CLK_SMD_RPM_BRANCH_PREFIX accept flags
>>>        clk: qcom: smd-rpm: Make DEFINE_CLK_SMD_RPM_BRANCH_A accept flags
>>>        clk: qcom: smd-rpm: Make BI_TCXO_AO critical
>> Stephen, parallel to all of the discussions, would you be willing to
>> take patches 4-6 as they are? XO_A being critical is something that
>> won't hurt without the rest.
> Sure, can you resend just those in a series?

Thanks, I'll do that after Connect!


Konrad


