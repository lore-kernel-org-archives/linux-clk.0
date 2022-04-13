Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B13EC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 13 Apr 2022 17:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237162AbiDMRbL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Apr 2022 13:31:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236604AbiDMRbJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Apr 2022 13:31:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE7B36C48C
        for <linux-clk@vger.kernel.org>; Wed, 13 Apr 2022 10:28:47 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id bu29so4882694lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 13 Apr 2022 10:28:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=FNo+I9GAGanJLFi+i76TeBuEVOOSEjjny0k1u196lSk=;
        b=n6zmZui8R/44EJZ1zBFJvb6+hpwa6QjmX1EFAVWUUOUDV17usQp0Kwpb7ulEJQL9wl
         OFJB5cRBWULjZR0l0dXoXh1F1OHDBpXnnBedP/r/LjfvSYtiQ1UWWCxKIFdWZJMhgk0c
         W7dbn5TDMbFFc/Uhfrgu65MFkHvE1ZhkheCHi1dkZoM3CtRyEwnvbu+F2lSFI/GLQTXw
         LJD8+JfKEcE1mHkYKGDwkcos7qk7RgvzdTMi1EdksowHfTCjXDUprwac+l4RLWHDL3RY
         V1TZduEMi9L2q2aQT/pNYjtRc/FPN59H+dz1qpWzl0q4NSS9UKKMstXBsUlBzZxk+Qem
         BHLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=FNo+I9GAGanJLFi+i76TeBuEVOOSEjjny0k1u196lSk=;
        b=zL9ExhCdE5U18nzJUlY3r+uojdyy6x+52G7f2xfEgi/Rzs75VLFYkkw0UBNy49wKHx
         WSKE2IbE6s8Ot1uYfCiWod0tDXaSekEL5JxExO0RKMFNyKNvKrnCDqwTvdk94DvkU8T8
         NJgAvkAMK3YHMEXRyIj23aRkP/dk4Ky8o6Pwxy3hKeRQYqN2whOqY7hgfaB2U8h0UuuO
         E4Kx9FRFplGGCbI59Z1i7rqmBkIXt1aVeCDQkbtQKzCJIaOxvq3DMVMXU82z7vrniKf4
         PDf+DhAp6+2Sb/LfJ34eqgX3VIJ1/tMoX9SBaQxY/cVm/qTJeP29xUvf2wa+AQ8VfyN6
         fkHw==
X-Gm-Message-State: AOAM5318WzSxNdp+py1oCu0+eZS9EcLV3nJezlQTsRu5/5IBXSuBmd7L
        Vw59T3iMteC1p1G2GU0/m/nj1Q==
X-Google-Smtp-Source: ABdhPJzjvFgT7yA/F8R81dfytbv81OzF39Dg3ucpcUlBeH92XgV1yXsTItaYDDI4nz0JpAIDOhbBQg==
X-Received: by 2002:a05:6512:4004:b0:46c:39a4:ac76 with SMTP id br4-20020a056512400400b0046c39a4ac76mr3181124lfb.676.1649870926058;
        Wed, 13 Apr 2022 10:28:46 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i14-20020a198c4e000000b0044a279d25d2sm4209371lfj.244.2022.04.13.10.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 10:28:45 -0700 (PDT)
Message-ID: <5052e89f-244b-b76f-1889-5294243c6921@linaro.org>
Date:   Wed, 13 Apr 2022 20:28:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v6 13/18] clk: qcom: clk-krait: add enable disable ops
Content-Language: en-GB
To:     Ansuel Smith <ansuelsmth@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20220321231548.14276-1-ansuelsmth@gmail.com>
 <20220321231548.14276-14-ansuelsmth@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220321231548.14276-14-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/03/2022 02:15, Ansuel Smith wrote:
> Add enable/disable ops for krait mux. On disable the mux is set to the
> safe selection.

Why? It it used during system suspend? cpuidle? cpufreq?

> 
> Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
> ---
>   drivers/clk/qcom/clk-krait.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-krait.c b/drivers/clk/qcom/clk-krait.c
> index 7ba5dbc72bce..061af57b0ec2 100644
> --- a/drivers/clk/qcom/clk-krait.c
> +++ b/drivers/clk/qcom/clk-krait.c
> @@ -85,7 +85,25 @@ static u8 krait_mux_get_parent(struct clk_hw *hw)
>   	return clk_mux_val_to_index(hw, mux->parent_map, 0, sel);
>   }
>   
> +static int krait_mux_enable(struct clk_hw *hw)
> +{
> +	struct krait_mux_clk *mux = to_krait_mux_clk(hw);
> +
> +	__krait_mux_set_sel(mux, mux->en_mask);
> +
> +	return 0;
> +}
> +
> +static void krait_mux_disable(struct clk_hw *hw)
> +{
> +	struct krait_mux_clk *mux = to_krait_mux_clk(hw);
> +
> +	__krait_mux_set_sel(mux, mux->safe_sel);
> +}
> +
>   const struct clk_ops krait_mux_clk_ops = {
> +	.enable = krait_mux_enable,
> +	.disable = krait_mux_disable,
>   	.set_parent = krait_mux_set_parent,
>   	.get_parent = krait_mux_get_parent,
>   	.determine_rate = __clk_mux_determine_rate_closest,


-- 
With best wishes
Dmitry
