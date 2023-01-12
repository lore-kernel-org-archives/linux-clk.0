Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AD90C54EBD
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 15:51:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240546AbjALPvc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 10:51:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232316AbjALPvI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 10:51:08 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98B286B5C4
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:40:04 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id b3so29011473lfv.2
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 07:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cr1Vb7XnTgf4fs3HVo5BDDjci9DqVFe2hWS5y4jRr2A=;
        b=XNvOiJZ2eRkpR9J3VDIeYG8XTKeidPcLs7FuW8DCfsLWIX6ArduaZiqfmE4+XucSTy
         mGLJzUysm8WoYA7BUUVXkk3m4dnxAv13+12Va6XievsjxKSP3XpRvjra6SdGdvSHBK1X
         Lwgf+el73+6DozOxf4hEKmaUuvbIPNSR19on6tAPxzv3/NkwyhaGrWh3Twg7CXCldBmc
         MfaGPXepasaFrfxGFUzUYp9CC658vwMJOvv8yM/WtQ3yT28OeGsSbro+OLOCujJ24l/x
         kJlJnKz2RL6EJ0SttzZr9s4RuZ+6C1XZjXlJNDe9+/QiSFE2g7yjVAg0nB+ShGKbL1Db
         MVYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cr1Vb7XnTgf4fs3HVo5BDDjci9DqVFe2hWS5y4jRr2A=;
        b=IKHgsoPnRb/bwBOAyv9DmDNJ2CuCdKvi5JmlhJm6/BmNcfGnFgq8LmUS4lVb/SK5mM
         MaagEGson21f8pvBJwAUds1BZutQCSBtqAnP7Kz2GR/AHIP1ZOYEedE9QF9q9TowzvLC
         YBOHokqtrkNZM8H2fl3Dskr4lqzVNwVxlwAlK+fbyJAK0lmxK+N2oEHmlzUPyuAlJqlY
         VJytQXMgNJGu5PSyySXWI0ReDbAdLSv+HSl48JPtmLFai4/kNNU6Ip6v1+5GpitW1fYK
         VAxhiYnmgpsSzg1Gv60xlxyQ+Hl9ZuNnTQz7PQ1YxxoCznltuWYL87tdh7vW+DVX1ksD
         +JlQ==
X-Gm-Message-State: AFqh2kpnwcV7lCgspaAwx9Z+/b/gviKFzq06ykSUHSIuF+xAzL8VS0eq
        FsbB07lfB0yAdymm4wRmHpdhhw==
X-Google-Smtp-Source: AMrXdXufOhitOsT6TMIJd08mwU786LJ1KvuT0yyRTRrhXIYXJThrcYscaF5om7jvhVIQkmwsn4d5Lw==
X-Received: by 2002:a05:6512:6d0:b0:4b5:d:efb2 with SMTP id u16-20020a05651206d000b004b5000defb2mr24349862lff.14.1673537998546;
        Thu, 12 Jan 2023 07:39:58 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id y1-20020a0565123f0100b004cb0256116csm3326103lfa.26.2023.01.12.07.39.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 07:39:57 -0800 (PST)
Message-ID: <719bfea0-0aea-fbab-3ffa-3f6c330f16d2@linaro.org>
Date:   Thu, 12 Jan 2023 16:39:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 4/5] arm64: dts: qcom: msm8996: add CBF device entry
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230111195754.2593134-1-dmitry.baryshkov@linaro.org>
 <20230111195754.2593134-5-dmitry.baryshkov@linaro.org>
 <3cd04f83-94df-931c-728a-f015ad05d876@linaro.org>
 <fdd82d5f-d66b-b297-ed28-f44e9806e020@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <fdd82d5f-d66b-b297-ed28-f44e9806e020@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 12.01.2023 16:38, Dmitry Baryshkov wrote:
> On 12/01/2023 17:05, Konrad Dybcio wrote:
>>
>>
>> On 11.01.2023 20:57, Dmitry Baryshkov wrote:
>>> Add device tree node for the CBF clock.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>   arch/arm64/boot/dts/qcom/msm8996.dtsi | 7 +++++++
>>>   1 file changed, 7 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> index 37ebd8a3b2c8..e5a638b85ffc 100644
>>> --- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
>>> @@ -3558,6 +3558,13 @@ saw3: syscon@9a10000 {
>>>               reg = <0x09a10000 0x1000>;
>>>           };
>>>   +        cbf: clock-controller@9a11000 {
>>> +            compatible = "qcom,msm8996-cbf";
>>> +            reg = <0x09a11000 0x10000>;
>>> +            clocks = <&rpmcc RPM_SMD_BB_CLK1>, <&apcs_glb>;
>> Shouldn't this be RPM_SMD_XO_A_CLK_SRC? I don't see BB_CLK
>> referenced *anywhere* downstream, other than being defined
>> in the 8996 GCC driver..
> 
> Good question. On the schematics I have the CXO input is connected to the BBCLK1 PMIC pin.
I guess it's a question of how RPM resolves this internally.. I
think I was once told that you just ask RPM nicely to turn on
the clock and everything is handled for you from there on,
so perhaps we don't need to poke at BBCLK manually if it's only
used as XO parent?

Konrad
> 
>>
>> Konrad
>>
>>> +            #clock-cells = <0>;
>>> +        };
>>> +
>>>           intc: interrupt-controller@9bc0000 {
>>>               compatible = "qcom,msm8996-gic-v3", "arm,gic-v3";
>>>               #interrupt-cells = <3>;
> 
