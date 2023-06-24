Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA8BAEB64DD
	for <linux-clk@archiver.kernel.org>; Sat, 24 Jun 2023 09:08:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbjFXJIi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Jun 2023 05:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230432AbjFXJIg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Jun 2023 05:08:36 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CB510F5
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:08:35 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-98bcc533490so167490866b.0
        for <linux-clk@vger.kernel.org>; Sat, 24 Jun 2023 02:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687597714; x=1690189714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n6JzkVRa8sMgqt4wOZNLb6V0TofrH1Kd7ev3kFxK2xc=;
        b=Rh8pbD9W2/mmo4vpLwjYYWuICUk4g/xZiRykDWLdyyaNcYKkKFf6TC+hX59iPXhc7M
         m5Mx927JbOZZSiDpI0jqZut6z0twtjvDu7+/APy5ALdjHKtkEAIoCzGHIdh/guaCxSMC
         oPyZzW50fzbPIvzCUsmNlennD/6einpbBEDAudDYS6TPzm64u0db39jTTys5sUcDD/mL
         TMGtGLgXaWbg3nboMjSS3FlLmT+dOSZrJUQvoW9EBQ4gC9m84otAZv1cC9I3IsPux4xg
         Df8l8aR7Xz/s+tGAQMybg4+gRuO04k+gHoMl4TRnFb3c/JGOIJkgQSTQtfEuQo5+Z0bZ
         xLVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687597714; x=1690189714;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n6JzkVRa8sMgqt4wOZNLb6V0TofrH1Kd7ev3kFxK2xc=;
        b=hV26mBCon88TQPav2nRF+bpHoqgvYOq+3cefDbSh6qUeDMyrhzTIpGwnVcYy6lal7n
         oDeGLd48iw3RYYE9PaiNeRSzFCHoqMGMC8cYK5Gvgo2JIb++JKGIi2AL1NH90QVs3omw
         hIadjDrJUMwffHYEyT6MikxR7spcjp7FO0pOH9YpP7fgjvWBzac96qYsT+zZ0/vYe/K8
         NZ1aRt+Q+vbPg9QNjbhQ7QMmb0ICw7K4kpz3JzFS/W0Y7FYhEfX1EImcfO6wuyaJGeo2
         RUJQbOsJf5TSBTChtcazaW15RU/Qt6FtO0qv1UfZcnVEk/WuIxREe6mDhMZvTpEU+hiq
         E2JQ==
X-Gm-Message-State: AC+VfDxFS1Qu0cmh+uVIk6o40nkw9vcSyo5UntqOEzU1n+0Ty75XHK5w
        Xfhfi2h7ikRHFz2PeZQDFCZcmw==
X-Google-Smtp-Source: ACHHUZ6WDJEt8kVafAtj06USOxNi1vO5kwV8GgXL8AtGVdivZUyr0N1GgeF04ko574WKyptwyPK0cA==
X-Received: by 2002:a17:907:a408:b0:98d:3ae:b683 with SMTP id sg8-20020a170907a40800b0098d03aeb683mr6395204ejc.19.1687597713874;
        Sat, 24 Jun 2023 02:08:33 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id gv18-20020a170906f11200b0098e0a937a6asm108250ejb.69.2023.06.24.02.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Jun 2023 02:08:33 -0700 (PDT)
Message-ID: <1d782241-f0ef-848b-9b42-a8a6234bbfae@linaro.org>
Date:   Sat, 24 Jun 2023 11:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 02/15] dt-bindings: clock: qcom,dispcc-sm6125: Remove
 unused GCC_DISP_AHB_CLK
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
 <20230624-sm6125-dpu-v1-2-1d5a638cebf2@somainline.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-2-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 02:41, Marijn Suijten wrote:
> The downsteam driver for dispcc only ever gets and puts this clock
> without ever using it in the clocktree; this unnecessary workaround was
> never ported to mainline, hence the driver doesn't consume this clock
> and shouldn't be required by the bindings.
> 
> Fixes: 8397c9c0c26b ("dt-bindings: clock: add QCOM SM6125 display clock bindings")
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---

In perfect would we would like to know whether hardware needs this clock
enabled/controlled, not whether some driver needs it. I understand
though that with lack of proper docs we rely on drivers, so:

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

