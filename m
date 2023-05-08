Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DDE3C77B73
	for <linux-clk@archiver.kernel.org>; Mon,  8 May 2023 08:27:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230187AbjEHI1g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 May 2023 04:27:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbjEHI1f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 May 2023 04:27:35 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08CBE44AD
        for <linux-clk@vger.kernel.org>; Mon,  8 May 2023 01:27:21 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2ac79d4858dso46656461fa.2
        for <linux-clk@vger.kernel.org>; Mon, 08 May 2023 01:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683534439; x=1686126439;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vzzV7o/cRkyKA4fMWXATwiDXCBGn/V28RB2TejGS6dQ=;
        b=BOxdMBvp1HrfPZ+qau8r94f0FRFatA17u+z22i0l2fkuKKHAaHiRTrYNuuq4bwxrM1
         6uQOneD4Kf93zRl1fUQOYNGuC4rRkQuqKbS8sP+CuvPQz/+OlqRZ6VLRjvhQwV4h1Bma
         3kToglCIn2qNbketePpc6CFP0/HUm/mWRQ+1xtjHZqclDwek5qsiW09dO7cF07eKtUt6
         hJgSljUmxH/Ew5NiZSIny+/M4A6UANFqIpv2JV0ZsdKH2vZZXeF4iqojRfiA59zNGx9j
         pN6qeSShY3FB//xOfBfHtTL/JSCHwUDjo9tnpHmrV98a4S/Ghe1ycQIIqkFBFRyNiqCB
         peWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683534439; x=1686126439;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vzzV7o/cRkyKA4fMWXATwiDXCBGn/V28RB2TejGS6dQ=;
        b=M6f8D/dzZwc1kn5LNAJmqFcesDznlIbIUD3afqRLk2q5vYhAfqED0lA7hDPtAhe4Vs
         1oTz0rSYK8+qRoXvuZWlmo6GppmGrmwNO4TiB5rFYVI044fKvrVNhWPUOubzjw2OInS0
         /nurVfVjvYLwAN+fH4QdySzlf/HMKne/LWCY17+f49CbbRTJl/5vqF/iilFYTsOZzYVs
         ADPNswvdw5HMDGTKeMxOIR0b7v9mcX84AXK5AGKpmCTcVyGVEPNxL/Vf3xssiY2bm2hu
         zPqvK6V7K+fRDgPVziVYtW7BL7Wmb9bO8QbYJi1F4kFTnS06ps6bsOHUrVxfcQ1xBlGq
         /Q0w==
X-Gm-Message-State: AC+VfDwhwTCm7Czul/6QZhX6LEHnSsYMZOBjEoIdQLJr0ngF8XRCS9H3
        65kq/zmL86vCnIiN1n4x9H5rug==
X-Google-Smtp-Source: ACHHUZ5qclbC/4fXs8Csx4zA7yUD6Fxk+2k5Mo6A6zP7h3IIYUYWAQruEGHiOsM/rUZaTmTea8Zq6Q==
X-Received: by 2002:a2e:2405:0:b0:2a7:73a2:d915 with SMTP id k5-20020a2e2405000000b002a773a2d915mr2448295ljk.5.1683534439064;
        Mon, 08 May 2023 01:27:19 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id i22-20020a2e9416000000b0029c36ebf89asm1088596ljh.112.2023.05.08.01.27.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 01:27:18 -0700 (PDT)
Message-ID: <e1ee4334-ee99-2495-89b6-6a67f4130747@linaro.org>
Date:   Mon, 8 May 2023 10:27:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20230507175335.2321503-1-dmitry.baryshkov@linaro.org>
 <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 2/2] clk: qcom: mmcc-msm8974: fix MDSS_GDSC power flags
In-Reply-To: <20230507175335.2321503-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 7.05.2023 19:53, Dmitry Baryshkov wrote:
> Using PWRSTS_RET on msm8974's MDSS_GDSC causes display to stop working.
> The gdsc doesn't fully come out of retention mode. Change it's pwrsts
> flags to PWRSTS_OFF_ON.
> 
> Fixes: d399723950c4 ("clk: qcom: gdsc: Fix the handling of PWRSTS_RET support")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
This is a stopgap solution, not exactly a fix, all signs on Heaven and
Earth say that 8974 should support retention on this GDSC!

*although*

pre-v2.2 chips don't

Konrad
>  drivers/clk/qcom/mmcc-msm8974.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/mmcc-msm8974.c b/drivers/clk/qcom/mmcc-msm8974.c
> index aa29c79fcd55..277ef0065aae 100644
> --- a/drivers/clk/qcom/mmcc-msm8974.c
> +++ b/drivers/clk/qcom/mmcc-msm8974.c
> @@ -2401,7 +2401,7 @@ static struct gdsc mdss_gdsc = {
>  	.pd = {
>  		.name = "mdss",
>  	},
> -	.pwrsts = PWRSTS_RET_ON,
> +	.pwrsts = PWRSTS_OFF_ON,
>  };
>  
>  static struct gdsc camss_jpeg_gdsc = {
