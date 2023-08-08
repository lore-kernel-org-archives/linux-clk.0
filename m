Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FA9CC04FE1
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 17:32:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232593AbjHHRcn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 13:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234102AbjHHRbu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 13:31:50 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E107A95
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 09:13:48 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fe2d152f62so9689509e87.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 09:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691511199; x=1692115999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wkxbaJE1w03H/idk1NWqMQgLO1L7biBsn5GEkh/lQVQ=;
        b=Dne17JMqdsxmlwJoCh1Kt0B7cxPEHV41ZVaWU9QMnMc2d4JKCzdG1+2muatj5vRo9E
         GXZb1PGSk8Vs/T05Mf7JbnaVKzbCVNFc6ioqBwDqNKgA84OCDbMnHGaWToDn6LhWI1OM
         V4c6Ic57wTRz/5tvVhTbIF9zEqbApX1fD+yeI/AJWegOPsS37r6Xzp2VVyF80LrGvzh8
         LNwltCPNZY0AhrHgGjJasLtsRsFatS1a9HnD5FmJVLCzEM7G9iHlJxmKKSm3SycSFqM5
         Mfb91NXcxdsjdKWVD7GWhD6bIuQql1TDPPbcEP7yaj27b3JViLQ1XHZUGThQrGggb8cY
         7+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691511199; x=1692115999;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wkxbaJE1w03H/idk1NWqMQgLO1L7biBsn5GEkh/lQVQ=;
        b=aYy2bUKd1M0DlHnU00+gl3qou2ba2j0QItk3NZdXfgPgPOzTb/qK++m49u/M/3TzH+
         4sNNQ1Y+HeVyZ9Rns3vx/XYzACOrUjcRpkFtb5mqrvzBuVz86o7QUxB7/x3luCTkWcYZ
         dlmvpBiZsbGTr7FuXz/f6Z0B4VKl63mVP2KxkLQEz339tiQCHf10nsE/Wd+N+okoCtec
         g7wPzSMfQd3eUBQw+VnJ4/dGdNLIyD63raTh67H023tRog83Ko8W/PV8iaB0tbcjR/0d
         rXnu6tZrN0eFJXcnj3C+/bkJ0EDRfBIbfSjdJ9h86nFAd1bpolcVIjT4sEnLl5yhEwfl
         chOg==
X-Gm-Message-State: AOJu0YxaKPdWcwjeoiaQeoi4dkggcHKp0jr5DB/hjTKoB06EM0e5KsRH
        Wf/r0Wm/oq7QIC3OvH9RzOfMKky3M79OZSvYcsA=
X-Google-Smtp-Source: AGHT+IGd2EkYnVmcbGVqenoYmJMzDW0/GB/8EFYGT8j/Y3vIO8hIfyRd/OSu9mbr2kbuJOvTwsbF3g==
X-Received: by 2002:a17:906:cc0f:b0:99b:d440:bf0b with SMTP id ml15-20020a170906cc0f00b0099bd440bf0bmr8097863ejb.67.1691477192381;
        Mon, 07 Aug 2023 23:46:32 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id c24-20020a170906155800b00993004239a4sm6147808ejd.215.2023.08.07.23.46.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 23:46:31 -0700 (PDT)
Message-ID: <1f20d778-cdae-d6d9-ac86-744dd45176d3@linaro.org>
Date:   Tue, 8 Aug 2023 08:46:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: clock: add qca8386/qca8084 clock and
 reset definitions
Content-Language: en-US
To:     Jie Luo <quic_luoj@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        p.zabel@pengutronix.de
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_srichara@quicinc.com
References: <20230801085352.22873-1-quic_luoj@quicinc.com>
 <20230801085352.22873-3-quic_luoj@quicinc.com>
 <ef996a7e-6eba-4366-c3ea-0d08f2768e98@linaro.org>
 <cf9788f0-a115-5ff9-1195-f4f302551e04@quicinc.com>
 <d1172ed6-ee3b-83b6-1656-c91e35fbc2df@linaro.org>
 <f25e1043-6dfa-2dcc-2948-88025f4881d8@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f25e1043-6dfa-2dcc-2948-88025f4881d8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2023 08:31, Jie Luo wrote:
> 
> 
> On 8/8/2023 1:57 PM, Krzysztof Kozlowski wrote:
>> On 08/08/2023 07:19, Jie Luo wrote:
>>>>> +properties:
>>>>> +  compatible:
>>>>> +    const: qcom,nsscc-qca8k
>>>>
>>>> SoC name is before IP block names. See:
>>>> Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>>>
>>>> qca8k is not SoC specific. I don't know what you are documenting here,
>>>> but if this is a SoC, then follow SoC rules.
>>>>
>>>> If this is not SoC, it confuses me a bit to use GCC binding.
>>>>
>>>> Anyway, this was not tested, as pointed out by bot... Please test the
>>>> code before sending.
>>>>
>>>> Best regards,
>>>> Krzysztof
>>>>
>>>
>>> Hi Krzysztof,
>>>
>>> Thanks for the review comments.
>>> qca8383/qca8084 is a network chip that support switch mode and PHY mode,
>>> the hardware register is accessed by MDIO bus, which is not a SOC.
>>>
>>> But it has the self-contained clock controller system, the clock
>>> framework of qca8386/qca8084 is same as the GCC of ipq platform such as
>>> ipq9574.
>>
>> OK
>>
>>>
>>> would you help advise whether we can document it with the compatible
>>> "qcom,qca8k-nsscc"?
>>
>> For example:
>> qcom,qca8084-nsscc
>>
>> Best regards,
>> Krzysztof
>>
> Thanks Krzysztof for the suggestion.
> 
> i will document the compatible below.
> "qcom,qca8084-nsscc" for the PHY mode of device.
> "qcom,qca8386-nsscc" for the switch mode of device.

The clocks seem to be exactly the same for both, so use only one
compatible in the driver (the fallback) and oneOf in the bindings like:

https://elixir.bootlin.com/linux/v6.3-rc6/source/Documentation/devicetree/bindings/sound/nvidia,tegra210-ope.yaml#L31

Best regards,
Krzysztof

