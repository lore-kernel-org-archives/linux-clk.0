Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D960AC77B78
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 05:38:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEDFiL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 01:38:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229494AbjEDFiK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 01:38:10 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33C811FC9
        for <linux-clk@vger.kernel.org>; Wed,  3 May 2023 22:38:09 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4f139de8cefso7063499e87.0
        for <linux-clk@vger.kernel.org>; Wed, 03 May 2023 22:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683178687; x=1685770687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0R/6F2fDA3fu8mo8fWH6D8UVAdWTIeYQHAz2BF8A7M=;
        b=bfn0/HMvcBVJDgWNnpzJsnesLE8K6/m3MFi1HoH4VER63n7gN2u81R43c3ajjwlv5L
         bEZSrabsqUBOY4J6Zglqs8mFPAP8SBTVzNdzrH9we8xemBMKzOisg/Kbhl3oLSYGmalK
         XIflo+kawSg4cInSY+jF7jvntPnVqK5CiUTeYNdPOYLsiuwpNI+MtlDcNEzIVZGhEgnU
         +m/9gvXLy/SfB3hgFU5ptVkHCnlDyGmtiIw9C4Ux9lJm000n1vuscwWth3gZrCBDE4cE
         UUMBqOyiv2DVSFQYZS8uU4eSuSPpzW7Pf4eYr6qmdoV9Bewu9o9/2wYNpVY+VBfuyKvr
         d7EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683178687; x=1685770687;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0R/6F2fDA3fu8mo8fWH6D8UVAdWTIeYQHAz2BF8A7M=;
        b=DtdXQ0y6hGDOUHJ8CqcFqyrkX/Lpb8GzooSzrBOHyYQ5ErIzXR9rUA4EdczbosyI8d
         fQy2ny6+NVq5eG4lccLdksiId2v64RwcVnGo7enF6jXrTLBQDD+rZUlfH/TMLaZWjxMZ
         IoES2AZu1dUp+vSBqsVi1WeJv9DmjE67mr4z1d1pCiF76Nt6p7d/qywct2Xnzw2g5cE5
         0DiVV0rRELtRdkK10ficlPm4LFHrpEbK+OgI4j7LiGy5HeIOEgyloPM8/0W9SnXdJByI
         sdL9IEjRFPsJHtfnMcgtsz+C0EEWoqYrTUT0Jfad/xbcfoMes5EIAPyuw43aHeloiUcY
         Bu2A==
X-Gm-Message-State: AC+VfDwq4Rejzbky+iAdF4RQ9myZDfj6W6kAubWHQe4Cy0XAunmmvMMw
        uc+81eCpKedA5R/deq98X+0hEg==
X-Google-Smtp-Source: ACHHUZ76yYL3ywZVQ6Yu/fDMSAsiT3rJarLzVrQWNbXGO3uWBruX3rTTID5e65AnCBa/CLR0i8HsFg==
X-Received: by 2002:a2e:98c2:0:b0:2a9:fa39:235e with SMTP id s2-20020a2e98c2000000b002a9fa39235emr418542ljj.26.1683178687461;
        Wed, 03 May 2023 22:38:07 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id p12-20020a2ea40c000000b002ac6b18999asm1030515ljn.4.2023.05.03.22.38.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 May 2023 22:38:07 -0700 (PDT)
Message-ID: <47bba0ca-745a-6236-79c1-506258cf237b@linaro.org>
Date:   Thu, 4 May 2023 07:38:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH V3 0/3] Add video clock controller driver for SM8450
To:     Taniya Das <quic_tdas@quicinc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_skakitap@quicinc.com, quic_jkona@quicinc.com
References: <20230503105937.24911-1-quic_tdas@quicinc.com>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230503105937.24911-1-quic_tdas@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3.05.2023 12:59, Taniya Das wrote:
> From: Satya Priya Kakitapalli <quic_skakitap@quicinc.com>
> 
> Add bindings, driver and DT node for video clock controller on SM8450.
Nice!

Did you test it with techpack/video or do you have some upstream
changes pending?

I've got sm8350 working locally and sc8280xp as a WIP, hopefully
heading upstream soon..

Konrad
> 
> Taniya Das (3):
>   dt-bindings: clock: qcom: Add SM8450 video clock controller
>   clk: qcom: videocc-sm8450: Add video clock controller driver for
>     SM8450
>   arm64: dts: qcom: sm8450: Add video clock controller
> 
>  .../bindings/clock/qcom,sm8450-videocc.yaml   |  77 +++
>  arch/arm64/boot/dts/qcom/sm8450.dtsi          |  12 +
>  drivers/clk/qcom/Kconfig                      |   9 +
>  drivers/clk/qcom/Makefile                     |   1 +
>  drivers/clk/qcom/videocc-sm8450.c             | 459 ++++++++++++++++++
>  .../dt-bindings/clock/qcom,sm8450-videocc.h   |  38 ++
>  6 files changed, 596 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8450-videocc.yaml
>  create mode 100644 drivers/clk/qcom/videocc-sm8450.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm8450-videocc.h
> 
