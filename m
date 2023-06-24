Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 157A1EB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 09:11:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229480AbjFXJLW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 05:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229560AbjFXJLV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 05:11:21 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC9F519AB
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:11:19 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-988b204ce5fso169354166b.3
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687597878; x=1690189878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TB9IHENJDTgP3/+RgmCR40mbzefHRkoxy0VpWnLxklY=;
        b=grwUtLESlVNXp6uim+dHlAYHJFBXetSUjezL5bHBZaNCN4WHItbgPsVqVEFsjYN4Rt
         2BAB2zpWJwRo9UEqMnSqwJkUbanLf/6B1TSOZLeZ8UfKg2TvccWv5R4eHxIvn5z24DMl
         qk+juz7k5H9qq5p8oUhdEvxEClDedMtrUTeu1djwzyeMCx2QWE5ZyGXJqSF4iB+D7sFM
         IorPe6SpPqO7N3InbG456FHlrS70BkvkEJqIrsMdwpNPXQoILbm6jRlrMgiKN3OppCZC
         39cqq4zhyC9Ea/FvFTODLTojMQmM0Ft5CoePsTengl0SjhapGJAjF1w5j8Ao5uvmcgWP
         gmGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687597878; x=1690189878;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TB9IHENJDTgP3/+RgmCR40mbzefHRkoxy0VpWnLxklY=;
        b=ftzg8ulCzWPsOmv9reEuYH85rQoP43CRS/frd2yfUY1hjcEOeZhCETEq7cr+B+1lGs
         rmXwN8f/bhGjQUVjLtTQG1s2Vbx1oSMs8tI8mtDM8yroHkx+mVtq8QWs4ZqAULrqKUHf
         uhCXDBTJk4lSDxOPKOOhY3D/r/9UMeKO6tna4XcsDS50l/8D4yfhwLdukxCE1sYmRwAJ
         0DkVauIi5wD1JOOTbgmA1ecQBbq8d4v8yaV6yZZaM+zV1fvoe3s/jWbSA3ImpJ1Vpw02
         8fDEhNgT96QYstURvRWsPjPvGesgmFQT6I5wmTk9rzYPUD9rSOcRQGlX1OY9YEKCgVbo
         ggZA==
X-Gm-Message-State: AC+VfDxSuLSqJbQLsmMivowRrdHw03S+EUvvVQfrDaMQUFk8jdGPXGaX
        o+vi3Kz4I3h1VEV0M8loS3l4Sw==
X-Google-Smtp-Source: ACHHUZ4TP0Vdg3BKzhJVTx8ptKa5/v9jsxLjJ+4KkREwbvl+gOjJuEvoSK1K+Qjdqw+DMfHimDsPFQ==
X-Received: by 2002:a17:907:7293:b0:988:84e8:747c with SMTP id dt19-20020a170907729300b0098884e8747cmr15007406ejc.32.1687597877906;
        Sat, 24 Jun 2023 02:11:17 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id u10-20020a056402064a00b00514b3dd8638sm455576edx.67.2023.06.24.02.11.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:11:17 -0700 (PDT)
Message-ID: <f880e10e-080e-4c80-4faa-fc2c0e62f260@linaro.org>
Date:   Sat, 24 Jun 2023 11:11:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 05/15] dt-bindings: display/msm: dsi-controller-main:
 Document SM6125
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
 <20230624-sm6125-dpu-v1-5-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-5-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document general compatibility of the DSI controller on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
>  1 file changed, 2 insertions(+)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

