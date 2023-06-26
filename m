Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACD11EB64D7
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jun 2023 14:04:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230351AbjFZOEm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jun 2023 10:04:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57574 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230433AbjFZOEk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jun 2023 10:04:40 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D1BD10E3
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 07:04:34 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b6985de215so25053071fa.2
        for <linux-clk@vger.kernel.org>; Mon, 26 Jun 2023 07:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687788272; x=1690380272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wyIEHWHQ/LcvFyprRxFC+Na0w05IbCRKTBTbUS5cgdA=;
        b=WrUvnmCzy00urIpPmpCzBuKn8wT0tNNC0Wvh8x2Hzr/jbBkLeZGDoUteOMHOBFsEEY
         WoPRB0G/A6/yyXEiFRPlmcWraG49HRyjcV8/EBzHdiTYK56VLk7u1kEfLdxvH8qDXJSh
         I8dbmVCYnd94fxo/J65iv6vyR2bH/EYT8qSC0DRPY4D5jLf6QLfkW59Cb7by6aaSuZxm
         NhzdyHUz0tKyGRIwNit5zGQG6ZpIiQJ8jyTCnRzP1tFP5MVQzSoegV74zffZPfyQ24y1
         nP5pt7iHRUmuMqk2td+hy+rZLyhFJ08iiX5HZ7WorozJbCVkmk0hcbbBY9t4rfbnYsVD
         Fxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687788272; x=1690380272;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wyIEHWHQ/LcvFyprRxFC+Na0w05IbCRKTBTbUS5cgdA=;
        b=KVbzsNMvXtzagBp7Uc+YTWe69MMWGUYWU19BiLF9T46EsjdWuYXVXuHZOAxSp0uK7e
         U3uR+TdiJfGjlHioSTyvvPoXLQKbjOIa2oJs/WvvX6VOwSXhcycUSjIMqeGi0P1xjD50
         1St8j2aYvoJNXP4XbG+sXLG/6w///YtSwhX2fobNMEF7ZsyOrGkdEVGfrstg6O7/tQ8I
         5PaP8v2qaoaz59E50iKCYoByU2Ml3vWvruqpN7efqa21pfz1R/x54iy+RP5BL84R4xDv
         g7SZkRk7j883mHcTb7l4v7y/cin/wqjsPMzzzAO1P59eRwki8EOZLbztaECMbTeXSL4U
         8BHw==
X-Gm-Message-State: AC+VfDy4zeprsX9tNcDXdU9Icznaqrf0KtzzGiZ17etv3Bw1GwB8HbHl
        GwBYb5kGculHw2nniDGoNDQWBQ==
X-Google-Smtp-Source: ACHHUZ4cCys5jLmsTbxwl6vC2/4BuewVlsgk63nHZjzLyOKbLNIGAd+7i6deIkRRAZW5T+VP+CDn+Q==
X-Received: by 2002:a2e:8855:0:b0:2b5:fef9:6ad6 with SMTP id z21-20020a2e8855000000b002b5fef96ad6mr3241115ljj.25.1687788272229;
        Mon, 26 Jun 2023 07:04:32 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a10-20020a2e88ca000000b002b6a4f35a0csm297726ljk.35.2023.06.26.07.04.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Jun 2023 07:04:30 -0700 (PDT)
Message-ID: <631728c5-9e4f-fa5d-e954-d4ba35f6fd19@linaro.org>
Date:   Mon, 26 Jun 2023 17:04:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 06/15] dt-bindings: display/msm: sc7180-dpu: Describe
 SM6125
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Lux Aliaga <they@mint.lgbt>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-6-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/06/2023 03:41, Marijn Suijten wrote:
> SM6125 is identical to SM6375 except that while downstream also defines
> a throttle clock, its presence results in timeouts whereas SM6375
> requires it to not observe any timeouts.

I see that the vendor DTS still references this clock.

Abhinav, Tanya, do possibly know what can be wrong here?

> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> index 630b11480496..6d2ba9a1cca1 100644
> --- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
> @@ -15,6 +15,7 @@ properties:
>     compatible:
>       enum:
>         - qcom,sc7180-dpu
> +      - qcom,sm6125-dpu
>         - qcom,sm6350-dpu
>         - qcom,sm6375-dpu
>   
> 

-- 
With best wishes
Dmitry

