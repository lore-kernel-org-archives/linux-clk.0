Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F48EC63797
	for <linux-clk@archiver.kernel.org>; Sun, 15 Jan 2023 04:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229900AbjAOEMs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Jan 2023 23:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230358AbjAOEMq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Jan 2023 23:12:46 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A0D4682
        for <linux-clk@vger.kernel.org>; Sat, 14 Jan 2023 20:12:45 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id s3so16261900pfd.12
        for <linux-clk@vger.kernel.org>; Sat, 14 Jan 2023 20:12:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HbOf8QOA+SQUVuPMrmy7ht0oGGMULpTbRXbzXkjFY3A=;
        b=hjm9nN1bYtTMlwFOMG3d/0+hrsk/uXSUsl+L6pAydr0htkM4+OO62Iuwkqqs0F29+6
         c0Inh+d64SeNTprg+UR0YTa++EI8ir5du58JpUmpg/YPn/1Z4mFw6QHRIWm0DkokKYJY
         IGCYf4oFqvDwKhQT6Yb/1DvrPwzbCwYuJbcdHhFDNUELUme+hQYEz9WWUBxVoIDLHOoB
         JR4i3Re1Lcl1LNWxpLZ02HzAQRqCPSwY48jzSQ/Iw0lgMscSDyz/AhlTlHyMVNru71CS
         uwtPFYplAhOE0WPpf3UTWiRnmjGxwx+ZNafGG0o6W2yDhudUrGuliTVHBAfKHFbOUdcT
         BD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HbOf8QOA+SQUVuPMrmy7ht0oGGMULpTbRXbzXkjFY3A=;
        b=Tq8q6AKPluvUH8epcwga6ZHtXpKgVkxRuzZwM/Nc54yc0K5EfHvkS0piQmdGdKx9Ub
         3NqpKcA+Vw8/FW2o2hgoNJR7CRHtxulrMV9C4TOhNhpqau6qAb9ttF7MW/wGU9+EAVId
         Af3uTzDbJQkSkst5XYr9PuqVjvJlhFGvozlhIJO47LEVwJBJ9xc83u0nqV+395mTwmnV
         Db2NdIpK1wpsMQnNsGqg7W29kVaPaLPFP5mvZZFx10y88Eo0UOpftfbLO4ts6ynvGfzY
         1dao9zVtAdd5H6Zbe52QwEsQtSnExM5VMaEh0fV1LD3uy6m4asHJbTKerWBd2k2GwnAH
         17+w==
X-Gm-Message-State: AFqh2kq2h2v9Vynv1zi5TMfIW0TqOhGSE2QMOqu6KicOGl3OaYUqSECT
        Qwa6a6qVKE3Ea+zcY4sjTDhr
X-Google-Smtp-Source: AMrXdXstU3k+Ez9dUb7CwiCgHzcbkcy6cGiJpvcz1VmULRJ+tjsFA08gfUCtv2uGb2za3n8vLfag/A==
X-Received: by 2002:a62:2903:0:b0:57f:f2cd:6180 with SMTP id p3-20020a622903000000b0057ff2cd6180mr79015953pfp.0.1673755965296;
        Sat, 14 Jan 2023 20:12:45 -0800 (PST)
Received: from thinkpad ([220.158.159.143])
        by smtp.gmail.com with ESMTPSA id x6-20020a623106000000b0058bb8943c9asm3473463pfx.161.2023.01.14.20.12.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jan 2023 20:12:43 -0800 (PST)
Date:   Sun, 15 Jan 2023 09:42:39 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Remove need for clk_ignore_unused on sc8280xp
Message-ID: <20230115041239.GD6568@thinkpad>
References: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 12, 2023 at 08:10:38PM -0800, Bjorn Andersson wrote:
> With the transition of disabling unused clocks at sync_state, rather
> than late_initcall() it's now possible to drop clk_ignore_unused and
> unused clock disabled once client drivers have probed. Do this on
> SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

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

-- 
மணிவண்ணன் சதாசிவம்
