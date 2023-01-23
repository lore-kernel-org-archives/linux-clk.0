Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B2CEC54EAA
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 20:28:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjAWU2z (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 15:28:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231876AbjAWU2y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 15:28:54 -0500
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D88356EBB
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:28:49 -0800 (PST)
Received: by mail-ed1-x52b.google.com with SMTP id y19so16077139edc.2
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:28:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LyRCAPq3YaTW2r5/PRAwn989pdN9U5QOL3ey/FfuYWE=;
        b=JUNyQr3tkk02/OFKS6Fih95SBBu/DWsOwixkDkJeJDYcW9aJB7yOih/v+L4rMyGz76
         jObWQ04IqFzHpmbwHGiPaO4I9freP2x7z2RoDHxUSmB7GueD1+bsDzQpvftw3YBbGSkL
         TfjPiF8XDJvgUh1SRuLha0TH13HodZLVmIRrOli8U6X7Sn3pCJwHn00wL7Wmq+Q+y3jJ
         rGTC1F02GFJoUvZOntQ9HhTnl4myXqxImzEHFmL7f9w2OiyH1Ov+HgR7TERFysidbzyF
         HwTKbKt9yBU+eI4v2FeZsicXsvaTpnRysuArE9S0a5Dyc5pUEghbcqdgjgf38pOQbGvC
         HNeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LyRCAPq3YaTW2r5/PRAwn989pdN9U5QOL3ey/FfuYWE=;
        b=HnnaXPQ3toV3WbhVTObkJlMs80EGZA3jZc65NeEW1ALEA62R0aOGE7COiIgFWMM31t
         gdBG6ebL7pb7YrgT549DME9fn6zwGVdKU/1EguoN4rtEBNCHwhttbk8R2u0QP+Iw0Io2
         b29lEudgWAJt706Lua94AD6dZnNZR2kp0TmgpnLKBYkPfWdj8ra/HU50vN6WlBi/swo9
         Mi3Hyn7xMLNVPEZzy9yhvDSDSRGSrIlw2bc6veIGVZIf1px8PAFaqt0oh0Ym0QjVRJEm
         hQy0n4cx6loLPnUp1kHXNeFQ9a29c2N75u0tzueFSlbOa5r2VXUtnAhi5ziZ24QIVSoF
         LFqQ==
X-Gm-Message-State: AFqh2kqYpg+WX9n4jxDG2utNlbBPviUphrjFcPBoTeXaM38wSTxbQmKj
        yskrbNKRkW2OHqvyTlzDCLGSnA==
X-Google-Smtp-Source: AMrXdXvGhWpJop161zFbnTiUaZ2RqITmyoupUZnT59QGGr8WNYc38Xx4Wvr/FTBFaYhpLBgNKkUv0Q==
X-Received: by 2002:a05:6402:3709:b0:488:6003:24b6 with SMTP id ek9-20020a056402370900b00488600324b6mr28579613edb.40.1674505728433;
        Mon, 23 Jan 2023 12:28:48 -0800 (PST)
Received: from [192.168.1.101] (abxi24.neoplus.adsl.tpnet.pl. [83.9.2.24])
        by smtp.gmail.com with ESMTPSA id u10-20020aa7db8a000000b00487b73912c2sm172346edt.12.2023.01.23.12.28.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 12:28:48 -0800 (PST)
Message-ID: <bfb099ac-6397-50d5-93b7-9424bea17e43@linaro.org>
Date:   Mon, 23 Jan 2023 21:28:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 2/3] clk: qcom: gcc-qcs404: fix duplicated num_parents
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
 <20230123201812.1230039-2-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230123201812.1230039-2-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 23.01.2023 21:18, Krzysztof Kozlowski wrote:
> num_parents field is being initialized twice:
> 
>   gcc-qcs404.c:63:32: error: initialized field overwritten [-Werror=override-init]
> 
> Fixes: 2ce81afa0c7c ("clk: qcom: gcc-qcs404: sort out the cxo clock")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/gcc-qcs404.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
> index 5f58dd82d3fe..a39c4990b29d 100644
> --- a/drivers/clk/qcom/gcc-qcs404.c
> +++ b/drivers/clk/qcom/gcc-qcs404.c
> @@ -60,7 +60,6 @@ static struct clk_fixed_factor cxo = {
>  		.name = "cxo",
>  		.parent_data = gcc_parent_data_1,
>  		.num_parents = ARRAY_SIZE(gcc_parent_data_1),
> -		.num_parents = 1,
>  		.ops = &clk_fixed_factor_ops,
>  	},
>  };
