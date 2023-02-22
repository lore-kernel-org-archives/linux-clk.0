Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA09FC6379F
	for <linux-clk@archiver.kernel.org>; Wed, 22 Feb 2023 08:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjBVIrm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Feb 2023 03:47:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjBVIrk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Feb 2023 03:47:40 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B545837B44
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:47:38 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j2-20020a05600c1c0200b003e1e754657aso5608946wms.2
        for <linux-clk@vger.kernel.org>; Wed, 22 Feb 2023 00:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ydbqHIOomLQeh1beAvbyiFGfrGZ1Ce579+OZnxybWPo=;
        b=fs3cPLauczcQdWa3FwFOSUhbiDXDMbGYoP25M2Of3zCyCpnMP/+YxTVIy6cPJ+7BFf
         iKGuIuehQWipO3gIj2K0Y3sqoxbQPw9XBmtE8TT/iA6Hy/exctxcVHUgZBk94GZ6r8l4
         sn7bydZckf1EsawQOcONeOTorrJr6zIhgHfVcQcYQG1M1Yp09X5KDxCO/3QQw1Jx8aIb
         9sn/zaFlc5o0dwE/NJ1tvdpFituLHPFOgI2u45mOPoKa2rsSkCBHhJnn6gOQNbmKQlGu
         oUxbqirnBZTcp7ZUzA8ufwOK5I8uJxJQfnEDqJWnsyd/htZx/ZgtOuxLhD21rEtKdk9R
         JG9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydbqHIOomLQeh1beAvbyiFGfrGZ1Ce579+OZnxybWPo=;
        b=Zax6vX7EHUn+Wh7m8GGPzhHOSTUfyPpneQtISmob5Gbo95aJkTlerqSVOHrMYd+yf0
         IQJNeirOQC6JPKpB3FOg3Mz7vI+ECFCpu3rT4ZeLM/Bn+QGK+lS5QRDR/HW0p980+ajZ
         2rgupvgTwPzqT+KPaQYamtOU4sogBlfSBPBMckmiwshMF99HKL33FtfosymoxPb74z8C
         CFubYAJNE1Gr/onnrjyBpLHvAV4bZZcQHnDCX0jFXTPNo2UaxxM4rlgt6/P7QStK9LFW
         zlh5V0ZZb5J4eUij3BIDLTQ924zCy0WFXEEjmhYRdW4CLt4a8oTd5hF+jD/nHDnxoQjo
         uFlg==
X-Gm-Message-State: AO0yUKU/Vo9XXvAjRrxVs4qyhUDv3aAuWXW1iwBATdjg0hKVu6x+uMKD
        zDplydn5scpYwCAhu2VWyFYxgA==
X-Google-Smtp-Source: AK7set/Zwaf/JaFNUau2+Uariy73JokxO9E53tfbT25EZNWh66ldE+Ieh8tCAjj8QikD8cnpcGdsRg==
X-Received: by 2002:a05:600c:4b30:b0:3e2:147f:ac16 with SMTP id i48-20020a05600c4b3000b003e2147fac16mr3437707wmp.10.1677055657253;
        Wed, 22 Feb 2023 00:47:37 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c468800b003e2232d0960sm8408707wmo.23.2023.02.22.00.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 00:47:36 -0800 (PST)
Message-ID: <51bc1656-2855-5d4d-076b-af1fc496974b@linaro.org>
Date:   Wed, 22 Feb 2023 09:47:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/4] dt-bindings: clock: Add MSM8917 global clock
 controller
Content-Language: en-US
To:     =?UTF-8?Q?Otto_Pfl=c3=bcger?= <otto.pflueger@abscue.de>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230221174909.164029-1-otto.pflueger@abscue.de>
 <20230221174909.164029-2-otto.pflueger@abscue.de>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230221174909.164029-2-otto.pflueger@abscue.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/02/2023 18:49, Otto Pflüger wrote:
> Add a device tree binding to describe clocks, resets and power domains
> provided by the global clock controller on MSM8917 SoCs and the very
> similar QM215 SoCs.
> 
> Add the new compatibles to qcom,gcc-msm8909.yaml. There is
> no need to create another YAML file because the bindings are identical
> (MSM8917 GCC requires the same parent clocks as the MSM8909 GCC).
> 
> Signed-off-by: Otto Pflüger <otto.pflueger@abscue.de>
> ---
>  .../bindings/clock/qcom,gcc-msm8909.yaml      |  13 +-
>  include/dt-bindings/clock/qcom,gcc-msm8917.h  | 190 ++++++++++++++++++
>  2 files changed, 199 insertions(+), 4 deletions(-)
>  create mode 100644 include/dt-bindings/clock/qcom,gcc-msm8917.h
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

