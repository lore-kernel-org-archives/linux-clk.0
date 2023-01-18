Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5BB0C32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 12:15:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230374AbjARMPh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjARMPU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 07:15:20 -0500
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C373465EC6
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:35:49 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1284265wmc.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p6Ndbj16TIZmtNw6BmwboGu9eKIrdjGHAGvmQw8N4Y8=;
        b=P8H37d4pf97MS8V5za+szmMn1Y9ePHQKn8visj69s5QkfEUHcqGAnFQqMkCkEjxuHF
         vsD7Uqgl6AM78a7CY0EsJQ9AemAAnuz0QxCEfP7BHM7IU+YEv4D38FV7/HA9/LOjp09+
         9KUWPinPw3DVtG4wh+1Apwh4l2hrzBilaA9rNxksxalcYTcGs1TDpSVESf4cxCLJM1Vw
         D1nqncfFeKStXxgyRdJ7X0TjbhsGBqPzvtlXffsCuOIEi+4YdEyftEDArHYX/fHfmNhn
         Wk14V3A4Y7mz7r4o/Xj2pRsuhsMgvKmK7GSitwDjrBNO7b+HWplT68OEyIkf7q+o2aWm
         a/Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p6Ndbj16TIZmtNw6BmwboGu9eKIrdjGHAGvmQw8N4Y8=;
        b=cLIb1g4WU/iYmheodqdBAEF48BI9qabTejl/9D6ZIgfnKmcgr1pF64B2UotmC+aW3B
         ji1rIdB3MQn2RMFabFDOA/dJysU7R501negmuNdZM4VkvhjPR7DkN8OB1VJPBfgRQr0H
         d3YYOdwf9fi4b6syrE58kNpykSNpCXCgIP1xIqNAKF2srTwqT6FUeteCWZ4FlOw/6Y+P
         u0BaKht4d8xovOr/RkOBhy61JdhUXG5a2CPhfIyHe6hcIDZ4eUw5GfQRdpfHv1qriXqE
         jf+tBK+TkODDIrbp69VrY95ChHjipLa+IA/QM4me6opgkwDrEwDLjT7iw5NYN+IWZc+P
         rAcA==
X-Gm-Message-State: AFqh2krZwI7kawTw20aTo6+JbkDns4RAhvH+s3KX13Zdszp/MWzV/ykn
        SGHUvpx7jiI7Aqk7oBRzFLdnWg==
X-Google-Smtp-Source: AMrXdXviNPoHp2tXGasKlh3ppYM7jRdIFLAEgMkjDroB+Oi/uChijAvpTMZMjFDkyXxQQUFiIYBy9Q==
X-Received: by 2002:a05:600c:5545:b0:3d9:f806:2d26 with SMTP id iz5-20020a05600c554500b003d9f8062d26mr6721236wmb.7.1674041747623;
        Wed, 18 Jan 2023 03:35:47 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c510200b003c6f8d30e40sm1844839wms.31.2023.01.18.03.35.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:35:46 -0800 (PST)
Message-ID: <722d14ac-dc4a-acee-0b36-2a3b475754bb@linaro.org>
Date:   Wed, 18 Jan 2023 12:35:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 1/7] dt-bindings: clock: qcom,msm8996-cbf: Describe the
 MSM8996 CBF clock controller
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
References: <20230117225824.1552604-1-dmitry.baryshkov@linaro.org>
 <20230117225824.1552604-2-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117225824.1552604-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/01/2023 23:58, Dmitry Baryshkov wrote:
> MSM8996 Core Bus Fabric (CBF) clock controller clocks an interconnect
> between two CPU clusters. The CBF clock should follow the CPU
> frequencies to provide enough bandwidth between clusters. Thus a single
> driver implements both a clock and an interconnect to set the clock
> rate.


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

