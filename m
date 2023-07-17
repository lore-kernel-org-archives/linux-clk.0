Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD2F0EB64DC
	for <linux-clk@archiver.kernel.org>; Mon, 17 Jul 2023 16:50:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230231AbjGQQuY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Jul 2023 12:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjGQQuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Jul 2023 12:50:24 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B35B3
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 09:50:23 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fcd615d7d6so6997309e87.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Jul 2023 09:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689612621; x=1692204621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OA9QtUTHDvXEmSCSyfC14bb0EBD3m9CHtlrpuix99a4=;
        b=EE8CG6Sv797sDpWdfp76eg092cbpOwKYvuxPGZiC0sEyBzEGvakwKBZ+sIhE3ic6j1
         mij2AAoDBW9LAlbfiXu4mJurTkYfgnFOWuxttIjNqp8Oj8XIsSE+RdXVo+j+i0aCuEVN
         PNrDbu7TFdk2UuYFT2PNSnwjflFeqItRO3WhAMk0ElRcZ75et1JAZMr/opm/wvgT2ZpE
         NTMe3H0VAXCKNAOQSMtNMWJpUiqhoEKYm+v8H3nqrdsC1AKGfPU0B6ZqrYTvibGPjlnQ
         oBjVddzzJfU5KT9g9U56Y5gYM03UlpZSIMOHIsKg+DubuSmuLGthZDHpu4rFVCjeDEwc
         khqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689612621; x=1692204621;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OA9QtUTHDvXEmSCSyfC14bb0EBD3m9CHtlrpuix99a4=;
        b=gsKwzC7OQq4yrg2urx46s3/dzz2QySTnwCJIdSf/BV+thW0qEpKPSoON0/VFFdbr7c
         wCVKXHj9WCGhFtGENlhFZuh7yWPiAB32Xuix6lSRGmkvkcACmr8TvkA74qO2zY4q72QC
         DMUlVE0zT62qIg0TctnIJsqyXWLiNVYOYb1Uj8jvFLOG5X25EOthVIXKHAvUnvTfCA40
         kJuqQpnJkiD36Lc3i8JiXCmpao/FGSf7SFKedGt6dNRrMej8I+YDJhLLsFLW5Uhxl3oH
         4dfC+epkksnvFgd2hrTqK2xCayv02Bl72r/LI06Hrx8qaF4bZ2drNbl32IbvHFZHfCZR
         hX+w==
X-Gm-Message-State: ABy/qLZRZ1Au0+1I4Xa6l9fyD+Ao1y33ChVAznWwS/p4DMOhMrKu2gGU
        +jADucszzE/a/ql+4UNahgcfqA==
X-Google-Smtp-Source: APBJJlGNzQ4o89/LEOmeUN85mKGWa1WBYa6nh8YlqrrpWkUm/nmaKlS9QbvwYyKYqhjP1FPp1uM5gg==
X-Received: by 2002:ac2:5337:0:b0:4fb:a0f5:d88d with SMTP id f23-20020ac25337000000b004fba0f5d88dmr10510893lfh.42.1689612621474;
        Mon, 17 Jul 2023 09:50:21 -0700 (PDT)
Received: from [192.168.1.101] (abyj181.neoplus.adsl.tpnet.pl. [83.9.29.181])
        by smtp.gmail.com with ESMTPSA id v10-20020ac2592a000000b004f84b36a24fsm848lfi.51.2023.07.17.09.50.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 09:50:21 -0700 (PDT)
Message-ID: <a193a4dd-0a0a-0d36-6d83-0424cd1dce80@linaro.org>
Date:   Mon, 17 Jul 2023 18:50:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 15/15] arm64: dts: qcom: sm6115: Add VDD_CX to GPU_CCC
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230717-topic-branch_aon_cleanup-v1-0-27784d27a4f4@linaro.org>
 <20230717-topic-branch_aon_cleanup-v1-15-27784d27a4f4@linaro.org>
 <ZLVsN40kYsvQm1z6@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZLVsN40kYsvQm1z6@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17.07.2023 18:28, Stephan Gerhold wrote:
> On Mon, Jul 17, 2023 at 05:19:22PM +0200, Konrad Dybcio wrote:
>> The GPU_CC block is powered by VDD_CX. Describe that.
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> index 29b5b388cd94..bfaaa1801a4d 100644
>> --- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
>> @@ -1430,6 +1430,8 @@ gpucc: clock-controller@5990000 {
>>  			clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>,
>>  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
>>  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
>> +			power-domains = <&rpmpd SM6115_VDDCX>;
>> +			required-opps = <&rpmpd_opp_low_svs>;
> 
> Where is this required-opp coming from? The clocks in gpucc seem to have
> different voltage requirements depending on the rates, but we usually
> handle that in the OPP tables of the consumer.
The only lower levels defined for this SoC are VDD_MIN and VDD_RET,
but quite obviously the GPU won't work then

Konrad
> 
> Thanks,
> Stephan
