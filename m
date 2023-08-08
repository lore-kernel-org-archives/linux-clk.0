Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 408A3C001DB
	for <linux-clk@archiver.kernel.org>; Tue,  8 Aug 2023 18:19:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235610AbjHHSTY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Aug 2023 14:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234541AbjHHSTE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Aug 2023 14:19:04 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AE4885292
        for <linux-clk@vger.kernel.org>; Tue,  8 Aug 2023 10:26:52 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-99bcfe28909so815545766b.3
        for <linux-clk@vger.kernel.org>; Tue, 08 Aug 2023 10:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691515610; x=1692120410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UyS/L7dLf5HA1aT+dxr0rfvSOnR4w8+8xr/m/2kmCIY=;
        b=RrY0yBArpEwf2RwAxgi6Xe8/poyE4eqsm9DHfY1+83yiAIrRsu5ymPqBDK+Nz255GZ
         lfMJpd/f8TcK3NnDWAxYup5O2G3dHWIdMjQanf/KJcHA9WWi0zKQHHTx/HrwilER25q8
         hUbfnFC1HJXsojXBjmnA1xs2PvqU9RO6b0fH1HCe5X3JzWqhMHY7SWMJB+2+Ib0QjVYJ
         iU5xzZd6xkPMJ6oUzKJ9uR1Iq2+SCv4fY+U3uRJemyeb9hvw0xm6gUUysXCgCN73Oenb
         Wb4KOzvvIfwAj2gXnkVvNOfdHXtH5SqUepG9RL3K4nvfYevqUJT9IEQGC7s9Cdy9o5IW
         q+fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691515610; x=1692120410;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UyS/L7dLf5HA1aT+dxr0rfvSOnR4w8+8xr/m/2kmCIY=;
        b=AIu7/t4my95inKrtto1MB5SdZSZy1XcjsERPg2faTv0NuaqI2h4TZlPRVr2xbF+O7E
         FEHaddAUi4YvBaARn9EExgKHnUTqda9t42ZTlyrdTS6WZda3DSkaLkFSFgH23GIElJpn
         fDYLSxkRz54LbUVQhTq1dRXaiJdb30Dff9C2yKBCpKfIfNRL9ssZaa/2GTQ8I8yPwf85
         kFjxiPk40tjj0B0Uvla3ZTFfJqxP+9Uxj5sARO5Lo6IiDKnrbraznJHmemoVSpiDTPMw
         0NCMBVorl8osq756JoZotlMBikcxS2CmsZzRyK6bLbxgDMrzCR5XRyq35jIxIlDsynEO
         cyIQ==
X-Gm-Message-State: AOJu0Yy7soC/8x1jp7N/XPZOBecNLA4BJ57dO8AFF/fI2/M+R6vRAtVI
        14zDSB1m+IMqbtU+ubH+cOF9T+qqlP/pDV+fFEg=
X-Google-Smtp-Source: AGHT+IG5ejXw8mSfMpGS3YO2cZNr5f38aIplR/Hy2qVkoP54+cIeF0lk06XFWiAgsKDzR7RqHr3rDA==
X-Received: by 2002:a2e:904c:0:b0:2b9:4b2b:89d8 with SMTP id n12-20020a2e904c000000b002b94b2b89d8mr7661614ljg.35.1691474242601;
        Mon, 07 Aug 2023 22:57:22 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id bn10-20020a170906c0ca00b00992b0745548sm6162130ejb.152.2023.08.07.22.57.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 22:57:21 -0700 (PDT)
Message-ID: <d1172ed6-ee3b-83b6-1656-c91e35fbc2df@linaro.org>
Date:   Tue, 8 Aug 2023 07:57:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 2/3] dt-bindings: clock: add qca8386/qca8084 clock and
 reset definitions
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
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <cf9788f0-a115-5ff9-1195-f4f302551e04@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/08/2023 07:19, Jie Luo wrote:
>>> +properties:
>>> +  compatible:
>>> +    const: qcom,nsscc-qca8k
>>
>> SoC name is before IP block names. See:
>> Documentation/devicetree/bindings/arm/qcom-soc.yaml
>>
>> qca8k is not SoC specific. I don't know what you are documenting here,
>> but if this is a SoC, then follow SoC rules.
>>
>> If this is not SoC, it confuses me a bit to use GCC binding.
>>
>> Anyway, this was not tested, as pointed out by bot... Please test the
>> code before sending.
>>
>> Best regards,
>> Krzysztof
>>
> 
> Hi Krzysztof,
> 
> Thanks for the review comments.
> qca8383/qca8084 is a network chip that support switch mode and PHY mode,
> the hardware register is accessed by MDIO bus, which is not a SOC.
> 
> But it has the self-contained clock controller system, the clock 
> framework of qca8386/qca8084 is same as the GCC of ipq platform such as 
> ipq9574.

OK

> 
> would you help advise whether we can document it with the compatible
> "qcom,qca8k-nsscc"?

For example:
qcom,qca8084-nsscc

Best regards,
Krzysztof

