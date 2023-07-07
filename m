Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3194C001B0
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 11:06:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjGGLGU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 07:06:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232732AbjGGLGO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 07:06:14 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5550212B
        for <linux-clk@vger.kernel.org>; Fri,  7 Jul 2023 04:05:49 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4fb77f21c63so2674452e87.2
        for <linux-clk@vger.kernel.org>; Fri, 07 Jul 2023 04:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688727946; x=1691319946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HX+g9C+7SiwpjIZlaW3PbaAICmuhwXUy2tZj1GLg4K0=;
        b=ifOvRemRzEymPd+hhQQLbwBMM7cEXYOiqBJSZ1ezN5yvrF0odjajrBnTNhtjIcSZno
         IV+xihvhbKeoF2gf4X1qxdeawyIr2qlLwuLk5rkKVuwdLsAJks3QpBJHW+xBZ1EHol+6
         TKVtBnJxp7TPww1abS/lE4RN9lHvPbNK+f53CFFOc2hWLyNvb3+bSPWS6EWZ398MMP1Y
         bPpcM2BuzWtOEmxgx1d2A/VxrVq7yaxVdXyswyknFtH1S37p8Ys5+P2lRx+vo94wrIS4
         cI76fc4RK72FkpPsPFqDNE7UyxfKAwYaWpf6lKCJVPB+VPPK4h3fiq7Y808pI9GUkswN
         drsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688727946; x=1691319946;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HX+g9C+7SiwpjIZlaW3PbaAICmuhwXUy2tZj1GLg4K0=;
        b=FguuhaMskJlvI2z/WlbXwb3SezHHnij0Q+jQKMHCT24Lru5zE1HtE2q878Xgjhkwbm
         fuiyDYpXkW3BXQnlDvPZWW8wfrmmh7itO4l+hqHgj+fVy+iRN2URscQDfVU40nlB6j6n
         hy8T6ZViGWOyGkz3w86x5lyn4WGsHGG8XCYGm6b9zgG7RaBqZFTDbb6lfwts5lOzg1aS
         oCflkUx+xhUNoRZZiW65PbCpNblf0RtQwUifrcZHd2Hkkn6tCMvegUS6k0pji18rWW76
         tTv+XjGW/yyU4/UWELyB0Cpzg2tK59cRemyDGHNj+W1ypsTLAWlP9yZ+gICDLq6XcvvE
         BWmw==
X-Gm-Message-State: ABy/qLbFCd1x3m2mEInDHtrSzCMgPiGdih5UvhSnJdnok6mnq5vHWliN
        af8FRe20Mm1A+1dBU9RrRnD/3A==
X-Google-Smtp-Source: APBJJlH0zOSHJ5KDhE1ZV1WRuaWEnNU3PfjMWvCDxdd7D93eWjaSw1bf53q5yzQx48S3/72RxLZ8lA==
X-Received: by 2002:a05:6512:344f:b0:4fb:92a9:cbe8 with SMTP id j15-20020a056512344f00b004fb92a9cbe8mr3415752lfr.18.1688727946582;
        Fri, 07 Jul 2023 04:05:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id ep13-20020a056512484d00b004fba808ab76sm633569lfb.181.2023.07.07.04.05.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Jul 2023 04:05:46 -0700 (PDT)
Message-ID: <ec42cc84-9050-be6f-080a-36a0d0b27583@linaro.org>
Date:   Fri, 7 Jul 2023 14:05:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH V6 4/5] clk: qcom: camcc-sm8550: Add support for qdss,
 sleep and xo clocks
Content-Language: en-GB
To:     Jagadeesh Kona <quic_jkona@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>
References: <20230707035744.22245-1-quic_jkona@quicinc.com>
 <20230707035744.22245-5-quic_jkona@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230707035744.22245-5-quic_jkona@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/07/2023 06:57, Jagadeesh Kona wrote:
> Add support for camera qdss, sleep and xo clocks.
> 
> Co-developed-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
> Changes since v5:
>   - Updated parent map and frequency table of cam_cc_xo_clk_src to use
>     active only source P_BI_TCXO_AO instead of P_BI_TCXO
> Changes since v4:
>   - No changes.
> Changes since v3:
>   - No changes.
> Changes since v2:
>   - No changes.
> Changes since v1:
>   - Newly added.
> 
>   drivers/clk/qcom/camcc-sm8550.c | 181 ++++++++++++++++++++++++++++++++
>   1 file changed, 181 insertions(+)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

