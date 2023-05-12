Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52A8CC77B75
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 06:51:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239960AbjELGvS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 02:51:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239986AbjELGvQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 02:51:16 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA6E27EF5
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:51:14 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bc4ba28cbso16906680a12.0
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 23:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683874273; x=1686466273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jsKErXbRUCx9c7pJsXtZwQSUgnhV+n88fwqIY9/PnvQ=;
        b=JUsi5uOkdPGkVRUOaAVDmZjBCegMSSSdUbhe5Qh45HTLe303viogN90K6Oxr+G/aS9
         34i6uBjZGlJ1h3yGtoAvif/dV3T4FMVTMylomVkycTz/yTyGDxRnWjBA5b2D8Gm5JJxH
         afhCF0pTwKXOvcOkOeJwLawMN/hLJ9KaUH9eMiXMSt1AtaFkKYiW3EKYCnmAGAI+fYOY
         hCUHyw5WCHvg9BxQrAn0rkTJfAuiGkFczZIZH2CA2MhyCApuxJUIrr1J3C9RMJ83dwri
         GKMuxkoz/lHDdpm3LRoObQlTVxo3Fcj1O5paXH+23BnHwcZtXJBvR62AqZkdKH5lO7q1
         /IGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683874273; x=1686466273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jsKErXbRUCx9c7pJsXtZwQSUgnhV+n88fwqIY9/PnvQ=;
        b=i3xkJq22z/QptzWt/XzEUI/wUPSXgF8VlPFjbSZY6r3XQsz+j5yJsYDWG2W+F+asuY
         JREdBgrTvrmFLuNv2qAgE5MqMoBxloraSjNWnJPlQ31Zz+T3oMojDCRDuuOsHx1YXiWg
         GuEYU1D8cNjybqESOMh0U2e99DZ0BbgvlwX32/AcsG+dMhFPhbayfC+OxU64kYEF61Dx
         WQiiEwUvvgwowZj3k1WFKEDFoe1+C/S73lHTL2nJ+ruHDV3ZjR1hCjuP5kSGRHn8YB2D
         yQetlpctgt3Ti4dfamSfwXRLEoTM5scBu6twTkr6Vh1HZ7qhpoZhOoqGmigR7Sluc1iK
         Tbyg==
X-Gm-Message-State: AC+VfDzhSO8xhQUIEfoSAJ/vRPUHSy8juYlOzD2RAOtx3VFCyv7K0ZuJ
        Xs4ZmgaNEMq+MKKqdr+zDjFrEQ==
X-Google-Smtp-Source: ACHHUZ5ne4AG2s1Tjpb09NNtv6IuN7wWFAFFSnCE8dNGrf8EMNOx7G8rmG4qvPMsmzEwzbAdQLy9kQ==
X-Received: by 2002:a17:906:ef06:b0:969:ee0b:24a9 with SMTP id f6-20020a170906ef0600b00969ee0b24a9mr9931134ejs.15.1683874273227;
        Thu, 11 May 2023 23:51:13 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:7ede:fc7b:2328:3883])
        by smtp.gmail.com with ESMTPSA id hy27-20020a1709068a7b00b0094f1fe1696bsm4950500ejc.216.2023.05.11.23.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 23:51:12 -0700 (PDT)
Date:   Fri, 12 May 2023 08:51:10 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v2 03/10] dt-bindings: clock: provide separate bindings
 for qcom,gcc-mdm9615
Message-ID: <20230512065110.zjr5rmcz6fahvzmu@krzk-bin>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
 <20230512003230.3043284-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230512003230.3043284-4-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 12 May 2023 03:32:23 +0300, Dmitry Baryshkov wrote:
> The global clock controller on MDM9615 uses external CXO and PLL7
> clocks. Split the qcom,gcc-mdm9615 to the separate schema file.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gcc-mdm9615.yaml      | 48 +++++++++++++++++++
>  .../bindings/clock/qcom,gcc-other.yaml        |  3 --
>  2 files changed, 48 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.example.dtb: clock-controller@900000: Unevaluated properties are not allowed ('clock-names' was unexpected)
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml


See https://patchwork.ozlabs.org/patch/1780326

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
