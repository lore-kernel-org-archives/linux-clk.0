Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACCFECCA47E
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 15:59:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229745AbiFXP7c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 11:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229641AbiFXP7Z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 11:59:25 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C45752513
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 08:59:24 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id q9so3697384wrd.8
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 08:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=CKOpi0ClXGqd/rmnAcMlopcGiNa7zGgVxNOiay2qwK0=;
        b=DqTAOo5Oi4BxSjCcZ/a6cTm6P8UgpLSfeKSAfwxKJLBUNe9BZS1S7Qna7VwWVwmh6z
         lV8pSpCfFdHR8cBE4YOGAQU9yBkm/jjM3jQjlwHy1E9sRf8+PAa6T+g9ErwOjPmlIFBK
         INNcv3cLspdy/CB7M7r0Sdwy8lz3Dp5Kgmi7nGxBCIgM00vFCjfTgoTonCV2CGZacaOB
         UXCZkI6elwrqY5K2CEF9oAT/W2Y5JblAxZ8Im/R73kvYbvQ9/DRcANsRa57AU6npRoOm
         h7I2+HdjDx1sm7r4YIV11BknBVKrlBkRzDz3EAkyFBemcPEhBLmSXYhQTxchDy8blTKN
         BIMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=CKOpi0ClXGqd/rmnAcMlopcGiNa7zGgVxNOiay2qwK0=;
        b=au3qhY4LARgP77FJDlwadWZuxP7GX45pJzfWv+Xxgnu/dII4nmUYVRh5ijZICKQxrC
         JsxO4/jSO0RTVQvn8LN+nceJ84Dt/3UXDMXa5Ei2oWz9nM2XCvnL0qFEmzZSf5MlQVFu
         TOEEXqXwUM0pm8s6vbNqTPgWKDPnC+URDEfipTflaWriH7swUsHiw60TGqMFa+RgeJ6+
         AwqrrwccD4iwmktO6mmYc/ThTqMalVmg5R9goh98rUxCZnbDRpTRce67KmBK5hnje0//
         7RSuDrx55q9TlZxHEC4u4r3z5LYjibhW4flxd4BSxDhvUjOllIdtkJKtzMH+rFjyPaSF
         VcAw==
X-Gm-Message-State: AJIora8qLt7RtLXQQkUA8gbTfeEHbqp5zWLDzOnjEsEQP1oCWUFiWBU/
        ZfSzJ52BKZsqzwbEmhZ+ojSjnw==
X-Google-Smtp-Source: AGRyM1vfennQfIgzz9neI4us2LxPYyGKBmR3d0Q1LAz2l/LplrP+yIM4iIjeZ19IdWIPNIpiI6r8tQ==
X-Received: by 2002:a5d:5847:0:b0:219:b512:3be2 with SMTP id i7-20020a5d5847000000b00219b5123be2mr13873727wrf.651.1656086362677;
        Fri, 24 Jun 2022 08:59:22 -0700 (PDT)
Received: from [192.168.0.237] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id b15-20020adff90f000000b0021b90cc66a1sm2753338wrr.2.2022.06.24.08.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 08:59:22 -0700 (PDT)
Message-ID: <665cbbe8-36ec-0484-f0a4-98fc47cfc0d9@linaro.org>
Date:   Fri, 24 Jun 2022 17:59:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v1 1/4] dt-bindings: clock: qcom: add bindings for dispcc
 on SM8450
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
 <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623114737.247703-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/06/2022 13:47, Dmitry Baryshkov wrote:
> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,dispcc-sm8450.yaml    | 132 ++++++++++++++++++
>  1 file changed, 132 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,dispcc-sm8450.yaml
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
