Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B4FC54EBC
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 15:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232251AbjAKPDy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 10:03:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236157AbjAKPDb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 10:03:31 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2066313E1E
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 07:03:27 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id bs20so15331257wrb.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 07:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gSjNh53fuTFX648VbV+cFXPXevheHMtqh9ORKZBfONQ=;
        b=f/DcrDMTm8lUsMVzMA8CVkGtWSVbYy0MBnnFulQCEoaplBnKgCmmlA6eu+TPbwNyjT
         ue/gAZSerx8XPU2+nVTkUu4idw0agYAb4x79ZlW1tVSLLQrs8vpvTilUbIZNfsZthldY
         eIM6Y7xaOEX2hd+7rd7z/FjmilAtsdhEzhPj3dqoqR4T03uAp4/IdnduAuzzdhRytJtR
         rwlBS9CJ6LoBv1+DwkLW+WTEE9ic9xtf933JMrcZGWamx4SaOABE2VoUuZNX0Gk/B7ga
         lTfXcrtwgYFiEZXW3WZVDqkRXRdusDuDKL8GPPERQg1Qah4UxEs4y7uPm/BDROgI7Em+
         Cbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gSjNh53fuTFX648VbV+cFXPXevheHMtqh9ORKZBfONQ=;
        b=r+Vz9c4QCVfJ0uR3KF2SuLe41zqNXIkc1pCSDvZBmGCU05QIg30BAyaGBXCHJbJmUI
         0Xukcal71Sx2gGkioFlmq/feyv52pwGkoUzAT7rQkI6SSGd8hfboLuodcI7A+RDyAmt0
         DFqpg9LDtH5UwVRlbe67Z7B2FvLJ15vB87AqTI+EXf4YhKRjWnqWUOoJ4N6RuezOyMkz
         DQ7BMjEb0ZoTmmjCr1gWCpmQ7EBG/pamE04+MM/KX5Xk8zxgFV8/nrVia5KnPn5rPI7H
         sWqE3b4cFq9m79MHBGXfJeDhxMqvZ7bzXvqoaGN2FaqcXUgI+pbov/MbqvbQIiXtYLtP
         7Y3Q==
X-Gm-Message-State: AFqh2koOiXOvfibuVCU3Y/Gb5kW6nYxz1W/f1ZhbTX/1vrXD6SyrA+Gw
        b9JfrK8Oom3kdSs03bc6IpAePA==
X-Google-Smtp-Source: AMrXdXtmbc+MAiHw2DNZmN5yQ7ULD99oOLR1VBGQvIju6NvR2aRocEC8S977tjFA900+RAJES1EUBQ==
X-Received: by 2002:a5d:6b87:0:b0:2bc:371a:8a1 with SMTP id n7-20020a5d6b87000000b002bc371a08a1mr7240550wrx.22.1673449405630;
        Wed, 11 Jan 2023 07:03:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id w5-20020a05600018c500b002420dba6447sm13885188wrq.59.2023.01.11.07.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jan 2023 07:03:25 -0800 (PST)
Message-ID: <24461c28-0939-bd37-a6bc-774dc70ed8ed@linaro.org>
Date:   Wed, 11 Jan 2023 16:03:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 7/7] arm64: defconfig: Enable IPQ9574 SoC base configs
Content-Language: en-US
To:     Kathiravan Thirumoorthy <quic_kathirav@quicinc.com>,
        devi priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, linus.walleij@linaro.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        shawnguo@kernel.org, arnd@arndb.de, marcel.ziswiler@toradex.com,
        dmitry.baryshkov@linaro.org, nfraprado@collabora.com,
        broonie@kernel.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_arajkuma@quicinc.com,
        quic_anusha@quicinc.com, quic_poovendh@quicinc.com
References: <20230110121316.24892-1-quic_devipriy@quicinc.com>
 <20230110121316.24892-8-quic_devipriy@quicinc.com>
 <a9dfc45a-dc7a-9e39-ccc4-a451ea165bdf@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <a9dfc45a-dc7a-9e39-ccc4-a451ea165bdf@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/01/2023 15:48, Kathiravan Thirumoorthy wrote:
> 
> On 1/10/2023 5:43 PM, devi priya wrote:
>> Enables clk & pinctrl related configs
>>
>> Co-developed-by: Anusha Rao <quic_anusha@quicinc.com>
>> Signed-off-by: Anusha Rao <quic_anusha@quicinc.com>
>> Signed-off-by: devi priya <quic_devipriy@quicinc.com>
>> ---
>>   arch/arm64/configs/defconfig | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
>> index 851e8f9be06d..e0ae0996d5ad 100644
>> --- a/arch/arm64/configs/defconfig
>> +++ b/arch/arm64/configs/defconfig
>> @@ -545,6 +545,7 @@ CONFIG_PINCTRL_IMX93=y
>>   CONFIG_PINCTRL_MSM=y
>>   CONFIG_PINCTRL_IPQ8074=y
>>   CONFIG_PINCTRL_IPQ6018=y
>> +CONFIG_PINCTRL_IPQ9574=y
> Please move this after IPQ8074, to keep it in ascending order. We can 
> move the IPQ6018 config before IPQ8074.

This must match savedefconfig order, not alphabetical.

Best regards,
Krzysztof

