Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCD12C63797
	for <linux-clk@archiver.kernel.org>; Sun, 15 Jan 2023 16:11:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbjAOQLh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 15 Jan 2023 11:11:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231150AbjAOQLg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 15 Jan 2023 11:11:36 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB01ACC13
        for <linux-clk@vger.kernel.org>; Sun, 15 Jan 2023 08:11:34 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id u19so62836454ejm.8
        for <linux-clk@vger.kernel.org>; Sun, 15 Jan 2023 08:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCTiFIBsz+mA+RBLRcWdYu9eMO+UAxD9uKThfcsKYDE=;
        b=wOtk3RHpHDrvp/2ct7en+pwljKn3TTcFH82jnoLSdNZM3YyjU1N2dRgZwu0CK7doUk
         OSATfYtZpKvdaiIEJkKSitxg2gVKReYxyHgnAQpq4psLuM5tXqVWwV1Be9PntztXwSi1
         pHNZt0UXLa7y9tCP+BTUjqJ4Q+BQaUjVnN608IdfC/wgRJDBBISlmEZLv4CF65Z1JDog
         vIl51CjSKsz4KZCnjc0GeuuW5/9LF4rYu6HFV5ck007JBpyP1qPOgkJaoiCELPSJqG9m
         N1nTorQ5Gy3Rbky/ct2yRGQDh+YuWMMRyw25Wvl1Qq1BsBg/g7k19g02qp+Rk2JBQGK4
         +DgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCTiFIBsz+mA+RBLRcWdYu9eMO+UAxD9uKThfcsKYDE=;
        b=XAM+/CrEZYo+wSCJehP69nJEhu/dI1kLQ8RckXVFg7v+XmEDU8lMCPxk3mrg+I3PoC
         5VRypNDWkvBFn36NuTCeLXVeNQW7KlrlW7xIs3nB9u1EQIaEcXd/Br9kL+eAo+IbiefW
         m56lyEyQ0Xx67faI0OLL5WWvwKNzR3imRDXy+b5Y/CVfMF90bQbxKJwinlVLwlchVGRU
         Ea4MWAwRcBCy0eLXom+OGi6PLU4s4GG/GwrUg4aAYghpNzBx8PehP9b1n/9Teg7TFJ5N
         /1B25LUSxjBxQnBQbNTkB61yEwO6Tm5UBPbJnySA2Yrg8du5JonRB3O8H3l2E/lJUk3K
         EXUg==
X-Gm-Message-State: AFqh2kopabDWDyQLWcXRg+uDxlIBTDtKt1lO9ffyEEwYC9OtIRqxpQuL
        MeMtcwYIgj8wx0XCA/HyBm7ypzibG62e0xzs
X-Google-Smtp-Source: AMrXdXupc2CzIStk6SHRrwiCJtsdSVrSUOx57XyaG3i3NMYkNDzLELTLZfW6IYtG/Y50W8tMZQAoYA==
X-Received: by 2002:a17:907:6026:b0:84d:445b:8aa6 with SMTP id fs38-20020a170907602600b0084d445b8aa6mr19617790ejc.70.1673799093344;
        Sun, 15 Jan 2023 08:11:33 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id 11-20020a170906318b00b0078d3f96d293sm10825646ejy.30.2023.01.15.08.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jan 2023 08:11:32 -0800 (PST)
Date:   Sun, 15 Jan 2023 18:11:31 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Remove need for clk_ignore_unused on sc8280xp
Message-ID: <Y8Qls7iBCT4bWY24@linaro.org>
References: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-12 20:10:38, Bjorn Andersson wrote:
> With the transition of disabling unused clocks at sync_state, rather
> than late_initcall() it's now possible to drop clk_ignore_unused and
> unused clock disabled once client drivers have probed. Do this on
> SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
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
> -- 
> 2.37.3
> 
