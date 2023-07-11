Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38BC9EB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jul 2023 10:25:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229583AbjGKKZS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jul 2023 06:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230053AbjGKKZS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jul 2023 06:25:18 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B84371A2
        for <linux-clk@vger.kernel.org>; Tue, 11 Jul 2023 03:25:15 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso8891180e87.3
        for <linux-clk@vger.kernel.org>; Tue, 11 Jul 2023 03:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689071114; x=1691663114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ap+Qilr7pP6gSy0LE7uHCYSIgV8Afel7/d4HNsbNnYA=;
        b=cyT5Q24B7H+TmYoe63NuWLwe9D8Jphm2YMzl7JBVssHGjd5OBuhpsFDV4P/x0RhbnZ
         LQKV6hr6BmO7AgYGVd57DoA78/w1Skx9mQy7+a7zJHWqOaf/XoZlfPEST/KONoOe9mvb
         bA9p6S4hf7t6g4iOFM54uiH67rhW9UURxQODfSrcNeg2vW7qsT1/bd1y3O4R6Zk9dz72
         enquOMRIwVgJqvReaf8myDsm0DGCh/48dQVLRBoXLjdDD5qsWTa3jptaY0pkt6rfNV5f
         IgCZ25TW9B8cgOxzAWeaDAFaDXM9h0ri1C0LaquBR7whsiXtlnvpKYuZ2hkXT6SYMncF
         lJHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689071114; x=1691663114;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ap+Qilr7pP6gSy0LE7uHCYSIgV8Afel7/d4HNsbNnYA=;
        b=lTc5QXeoqdzXnyhA6a8h2nHQzagwtjMpTDKrX9KEHxjPcaUJ7tGIqAzuIIgeo6s7T6
         /tKxUseJmYT22Gl/EJQjvji2P6ZcAm0OT8WUR77E23GNNFcxXgfhEjLOq5Ij7K+LuVnr
         +3w8mWESPNq5JfOGQFTd3yg0GgMs8ZeDD8UPtmk/9sCBXwlVjegyvsRKAblQvdZdF8P2
         2g0upLUcmpyyaV8Xj6qDlJMn0G/B6TyqX+hv78aPcRslw6+2+e9TqN9c8vMDNNm/eXIQ
         6k4t6DBlQxbIvRQSe7Y3o9Q1JD2KNidyPSjt5HzdpWcg0lKtBzR+27zJlDrCKjKTuFBz
         hANA==
X-Gm-Message-State: ABy/qLaeruL9xEcvoC6cKQ7/dXbaKDSthFLsiisDBGG0uzUGFKklyVau
        MWgLr1MQ1kN4MjpoSa9ubvTyDg==
X-Google-Smtp-Source: APBJJlEI1MBBNehgLKJV8ioSBy96KjyisYgRyyr0tV5x8hA/Ydijb7i3TewFQrl8uZrL2w9Z81nWdw==
X-Received: by 2002:a05:6512:5d7:b0:4f9:5a87:1028 with SMTP id o23-20020a05651205d700b004f95a871028mr11004577lfo.30.1689071113857;
        Tue, 11 Jul 2023 03:25:13 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w28-20020ac2599c000000b004fb759964a9sm258645lfn.168.2023.07.11.03.25.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jul 2023 03:25:13 -0700 (PDT)
Message-ID: <8433cbfa-52c5-90c5-1e4c-0b13236d2153@linaro.org>
Date:   Tue, 11 Jul 2023 13:25:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/6] clk: qcom: gcc-ipq9574: Mark nssnoc clocks as
 critical
Content-Language: en-GB
To:     Devi Priya <quic_devipriy@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org, p.zabel@pengutronix.de,
        richardcochran@gmail.com, arnd@arndb.de, geert+renesas@glider.be,
        neil.armstrong@linaro.org, nfraprado@collabora.com,
        rafal@milecki.pl, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        netdev@vger.kernel.org
Cc:     quic_saahtoma@quicinc.com
References: <20230711093529.18355-1-quic_devipriy@quicinc.com>
 <20230711093529.18355-3-quic_devipriy@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230711093529.18355-3-quic_devipriy@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/07/2023 12:35, Devi Priya wrote:
> Mark nssnoc clocks as critical as they are to be turned on to access
> nss port tx/rx clocks.

Can you please clarify, if these are turned off, one can not access 
nsscc clocks? Then the nsscc should be the consumer of these clocks 
(instead of declaring them as critical). May be using pm_clk for nsscc 
will work. If not, you'll have to do that manually from 
runtime_suspend/runtime_resume callbacks.

> 
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
>   drivers/clk/qcom/gcc-ipq9574.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gcc-ipq9574.c b/drivers/clk/qcom/gcc-ipq9574.c
> index 6914f962c893..b68addc6f687 100644
> --- a/drivers/clk/qcom/gcc-ipq9574.c
> +++ b/drivers/clk/qcom/gcc-ipq9574.c
> @@ -2166,7 +2166,7 @@ static struct clk_branch gcc_nssnoc_nsscc_clk = {
>   				&pcnoc_bfdcd_clk_src.clkr.hw
>   			},
>   			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>   			.ops = &clk_branch2_ops,
>   		},
>   	},
> @@ -2565,7 +2565,7 @@ static struct clk_branch gcc_nssnoc_snoc_clk = {
>   				&system_noc_bfdcd_clk_src.clkr.hw
>   			},
>   			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>   			.ops = &clk_branch2_ops,
>   		},
>   	},
> @@ -2582,7 +2582,7 @@ static struct clk_branch gcc_nssnoc_snoc_1_clk = {
>   				&system_noc_bfdcd_clk_src.clkr.hw
>   			},
>   			.num_parents = 1,
> -			.flags = CLK_SET_RATE_PARENT,
> +			.flags = CLK_SET_RATE_PARENT | CLK_IS_CRITICAL,
>   			.ops = &clk_branch2_ops,
>   		},
>   	},

-- 
With best wishes
Dmitry

