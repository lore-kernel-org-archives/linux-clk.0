Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B9E3C43334
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 11:52:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241509AbiFTLwP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 07:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236849AbiFTLwO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 07:52:14 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C474175A3
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:52:13 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id me5so20602404ejb.2
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 04:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=pjiYiq00+pKffQK8KVZh0Qwi/MjZpnVeHRmOtDA+mME=;
        b=jOg+J0isum7Uf/uwtj5efIGxs5MptaJNpHnAGh3CTv9iRPo/Sng2RTD22nqqpTtjuC
         4WbVQyoUEednhZFWpzlqqnBd0y8Ywhg4a6dVr9yiF/0BRpYgiBxYtmsPLaRBcrha7Gm+
         OAxIRZJ1IX7obzfJCFS6VQeIUbSZuMlZUWUGvsQl1UNqJdC/ZjecBNVmfjnxvYNCxFt/
         uYDjGmS3wO+GaGJqVYl/ohIYjMI60Kh+S1GD1c4BzsgySWwmAiUCd7pHVfCplEuFrgVl
         CcbaysD0xDz/IIrxShg+mHFMQpDaj9DExdBU2YJuRPQSBgTHbDJYE0KB3aE07QO45Yg1
         qBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pjiYiq00+pKffQK8KVZh0Qwi/MjZpnVeHRmOtDA+mME=;
        b=LqDuEOQ+MtG3j3s32UkBpIbl6kpy0Y5YRDZKBABvo8Vd7zRBQeYBMLoaITae1BVynL
         BQiK3RG43L/FUA9IyEpZzwN9Pr6IptpzQVLITMB6zd/EYBPUHKwGqM7EzBqsvNC0gde7
         ceCDoqTmTYwAzWGGj3SdqIOUQeItq5GgcuyKmk9+U+Dlo6OY0Jp+xxJ3rImbKRdWzBEz
         ZS2F2RuJCTsRwR3io1aLNDCc28K42fjAiaUFMsRxk3cSMVCRjax0Iks6I5BEgKAw+xpT
         Geu2Gnod3VRzTFE8Z8D9QTuA8pelfoZZQjwJnOGZWy+RKw8aYvyPwVNs3nmur6CEPnE+
         Nh/w==
X-Gm-Message-State: AJIora9OBRq8pkAa5VsFEdMYO9ENlYpEOuLUxaJAMWrw7k1fIuxOYT+E
        Oe/mLBB8f8SUXCdCpgURKeEF0w==
X-Google-Smtp-Source: AGRyM1sZQbtILGoXdAHeknokVlLyAlaxF1ADx9hpjfcfX97km1jjoQIELxTPRCJFoDzO5RzmHVhtsA==
X-Received: by 2002:a17:906:64cb:b0:711:f686:a843 with SMTP id p11-20020a17090664cb00b00711f686a843mr21147101ejn.333.1655725931854;
        Mon, 20 Jun 2022 04:52:11 -0700 (PDT)
Received: from [192.168.0.209] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s18-20020a170906169200b006fec69a3978sm5749565ejd.207.2022.06.20.04.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jun 2022 04:52:11 -0700 (PDT)
Message-ID: <b3b37e00-e3fb-f24e-de02-5a83ca525222@linaro.org>
Date:   Mon, 20 Jun 2022 13:52:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 4/4] ARM: dts: qcom: msm8660: add pxo/cxo clocks to the
 GCC node
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220620110739.1598514-1-dmitry.baryshkov@linaro.org>
 <20220620110739.1598514-4-dmitry.baryshkov@linaro.org>
 <d80d2148-cfc2-8f48-56d5-71f4aae03cb6@linaro.org>
 <CAA8EJpqp92_SOKyU+AjckKC53pDB-i4wsrYx01BySOWNhUaJsA@mail.gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJpqp92_SOKyU+AjckKC53pDB-i4wsrYx01BySOWNhUaJsA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20/06/2022 13:25, Dmitry Baryshkov wrote:
> On Mon, 20 Jun 2022 at 14:17, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 20/06/2022 13:07, Dmitry Baryshkov wrote:
>>> Add pxo/cxo clocks to the GCC device tree node.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>> ---
>>>  arch/arm/boot/dts/qcom-msm8660.dtsi | 6 ++++--
>>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/arm/boot/dts/qcom-msm8660.dtsi b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> index 47b97daecef1..61e3ab0ebfd3 100644
>>> --- a/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> +++ b/arch/arm/boot/dts/qcom-msm8660.dtsi
>>> @@ -50,13 +50,13 @@ cpu-pmu {
>>>       };
>>>
>>>       clocks {
>>> -             cxo_board {
>>> +             cxo_board: cxo_board {
>>
>> If you touch this line, please correct the naming for node - no
>> underscores and preferred some prefix or suffix, so:
>> cxo-board-clk
>> clk-cxo-board
> 
> Unfortunately, I don't think it's possible. We are bound by backwards
> compatibility. Node name is used as a clock name. And other drivers
> might reference the clock using the name. Thus, if you check other DT
> files, we also have similar clock node names.

Hm, right, we would need clock-output-names which makes the change a bit
bigger than just adding label.

Best regards,
Krzysztof
