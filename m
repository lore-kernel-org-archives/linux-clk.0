Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7FB7C54EE9
	for <linux-clk@archiver.kernel.org>; Thu,  8 Sep 2022 21:16:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229994AbiIHVQW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Sep 2022 17:16:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229980AbiIHVQV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Sep 2022 17:16:21 -0400
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC88CBFA86;
        Thu,  8 Sep 2022 14:16:20 -0700 (PDT)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1274ec87ad5so32927829fac.0;
        Thu, 08 Sep 2022 14:16:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=e+e0hUAWinjpQC8Vo+J20HCggVCvtX2Vwkd7WM23/j8=;
        b=Tq0yjUYrDm6Q2UPi6eQS7yI6tP2mI4B9vrKlsMU3vlNRKL/JrwsY7/9b1i2l5AQEMi
         KobptIqjpyP6aBtN7NZKynt0TaStQcitUrA4L/4FB23JsDQd3ND/8x/lNszKPjK9rr8E
         bmx806UpKlq63Q/2KhlvOexAsBMfitKJB8xn5IfNOamp0+6NRUdWmH39NodQ6vt/dnkp
         X66Jvm1M0UXMb3Asro9J3GZ+15p5PrVxKy8FS016JffgDeqWktiV5nJm6oXpU13f1Fec
         9CLhBfnwMFREvvU+dJXQKYZxzwW+HdsOTFNlpakSY9nq5O3jc61IoU0N9cF4pse5bUGX
         1YBQ==
X-Gm-Message-State: ACgBeo2WFhBt6W0dYcxXxDeVbXCj7W0Iu9GvcgdVbitKSCJY+FhMpQER
        i5CRrVOBH2bukEW6kMPQzA==
X-Google-Smtp-Source: AA6agR5iHeHRzAN0E+h68PODJqropuBCYfQP9FPVOaIODqKQ3vgbcRox5wBeJ7IvJKA7NCC0EnglfQ==
X-Received: by 2002:a05:6870:c596:b0:101:6409:ae62 with SMTP id ba22-20020a056870c59600b001016409ae62mr3009430oab.112.1662671779979;
        Thu, 08 Sep 2022 14:16:19 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s7-20020a056870630700b0011e73536301sm48309oao.52.2022.09.08.14.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 14:16:19 -0700 (PDT)
Received: (nullmailer pid 3355399 invoked by uid 1000);
        Thu, 08 Sep 2022 21:16:16 -0000
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
In-Reply-To: <20220908191044.3538823-2-dmitry.baryshkov@linaro.org>
References: <20220908191044.3538823-1-dmitry.baryshkov@linaro.org> <20220908191044.3538823-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: qcom: add bindings for dispcc on SM8450
Date:   Thu, 08 Sep 2022 16:16:16 -0500
Message-Id: <1662671776.555138.3355398.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 08 Sep 2022 22:10:41 +0300, Dmitry Baryshkov wrote:
> Add device tree bindings for the display clock controller on Qualcomm
> SM8450 platform.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,sm8450-dispcc.yaml    |  97 +++++++++++++++++
>  .../dt-bindings/clock/qcom,sm8450-dispcc.h    | 103 ++++++++++++++++++
>  2 files changed, 200 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.yaml
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-dispcc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.example.dts:25.26-27 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:384: Documentation/devicetree/bindings/clock/qcom,sm8450-dispcc.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1420: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

