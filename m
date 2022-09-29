Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB71FC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 11:00:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234970AbiI2LAo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 07:00:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235023AbiI2LAn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 07:00:43 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 60A8B5006D
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 04:00:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id bq9so1591972wrb.4
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 04:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=fHFFCshn3v7oJCGQlT5d3EjHBX8rxPGp/Q6mPgcTP00=;
        b=SIYr3OEGy5OZHX7kCmcm87PzQyJiBBqn1UT/Ex0Wm3SE63y2ci+Xw9jWf4caPxqHha
         RXI9XF2V2NqfgPKtm8om1auJBB+wFWkiX/+qN+ZUb72dMFbPGjLuuyKQhzqDvsQtENh/
         dwZKQIlfW6nyxmbfaIbR87NCq+LaNPy3XQsk1s5Qi01JA9TrQUt4X89ZnIAATD4dkjx5
         tJqwCwVVixSc0o5b0D8c0mR0Vob45g9JWSxB47+Y6L1ZhN/dgAAj4AY47/oWzde0oyC2
         hs9gT8ipx73xAIo0Cnu7tV2IdvvhvTIR0WArQENoP/dQSPB1Eqvze7xp9QQoFicMYbo+
         ubxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=fHFFCshn3v7oJCGQlT5d3EjHBX8rxPGp/Q6mPgcTP00=;
        b=6hY7ElpuVG9AO+iu1rJLG4HvAHaaEFxUe6XaRSMdymqVw3M0VhnB/9tbMvjrqijiBF
         Aq6pLrrR3eFimD9S7bLxaOY1EKrxCwQguu8x206MItlP/NNOtL2qj3SiU1ZTkEiFVz2E
         Kq0SHyixm6G1ni/M7t55q9N46455ldlYi+SKzuIHg60zUI9+lML3h/nRksUyKEAwMRhG
         8WpTeM7OnQVyp/hEz7yonbWKUjith5/+qFfsRt9aq+hN8FzB4h/EUfTBDgMag/sIDAVl
         M+vjGuKid3tsteccQxJlen4NHGciFVvjMYaHlwQWJdngkVSb5G2zgDhmWoHO04I752kZ
         MF4Q==
X-Gm-Message-State: ACrzQf0E+jtAqmwXO0mF9Yf131fwFs8Nb0osIOveoYVhZL2eSNM1iY7d
        qzOu0A1AT8rK3eWk20E/KAcE4g==
X-Google-Smtp-Source: AMsMyM6HIg9IpN1mNWpdqZtj2j93/Iyw3M9sUvGGof79PVoq1smwD/7LKmoTc2DFE+th4tUJuOMIwg==
X-Received: by 2002:a05:6000:1846:b0:22b:66d:12bd with SMTP id c6-20020a056000184600b0022b066d12bdmr1825326wri.572.1664449238884;
        Thu, 29 Sep 2022 04:00:38 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff? ([2a01:e0a:982:cbb0:1f17:3ea3:4e46:dff])
        by smtp.gmail.com with ESMTPSA id t5-20020a0560001a4500b002286670bafasm6518619wry.48.2022.09.29.04.00.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 04:00:38 -0700 (PDT)
Message-ID: <f9a51b99-7bd2-0b92-9afc-7cac84a5b65d@linaro.org>
Date:   Thu, 29 Sep 2022 13:00:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 04/11] clk: qcom: gcc-msm8974: move clock parent tables
 down
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20220929092145.473009-1-dmitry.baryshkov@linaro.org>
 <20220929092145.473009-5-dmitry.baryshkov@linaro.org>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220929092145.473009-5-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/09/2022 11:21, Dmitry Baryshkov wrote:
> Rearrage clock parent tables and PLL declarataions (pull parents down
Typo remains:                        s/declarataions/declarations/
> and gpll4 up), so that we can use pll hw clock fields in the next
> commit.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   drivers/clk/qcom/gcc-msm8974.c | 98 +++++++++++++++++-----------------
>   1 file changed, 49 insertions(+), 49 deletions(-)
> 

<snip>
With typo fixed:
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
