Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8E9FC48BE8
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 16:07:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 94367610A0
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 16:07:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229642AbhFPQKC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 12:10:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234576AbhFPQKB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 12:10:01 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C3B2C061574
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 09:07:55 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id b37so4542405ljr.13
        for <linux-clk@vger.kernel.org>; Wed, 16 Jun 2021 09:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=UN+MCy79+aiReyg4GmhXPJbyl4AxyQ+BCC6wVSMU3qs=;
        b=Xh67aMJn1kR5JF657nNTe4s9thtnLQHLX2MfVEslORURhsfZ1yBwTFI3FqmhNgPUB3
         JN1MaODmmYAE8L98FSFRYGOWKER02v7vjZQC0qTuudjXgff/PXkLctkRclqygeS8Q7Rz
         yQeMFgaXhDbEJu7iaC52+B1OpDj5w6suBbq8LjFoK5OMy9pNVBaNMJ3wzXB05IypkZpW
         AeAY60BSUeUoINW657ynzPcEj0tVdrHvArY5kUiKwE1FFgYbEP8tr30BLLyutfPJN1VH
         vrmruNLQEQyQeP++m/P7/OalSWRiGGfBZaxXwo6/DCGDmzBWH+Ajh+RHRGCTT42POUgS
         dJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UN+MCy79+aiReyg4GmhXPJbyl4AxyQ+BCC6wVSMU3qs=;
        b=SFXRw/PqZeU58Y2T2mzGHBKpL0eFJq4e4ErGTy/oZE3Lk5tiKkeb1U/6xqYjiQ5b+T
         U7dxe6TG7wpfCWFcr0j64GRnvg+nEHhAr7V1GNGBAMsPVwY0fCpLaqSLqV4cKhbtc79z
         7fmBQcjwh7c+KSYzV458Kvg/QO2KAZ7PFXtNNgvihfX7HtFM5qHmKJ7KXEW2lDcxJjYL
         IwBuBn3Ey5sU8ooUqRs/j8gNoq8FoQGEggS65aO5LcXVIWXbhrxXThZlbnh5gX7eN0sw
         S8qzOGN4lLbYj2VfzNXzsZVQN9DVAHkZpfUxTNdTkAMBSyW9oNghwtLV93siyddbMxYD
         Mf7A==
X-Gm-Message-State: AOAM531JOIRqK93YqPUTP38jsZDf4rAb4+Ekx0v3tMgkCw06r5HJheTE
        /6gFJrm0OFQHTgd4xO3B+SKoDg==
X-Google-Smtp-Source: ABdhPJzR34d+/RTML7o8n2wnjNOlwYw3iPMzGh7qB07Op+cC0dHOoqVD/2S+NbcLjfJHYKF8CnUy3A==
X-Received: by 2002:a2e:858a:: with SMTP id b10mr465673lji.445.1623859673557;
        Wed, 16 Jun 2021 09:07:53 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x25sm286248lfc.305.2021.06.16.09.07.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 09:07:53 -0700 (PDT)
Subject: Re: [RFC v1 02/11] clk: qcom: rcg2: Add support for flags
To:     Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, robh+dt@kernel.org, jonathan@marek.ca,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vinod.koul@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
 <20210616141107.291430-3-robert.foss@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <b48198ff-a954-4941-32d6-65c992b345e7@linaro.org>
Date:   Wed, 16 Jun 2021 19:07:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616141107.291430-3-robert.foss@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/06/2021 17:10, Robert Foss wrote:
> These changes are ported from the downstream driver, and are used on SM8350
> for CAMCC, DISPCC, GCC, GPUCC & VIDEOCC.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/clk/qcom/clk-rcg.h  | 4 ++++
>   drivers/clk/qcom/clk-rcg2.c | 3 +++
>   2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rcg.h b/drivers/clk/qcom/clk-rcg.h
> index 99efcc7f8d88..a1f05281d950 100644
> --- a/drivers/clk/qcom/clk-rcg.h
> +++ b/drivers/clk/qcom/clk-rcg.h
> @@ -149,6 +149,10 @@ struct clk_rcg2 {
>   	const struct freq_tbl	*freq_tbl;
>   	struct clk_regmap	clkr;
>   	u8			cfg_off;
> +	u8			flags;
> +#define FORCE_ENABLE_RCG	BIT(0)
> +#define HW_CLK_CTRL_MODE	BIT(1)

Downstream also has these flags for 8250, but the upstream driver ended 
up not using them for the dispcc clocks. Could you please check that you 
realy need HW_CLK_CTRL for dispcc clocks?

> +#define DFS_SUPPORT		BIT(2)
>   };
>   
>   #define to_clk_rcg2(_hw) container_of(to_clk_regmap(_hw), struct clk_rcg2, clkr)
> diff --git a/drivers/clk/qcom/clk-rcg2.c b/drivers/clk/qcom/clk-rcg2.c
> index 42f13a2d1cc1..ed2c9b6659cc 100644
> --- a/drivers/clk/qcom/clk-rcg2.c
> +++ b/drivers/clk/qcom/clk-rcg2.c
> @@ -295,6 +295,9 @@ static int __clk_rcg2_configure(struct clk_rcg2 *rcg, const struct freq_tbl *f)
>   	cfg |= rcg->parent_map[index].cfg << CFG_SRC_SEL_SHIFT;
>   	if (rcg->mnd_width && f->n && (f->m != f->n))
>   		cfg |= CFG_MODE_DUAL_EDGE;
> +	if (rcg->flags & HW_CLK_CTRL_MODE)
> +		cfg |= CFG_HW_CLK_CTRL_MASK;
> +
>   	return regmap_update_bits(rcg->clkr.regmap, RCG_CFG_OFFSET(rcg),
>   					mask, cfg);
>   }
> 


-- 
With best wishes
Dmitry
