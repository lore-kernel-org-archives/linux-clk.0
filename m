Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B0E6C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 22 Jun 2022 15:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231352AbiFVPAH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Jun 2022 11:00:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237523AbiFVPAC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Jun 2022 11:00:02 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6A8A3E0C4
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 08:00:00 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id v1so34777579ejg.13
        for <linux-clk@vger.kernel.org>; Wed, 22 Jun 2022 08:00:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4WRbj1QERW/av8psTVhlz4CLgb5wsd2uJJdprSn+O1g=;
        b=ywoEjbfFbhivBAwWa/R/EzH9PY9yDMp4YbZJueOVLsv555+LQ2EHk8LXaq1KYJRZTz
         aWNsy9DW6jJ+1/Qk9ChphBFLTnupm2CBWGrrUN/+aqNkvYvjWgSb2QKJ83C8fPNHerPc
         os8s58x1zsuP1PToF56fprTaU7Nzs1hS9prG5PgoLLwMTPOjH8kQKb/BG6WA1FESzyoe
         YlFj3/jGBKyWV4mIWsHb+4E8JogrKy/H4wZvFGLhYtB+jaiDRpZ5N7eg71ZI/7daIoi7
         PvCbv5b643Q//fIaNJpVJkMEDKVO06G9g6D+8PUvjKhEOEty4cEe17VG8+9r+nU6tuM2
         BTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4WRbj1QERW/av8psTVhlz4CLgb5wsd2uJJdprSn+O1g=;
        b=LRw2JvTOUeppBVFhuVHcNiS8g1J3sphhVnmr/AeXJyps8MXoK4B/8kWJ9uJ41dIn3+
         /QBbs8cM3Q5qps6otmcG+xSzntjlLkQm+J5c6pRuTDF82ZfVU5A+bmw4fNw2BxUX5CFN
         1iiLkIhBBUo4huUmRQK0ktxAWlT/SznrhUXeOfN3yG7wBN+kkfdEB66t3+eIOXS95ZKu
         fbq5GkWFED1hkWoonA0qHwZTaSbnNlawx2dsy7z+2anEa93IlnzVYkoIiiZuAtp9pad0
         FxvOPTrrH6nuH/CmjROx+shRaps19XoiSJGfq7Gy12cIIMfXkhKvMDH9Y/rWeePEwssI
         i+mQ==
X-Gm-Message-State: AJIora+M5g6TDFEvsuhOj8Jka8KommZlAXZODVeT2FIoqGVRxPOdMiV5
        HflGhwGHNkuRgtDjiJ6nmG9oAA==
X-Google-Smtp-Source: AGRyM1u3mPVv9tLPHuraiJXYGakA8OSJV1otrdE7dZHmWgQ8rMN06jOfUwrVjHL4Mk4I8uCfoPlhXw==
X-Received: by 2002:a17:906:2252:b0:711:d2e6:9e7e with SMTP id 18-20020a170906225200b00711d2e69e7emr3797696ejr.161.1655909999464;
        Wed, 22 Jun 2022 07:59:59 -0700 (PDT)
Received: from [192.168.0.226] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id lb13-20020a170907784d00b006fa84a0af2asm9696187ejc.16.2022.06.22.07.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jun 2022 07:59:59 -0700 (PDT)
Message-ID: <d7da5034-a2a5-71d1-5898-4a110d495638@linaro.org>
Date:   Wed, 22 Jun 2022 16:59:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 5/6] dt-bindings: clock: qcom,msm8996-apcc: Fix clocks
Content-Language: en-US
To:     Yassine Oudjana <yassine.oudjana@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220621160621.24415-1-y.oudjana@protonmail.com>
 <20220621160621.24415-6-y.oudjana@protonmail.com>
 <CAA8EJprQTiU+=ajKSWbFfbHuVxjEiybTPNez66Ob+4YZ+fXW_A@mail.gmail.com>
 <XJ8UDR.9Y06T8FUTMOH2@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <XJ8UDR.9Y06T8FUTMOH2@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/06/2022 19:28, Yassine Oudjana wrote:
> 
> On Tue, Jun 21 2022 at 20:07:50 +0300, Dmitry Baryshkov 
> <dmitry.baryshkov@linaro.org> wrote:
>> On Tue, 21 Jun 2022 at 19:07, Yassine Oudjana 
>> <yassine.oudjana@gmail.com> wrote:
>>>
>>>  From: Yassine Oudjana <y.oudjana@protonmail.com>
>>>
>>>  The clocks currently listed in clocks and clock-names are the ones
>>>  supplied by this clock controller, not the ones it consumes. Replace
>>>  them with the only clock it consumes - the on-board oscillator (XO),
>>>  and make the properties required.
>>>
>>>  Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
>>>  ---
>>>   .../bindings/clock/qcom,msm8996-apcc.yaml         | 15 
>>> +++++++--------
>>>   1 file changed, 7 insertions(+), 8 deletions(-)
>>>
>>>  diff --git 
>>> a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml 
>>> b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
>>>  index a20cb10636dd..c4971234fef8 100644
>>>  --- a/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
>>>  +++ b/Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
>>>  @@ -26,22 +26,18 @@ properties:
>>>
>>>     clocks:
>>>       items:
>>>  -      - description: Primary PLL clock for power cluster (little)
>>>  -      - description: Primary PLL clock for perf cluster (big)
>>>  -      - description: Alternate PLL clock for power cluster (little)
>>>  -      - description: Alternate PLL clock for perf cluster (big)
>>>  +      - description: XO source
>>>
>>>     clock-names:
>>>       items:
>>>  -      - const: pwrcl_pll
>>>  -      - const: perfcl_pll
>>>  -      - const: pwrcl_alt_pll
>>>  -      - const: perfcl_alt_pll
>>>  +      - const: xo
>>>
>>>   required:
>>>     - compatible
>>>     - reg
>>>     - '#clock-cells'
>>>  +  - clocks
>>>  +  - clock-names
>>
>> I think we can not list them as required, as then older DT files won't
>> pass schema validation. But I'll leave this into the hands of Rob and
>> Krzyshtof.
> 
> The old DT files that didn't have XO defined had a wrong
> compatible string to begin with (fixed in [1]), so I don't
> think it's a problem.
> 

Reasonable.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof
