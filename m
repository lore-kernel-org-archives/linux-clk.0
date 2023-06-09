Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5628C7EE29
	for <linux-clk@archiver.kernel.org>; Fri,  9 Jun 2023 12:55:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240857AbjFIMzX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Jun 2023 08:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241220AbjFIMzU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Jun 2023 08:55:20 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC6C92D72
        for <linux-clk@vger.kernel.org>; Fri,  9 Jun 2023 05:55:03 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-4f63006b4e3so2239901e87.1
        for <linux-clk@vger.kernel.org>; Fri, 09 Jun 2023 05:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686315264; x=1688907264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iWAc8s9mtYq9bvfxWICbMJo3RkYM/eJc1QSBr+x6G8Y=;
        b=xfyZNLfaD0QTAnUJUAEH8T4GdANS45eqBTdyEnOUe0avgitAwOpNCO2K/wmbsrhWaP
         MM1h8jbCTsc9hhjOcUkuFZZB1aNee0AuTns+EUVlJm4Syqpfkj605YC4O1ScWL167G0V
         owsaOPVbtz3IwSpfkN8VuvrWeJZWsLQWmWWMmgoAmKnhBOAxRICBzCThvvkkj2lA5p5m
         ZqcXfxZh6FDQY0zX4Ikc+nnQPNKv4DZRxhez7aUunmUSJeistB6MDu14OBefv1TpI0gr
         f4tZ2dKvbRBKiCTfrvoepT68XTXKGzNCkSfF4E1SSIIfVvJdtSOJt+aBEgbIK95Ker13
         XxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686315264; x=1688907264;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iWAc8s9mtYq9bvfxWICbMJo3RkYM/eJc1QSBr+x6G8Y=;
        b=Sturgr0CK81MpHpNJkmqHGYWL45uyGYYJLQQpPVPUM63IMWlruUGLQsxHI6JaJBt7S
         ooBmWoiZ7pt6kkGD3XY8bUhy0KsLM2zlnv5DJ88NunRUOtWHypFuT6EYxC5yJ4lBREBv
         /5MXSjpOuKoCcmCfMizCgarxaT18E+S5rqCoyWQz/K2KTXTnfjmkA59zBJxQ/iPlMpkG
         tAoqmZRlRrAi+V0mmz9GZtNtckm70C9LdKiuzfCfQciL6mBzn+RULVDkCjD7DdC4MEzO
         InZobWqAijzUR9pSqGRFGnuYcGy81TVauc+VSzmbTOQiasDKCVs4cpAdrPXMzX32jYua
         Iypg==
X-Gm-Message-State: AC+VfDwXUm522R5MCsTrZ6ZCEdrCZIll6Csu0NdCEeMxHV9sAmaPF9tE
        GfezEgq4Ku9zmB60WyCPD2HfIQ==
X-Google-Smtp-Source: ACHHUZ6drSlhoDmee4FQUAtmNA+rg3NZmyqtbBNMYb8qCNApuq5hPUipIG1dmiNUk7AzPMw6LF++Sw==
X-Received: by 2002:a19:ca59:0:b0:4f4:b05c:dbbc with SMTP id h25-20020a19ca59000000b004f4b05cdbbcmr834341lfj.63.1686315264003;
        Fri, 09 Jun 2023 05:54:24 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id v4-20020ac25924000000b004f64409eef1sm534202lfi.246.2023.06.09.05.54.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 05:54:23 -0700 (PDT)
Message-ID: <88b41c0f-e515-ce94-e4fd-befbeef53781@linaro.org>
Date:   Fri, 9 Jun 2023 14:54:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH V4 0/4] Add camera clock controller support for SM8550
Content-Language: en-US
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230609115058.9059-1-quic_jkona@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230609115058.9059-1-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 9.06.2023 13:50, Jagadeesh Kona wrote:
> Add bindings, driver and devicetree node for camera clock controller on
> SM8550.
> 
> Jagadeesh Kona (4):
>   dt-bindings: clock: qcom: Add SM8550 camera clock controller
>   clk: qcom: camcc-sm8550: Add camera clock controller driver for SM8550
>   clk: qcom: camcc-sm8550: Add support for qdss, sleep and xo clocks
>   arm64: dts: qcom: sm8550: Add camera clock controller
What's the final verdict on RINGOSC_L etc.?

Konrad
> 
>  .../bindings/clock/qcom,sm8450-camcc.yaml     |    8 +-
>  arch/arm64/boot/dts/qcom/sm8550.dtsi          |   15 +
>  drivers/clk/qcom/Kconfig                      |    7 +
>  drivers/clk/qcom/Makefile                     |    1 +
>  drivers/clk/qcom/camcc-sm8550.c               | 3585 +++++++++++++++++
>  include/dt-bindings/clock/qcom,sm8550-camcc.h |  187 +
>  6 files changed, 3801 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/clk/qcom/camcc-sm8550.c
>  create mode 100644 include/dt-bindings/clock/qcom,sm8550-camcc.h
> 
