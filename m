Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EAB5C32771
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 17:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234550AbiI1Rhu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 13:37:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234506AbiI1Rhs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 13:37:48 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F875F3720
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:37:47 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id bu25so19559805lfb.3
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 10:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=0aztqcNn6LykQdwp4m1RypEaxXnCq8fh7JDHFifhgfc=;
        b=J0xXcMdkx8qNPncfLfjbp0HUbAzXfrf+XjDuMJFwgKXV61vJxqMAgFpoh0uhvAmDc+
         6EzGFRnBnBnwxma7ril5YJq+rnPsIbdrBNQnTEVz3hMiFbBzSRY356eag73OQ7vg0EpL
         v6eeLXyDq8jQn+8aDXySuPN+1yValwFU3eCSQZydOysC7hG6j+LPLa8mYP1Lc7+Xv7kM
         4HHdsocXkJLeOfmBsE2PKh53Qo5AAU0N87+pCoLp1O3nnO269qK1gQqgNoFIB3NQDI3P
         jWXq2R4X1iN+7JJUJiitEFwgpJ5yB4Z3ngtcQzhTQmMjYRyrmk3JC84KJtmEgYXFB8EG
         hG2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=0aztqcNn6LykQdwp4m1RypEaxXnCq8fh7JDHFifhgfc=;
        b=CN8TGnA994TAmutfPxMWZZ6ZP52HOMqXb7GeQgq7pbOfr6YFEi0sLNW+EQq4ekvlqN
         Bn6WErsi5vgKy5mC6ZGgcMn9QWxc9UU1AP/jotETWzU7Os4/GXTUVi5VjQBmK+UyY13F
         L5xafu2B7ec1ne8VxmchmY3qZBDk29/RK7SIGQ6iaD0+6qrwtUNkMLQXJOM1y6XbApR/
         IPH8POjXPBiGmyAc9b0Zpc9YYOrdddbxhAEQ/VySdohZODqgqsilacBORh58k+LFUCYs
         7OK139LIEsNCPlW6RnKW6n67f6sXMOV88JOAa7f69VG7Ds8G2amcXvYmmOk8uNMa4GbD
         vFlw==
X-Gm-Message-State: ACrzQf2h2KxZsf3aaDlj25q/KdukLbxV6u/j0kq49ZsFRowmWhZhHXpv
        73rQdsUICqgZVT/KAypem4sg9A==
X-Google-Smtp-Source: AMsMyM7YsQDUPkO6r21a9nJydaJNbpzuIJVa9lJwU5R/Q1qeWKdseUnCwVPoGfsdsFQkoibE9Rx+ng==
X-Received: by 2002:a05:6512:2354:b0:49f:585c:a796 with SMTP id p20-20020a056512235400b0049f585ca796mr13070770lfu.680.1664386666008;
        Wed, 28 Sep 2022 10:37:46 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id j14-20020a05651231ce00b0047f7722b73csm528697lfe.142.2022.09.28.10.37.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 10:37:45 -0700 (PDT)
Message-ID: <fff9d3e8-a9cf-ddb4-f568-3a58622715af@linaro.org>
Date:   Wed, 28 Sep 2022 19:37:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] dt-bindings: clock: move qcom,gcc-msm8939 to
 qcom,gcc-msm8916.yaml
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
 <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/09/2022 16:56, Dmitry Baryshkov wrote:
> The MSM8939 GCC bindings are fully comptible with MSM8916, the clock
> controller requires the same parent clocks, move MSM8939 GCC compatible
> to qcom,msm8916.yaml
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,gcc-msm8916.yaml   | 11 ++++++++---
>  .../devicetree/bindings/clock/qcom,gcc-other.yaml     |  3 ---
>  2 files changed, 8 insertions(+), 6 deletions(-)


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

