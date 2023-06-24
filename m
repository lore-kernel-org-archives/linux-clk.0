Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D784DC001B0
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 09:33:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232908AbjFXJdO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 05:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232440AbjFXJdN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 05:33:13 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDD4B170B
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:33:11 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-51d7d0dbec8so551037a12.2
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:33:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687599190; x=1690191190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tj3h2F7PrfXgiEVSgcmcva0dTAsO+LbFtvUy3HlpOUM=;
        b=ic86rBDVlYcttew4/vob85e87FNpbbw8JM1F4OZp5nVBORwXNv4q2cTt9SNVFlD9m1
         dFi33g/gLFSWKIokJ9yYgX/tAQvFqVzaGb+REdj5S1pJg8PrdKReA0WIdwbevE9qKL9X
         jTb64bNYUQw0MrC41EE0O0A9p8khOb4xXzpmJeG9HS6yk9KoACeNybd0UTWCAMTDIW+h
         KDdKphFAbVxcyXlCNtts7L78DEmH/dMSIUyCQVoipTLDJWOgGB1FLejiUR8b146FM1N8
         zQFTl5lZGymUQd3VgWk49FEUwvT7wCpqn0SQ1lMbET9C6orZAQ1dEMjK8+eDWqCcdBdD
         dvuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687599190; x=1690191190;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tj3h2F7PrfXgiEVSgcmcva0dTAsO+LbFtvUy3HlpOUM=;
        b=U7CBnPas6jGC1neN+xMtEybn3UrgXWzgd/qmyB2MpMMPOi1AyGmcNEKX07D2mvaGmJ
         2naQm0v9h2qO5T0bcQj42N5jeiYzj7JK0Q8Csw06LoWZvy12ZwT3JtNG7k4/MiUtBVZ9
         CqGilu8ZFVVxrSd2WtmD5rBsjIvapv2ypjhlNIwDMr5y6KE5gaR3LDkw6hTdU21Xw/Rv
         1Psn16Sw2EodTuBtvDnzvWG0QykS8NEMuGoOvB96Mjkhl8sFu3rnte61f0JFYLGuew3C
         g/fweNpe8kCJ7dEL1q6QEmOMGA2YGRY888uJFeDOJT9EHYcS+6baQ1SXOp2hAw2a+M09
         UHFw==
X-Gm-Message-State: AC+VfDyZNLxaRLW7nc0QDO8uFX98Cet4VNfcLoFPlZayXTvcRDVYJIdC
        Dfp2UcAG/zJSK8rFIpvdYOsWWg==
X-Google-Smtp-Source: ACHHUZ6bs/BxTDqMq4cvMfLXihVSFIJDim3qioOSXkCmAssN1V1E4/ail2H+MUzzE3JuAdSuXV/mmA==
X-Received: by 2002:aa7:d411:0:b0:51b:ece3:70d6 with SMTP id z17-20020aa7d411000000b0051bece370d6mr4079434edq.26.1687599190265;
        Sat, 24 Jun 2023 02:33:10 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b10-20020aa7c90a000000b0051bed090703sm481937edt.12.2023.06.24.02.33.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:33:09 -0700 (PDT)
Message-ID: <00cd9016-4b2d-b8b9-45da-49d1f82148a2@linaro.org>
Date:   Sat, 24 Jun 2023 11:33:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm: Document SM6125
 variant
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
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> Document availability of the 14nm DSI PHY on SM6125.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> index a43e11d3b00d..60b590f21138 100644
> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
> @@ -18,6 +18,7 @@ properties:
>        - qcom,dsi-phy-14nm
>        - qcom,dsi-phy-14nm-2290
>        - qcom,dsi-phy-14nm-660
> +      - qcom,dsi-phy-14nm-6125

If there is going to be next version:
Should be rather ordered alphanumeric, so before 660.


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

