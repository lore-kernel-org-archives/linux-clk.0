Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7012EC38142
	for <linux-clk@archiver.kernel.org>; Fri, 27 Jan 2023 10:21:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231428AbjA0KVM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Jan 2023 05:21:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229670AbjA0KVK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 27 Jan 2023 05:21:10 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFFD1EBC6
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 02:21:04 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so5064584wml.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Jan 2023 02:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5M8wwaIB6hTb2DPTPd13/t9PHi09rEsWJLeVtxBFkfU=;
        b=PAxQb29zuGGv5AA29BFPSf3KAUsQ3nHyP+xRhfvF4wlTZjFlRtOHf07wE8ZMIhv9cu
         jf4nlnMmKPwH8nhbJGw7qgwMbyN65/N1EPFnm2XcdZSaz2wbns20UjxAO5kw+WwJgo5U
         Jaam+M2+lX1EQ2TGy3Ar2YFaVRq9oJQ8awLb42jrhol8vaJp0yiXyxBlipNiNPJRjJyl
         A5GaIV0mecZi2notqu/t5bNq9XS1HYsbvpJJks93DaHmBjFh159zmpe7Mu5NZ2/qD0b0
         AUVG3lBormCjK1Dkba0DSUQtcWi0xVaSq1mpXxvJxrsnRZ9I8gwC0yfTUfvXLLTEP+tT
         Xr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5M8wwaIB6hTb2DPTPd13/t9PHi09rEsWJLeVtxBFkfU=;
        b=D0LD/GY5TJKlPjl5LjrCgz1NF9fMfiAgX1kp0Kv7fB0X3N908jkRtb4f2KK9M5tfPq
         81MCxqM1pEkgB4b85FMaavft70ZP8gdzaBbfaZ7t+6XIKgvP2865p5mKtOVtY4evAoe4
         3Zp1+OOOORssLOBiku1ho5b0zrUkQNeZWaIHekD1QOv7IRaPJXyomYARO/MVHgrzefIZ
         1dMNE15VNeneNeGcAEGNjkux8CNNHEq4yU/cKYYpVrAsk/GQdIkrTK2EgwJ+xy9CrIUu
         O5SE90QMW25dG7iuwlq1lIKZIo+lA/Ab2p7+r5hFsZNSFYDZUC74Vr7Ai0KKtVUQiN6L
         CHgQ==
X-Gm-Message-State: AFqh2kpJxbwCrDzFPduZacSSo4Js/fhaThjpE8NqcR0vc0qfpXBCHcwb
        /xVE/j+i7sFhKfSf4jogCOUeMg==
X-Google-Smtp-Source: AMrXdXtQgHrtT79dnJjv5rE9O7zhxmcspNgS9NhZpF3jn1szrHImeCZB/Se7RvSrAv7pSLj85FXSuA==
X-Received: by 2002:a05:600c:3b1b:b0:3da:11d7:dba3 with SMTP id m27-20020a05600c3b1b00b003da11d7dba3mr37744059wms.5.1674814863127;
        Fri, 27 Jan 2023 02:21:03 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id bh6-20020a05600c3d0600b003daffc2ecdesm7243158wmb.13.2023.01.27.02.21.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 02:21:02 -0800 (PST)
Message-ID: <8c0b2020-cca7-7b16-5bb3-a0e5eddc9709@linaro.org>
Date:   Fri, 27 Jan 2023 11:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add Qcom SM6125 GPUCC
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org
Cc:     marijn.suijten@somainline.org,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230126181335.12970-1-konrad.dybcio@linaro.org>
 <20230126181335.12970-2-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126181335.12970-2-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 26/01/2023 19:13, Konrad Dybcio wrote:
> Add device tree bindings for graphics clock controller for Qualcomm
> Technology Inc's SM6125 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
> v1 -> v2:
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

