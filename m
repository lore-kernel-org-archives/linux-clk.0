Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E96C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 29 Apr 2022 14:42:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377665AbiD2Opr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 29 Apr 2022 10:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377366AbiD2Opo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Apr 2022 10:45:44 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F86867D1D
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 07:42:25 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id h29so7189319lfj.2
        for <linux-clk@vger.kernel.org>; Fri, 29 Apr 2022 07:42:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=pbkWm4e4g0Ei7WvLv3KuWHkYdrue95SLVxUwy+am5Sc=;
        b=wSek+3tA4a3bzfyCNrLX29enessoWGqvs1EGdkfUJeN3O0YmvpIvnlFnzavuNxCcFx
         00trmatmpnrZdcsB9K/O6dHvHttWdcH4qr8S54yfMjno7M2vfajXBi4C3ZpLNQhwgnTb
         kWG3sdKuG1E55PQwbLV9xoZcbrNQVRc2fJ3eYfB5i1rkf37UAz+a+/eg98zmB2GrdLZ0
         ZcUO0e4tpXlW+ctVDQ/0XMBGiQnvcjidv4oNZVTfxv8Sjd9Ij5VuwQF/ZZv/plrxquOg
         pwTrfHboanAyzMWKbf1RP6ItqVKw3vSVmrUwI6xwG1uPEGage7+BnSjddFwWUORXBNM6
         j7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=pbkWm4e4g0Ei7WvLv3KuWHkYdrue95SLVxUwy+am5Sc=;
        b=DV1f7M42FcrElgKDXWRxU+3BaxULtrE7pKNiIAEGCFeAJNfHzI7e+CHYSPcNVTE3eA
         1pKwQY0LbQ2KNXcQr4ubrLcfBfV8tXCCssQ9WNL9t/aiduNOfM9NVXYS+LZxm0UkERWO
         70YTaZouMdeHqh9czKcZHytnOouw1NXY+FC0HJJGWl9dLTMr6w2bRopWakcY9wweIQno
         apqv1MMjZxwsiDH+ScDIZgdNGELMeCYFxo1beSXS26E3mO1hGpeSB5xF2kcutGVMW4SS
         eH/HGFGKCM4rUrdDOQhGYV444u3a/bsZgpUnKKLamqbwURSXFQyEV2AS/8GKt0dEId1h
         aT1Q==
X-Gm-Message-State: AOAM531a8QUqgbZOmlnxid0O5GqHLJ35Vv6/AHSN+oQZMApxDz8X8lSb
        ZsuIq0xl4mna2xjxz77vjcf+kg==
X-Google-Smtp-Source: ABdhPJyOHWn3rXr9v6Hf8u+ddZTcLxtGJiDZG6gyglrbbbKvOgn6/9vkHo8Cx4xAnxPuY5TtW3m4FQ==
X-Received: by 2002:a05:6512:39c9:b0:472:4699:89c7 with SMTP id k9-20020a05651239c900b00472469989c7mr2640331lfu.564.1651243343922;
        Fri, 29 Apr 2022 07:42:23 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id p22-20020a056512329600b0047223ec4809sm252483lfe.145.2022.04.29.07.42.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Apr 2022 07:42:23 -0700 (PDT)
Message-ID: <506f1669-b3a0-1543-9d9c-2a0931a2e3f2@linaro.org>
Date:   Fri, 29 Apr 2022 17:42:22 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 1/4] clk: qcom: clk-hfpll: use poll_timeout macro
Content-Language: en-GB
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sricharan R <sricharan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20220429120108.9396-1-ansuelsmth@gmail.com>
 <20220429120108.9396-2-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220429120108.9396-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/04/2022 15:01, Ansuel Smith wrote:
> Use regmap_read_poll_timeout macro instead of do-while structure to tidy
> things up. Also set a timeout to prevent any sort of system stall.
> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/clk/qcom/clk-hfpll.c | 15 +++++++++------
>   1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-hfpll.c b/drivers/clk/qcom/clk-hfpll.c
> index e847d586a73a..7dd17c184b69 100644
> --- a/drivers/clk/qcom/clk-hfpll.c
> +++ b/drivers/clk/qcom/clk-hfpll.c
> @@ -72,13 +72,16 @@ static void __clk_hfpll_enable(struct clk_hw *hw)
>   	regmap_update_bits(regmap, hd->mode_reg, PLL_RESET_N, PLL_RESET_N);
>   
>   	/* Wait for PLL to lock. */
> -	if (hd->status_reg) {
> -		do {
> -			regmap_read(regmap, hd->status_reg, &val);
> -		} while (!(val & BIT(hd->lock_bit)));
> -	} else {
> +	if (hd->status_reg)
> +		/*
> +		 * Busy wait. Should never timeout, we add a timeout to
> +		 * prevent any sort of stall.
> +		 */
> +		regmap_read_poll_timeout(regmap, hd->status_reg, val,
> +					 !(val & BIT(hd->lock_bit)), 0,
> +					 100 * USEC_PER_MSEC);
> +	else
>   		udelay(60);
> -	}
>   
>   	/* Enable PLL output. */
>   	regmap_update_bits(regmap, hd->mode_reg, PLL_OUTCTRL, PLL_OUTCTRL);


-- 
With best wishes
Dmitry
