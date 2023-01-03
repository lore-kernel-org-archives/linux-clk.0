Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4BDC54EBD
	for <linux-clk@archiver.kernel.org>; Tue,  3 Jan 2023 13:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237688AbjACN5N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 Jan 2023 08:57:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237746AbjACN5B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 Jan 2023 08:57:01 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50AAF10B40
        for <linux-clk@vger.kernel.org>; Tue,  3 Jan 2023 05:56:59 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so45734616lfb.13
        for <linux-clk@vger.kernel.org>; Tue, 03 Jan 2023 05:56:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=alWcI+JAUgaHIMnURdiNevKupC1Ev2KwHVJZTPqk/Mw=;
        b=PjbkIHsi1OFmR6RoG+hRynsJegteU3JKnkJIsBR6n0UZ5yFo10eqEqDiOtKOx51Qst
         t2Qt7+9ttPG3iOcYgPFGLovfsQqOmLfUS1QtICojuF4ZuzqFkmTCFxWXNVsaP+UZpmVF
         KEWDY9KNlCIGvHY6ZpGfHIXCJgGlZmpG3reh60td3cOrIrQZ9lLPqg005Ts8y65wh3UM
         JUhfgpFCEpnNrQUdeclJjcbG29LBm3yZOVy9bPQVDi+Jjl9GKrjy7BeHQt0/bGi+sUiu
         Ezn1C52eeHzzXINAKuCMzsb8OYAHR8repbEYlA83N76DB4CHY+iwHpZGL8q7AB0C0EE8
         xcxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=alWcI+JAUgaHIMnURdiNevKupC1Ev2KwHVJZTPqk/Mw=;
        b=WmxHUfOg+EUDsF0j2lptqpbDBym2gVZe6+w9EJ++XyyD7rxUq5mtpMulysQ3cMS9M9
         UIzrItwz6pxz7RxsV1Tnv1C4GIYUXEmjocbk/tanqWGDbcmL794lYFp0ckI5h5RuetDz
         d3ZAo9Gg+9tFlW5OgPB8gjXHe6l/pg8A7OMvSWxKkJ1IjyyoUiTMwMZYHXvUSiU0KUta
         jgQnrKMCPl+XA6MmgVRBNYTRanwf900inddYbKrjniGET+uox6OvkSFBtxHCURqy1D09
         mIK1GOVnV21PMFW9Fxn+RtqEdAIArExt7pd9RoEPFAgkRs4jh8sX1eNZeSRFndllzCTx
         aCVg==
X-Gm-Message-State: AFqh2koi+N0LnpXytXNZB27s9/TLl3jJW3Vs80p0j+i1DKm8MAVDp+yV
        nzZy8z/ZpvHT7gtODFx4GXCRIv5OsRtV+b68
X-Google-Smtp-Source: AMrXdXtho3pa153o5IOKv1liqVNqeU2DTI3V94wlf5xBgr/gsPuCMm40nP2HNkJDYvrzZ6YQgFVleQ==
X-Received: by 2002:a19:650a:0:b0:4aa:978:32fb with SMTP id z10-20020a19650a000000b004aa097832fbmr16104497lfb.31.1672754217669;
        Tue, 03 Jan 2023 05:56:57 -0800 (PST)
Received: from [192.168.1.101] (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id z2-20020a196502000000b004cb015794a8sm3917652lfb.109.2023.01.03.05.56.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 05:56:57 -0800 (PST)
Message-ID: <ff328a1f-e193-ec16-8dae-a580759c43ee@linaro.org>
Date:   Tue, 3 Jan 2023 14:56:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 2/3] clk: qcom: clk-alpha-pll: define alias of LUCID OLE
 reset ops to EVO reset ops
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org>
 <20230103-topic-sm8550-upstream-dispcc-v1-2-81bfcc26b2dc@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-dispcc-v1-2-81bfcc26b2dc@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 3.01.2023 14:53, Neil Armstrong wrote:
> Add an alias of LUCID OLE reset ops to EVO reset ops similar
> to other aliases.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/clk-alpha-pll.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
> index 2bdae362c827..c67cfda27ecb 100644
> --- a/drivers/clk/qcom/clk-alpha-pll.h
> +++ b/drivers/clk/qcom/clk-alpha-pll.h
> @@ -162,6 +162,7 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
>  
>  extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
>  extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
> +#define clk_alpha_pll_reset_lucid_ole_ops clk_alpha_pll_reset_lucid_evo_ops
>  extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
>  #define clk_alpha_pll_fixed_lucid_ole_ops clk_alpha_pll_fixed_lucid_evo_ops
>  extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
> 
