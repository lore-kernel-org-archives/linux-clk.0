Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A794BEB64DA
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 16:10:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjFZQKw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 12:10:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231387AbjFZQKu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 12:10:50 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D2D01B1
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 09:10:49 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3112c11fdc9so3000352f8f.3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 09:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687795848; x=1690387848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zqAmLl/C5FNJIhv2Xt1PuXVNbepqgpYqVZ+raKQfDgo=;
        b=Dk9D/qPMCY74SEye/8fNMTPEpEockgkVtKFNB5FpvJP6Z2NVSo47uRsb0CubNQMYKd
         WtkUlVzRm0OstEhMn04c8lGSdVBSwfWues+6SYb8jxXGnITJ/3Kys7xO1aGHt0pWGOvM
         aA8yIEBHWbJFPmP0UWx3SloZvu0U2PR48aUI4URctIkhwDtRpYz7uXYWH7BXxA+BUtGd
         daPgIncZc5uHyrG7QxHLGDzN0ePEASN4hMWadW2r8fn/QIRPCMMWwCa5uoMgc6pxaZPl
         +Eaa8YzSoZgMSGjoplFEYNvjPCOATV5BP/Pbk7lZXMiSx1VYsVB+XwniRCN8wfPc5YmI
         LzLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687795848; x=1690387848;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqAmLl/C5FNJIhv2Xt1PuXVNbepqgpYqVZ+raKQfDgo=;
        b=PPgTsfLNLtHziC4cRE6YTNB2xE7mD6/uNVP0DnP68TI9DifjjN3en1GustozyW7HRD
         GWwVPFGvAHH5cFM++I3cRykbAtbclS8NMUlV/i3r/Y7lkIKQY110az46VOe+mw8NZxfj
         M//JcbyuT0c/IrhrVrQ3FlLUS3mbJTaaSQxzX0HkF04dFiheEFEtWdv7fcGtVYe9a8t1
         jNeoQ870e7VqOFhgXe46hxtzgCiwhvIJxNIgMaSbN+NzZpeWNBY1ye/Cm14iFrOrTc6M
         3MKncuHPC3ij0fKdt6yakjeGKtMjmF4/hpjBWnEZy42/x1kU1Bd0AOVxrpQ7q5FAxBGP
         DVoA==
X-Gm-Message-State: AC+VfDwg8ACvA1kZiw+xWhj/v8GSQiDFmxcLNs1StLyxumCcnfSNEDZK
        r7RrAC5jiodGSfXiGRTa5+HEdQ==
X-Google-Smtp-Source: ACHHUZ7NhS/vlSmtNSKWHpB3xX654GhMOQ5yRJfZky0DhRpX0T7S8MJstbg9Aob3s7/xTaRbLNztbg==
X-Received: by 2002:a05:6000:118f:b0:309:4620:e155 with SMTP id g15-20020a056000118f00b003094620e155mr8838545wrx.49.1687795847749;
        Mon, 26 Jun 2023 09:10:47 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id r16-20020adfce90000000b00313f1f543b8sm3000758wrn.108.2023.06.26.09.10.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 09:10:47 -0700 (PDT)
Message-ID: <52c57cab-10cf-2e7e-2c1d-fa6506786d45@linaro.org>
Date:   Mon, 26 Jun 2023 18:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 03/15] dt-bindings: clock: qcom,dispcc-sm6125: Require GCC
 PLL0 DIV clock
Content-Language: en-US
To:     Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-3-1d5a638cebf2@somainline.org>
 <c9681bce-efa8-9b79-4bf6-837dd6a2dc12@linaro.org>
 <55b0ca89-8f2e-5383-59d4-6809e813abf8@linaro.org>
 <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <vnp263d43flny2ibt3n7fbloyi26enqrejnobogplfu5fcj6l3@s7zkxrsi2rde>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25/06/2023 21:48, Marijn Suijten wrote:
> On 2023-06-24 11:08:54, Krzysztof Kozlowski wrote:
>> On 24/06/2023 03:45, Konrad Dybcio wrote:
>>> On 24.06.2023 02:41, Marijn Suijten wrote:
>>>> The "gcc_disp_gpll0_div_clk_src" clock is consumed by the driver, will
>>>> be passed from DT, and should be required by the bindings.
>>>>
>>>> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>> Ideally, you'd stick it at the bottom of the list, as the items: order
>>> is part of the ABI
>>
>> Yes, please add them to the end. Order is fixed.
> 
> Disagreed for bindings that declare clock-names and when the driver
> adheres to it, see my reply to Konrad's message.

That's the generic rule, with some exceptions of course. Whether one
chosen driver (chosen system and chosen version of that system) adheres
or not, does not change it. Other driver behaves differently and ABI is
for everyone, not only for your specific version of Linux driver.

Follow the rule.

Best regards,
Krzysztof

