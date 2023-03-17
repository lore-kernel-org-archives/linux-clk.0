Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CE22C6FD1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 12:14:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230034AbjCQMOB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 08:14:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbjCQMOA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 08:14:00 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1A1E521E3
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 05:13:58 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id bi9so6182248lfb.12
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 05:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679055237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=83U2jLiLn7IaOmKXStZYTfl67I48v7+ZeyuCVBIILts=;
        b=cH9kWSsGThr2YarnxMONCf2X8PtI67bYIGQkrTru4RxWE7dWDDuUQ0iqbUhKkAM6X3
         fzBbo8+EYV2VZrwqgbweLL7y2VzxHg80mj7XugfSn2n4yMCWTGivXBMS8r4Of2Yvoi6n
         KswyLgpsPOdGXhgq+nm/kvfbKH+G320Ll+3aWTUtvuDoYFF6tiPJCEkQTtAnpERWBCKR
         cZalWa+fXAmZxUS/gGjLKuAZ1je1ftF8Pf9zRb0FRxldh83vK15foHOnRBMYnYGgc7V5
         iQsG3qzbRLUBnSjeFku14VpaSP14e08KV3BIUHkgs1WThEYYcsMgVXSqG3EzKuINZ5WH
         twxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679055237;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=83U2jLiLn7IaOmKXStZYTfl67I48v7+ZeyuCVBIILts=;
        b=BssbLQn/g0E7kWdTuu9stnN68b1210PO5wFDj8WIgNchPwhzq7vjHqM6WDqH9nUrXM
         o0TYWc4Oi6Z91zq7yViddR3MZ0I7MAeU1L+9wE/3lVKtARpP/lYGQXKmJW1x7iP0TVVM
         9OQwDkNntV0G3BQR8Sa6YIdvliKLgFwvY6FkBPkjEyYdF4WtqQAjIt9k9JVQYdPAVkmN
         uPwTtTDxm09o7AnrQ7HU/L8A3avycC30ysUy94vfwSgqv5+DKUm4eBYCJ32skVFFzgq3
         cRs0vR5R1qWstsK9hYBnyFTDHYeoN/nSMGfRc/xh73aBwjPrwU83yTCOxeW7okDl+Mie
         GxPg==
X-Gm-Message-State: AO0yUKU14Cv9ztAMmrxhkjQxgDreI9julAoWbCOsZcBUqrqv/VwnH9xq
        GRzujEGqFAInrcYsYMF2vsZTfQ==
X-Google-Smtp-Source: AK7set9LGs58S9Z7/HdJn2wBUJ5Td7GhsgiBh6ePhghD0PO0si0Jx4wEuI4NpmQBkhz8ayhj7+oDfA==
X-Received: by 2002:ac2:5d63:0:b0:4e8:47cd:b4ba with SMTP id h3-20020ac25d63000000b004e847cdb4bamr3697975lft.13.1679055237154;
        Fri, 17 Mar 2023 05:13:57 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id m15-20020a056512014f00b004d0b1327b75sm365251lfo.61.2023.03.17.05.13.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Mar 2023 05:13:56 -0700 (PDT)
Message-ID: <baf9336d-fd53-b01e-6e1c-1efdbb1a35dd@linaro.org>
Date:   Fri, 17 Mar 2023 13:13:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] clk: qcom: Remove the unused variables
Content-Language: en-US
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        andersson@kernel.org
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abaci Robot <abaci@linux.alibaba.com>
References: <20230317062045.130638-1-jiapeng.chong@linux.alibaba.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230317062045.130638-1-jiapeng.chong@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 17.03.2023 07:20, Jiapeng Chong wrote:
> Variable gpucc_parent_map_2 and gpucc_parent_data_2 is not effectively
> used, so delete it.
> 
> drivers/clk/qcom/gpucc-sm6375.c:145:37: warning: unused variable 'gpucc_parent_data_2'.
> drivers/clk/qcom/gpucc-sm6375.c:139:32: warning: unused variable 'gpucc_parent_map_2'.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Link: https://bugzilla.openanolis.cn/show_bug.cgi?id=4555
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
This is fixed already

https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=54ed70b57623e18f6c18f510cbe1e741bca89f34

Konrad
>  drivers/clk/qcom/gpucc-sm6375.c | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gpucc-sm6375.c b/drivers/clk/qcom/gpucc-sm6375.c
> index eb9ffa956950..d8f4c4b59f1b 100644
> --- a/drivers/clk/qcom/gpucc-sm6375.c
> +++ b/drivers/clk/qcom/gpucc-sm6375.c
> @@ -136,18 +136,6 @@ static const struct clk_parent_data gpucc_parent_data_1[] = {
>  	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
>  };
>  
> -static const struct parent_map gpucc_parent_map_2[] = {
> -	{ P_BI_TCXO, 0 },
> -	{ P_GCC_GPU_GPLL0_CLK_SRC, 5 },
> -	{ P_GCC_GPU_GPLL0_DIV_CLK_SRC, 6 },
> -};
> -
> -static const struct clk_parent_data gpucc_parent_data_2[] = {
> -	{ .index = P_BI_TCXO },
> -	{ .index = DT_GCC_GPU_GPLL0_CLK_SRC },
> -	{ .index = DT_GCC_GPU_GPLL0_DIV_CLK_SRC },
> -};
> -
>  static const struct freq_tbl ftbl_gpucc_gmu_clk_src[] = {
>  	F(200000000, P_GCC_GPU_GPLL0_DIV_CLK_SRC, 1.5, 0, 0),
>  	{ }
