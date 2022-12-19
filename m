Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D05BBC4167B
	for <linux-clk@archiver.kernel.org>; Mon, 19 Dec 2022 09:14:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231544AbiLSJOY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Dec 2022 04:14:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231377AbiLSJN5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Dec 2022 04:13:57 -0500
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61C4DE39
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:13:55 -0800 (PST)
Received: by mail-lf1-x12a.google.com with SMTP id z26so12690992lfu.8
        for <linux-clk@vger.kernel.org>; Mon, 19 Dec 2022 01:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LUx5MYCfnj/1H50qfkuVhePLMPUMVD211tZ96Ux4Qkk=;
        b=DofmNMWGgHsV98OYuQkE+JUWgwRoAIXoeP52WsseD0nBLTqXRTQjn1VYoAkcLzL/Y4
         6R7vqOqCyqtUEHNU8CM2jJ0yMYPbNsI2wCAq170/0rtiDOrl24hfv0+D4m2GYJ5soB0X
         jE1lr79kHyFcszGiB1iFNF7Yo0x/WiQ7o9t+PaBd9mTv4zSRsYpSPmKJfG2MHMKJWgQb
         qMP1kLAMJs1X8FaGhFysiZ6XRHJ4lrV5GxJgjI/TyTNnYE3PMKUcVctEpngq/FAFQ7fC
         eM1cuN2qBR/KC6zaCp3OZw8sJyeWpeNj7Y7jQGckggi/SgORSpW5CQ3JgvSd2R7CPykR
         SVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LUx5MYCfnj/1H50qfkuVhePLMPUMVD211tZ96Ux4Qkk=;
        b=RenKis5HtoHLqYQa/yLF1BzfUlF+DtRa2pW0pWJGID/G5v6LLkWPnNp7bn7ZcWfCGN
         lRhIWjrDm2Id5fiRer+PxWhnQD/4TLi7JU/WexzaPqfxrTHie3OXbzC5kZV4TzbkBYw/
         6WgCm4JhpfStEj/OelOFHJJiT82wJLQ6/M1/vIyJZroyruyvQSnGWyjyJkqRFq2ws3gO
         IO/sUXgyrvfvGQp7KYuT8oY9ICXFgUHhEsfbQXh0pMRYEveHcJ8Dw/C0cVPNq8BBmGzB
         q2USJrHtus/aOelTuiUQjLzHYPsd8TOL+alfVht+QX5AcduPEynZmd84qlS6YVYL0mpt
         iWxQ==
X-Gm-Message-State: ANoB5pnWxrx4YadjcTDV/1dcOOVl4f+Ax66yawS9rWkae56BBYdVs+sJ
        +eAZzRwtpE3pAEQSaNNVf/MkVQ==
X-Google-Smtp-Source: AA0mqf5TYBkDMS+bjG24i/C65vIRXR7GqJJINJdikUEPOM+mTn+Z97RYzXcjrWzLcUo2K1yNlfpLpg==
X-Received: by 2002:a05:6512:2527:b0:4b6:edce:a192 with SMTP id be39-20020a056512252700b004b6edcea192mr9283232lfb.4.1671441233793;
        Mon, 19 Dec 2022 01:13:53 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id m18-20020a056512359200b004b523766c23sm1051457lfr.202.2022.12.19.01.13.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Dec 2022 01:13:53 -0800 (PST)
Message-ID: <eb1fb1a2-d31d-2a1f-39e3-0c329cbcae7b@linaro.org>
Date:   Mon, 19 Dec 2022 10:13:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 02/15] dt-bindings: clock: qcom: gcc-qcs404: switch to
 gcc.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
 <20221217001730.540502-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221217001730.540502-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/12/2022 01:17, Dmitry Baryshkov wrote:
> Now as the gcc-qcs404 gained support for GDSC and requires using
> the #power-domain-cells property, switch the qcom,gcc-qcs404.yaml schema
> to use common gcc.yaml.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

