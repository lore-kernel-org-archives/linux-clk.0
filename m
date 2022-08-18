Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A96CC00140
	for <linux-clk@archiver.kernel.org>; Thu, 18 Aug 2022 07:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243831AbiHRHKi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Aug 2022 03:10:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243801AbiHRHKb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 03:10:31 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C1A895C6
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2022 00:10:29 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d14so965706lfl.13
        for <linux-clk@vger.kernel.org>; Thu, 18 Aug 2022 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=4AkHVnmH3Qgljaq8kspzBsE5mDKEXgmNmBcNRLyZpfo=;
        b=gZpAZJTQ8l5SemqKeTwFepwZXG7wa1f6L0zrraK6KM5GRT2GfnEYaougqWwQRTJJ3R
         tlGuMAGBrfDDtjT8pks99gfOWY72Be1YUWjrYzeTLja605yzJegKFQauEfHWnj7Yoq7m
         UEVGM+trkCYe22YUFEGun9AyKKldYjuOoRa7dyvN7AhsjEOyVd266XcZDIghdjHyF4/A
         ca3ezFZ8E89j/fDFlb54QHxDJbfcy/GWC0O0cyD/U4rmE4DL/R1Ow7ZmDip8wG3LE61Q
         LbH35rWVo8ULcDGxY6pbLmqiVUo7xR1S3B5Mr2/G559dnG9g7QscHBJ/t6T7ibcWCs2O
         nDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=4AkHVnmH3Qgljaq8kspzBsE5mDKEXgmNmBcNRLyZpfo=;
        b=IjFH9zXwmCPoBIGA9zBibvPKhYpdTgEnFc0bF1OKbc4YD3SXL/XO6wiiwkt5AJwfq1
         epz7d0C89kCUJYIaph1uXWCT2m5+KTibJ+0czmR79PiVz7RLf+cejrwBejDznSQn04bX
         UwpFmO1XgfXuG6DwiJuwlNMf4fF2gGkgNIjHuLtO18tkVcoh0UfED+VNrN/hBF01heQh
         mvFiFkaxNc/86MhtjahkEUX1mFcE70cPQfGQ0JQMUoGq817H65pfiiyC6Nea1LZlryj/
         nbGT1rDFTphWP0qZXs/hhWjQWNhBVG/NaXWOPn+D8+BsFXQMKLGIVPbKvqWHoD+771S/
         SwWg==
X-Gm-Message-State: ACgBeo3CoWVs6VL5JwrJhNvvoGoqIexf54emxegN6Jxh+ZhTL8bfhPph
        joq7xkuMSeGvBnLXU5EAkUc8lA==
X-Google-Smtp-Source: AA6agR5zsBQpMggDPWPhCVXkH4YrDgWCTxmfyFBqg6rPVwRLM6tjQlIRLnwexY8i61elDwn4FUH6Ag==
X-Received: by 2002:a05:6512:114a:b0:492:84b9:b376 with SMTP id m10-20020a056512114a00b0049284b9b376mr555220lfg.450.1660806628262;
        Thu, 18 Aug 2022 00:10:28 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id c10-20020a056512074a00b0048aee10096fsm112529lfs.82.2022.08.18.00.10.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 00:10:27 -0700 (PDT)
Message-ID: <5a22d41a-f7cc-0be0-8bd1-d7d2c2133ace@linaro.org>
Date:   Thu, 18 Aug 2022 10:10:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/5] clk: qcom: Allow custom reset ops
Content-Language: en-US
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>,
        freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220817202609.v2.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817202609.v2.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 17/08/2022 17:57, Akhil P Oommen wrote:

Thank you for your patch. There is something to discuss/improve.

>  
>  	return regmap_update_bits(rst->regmap, map->reg, mask, 0);
> diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
> index 2a08b5e..d4213b4 100644
> --- a/drivers/clk/qcom/reset.h
> +++ b/drivers/clk/qcom/reset.h
> @@ -8,9 +8,17 @@
>  
>  #include <linux/reset-controller.h>
>  
> +struct qcom_reset_ops {
> +	int (*reset)(void *priv);
> +	int (*assert)(void *priv);
> +	int (*deassert)(void *priv);
> +};
> +
>  struct qcom_reset_map {
>  	unsigned int reg;
>  	u8 bit;
> +	struct qcom_reset_ops *ops;

This should be pointer to const.


Best regards,
Krzysztof
