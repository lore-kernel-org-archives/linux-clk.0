Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F43CC04A94
	for <linux-clk@archiver.kernel.org>; Sat, 12 Aug 2023 10:56:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237111AbjHLK4J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 12 Aug 2023 06:56:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236408AbjHLK4I (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 12 Aug 2023 06:56:08 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77CDED7
        for <linux-clk@vger.kernel.org>; Sat, 12 Aug 2023 03:56:10 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b9bee2d320so42965501fa.1
        for <linux-clk@vger.kernel.org>; Sat, 12 Aug 2023 03:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691837769; x=1692442569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsDkru9Cd+QMTZjL2vgJUI/oZABtMlJwLOLZa2FBIZQ=;
        b=EJT6/mzyqQ+CKZcR2kelRqxT0uENV3F00mPCB/UsYdG5YU0KYPHnEa/gBLovhF16Nc
         gVJ65wg7LoldMKfPbBdBd67ypgY12njXFp4x/gtlwTuLNvNxxyAxrmYaQbkXZyl/XFZM
         nH0J1se8jdOoahAnmJcM9Ky2Wuf2dNoF1z0iaeaPX+cnFRcEE5q4dEE+faXrAwKDCM6m
         xIQ4hSNM2JZaw4NSmmr2tk0SbwKIs+P8Zj2ts+WHNqC5at629LYK3um1y5bz8kLw0olO
         PazfDJDwywrYCtXVYMDc3MEi3ZREqx0NU47ykbN/dheL3CWEBD42yU8bMci99GBRAjIp
         0iFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691837769; x=1692442569;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsDkru9Cd+QMTZjL2vgJUI/oZABtMlJwLOLZa2FBIZQ=;
        b=VIDgQUSzBDbMpYMPa0diCcY/QM6laSj07k3R9Qy2IjQWZPKKm/cWo6JpRYksPUXq54
         vWOQd6CyBUUUe1cXwNsk+rVkzy2pkR/e/NJi12/3pel6cMlxOzIE1mSCrTWOwqus9p5U
         yS7RcP2lwC0fqRJRXuzwplsGxEWtNDNw6PGyIAo0pReqGDtt9yDvtsdVctA5I2gHPfw1
         ztyhgJgv4BpbG/RF56OX6nP5rZoS0QDTYuVa/wWgiRoDwNIMxj7r8SOMqt1CxZaElI2Q
         njAVkPekBiu7CRL3Yt+vAmxR+qGjSwEjRYS1mZQWXCk5NvfMczW2KBUFgU8sSAqYW3s+
         MApg==
X-Gm-Message-State: AOJu0Ywjhj69Rez3zwEiC0RjfzmMs5HXE5wvWmoTEnSDzswmqay1CiCN
        NqJ3qGVCZpgtzdT992PGrHJeZA==
X-Google-Smtp-Source: AGHT+IHaRMtZA8KV8vXFuM5ViYSywNipf5JO30re//r254mA78KVIzZ+yN58RLe7xg8AazfEEXYGuA==
X-Received: by 2002:a2e:7412:0:b0:2b9:4418:b46e with SMTP id p18-20020a2e7412000000b002b94418b46emr3127642ljc.21.1691837768724;
        Sat, 12 Aug 2023 03:56:08 -0700 (PDT)
Received: from [192.168.1.101] (abyj188.neoplus.adsl.tpnet.pl. [83.9.29.188])
        by smtp.gmail.com with ESMTPSA id j21-20020a2e8015000000b002b83dbc71c9sm1335439ljg.54.2023.08.12.03.56.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Aug 2023 03:56:08 -0700 (PDT)
Message-ID: <631d5a82-7d24-49cd-9868-74c7b3c08bcd@linaro.org>
Date:   Sat, 12 Aug 2023 12:56:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] clk: qcom: add clock controller driver for
 qca8386/qca8084
Content-Language: en-US
To:     Jie Luo <quic_luoj@quicinc.com>, andersson@kernel.org,
        agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org,
        p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230810115419.25539-1-quic_luoj@quicinc.com>
 <20230810115419.25539-4-quic_luoj@quicinc.com>
 <9dec09fa-a5a3-416c-9b4d-4b4c4e10320b@linaro.org>
 <9a55016f-0049-f185-f2be-d138fe33384b@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <9a55016f-0049-f185-f2be-d138fe33384b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11.08.2023 13:49, Jie Luo wrote:
> 
> 
> On 8/10/2023 8:59 PM, Konrad Dybcio wrote:
>> On 10.08.2023 13:54, Luo Jie wrote:
>>> Add clock & reset controller driver for qca8386/qca8084.
>>>
>>> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
>>> ---
>>
>>> +struct qcom_cc {
>>> +    struct qcom_reset_controller reset;
>>> +    struct clk_regmap **rclks;
>>> +    size_t num_rclks;
>>> +};
>> This all, including the probe func, is required because of the MDIO dance,
>> I assume?
>>
>> Commonizing that would make more sense should more clocks like this appear
>> in the future.
>>
> Hi Konrad,
> Thanks for the review.
> the structure qcom_cc is not because of MDIO dance, this is the common structure used by other qcom clock drivers such as gcc-ipq9574 in the probe function.
> 
> seems that we can't make any more commonization on this, please let me know if there is any idea on this.
My main point is, why can't you use qcom_cc_really_probe?

> 
>> [...]
>>
>>> +static struct clk_branch nss_cc_switch_core_clk = {
>>> +    .halt_reg = 0x8,
>>> +    .clkr = {
>>> +        .enable_reg = 0x8,
>>> +        .enable_mask = BIT(0),
>>> +        .hw.init = &(const struct clk_init_data) {
>>> +            .name = "nss_cc_switch_core_clk",
>>> +            .parent_hws = (const struct clk_hw *[]) {
>>> +                &nss_cc_switch_core_clk_src.clkr.hw,
>>> +            },
>>> +            .num_parents = 1,
>>> +            /* Can be disabled in PHY mode for power saving */
>> Well it clearly cannot be disabled if it has the CLK_IS_CRITICAL flag :D
>>
>> What's the "PHY mode" you're talking about?
> Yes, the clock with flag CLK_IS_CRITICAL needs to be enabled, the hardware register needs to be configured to enable it, it is disabled by default.
> 
> this clock branch is necessary for the switch mode that has switch features such routing and fdb forwarding, i will remove the CLK_IS_CRITICAL from the clock that is not needed for the PHY mode, we can enable it later when configuring it as switch mode.
> 
> As for PHY mode, the device works as only PHY device, that includes 4 PHY ports, no switch functions.
It's still not obvious at all what "phy mode" or "switch mode" are.
Are they usecases for a device based on this SoC?

Konrad
> 
>>
>>> +            .flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>>> +            .ops = &clk_branch2_mdio_ops,
>>> +        },
>>> +    },
>>> +};
>> I see a whole bunch of CRITICAL clocks.. please make sure these clocks
>> are actually necessary for Linux to know about (i.e. if we don't need
>> to call any operations on them, we might just skip registering them
>> with the driver).
>>
>> Konrad
>>
> yes, Konrad, the clocks with  CLK_IS_CRITICAL need to be enabled manually, all clocks are disabled after reset(by default).
