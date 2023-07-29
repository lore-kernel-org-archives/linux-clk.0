Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96421C41513
	for <linux-clk@archiver.kernel.org>; Sat, 29 Jul 2023 12:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229472AbjG2Mj4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 Jul 2023 08:39:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230091AbjG2Mj4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 Jul 2023 08:39:56 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D267F1BB
        for <linux-clk@vger.kernel.org>; Sat, 29 Jul 2023 05:39:54 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-3fe110de46dso12090875e9.1
        for <linux-clk@vger.kernel.org>; Sat, 29 Jul 2023 05:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690634393; x=1691239193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KYLF8GkDnhTx5rUfgByMfMBOvyYSMEjkN30gboXrHaY=;
        b=afmlzFkuBPFXsqfNcaQWZjaZwH9WaJjEP7GTgFvksOp40iWz5zsMMYoVOKxBuyQmB2
         XTsoWdQkgUnrM7SDlRvERmMvpP4sqBMC0+J9N5eqVTv7jEAmtKhJGyceDFye8DZgFwpd
         4xNXFyijEGdagPvRaTHJgK32pt4YZrREY3SjzKXoR4/MlN4hsAoe50JipjRWbDG8STib
         vtTVu7N1E7sePM7KbktXkI6E0pY/+PbrFInBO11NfVfMq4yTo+cN9qVdn12RVdJvSpIJ
         mZRUL3UKITEd7Ci/j1fZ/MtFR4pxDXUN12freYQyLYc/thoWKEMf6017iYT7IWr12bQM
         sRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690634393; x=1691239193;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KYLF8GkDnhTx5rUfgByMfMBOvyYSMEjkN30gboXrHaY=;
        b=iB+42ZtzifFzZoDD3vgBUYNyyBF1W66ZqgP+a1UtHIOxa+vEASShTFzWQITjy/r7Wj
         mWJ1Hs8HeelMpJy7y2zXTitaB6/fWEeEwvY1uLjlJxjVlVvvfhMiylV1hYB3sXQIdQQD
         q/3wHpONDnCtblMmnYG/+6K67hzHrbw5q6KZAxaWkZtmK8/n9LylLHcjJS76F6bqUyzP
         pSmGF50gdxio4bsPzWHdYr3ilPNdQQcJKZUalA/K77uIhcGJCUxp2K39LKJFyWSaNHtm
         0WyLgU1HpfUhA0twDs1wxp+Fd0cxI4IH5xNRf8AoU+Z3xvn/L51oxMpAyfipQ7QJzE+4
         SMtg==
X-Gm-Message-State: ABy/qLYir1U1fjxHsAfFfZPzqS8FEIvrL3tKCrP+y+yDKyxml+I536uR
        syfhevDuBeD8pVB8ly9+5y0tFg==
X-Google-Smtp-Source: APBJJlGIfCQfZ3VGJfA5hhRjITx/VVf16FmUlqbHwGKxS5JDxe5bjR4RGkAzarVbIHA1pZvTv7dPiQ==
X-Received: by 2002:a1c:ed0d:0:b0:3fb:dd5d:76b with SMTP id l13-20020a1ced0d000000b003fbdd5d076bmr3546151wmh.7.1690634392660;
        Sat, 29 Jul 2023 05:39:52 -0700 (PDT)
Received: from [192.168.0.162] (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id k17-20020adfe8d1000000b003143867d2ebsm7360123wrn.63.2023.07.29.05.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Jul 2023 05:39:52 -0700 (PDT)
Message-ID: <deb24fd5-6760-4e3c-f6b6-444cee689bd4@linaro.org>
Date:   Sat, 29 Jul 2023 13:39:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] clk: qcom: gcc-sm8250: Fix gcc_sdcc2_apps_clk_src
Content-Language: en-US
To:     Patrick Whewell <patrick.whewell@sightlineapplications.com>
Cc:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        William Gray <william.gray@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230728191423.13837-1-patrick.whewell@sightlineapplications.com>
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20230728191423.13837-1-patrick.whewell@sightlineapplications.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/07/2023 20:14, Patrick Whewell wrote:
> Set .flags = CLK_OPS_PARENT_ENABLE to fix "gcc_sdcc2_apps_clk_src: rcg
> didn't update its configuration" error.
> 
> Signed-off-by: Patrick Whewell <patrick.whewell@sightlineapplications.com>
> Fixes: 3e5770921a88 ("clk: qcom: gcc: Add global clock controller driver for SM8250")
> ---
>   drivers/clk/qcom/gcc-sm8250.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/qcom/gcc-sm8250.c b/drivers/clk/qcom/gcc-sm8250.c
> index b6cf4bc88d4d..d3c75bb55946 100644
> --- a/drivers/clk/qcom/gcc-sm8250.c
> +++ b/drivers/clk/qcom/gcc-sm8250.c
> @@ -721,6 +721,7 @@ static struct clk_rcg2 gcc_sdcc2_apps_clk_src = {
>   		.name = "gcc_sdcc2_apps_clk_src",
>   		.parent_data = gcc_parent_data_4,
>   		.num_parents = ARRAY_SIZE(gcc_parent_data_4),
> +		.flags = CLK_OPS_PARENT_ENABLE,
>   		.ops = &clk_rcg2_floor_ops,
>   	},
>   };

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
