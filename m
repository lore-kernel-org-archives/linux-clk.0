Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 630B5C6FD18
	for <linux-clk@archiver.kernel.org>; Wed, 29 Mar 2023 08:36:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229838AbjC2Igg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Mar 2023 04:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229481AbjC2Igg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Mar 2023 04:36:36 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99BE0BA
        for <linux-clk@vger.kernel.org>; Wed, 29 Mar 2023 01:36:33 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id ek18so60122451edb.6
        for <linux-clk@vger.kernel.org>; Wed, 29 Mar 2023 01:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680078992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rkqB/pSe/Uf7R42daYkgCUwin72MjNO+JZK0n3K2tQ=;
        b=czhBAIR15K3/QMgCfWoz7zsl1hUze64kkHJm0ygOWkJOgwLDqSIXSV4gszgmG5A3x6
         oEr+5tJyoat25VyQc3AK513zGyw41IDJYSlDxvA+ajgv9W/pb9hD0uNYrDXBkbHZ/u43
         88fsIsgyOGe7YfpohBRD9Rqv+FNqq/djaWDPK5QaE9hzoxh64cZCMCOyJ2HOmMQKWEaT
         pLBU5OVN4tzzRHxH0w7nxgpAqGKwO4fKpTS8SL2bY/9rPLEd+jWs7f86BNIg3T8iXcK9
         2ld0G70NJCIXM3ag3N90QIjuRd0zbmeWu8sk2QIMmW0ym7I4n2qZdxkVwXb6Sj197ZsU
         F4Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680078992;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1rkqB/pSe/Uf7R42daYkgCUwin72MjNO+JZK0n3K2tQ=;
        b=tlMT92IfqkG0ptUpdQMcCwkoqDYdAW5yrB/rksRDLoEnqf1bFOTQAxfZL3eMvdd/lS
         AaV0axoCBcTMhx5CRM9vTfSkj3JbmkofuW+DoggQ8uWQM/SriCwuP3O/NcYNwVU7/ppJ
         s97zoMHfm1QMye6BaPjnOEerVRV0sXUJrPuj+g9g9vUG0et2W5Av5r4SgBtadgH5eSWs
         WYiRavY92lVO2cgn9nHMAafR57KGI0PryInoox/4GWgCxEyAt4/iwZwdj8G6H+i5E9Wi
         sOVnGMxIyRVrLLXrP2tNAazVwV8MchsRu3zoj2YUvl9SrGZ/0mqap8lGbxfRNsXnwJ0u
         0mew==
X-Gm-Message-State: AAQBX9c4TpQL4YmRFDyyKcvYGwkDs0WeIWleTBixtr2v01WjtHgiuQBT
        gBeFjXHLri4sqet0yAxRJ/Sc7cR3FutosCzaiBB9sA==
X-Google-Smtp-Source: AKy350aLnZoE3VH5F+C9qZoroickOae9EztGyVhx2T4moZpvdDOO2NmhS3zjPSDiQb1l+vkSWljpNA==
X-Received: by 2002:ac2:5966:0:b0:4e9:d85d:9032 with SMTP id h6-20020ac25966000000b004e9d85d9032mr5581749lfp.54.1680078679782;
        Wed, 29 Mar 2023 01:31:19 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x6-20020a2e7c06000000b002a5f91380e2sm1030479ljc.84.2023.03.29.01.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Mar 2023 01:31:19 -0700 (PDT)
Message-ID: <14688a5c-c50a-4876-e7b7-565b106b431a@linaro.org>
Date:   Wed, 29 Mar 2023 10:31:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 4/7] dt-bindings: iommu: arm,smmu: enable clocks for
 sa8775p
Content-Language: en-US
To:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
References: <20230328193632.226095-1-brgl@bgdev.pl>
 <20230328193632.226095-5-brgl@bgdev.pl>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328193632.226095-5-brgl@bgdev.pl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/03/2023 21:36, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The KGSL iommu will require the clocks property to be set. Enable it for
> sa8775p in the bindings.
> 
> Cc: Will Deacon <will@kernel.org>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> index 807cb511fe18..74d5164ed1e8 100644
> --- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> +++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
> @@ -375,7 +375,6 @@ allOf:
>                - nvidia,smmu-500
>                - qcom,qcm2290-smmu-500
>                - qcom,qdu1000-smmu-500
> -              - qcom,sa8775p-smmu-500

Then you need to describe them, like other variants are doing.

Best regards,
Krzysztof

