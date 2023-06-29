Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA00BEB64DD
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jun 2023 10:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231204AbjF2KwF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jun 2023 06:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232050AbjF2Kv2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jun 2023 06:51:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 992EC35A3
        for <linux-clk@vger.kernel.org>; Thu, 29 Jun 2023 03:50:40 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4fb7b2e3dacso835769e87.0
        for <linux-clk@vger.kernel.org>; Thu, 29 Jun 2023 03:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688035839; x=1690627839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=guJGAnCCFO9fo+Q+lePAT4AatbNAwA3TFffGx0GvU2g=;
        b=FeYShU0DV1r0J9WSZmSnq9d2EoVzRoh5p49t+fWb/LGP8ECl+Gy3WSNWdZtVUJHBQv
         zqvtPfCyWiu7RTS6UJyBI4599ar9DmtwSdu/7fh/Vjtucc2wp5m5eXsuNeE5WuX1CAkp
         Ayx2t3b56TRAucWstatE2y1GNO2zkjRXci5Zb3ts9pP9lbOr+CgDBRCOkg5Jto9t9f30
         ftp5lkYdIuSlxkZLePjjCDcrrCm3LOSHoT46eKUjr+fpJfk1aIL33uCMTgNrWd3D1Kye
         jNWN84Kg2J44iAJuyMeLJenjkPuPXNv8JiBsCHnxwWciS/nIa3Db2EawhD3a8rQaStyv
         jx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688035839; x=1690627839;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=guJGAnCCFO9fo+Q+lePAT4AatbNAwA3TFffGx0GvU2g=;
        b=J8wIq7qn/rDnrtBI5uJe+4Gvxo/XEM+jM/plLwj8YzQxMaja8SuOa6/Oo7j53ni5Hg
         hqohm+z4beyyxVUyKNgO7bDkckH0EQ50LGKV3fD3Bks+5ZH7ySjqpQnkN3VbaYh+o/XC
         JwblmbUSGu5A/wllv32C0jlRWKtmf5JSNNAk8jc0DLLu71QQKiY0s4+hlcVifnt4gJMs
         OsDmqZBrpKHCqB3Pklkg+lEyqDWQtKzLzmsvp4rvbr0jDQMacj4OPP9pyxlvIO14w+Ed
         T322JvZca/HuwWGTxzlnDB4MqxQiX8Nuc+wU4ThTNsKAm6BjkDd7r0JCtUtnMDnGWVU1
         /qwg==
X-Gm-Message-State: AC+VfDwj9xUO9QsGY1RFh1EFBusN9/uMmfRVkdRrHg9JFI2/reZ+5OTU
        yoaSr72cg1E3q4Gq8t5+MLpfuw==
X-Google-Smtp-Source: ACHHUZ5r4m7KdWWjT77yGYOUnmn6vM0l13dgN6t/mdKe0fnH9Xe8pYvpvGlo4fSP5Eyx3hzgL0RLSg==
X-Received: by 2002:a05:6512:6f:b0:4fb:8987:734e with SMTP id i15-20020a056512006f00b004fb8987734emr4131316lfo.68.1688035838866;
        Thu, 29 Jun 2023 03:50:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id v15-20020ac2592f000000b004ec6252aa37sm2297812lfi.116.2023.06.29.03.50.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jun 2023 03:50:38 -0700 (PDT)
Message-ID: <0682f82e-0ca8-29c7-0ee6-e2438122bf5c@linaro.org>
Date:   Thu, 29 Jun 2023 13:50:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 05/15] dt-bindings: display/msm: dsi-controller-main:
 Document SM6125
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Loic Poulain <loic.poulain@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-5-03e430a2078c@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230627-sm6125-dpu-v2-5-03e430a2078c@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/06/2023 23:14, Marijn Suijten wrote:
> Document general compatibility of the DSI controller on SM6125.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

