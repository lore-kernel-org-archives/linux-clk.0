Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E1EDC46467
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 10:49:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239170AbjADKtE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 05:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234701AbjADKsZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 05:48:25 -0500
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B279C34758
        for <linux-clk@vger.kernel.org>; Wed,  4 Jan 2023 02:46:58 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id v25so2407799lfe.12
        for <linux-clk@vger.kernel.org>; Wed, 04 Jan 2023 02:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NfmlmwOicK+P4Fj19lQDKKUueXvm4uJUNgQaNuxICg4=;
        b=JSuQn1rOdaxTDZtFChmYr1iKMXcr8UELgNW3/stAYotGA2EIeyL/+xXgdDBYkrU0/p
         UL8uTjP1eQh2c+d71VwAcT5rxp2P4BygBNye1lDkReI41EsU0TC1246fndj1D5vRGfzB
         W1mFcEVn5iNtdQunPlbie2r8kAq3HrvQ/fL1KCWI8mDLDbvgrmEFYv5jTZZHEBfV6xf+
         XPNI6pPCG1EM42swVNv+3sWQqbF8B2eWRTsK/cgW9I/lMUFG95nd3wwvmWMNuMDZlMxg
         CwtX8YOH31DatVuN7I8cl/naEd/i3kLV3Ppxf6ugAjx4q2IN89Q8lw4Y+GiOCfUHFaYt
         a0OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NfmlmwOicK+P4Fj19lQDKKUueXvm4uJUNgQaNuxICg4=;
        b=xaLsdJKsr4VoA0Vcf32SV25CPRh4i08AMpgzZ6tleyK3YUbb6odOgD+/nOUsbW2Xxg
         LzfqJF6o+mOczRBQ2OUBI1hIiAAykb3rv2Jt9zrO5G4G658TcDiyOayvJH1oXd8pKfZQ
         +gX8XFPBXSj6DyuCM/fn0NZAkYZhZYhONtdP1uqL5ekopN6d0yaI+Mf3ILaGWd8Sbqew
         PhJd01kKc4cvV0UGLMRwTdtl4/KKVaAWakwpHfqKizOEYv6sMknjsVex5qhia/qaHPBS
         nJ2Abf907VMCFWOJp1MJfAPQBeJyuklFSRNXeCquoiQLbHhS/bgOgQsxZZiqjPUDePXZ
         xKmA==
X-Gm-Message-State: AFqh2kqhnB2oKKyARMRkDXWyJokQfzidxwUPCq7gAUvd0WGitWUyhWHO
        1XMZ/Sk9cDpjT1jzV6RyfYCj5g==
X-Google-Smtp-Source: AMrXdXvhE08HUtoKGH4kUNqXmHmA8bNtvf777aR10BcsOI6lrQfH9CSmNxcPQ4lE7kpI1o5TljnNmQ==
X-Received: by 2002:a05:6512:2a90:b0:4ac:b7bf:697a with SMTP id dt16-20020a0565122a9000b004acb7bf697amr14010829lfb.4.1672829217065;
        Wed, 04 Jan 2023 02:46:57 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id m6-20020a056512114600b004b584204b85sm5093407lfg.161.2023.01.04.02.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jan 2023 02:46:56 -0800 (PST)
Message-ID: <07a849a9-03dc-f3af-1d3f-2369cb71451e@linaro.org>
Date:   Wed, 4 Jan 2023 12:46:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v8 3/4] clk: qcom: rpmh: Add support for SM8550 rpmh
 clocks
Content-Language: en-GB
To:     Abel Vesa <abel.vesa@linaro.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230104093450.3150578-1-abel.vesa@linaro.org>
 <20230104093450.3150578-4-abel.vesa@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230104093450.3150578-4-abel.vesa@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 04/01/2023 11:34, Abel Vesa wrote:
> Adds the RPMH clocks present in SM8550 SoC.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>   drivers/clk/qcom/clk-rpmh.c | 36 ++++++++++++++++++++++++++++++++++++
>   1 file changed, 36 insertions(+)

I think the plan was to have the _PAD clock as a child node of the 
rpmcc. Is it still the planned implementation?

-- 
With best wishes
Dmitry

