Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEBDEB64DC
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 09:10:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232831AbjFXJKU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 05:10:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231715AbjFXJKT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 05:10:19 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 43ECA1BC1
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:10:18 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-98e011f45ffso15643466b.3
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687597816; x=1690189816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
        b=jc1Auh5tqvnIULQo0SinoF4pptEI9CJAL3uA1jKLnlNGiTWufhWrhahGAE+h32L1xx
         hCwdO7h3Vmv1b34q5rAjJbBMrkdAJ8jeyZmjvO+/pFLJkS4CYb8abNyKpQxPGX5ienRW
         PIJMAwGBAxWfsdY4eyp40JyXmD5mVqTuA7AjloZ2sTj1+fTYOyn35xzG2+XOl0lDTdlS
         QPyfGp/MBw3L4SDMqlLRDP9AJH7so7ie6Vil1QYZyTe6pApxQk8F1CZiR60hS7V1esSW
         za+FT3/7dbx3jXeTCm+xsyV8y0gAot6PpCd97/OoF2RdV9kXALgQsFE8fatD+p/d2bEU
         4+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687597816; x=1690189816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
        b=K8LTBkH3ypkIR370oRyOpvhYXdovbHE0NuIu61Wu3+47UMlW62LlUgrm1kGPooEz7A
         1qkt9PNsajXl0RMc3ftXZlmB1YvA7ZbPMeLACE94esDScLZJqqkh+wa/FiShPuFptKKj
         YhnMI7uWHYILiitr2kzFBdkPtWlirGS5eC6SQSoDqnRpusqMhHPjOQKiVGlJi1G5YFhW
         2GIiUXClIx/GZtXTXrQxslCBug1Ypo7reCv2Zqto52JXzclnAaM2GkafXCdRkSCOSuqA
         IwsVBmIdZQfpIcNcPQox3c3Muk+783zrjDjkhEsfUxqZXLBPFhMnsTHk6lUZvaKGmjUq
         qoDA==
X-Gm-Message-State: AC+VfDznejGrMkGJkti58kzwTN02z2UJSQ3CfKH/Y4sh6WpICfDSEUuC
        WBE2JFVoohWWkHwstfS6U+hmJw==
X-Google-Smtp-Source: ACHHUZ4pqNge7JwaJVBPQcyWNxciyTTsdI3G9ALVxmbefnkvykz7tn8SBKrUteVDofWtt9OCuMQg/g==
X-Received: by 2002:a17:907:7628:b0:98e:a54:42e3 with SMTP id jy8-20020a170907762800b0098e0a5442e3mr173662ejc.54.1687597816650;
        Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id n3-20020aa7db43000000b0051a4361f3efsm455606edt.61.2023.06.24.02.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Message-ID: <0aefd7ef-a877-2501-1db9-d2c14c6ffdb8@linaro.org>
Date:   Sat, 24 Jun 2023 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/15] dt-bindings: clock: qcom,dispcc-sm6125: Allow
 power-domains property
Content-Language: en-US
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
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>
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
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> On SM6125 the dispcc block is gated behind VDDCX: allow this domain to
> be configured.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 5 +++++
>  1 file changed, 5 insertions(+)



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

