Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1842EC61DA4
	for <linux-clk@archiver.kernel.org>; Thu,  2 Feb 2023 20:01:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjBBUBy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Feb 2023 15:01:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230368AbjBBUBx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Feb 2023 15:01:53 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84D4751AE
        for <linux-clk@vger.kernel.org>; Thu,  2 Feb 2023 12:01:51 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id p26so9151081ejx.13
        for <linux-clk@vger.kernel.org>; Thu, 02 Feb 2023 12:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxM9HSg7LJAXbn7ENAypRMHLklYazMOh09jYix5Uw6E=;
        b=TrgOINh6q9JsQaHyOaEFAUKvJS025pXWFlHU3arvlNbLBnK3qcsGuaaMCbjbJN04ZO
         3IlOf2lr6noFQliEHbf+rC9NgB3jAok4fEfbVtF+MywGorktax/oUFYU1xpF5Zau1qmB
         8hq5h44U+elUuZzAW8XFbnpkXiY8ssOyfB4dr13WJ/qtnykslbWA66MGAzupbFzoz7K0
         CJdyB6VXLW++6J0RmyCOgXWJrSnDfUguUwDCMrVjiMZ/xIElI3SKLwY0Fxxvp7z/1b2g
         1plpTYByibYUq0+1x1yJo9bnQHj9K2HIQ7G+X0SMfqGPKuPxlrjKkNeU7vHb+r+ZpDOm
         wQrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fxM9HSg7LJAXbn7ENAypRMHLklYazMOh09jYix5Uw6E=;
        b=1NJy4kVR4+1RPFiu9Ak67HP7XkwPlq0JgzLhW9PeukwSozAhrqD+jFNMANLp+paJlp
         eZWkx8WHRBDEptbFTnLhsL5Wv5iBT/bNQNl5lYVklrqzehPl2l9jMlM+gu54qJKf29/z
         Qc0bghobJp4WdzRVxfDBlWUNJcfUARv236f5wO7h4tcyRf+ENbnhG4P59FzN7lBbddX0
         Bsg/IwcvtmHU6G87Bh/X0D2e+Vn+NoN1vEG/GEun+UdtQX4n/jz5ZziCscDNLWnVCpoA
         nsidlTKDBlr5b7dnbKt5Bp+p/suViZAMsWEWrwt4t7OEfZycPvps3tkOwc07rMjMwCwJ
         gfeQ==
X-Gm-Message-State: AO0yUKUvm6gMDHtmY3vKG95FEAFFvcwbWNKIu7LdoytET74OGy6MXFcp
        nxJoREn3Bbt/J45j81PiSgUiQw==
X-Google-Smtp-Source: AK7set9JKwd3BkoJ3sv3/meRokBhU/jYIVthMrh8D+corP149rVnlLcP+5twV+Gr3Na6gp+EK9USwA==
X-Received: by 2002:a17:906:3885:b0:877:6a03:9ad4 with SMTP id q5-20020a170906388500b008776a039ad4mr7284363ejd.56.1675368110320;
        Thu, 02 Feb 2023 12:01:50 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 1-20020a170906318100b008787134a939sm257789ejy.18.2023.02.02.12.01.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Feb 2023 12:01:49 -0800 (PST)
Message-ID: <a3b6560a-764f-203f-4926-871c814a556a@linaro.org>
Date:   Thu, 2 Feb 2023 22:01:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 4/6] dt-bindings: mailbox: qcom: add compatible for the
 IPQ5332 SoC
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Kathiravan T <quic_kathirav@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, jassisinghbrar@gmail.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230202145208.2328032-1-quic_kathirav@quicinc.com>
 <20230202145208.2328032-5-quic_kathirav@quicinc.com>
 <3a346606-576b-ab89-78f5-5bbaca729090@linaro.org>
 <8766f07e-a5d2-b59c-d130-f8cc2da64556@linaro.org>
In-Reply-To: <8766f07e-a5d2-b59c-d130-f8cc2da64556@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02/02/2023 22:00, Dmitry Baryshkov wrote:
> On 02/02/2023 17:35, Krzysztof Kozlowski wrote:
>> On 02/02/2023 15:52, Kathiravan T wrote:
>>> Add the mailbox compatible for the IPQ5332 SoC.
>>>
>>> Signed-off-by: Kathiravan T <quic_kathirav@quicinc.com>
>>> ---
>>>   .../devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml     | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git 
>>> a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>> index 943f9472ae10..8d8cd1bbe67e 100644
>>> --- 
>>> a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>> +++ 
>>> b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
>>> @@ -18,6 +18,7 @@ properties:
>>>       oneOf:
>>
>> - items:
>>      - enum:
>>          - qcom,ipq5332-apcs-apps-global
>>      - const: qcom,ipq6018-apcs-apps-global
>>
>> and drop the next patch
> 
> Is it still ok even if the two devices are not fully compatible (iow, 
> using different PLL types)?

Ignore my question, I mixed the A53 and APCS clocks.

-- 
With best wishes
Dmitry

