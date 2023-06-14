Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 576DFEB64DC
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 22:50:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236895AbjFNWuI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 18:50:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234207AbjFNWtu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 18:49:50 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3401FCE
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 15:49:48 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b34e133f5aso14059361fa.3
        for <linux-clk@vger.kernel.org>; Wed, 14 Jun 2023 15:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686782987; x=1689374987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SLDzJSxQZskr0Cl4XkH1ZSWbdavJeb1yjH9huK60JGU=;
        b=iFNpS9TkjHbDcvpZX8+Kh6A/ZKdU0v8OccZXmYrctkpTbWirXpm74PxldYCTNEf79q
         uBI/OPJQjWU+k6qvYvOEaAuWfmX+8h2K5+mJgxmVqXlT0oWB++ZgFmSU92hg6z708TDD
         fRpAvQErMSVxFiED7s2t3lVr1jd/y3Je4i7GrLmBmqpzH5AOyvwaJX3mA+2IdMxq/+D0
         Gpz7t/6DsFpARW3dGvjihmwJUGxkuZwwYIzhzUB6USvtbyjoSzRU11XuN5QNB6VJl+SB
         t3PM0Cdbq3yAHMcMrXFucWy4yjAyPI1lvlGmKR5fJJ+PmyHvSH0US8YV+Cy0YH+PkLMh
         taOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686782987; x=1689374987;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLDzJSxQZskr0Cl4XkH1ZSWbdavJeb1yjH9huK60JGU=;
        b=duai8EVjbe800P2gjBqJyT2fqDkskgfsOdLW6tmbaUudExTD2DJH38CX1QrA91WrKy
         5Z3nRTQKMlSYDryZNkPJgQLsnVrU/wLacL0J34p3XPaJj6oLAFHlXequixjCM8+bJgRT
         nWMqbN8nP/RaSeV7+4TAm4qcV/gXU9wEMMNXpY6yKlEnbio8R+/kEffjOpc3VNOTadwu
         s9qCbqMkgQr7dcRoHnBe48LzPo0ydVMjK5ApvPkK0DmwCj/k3imey+8bZjp2cO7Xzy61
         6MyyhQmnr4U2pghIghqoavOm5zSbfNRAIJ56il/0+xsSCXeYRnNDAcNRsUr4M69BZEI4
         Owxg==
X-Gm-Message-State: AC+VfDy7qLyEFAi/SaHbo4UdPpDbwl3aHbnWmHHUXbP5uW4VqsOwiTES
        /3ivQoj6WMDA8En4AOfDHd084Q==
X-Google-Smtp-Source: ACHHUZ4+0MirKpPxCOYertoARVhJCSV5Rvf1vp9RpZH7q+j92Tud1zhaLDAPPNMsAEIXsHfR0m5mcw==
X-Received: by 2002:a2e:3305:0:b0:2af:2466:1c18 with SMTP id d5-20020a2e3305000000b002af24661c18mr7682604ljc.18.1686782986787;
        Wed, 14 Jun 2023 15:49:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id j14-20020a2e824e000000b002b1a4238c96sm2765969ljh.128.2023.06.14.15.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jun 2023 15:49:45 -0700 (PDT)
Message-ID: <e70520a9-6c97-07b3-326a-6fa80aad0d6a@linaro.org>
Date:   Thu, 15 Jun 2023 01:49:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 03/18] dt-bindings: soc: qcom: qcom,saw2: define optional
 regulator node
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>
References: <20230612053922.3284394-1-dmitry.baryshkov@linaro.org>
 <20230612053922.3284394-4-dmitry.baryshkov@linaro.org>
 <e48f6153-0485-9fb9-5fe0-145251a8b367@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e48f6153-0485-9fb9-5fe0-145251a8b367@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/06/2023 19:05, Krzysztof Kozlowski wrote:
> On 12/06/2023 07:39, Dmitry Baryshkov wrote:
>> The SAW2 device can optionally provide a voltage regulator supplying the
>> CPU core, cluster or L2 cache. Describe it in the device bindings.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   .../devicetree/bindings/soc/qcom/qcom,saw2.yaml | 17 +++++++++++++++++
>>   1 file changed, 17 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
>> index a016242367b9..b809a9cc0916 100644
>> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
>> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
>> @@ -47,6 +47,10 @@ properties:
>>         - description: Base address and size of the alias register region
>>       minItems: 1
>>   
>> +  regulator:
>> +    $ref: /schemas/regulator/regulator.yaml#
> 
> There was such property in the binding (and DTS!) but a bool. Previous
> patch silently dropped it, so re-introducing it with different type is
> confusing.

Could you please propose a better name here? saw-regulator? Or maybe 
regulator-saw? (as we might get regulator-avs at some point).

-- 
With best wishes
Dmitry

