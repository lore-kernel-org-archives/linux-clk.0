Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0398CCA479
	for <linux-clk@archiver.kernel.org>; Mon,  4 Jul 2022 16:24:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234090AbiGDQYi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Jul 2022 12:24:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234042AbiGDQYi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Jul 2022 12:24:38 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57295625C
        for <linux-clk@vger.kernel.org>; Mon,  4 Jul 2022 09:24:36 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b23so11646571ljh.7
        for <linux-clk@vger.kernel.org>; Mon, 04 Jul 2022 09:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=Sn8r/wCwINZRFzULmvAmngogVLhKxhw5hVjfEMjh1CI=;
        b=wd/nXp18FtY7THmR0JieeF4k/kTzVljiwQfzEKZvnjBFqlfoj8Qpor3nHLR6jGrgiu
         EuI+uThVDU/PDVw+uEc5ik935VT1CwO5YBqy5zDZBtxZK2+t4oo7eqfdD97sGk6UqXgB
         KWVxyjNponQ3FOoghhBhjQhitsq6yghm9fC7U7jtzmKk0DlcjKVhdRW+sAyrKDLsV+Es
         uGIL5cOO4g/AYZiD1aaHivjC++jUcjf27VjI9q0Ttm0QfmxfnSxYJ41GW9IpdTSWhMUI
         Qj9hRZsUt6VzugaplHPVpuGdD/N99T9vNfACgYPacReUraFTB64h6zYkyQSogLimkOff
         0E5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Sn8r/wCwINZRFzULmvAmngogVLhKxhw5hVjfEMjh1CI=;
        b=8AAEkW5535JTRtzTPttdyx9vZuhvVH+/ZBi3P8H2CwGU7u2YvgxrPMdV+b6RNVdLNp
         Kca9/LGzjtJYpmrHzW8259V5DjvBZeUG8C+PIS5b+XiqQQFUVr3sSLSCWwgTha5TLQx6
         ze9cQdI+e34T4XQFhgx8OJJpCpBPK463zx/eOZ9BRZbfjfkANEh3KxRx5nCAWOou6B9p
         C9Q7DpZ2z8bkSm1cDmSGmv3w6JcgrArk6Wg+d6assl1w8J2hGo67AU3vQIA3vxgl4t3S
         vGhzSxQDF+n+FZQGWYoJmve+cxAElqrRZD1guanyOozIuPHYbCRY/0cG7PoYeF1uUCh8
         A+pA==
X-Gm-Message-State: AJIora98EtsGTcsMOUaZFDfjKtX/VO2erAkQESzcBEX9YUOOEgAzlK4y
        CNZ6ai1MWUuURP9d6N/HuB3Grg==
X-Google-Smtp-Source: AGRyM1tbdsfuiNrfGGVut59sxgcRn+0ZzEgGSzB4dwTtug7V8FQj8oHdCsIfj7VmT6QhTQahTndnDA==
X-Received: by 2002:a05:651c:154b:b0:25b:d2c4:8dd6 with SMTP id y11-20020a05651c154b00b0025bd2c48dd6mr17297808ljp.459.1656951874715;
        Mon, 04 Jul 2022 09:24:34 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k22-20020a05651c10b600b00253ceefb668sm4922401ljn.60.2022.07.04.09.24.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Jul 2022 09:24:34 -0700 (PDT)
Message-ID: <50529c07-d630-c8ec-0127-6919e27d4bd7@linaro.org>
Date:   Mon, 4 Jul 2022 19:24:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 0/7] clk: qcom: gcc-msm8916: modernize the driver
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
 <cb15fe73-2805-7776-307d-02e1b175301c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <cb15fe73-2805-7776-307d-02e1b175301c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/06/2022 15:12, Konrad Dybcio wrote:
> 
> 
> On 19.06.2022 23:27, Dmitry Baryshkov wrote:
>> Please excuse me for the spam, I've erroneously sent v2 without the
>> requested change.
>>
> Please excuse me, I didn't notice and gave you R-bs on v2 instead..

N/p, I'll pick them while sending v4.

> 
> Konrad
>> Update gcc-msm8916 driver and bindings to use DT-specified clocks
>> rather than fetching the clocks from the global clocks list.
>>
>> Changes since v2:
>>   - Use xo-board for the XO rather than RPM clock. This will be sorted
>>     out separately (requested by Stephan Gerhold).
>>
>> Changes since v1:
>>   - None.
>>
>> Dmitry Baryshkov (7):
>>    dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
>>    dt-bindings: clock: separate bindings for MSM8916 GCC device
>>    clk: qcom: gcc-msm8916: use ARRAY_SIZE instead of specifying
>>      num_parents
>>    clk: qcom: gcc-msm8916: move clock parent tables down
>>    clk: qcom: gcc-msm8916: move gcc_mss_q6_bimc_axi_clk down
>>    clk: qcom: gcc-msm8916: use parent_hws/_data instead of parent_names
>>    arm64: dts: qcom: msm8916: add clocks to the GCC device node
>>
>>   .../bindings/clock/qcom,gcc-msm8916.yaml      |   61 +
>>   .../bindings/clock/qcom,gcc-msm8976.yaml      |   21 +-
>>   .../bindings/clock/qcom,gcc-msm8994.yaml      |   21 +-
>>   .../bindings/clock/qcom,gcc-msm8996.yaml      |   25 +-
>>   .../bindings/clock/qcom,gcc-msm8998.yaml      |   25 +-
>>   .../bindings/clock/qcom,gcc-other.yaml        |    1 -
>>   .../bindings/clock/qcom,gcc-qcm2290.yaml      |   25 +-
>>   .../bindings/clock/qcom,gcc-sc7180.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sc7280.yaml       |   21 +-
>>   .../bindings/clock/qcom,gcc-sc8180x.yaml      |   25 +-
>>   .../bindings/clock/qcom,gcc-sc8280xp.yaml     |   21 +-
>>   .../bindings/clock/qcom,gcc-sdm845.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sdx55.yaml        |   21 +-
>>   .../bindings/clock/qcom,gcc-sdx65.yaml        |   21 +-
>>   .../bindings/clock/qcom,gcc-sm6115.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sm6125.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sm6350.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sm8150.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sm8250.yaml       |   25 +-
>>   .../bindings/clock/qcom,gcc-sm8350.yaml       |   21 +-
>>   .../bindings/clock/qcom,gcc-sm8450.yaml       |   21 +-
>>   arch/arm64/boot/dts/qcom/msm8916.dtsi         |   14 +
>>   drivers/clk/qcom/gcc-msm8916.c                | 1020 +++++++++--------
>>   23 files changed, 669 insertions(+), 870 deletions(-)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
>>


-- 
With best wishes
Dmitry
