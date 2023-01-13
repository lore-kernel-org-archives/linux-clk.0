Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAE1C54EBD
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 04:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235113AbjAMEVU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 23:21:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235584AbjAMEU3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 23:20:29 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B507669B9
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 20:16:29 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id j17so31418494lfr.3
        for <linux-clk@vger.kernel.org>; Thu, 12 Jan 2023 20:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=URtOFWc4Y3NxXCjmj7AoFN5jaz8UOuGFeVdCsjgAKHQ=;
        b=n15d5i1b2JsF8ap0e3rcuLaCuH0PeyokVa8wCGGEM6lsGiHuwi14ThJo3h8e2SEiW8
         nnYqZQNvmtOucAd0ruIgTM1aZ9q14Hise7ZkAm+ZzrSkH1t3XL1CDVG/CTAMZW1DFm/a
         B1CNMhEK5uOwnpzNZVvFQK+kaeXJMG+2+/26d3UVJa/CR/Mo0MefuRbIZg+XPjgdhK1D
         NNa5VEo7/TdHA7cTcpdJ1tGsYDEU2O+Ujr6NonQbNjr46FuBM+qMyTB8ZXP3ACz7cTj1
         IvqWFbenwDmwH9Pzw0fsHNEANVJdvsBMEvW+7JMD9FNNoPGG8op4yyBW2IL3P3CFahCO
         bu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=URtOFWc4Y3NxXCjmj7AoFN5jaz8UOuGFeVdCsjgAKHQ=;
        b=afpCgMCyFxfoSVRhZ2Hnb9MiSo3WqLc2VReml/Krg+o6FhkSq8RXok8tXC/KTnYkGt
         ob8OsbCISnMuPo1aYbm4nJsgkZEbHrDUQriI/7rnG0gWAnp5zRDCzOXm8R23mNi+xw23
         Lv57mKlJDNbxSkYJj9sMhXZ2s33twsuaryT9THKUMCNuB5kf/iMfT8ufHTAy/0F8nxNC
         j6LprzPJz9IWsJ0zdqQLiVrxY67nQWekoDmec7wSx6cUGQfPxyjAQ3kVA0SVjCmiII3H
         A5glfCuGKhM6qsw7PJFCeyk2NutzEDV2HiV7zuawuDZXEoewG0qxQKj4hi5Vaaia30PN
         CjWQ==
X-Gm-Message-State: AFqh2kr5XgOqlklXpqM9S2UpfdQ5h9e3y3iUW7zpqqA8fbMkxALw2uYJ
        m+IgP6qE+tOBBDseRtovxpLoEA==
X-Google-Smtp-Source: AMrXdXvRHpkZJ1xwVK3MJlzWO9Gyuyj2XbYT3Ctq3VNKQBgDU1Ogv3R+JLOhJKYOu2PWtREwf7STIA==
X-Received: by 2002:a05:6512:38cc:b0:4a4:68b9:19f0 with SMTP id p12-20020a05651238cc00b004a468b919f0mr18223586lft.24.1673583387558;
        Thu, 12 Jan 2023 20:16:27 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
        by smtp.gmail.com with ESMTPSA id p18-20020a19f012000000b004cc9e4bc00esm922753lfc.2.2023.01.12.20.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jan 2023 20:16:26 -0800 (PST)
Message-ID: <d457ed7e-bfb3-b31d-72c5-ed8130e5c37e@linaro.org>
Date:   Fri, 13 Jan 2023 05:16:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] clk: qcom: Remove need for clk_ignore_unused on sc8280xp
Content-Language: en-US
To:     Bjorn Andersson <quic_bjorande@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The subject could be more in the likes of "use disable_unused sync_state"..

On 13.01.2023 05:10, Bjorn Andersson wrote:
> With the transition of disabling unused clocks at sync_state, rather
> than late_initcall() it's now possible to drop clk_ignore_unused and
> unused clock disabled once client drivers have probed. Do this on
> SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/clk/qcom/dispcc-sc8280xp.c | 1 +
>  drivers/clk/qcom/gcc-sc8280xp.c    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
> index 167470beb369..c84a6481b879 100644
> --- a/drivers/clk/qcom/dispcc-sc8280xp.c
> +++ b/drivers/clk/qcom/dispcc-sc8280xp.c
> @@ -3199,6 +3199,7 @@ static struct platform_driver disp_cc_sc8280xp_driver = {
>  	.driver = {
>  		.name = "disp_cc-sc8280xp",
>  		.of_match_table = disp_cc_sc8280xp_match_table,
> +		.sync_state = clk_sync_state_disable_unused,
>  	},
>  };
>  
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index b3198784e1c3..f4fdc5b9663c 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -7441,6 +7441,7 @@ static struct platform_driver gcc_sc8280xp_driver = {
>  	.driver = {
>  		.name = "gcc-sc8280xp",
>  		.of_match_table = gcc_sc8280xp_match_table,
> +		.sync_state = clk_sync_state_disable_unused,
>  	},
>  };
>  
