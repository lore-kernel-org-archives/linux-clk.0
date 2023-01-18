Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF143C32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 12:19:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbjARMTW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 07:19:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbjARMRG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 07:17:06 -0500
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com [IPv6:2a00:1450:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1250582AB
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:40:27 -0800 (PST)
Received: by mail-wm1-x330.google.com with SMTP id f25-20020a1c6a19000000b003da221fbf48so1293600wmc.1
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 03:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dqQJJl1MXv+9dPuJMpwYZsIEmIu3Y6KB4eobe/SEMC8=;
        b=r/AtxOx2fmtZXGff/Hnfj1nWOtDnyDtRbCOww3cvbPaqNPgISoKia8PKNwhy0Kbpd0
         yjyM+RxnIsFEBBJegj3+kh3ARvPvuAf0ovQ+v4aV7YYu4FIKM0o8C9GKA4aCTuMAyZKI
         etaUqwtZcZzWBlSkeO+zn+XvTjdO/uTw4c+OF++M99VRR5Ve0nIlWhd2OkwfwvZhBYIj
         mLxAjbJPZnUfNzdgdFT58Dpq0wqtpzEHM0FowCtPs92sGyzsSq+1jLR1K8XhncNpIaHV
         Tp2N+Up7bXGDunbKNb4wpeFSazAFeT9fN+vTQlTvXHkyPGgDIK4OX3yR8Xp4vg+p9VNh
         WuaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dqQJJl1MXv+9dPuJMpwYZsIEmIu3Y6KB4eobe/SEMC8=;
        b=BsA+WENHGN2r+wvBBYpgPFmqGNXvu607VTZNul7I6/LSPuFn4v+Cw1GmwtQESxua2/
         FUTYPbYoGMHBE3FHnjPPzYoOxQCQP5Y9zMwcDIVjUbuKpc0mQ99WVAxSLggVXa0zdBJo
         8LgXaBrqa/Hqy7cjeVP0Rvlp8YJytKssXgq5MAB+ujuTkBxpuMgmCe6Hzx2C3y0h2tVZ
         /3pbvLy27gU3cG6iWy+34vM1D3pPM07t5sIzgilAjACKn+Ce87A1P6L6Hn0pvSbPcsb3
         UoZ00TbihsH1msKEbfh1MwHqZKJs1j4GT1KQqIRwoH0SoCAk3NvL56bTLPWfP01JMHt7
         C+OQ==
X-Gm-Message-State: AFqh2kq+t4XdLxECt692ymth5p5PPBWfugC0GThkicEPjnmCHLpLZc3f
        l9ac5Z9Yc6cLtv8CfFBds1AycA==
X-Google-Smtp-Source: AMrXdXsvlsA81Kd5HuWdhL98Ck/AGumekBmnqK8lVG4dcfWyI1boqUT/qU0e/RcXz1BPIi65K1hqlA==
X-Received: by 2002:a05:600c:1e19:b0:3da:2ba4:b97 with SMTP id ay25-20020a05600c1e1900b003da2ba40b97mr13866343wmb.19.1674042026510;
        Wed, 18 Jan 2023 03:40:26 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id j35-20020a05600c1c2300b003c71358a42dsm2324551wms.18.2023.01.18.03.40.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 03:40:26 -0800 (PST)
Message-ID: <990345b4-4dd9-8e73-87c0-68666b9474ce@linaro.org>
Date:   Wed, 18 Jan 2023 12:40:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v3 2/6] dt-bindings: mailbox: qcom: enable syscon
 compatible for msm8976
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
 <20230117223013.1545026-3-dmitry.baryshkov@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230117223013.1545026-3-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/01/2023 23:30, Dmitry Baryshkov wrote:
> On msm8976 platform APCS also uses syscon compatible, so move it to the
> block of compatibles using SoC-compat together with syscon.
> 
> Fixes: 60545466180e ("dt-bindings: mailbox: qcom,apcs-kpss-global: Add syscon const for relevant entries")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

