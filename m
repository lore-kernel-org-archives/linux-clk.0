Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9ABC38142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 19:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbjAaTPJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 14:15:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbjAaTPI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 14:15:08 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5E4274B0
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 11:15:07 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id hn2-20020a05600ca38200b003dc5cb96d46so4286695wmb.4
        for <linux-clk@vger.kernel.org>; Tue, 31 Jan 2023 11:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=58Q2UI7MHZibBsmsG2xi+vLOgq5BEQsjL7SVOWh3yD8=;
        b=vdz/+JApBmOgLHjE7x9vndfBikGvJMsJVuF7kS/h4rEtpIU+XaUpL5C8vDmcBzCzto
         9fo7chEpH+CEeUk1x2tx0d7C/HjZZHa7SVBlXNJGlmIFDQOXUe9jMqCBL/GKiMw8Oulu
         Q5xekNXeunYHg+Qiattr/q0AfZZB3geDVF52T2jpbCpL5MpwswpIVJE+0/VOPyXMqFhG
         AaxNze1F1QQHgaMHe56jabjHmXpVO2XgggHwCOJqoOp5rft42LmJG+Nj6mNhIBu2w1hl
         ffKnkbIQHqFWppEq6tO+gB+/3hAClUm0C+PxaGlH3mk1gscciYAFJr21ZX/5OXz7d1kj
         vDsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=58Q2UI7MHZibBsmsG2xi+vLOgq5BEQsjL7SVOWh3yD8=;
        b=CsE2Qsso00w6t8itNIPX3T4BeUe8LdUFJs9VuirXcxHLk6ZfjN+K57GeRvah0Bfa9d
         +nM9qSiFo70cWFx/JLgCB3c0x/9PWaWbS5UqUuvVJHB1eKDJlCYt0MMShkoOHB0wSv1J
         zNfTUsTmdutBACPNG91gxEya6jZs/2pul3dSeSrtc/6LiQGdGVUE2o2Fy2WsTltEVKaW
         pRRyoMZ52poQanN0yYyDpQEHllPia1EIMdFM1rIkHvSTN5RbHSKZ7FDLX8IvE0LTUHgS
         6OIe5aYzHyuSgnZVlQlOxwkm4Ank6etgO3e5F5RaWriZhlLdWJkIhFOStTMD6/Ar1Y9Q
         eNng==
X-Gm-Message-State: AO0yUKWenti+obT37FO2MjgRECCuDx7igGVkPHbtzBm6sWMaitMLyss3
        up3L6wuSdJ3xFGhNxP6/aSmxiw==
X-Google-Smtp-Source: AK7set9eSuU1DiJc/lhnqA6XBu/oi70gRWi+lSIjHvMNH/TFjPnfOYqqxMjfGABVcM9ka5cMIebFBw==
X-Received: by 2002:a05:600c:4f02:b0:3dd:1b6f:4f30 with SMTP id l2-20020a05600c4f0200b003dd1b6f4f30mr5820189wmq.3.1675192506254;
        Tue, 31 Jan 2023 11:15:06 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id y3-20020a1c4b03000000b003dc434b39c2sm12382472wma.26.2023.01.31.11.15.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Jan 2023 11:15:05 -0800 (PST)
Message-ID: <52db5c7f-8abd-c4c0-cb94-725a6ec01448@linaro.org>
Date:   Tue, 31 Jan 2023 20:15:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 7/8] dt-bindings: clock: Add Qcom SM6115 GPUCC
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
References: <20230130235926.2419776-1-konrad.dybcio@linaro.org>
 <20230130235926.2419776-8-konrad.dybcio@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230130235926.2419776-8-konrad.dybcio@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31/01/2023 00:59, Konrad Dybcio wrote:
> Add device tree bindings for graphics clock controller for Qualcomm
> Technology Inc's SM6115 SoCs.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

