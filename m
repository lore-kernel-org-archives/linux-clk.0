Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4156CC77B77
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 15:18:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230516AbjDNPSG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 11:18:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjDNPSB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 11:18:01 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D9E3A5EC
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 08:17:51 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id gc14so1308681ejc.5
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 08:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681485469; x=1684077469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9drcNPSM0KBR/CLrBwPG24/hlufSHekIX2GuAa0mc7s=;
        b=DpYdX+CHD+F/+NFh7Oh0tAd/G7RToDYcGkhwE0Qp9T+/OXvLJkiThET18+0f2JhQR/
         ytNVi+NL44SPs4QSFY3PVpySwPE8J67VT6ToVQyvHjhsbqre9DKC1GI64VmbIKZINwuQ
         TBrs8yC9yasnwi7+34VIkrpYmsalcISpUyMIMxWPxhHm9W2fCutH/uqUiiwSFAM/Epgs
         Z1vis+O0CuGzfD3ka/4FKW33Y7U1MqWS1c2LEqQ9ARD7gQ4stOYs+jI7cehgK/wmEphg
         wt2mU3/FpPLYcZUff4OIPg4J8gaRgJ/VlB5oiirY18bTdXQllJmRfVm9GrR47BMFGojl
         Czqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681485469; x=1684077469;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9drcNPSM0KBR/CLrBwPG24/hlufSHekIX2GuAa0mc7s=;
        b=VegJ33q05IBXj3SF86l/6Y+XdmT5hS2Qtpk3U92kd9FlgcYLKcACLIhJJFVN47AO6U
         L6H6ovV39NEsBdRvII7OS0J+pwafsYoiBTfL0Y7B87abXYTQBEK/kXg1x8gtPN/CLW2o
         TGRzbBL1gR3v12XHuIK70yC3KptKW5m12omN0D7iUGcvHH5m3rSDXLifxIcMgYNmHB/E
         /jUN7nAf3XuAg7ZHRuHYx+2ErR82KfBQMpmcj5I3DOSYfV37RBTyyUyFm/rUyor8n6tK
         l0mZmQEIgoOiOReiwvqO3QUxj2WzgyH6xwQx0PcCyOXqYESJ3Iz4hvJMHhQmtdmRmd7T
         FspA==
X-Gm-Message-State: AAQBX9d8E9Jq/uQT9kTOyEoG2mz+JqnL2blAId0vTryzSdclOaPRqnJI
        2AQcffhnirG8aGxs8S1jX86cnw==
X-Google-Smtp-Source: AKy350Y1ovRQx1f10GgZ8oEgerwPzy42tM/K38eDatHEyM6Q0mtLluw+V3szHNhRcNBxfX4Yn4ti6g==
X-Received: by 2002:a17:907:72d4:b0:94a:7da2:d339 with SMTP id du20-20020a17090772d400b0094a7da2d339mr7465159ejc.26.1681485469533;
        Fri, 14 Apr 2023 08:17:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:39b7:81a0:bd41:17b1? ([2a02:810d:15c0:828:39b7:81a0:bd41:17b1])
        by smtp.gmail.com with ESMTPSA id p25-20020a17090635d900b0094e75d3ba1bsm2575677ejb.131.2023.04.14.08.17.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 08:17:49 -0700 (PDT)
Message-ID: <20faef75-9182-6e67-8ac5-c8234318ab64@linaro.org>
Date:   Fri, 14 Apr 2023 17:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add SM8350
Content-Language: en-US
To:     Konrad Dybcio <konrad.dybcio@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
 <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/04/2023 13:26, Konrad Dybcio wrote:
> SM8350, like most recent higher-end chips has a separate clock
> controller block just for the Venus IP. Document it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../devicetree/bindings/clock/qcom,videocc.yaml    | 29 +++++++++++++

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

