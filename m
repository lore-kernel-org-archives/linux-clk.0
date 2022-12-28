Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961EEC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 28 Dec 2022 20:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230239AbiL1UXW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Dec 2022 15:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230158AbiL1UXV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Dec 2022 15:23:21 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDBA1573B
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 12:23:20 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id y25so25015927lfa.9
        for <linux-clk@vger.kernel.org>; Wed, 28 Dec 2022 12:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WpKCaW3wuzKUXhWkvFOm3Ad81fixeY/4fQoaCaSrMK4=;
        b=xdxWtCxyV0uRN+WWy2jdGw1ciyJ7Vdtr4SKvZE8dgwyYDKQoqFg0eSFRZVfoQ62mp3
         5oUW0Kb1xRsWdlozt7wkuTd4XYdxJ+70zQCfervo/KFqfvpQBe59MuepBdL5gxbf6/Ys
         bsFDzUKPpiHBXXdkCScW3Y8tX5r+jKkfGBFNUl4oGaCD4R7CppKRvBQBiiZ5b5J4XjF1
         6taYmKYHBfZaJbNPTb6LZYtQvUWU/rV1MGv/liN9BUYArP9Qjm/LRJPnLLiPk8Wl+ef7
         8tyNQT2++1uwzQTFOoGwM+Zzy8AFXX6tZWBL/QZcZDyY3btBjV8Z4VFoGFftrDA8+9BG
         TGAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WpKCaW3wuzKUXhWkvFOm3Ad81fixeY/4fQoaCaSrMK4=;
        b=7NPxfWcaVW0Qxt1HoisiEVj99y5l9X8gldHLJqRj34TQloIbfmAYfo+4g8wF95eXcH
         WO5GEg9tNbVA1sVUYjVAXn/XHE18u4zWWox9mDTvw/BhzHkNnrboFm1PCTnN3OycgEr4
         Hxw4B79W+eoNs/R2n/j/AGeb5O4gOI+lNUj1KhHNCZINpvCu2K7UZk7B6PdkqPcn8+Ql
         Tzhj14hXdeO4rJ3ZY0T1Rl4giDv8f18F2LskS3i6DdePLAKl1mI0BemmQShltdpg8Zkr
         uje/rXA8okECAjN2xr/SSIkpkY3Cjm0rz88OcljpTeePkAWn8bFKz5VMibr/3ctGImQI
         tf3Q==
X-Gm-Message-State: AFqh2koT3INv5o50gASM8a/h2vKZOL5mVbqUD0CwavUGChXjDzh53STS
        9FzZsIEgHMEx1/2DMccAp8Eryg==
X-Google-Smtp-Source: AMrXdXtcG+rqV76g0AimrIZqhqVXm/gBj+9hdpMittqVzRFq7YWL5F3FWjCa7SIiArSZzfDedL+CIg==
X-Received: by 2002:a05:6512:1305:b0:4cb:e52:d1ac with SMTP id x5-20020a056512130500b004cb0e52d1acmr2498577lfu.20.1672258998655;
        Wed, 28 Dec 2022 12:23:18 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id z12-20020ac24f8c000000b004b567e1f8e5sm2784966lfs.125.2022.12.28.12.23.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Dec 2022 12:23:18 -0800 (PST)
Message-ID: <41788ef8-8bea-6a9d-d8cd-0953ba0aafad@linaro.org>
Date:   Wed, 28 Dec 2022 22:23:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [RFC PATCH 01/12] dt-bindings: clock: qcom,gcc-apq8084: define
 clocks/clock-names
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
References: <20221227013225.2847382-1-dmitry.baryshkov@linaro.org>
 <20221227013225.2847382-2-dmitry.baryshkov@linaro.org>
 <262fb9c4-c7d3-989f-c3fb-3e36da26b081@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <262fb9c4-c7d3-989f-c3fb-3e36da26b081@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/12/2022 12:30, Krzysztof Kozlowski wrote:
> On 27/12/2022 02:32, Dmitry Baryshkov wrote:
>> Define clock/clock-names properties of the GCC device node to be used
>> on APQ8084 platform.
>>
>> Note: the driver uses a single pcie_pipe clock, however most probably
>> there are two pipe clocks, one from each of PCIe QMP PHYs.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../bindings/clock/qcom,gcc-apq8084.yaml      | 43 +++++++++++++++++++
>>   1 file changed, 43 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> index 8ade176c24f4..02a856f14fbe 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8084.yaml
>> @@ -25,6 +25,30 @@ properties:
>>     compatible:
>>       const: qcom,gcc-apq8084
>>   
>> +  clocks:
>> +    items:
>> +      - description: XO source
>> +      - description: Sleep clock source
>> +      - description: UFS RX symbol 0 clock
>> +      - description: UFS RX symbol 1 clock
>> +      - description: UFS TX symbol 0 clock
>> +      - description: UFS TX symbol 1 clock
>> +      - description: SATA ASIC0 clock
>> +      - description: SATA RX clock
>> +      - description: PCIe PIPE clock
>> +
>> +  clock-names:
>> +    items:
>> +      - const: xo
>> +      - const: sleep_clk
>> +      - const: ufs_rx_symbol_0_clk_src
>> +      - const: ufs_rx_symbol_1_clk_src
>> +      - const: ufs_tx_symbol_0_clk_src
>> +      - const: ufs_tx_symbol_1_clk_src
>> +      - const: sata_asic0_clk
>> +      - const: sata_rx_clk
>> +      - const: pcie_pipe
>> +
>>   required:
>>     - compatible
>>   
>> @@ -38,5 +62,24 @@ examples:
>>           #clock-cells = <1>;
>>           #reset-cells = <1>;
>>           #power-domain-cells = <1>;
>> +
>> +        clocks = <&xo_board>,
>> +                 <&sleep_clk>,
>> +                 <&ufsphy 0>,
> 
> No IDs available yet?

No. I didn't add IDs to the UFS symbol patchset. And anyway apq8084 
seems to use different amount of UFS symbol clocks (4, while other 
platforms use just 3).

-- 
With best wishes
Dmitry

