Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481B2C43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 00:11:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0608B20645
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 00:11:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xt9TC+t5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0608B20645
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727132AbeK2LOb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 06:14:31 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:33979 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbeK2LOb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 06:14:31 -0500
Received: by mail-pf1-f196.google.com with SMTP id h3so78510pfg.1
        for <linux-clk@vger.kernel.org>; Wed, 28 Nov 2018 16:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=GFyptxggJtejOE3476NS2ELCkdBoYiu1nTR47eTYahc=;
        b=Xt9TC+t5y2hoKfXcUG/7FslbIk71wPUO1vjnh9OI7mEC7kJkAEKNELM5b0A0fPxRpR
         I+9qRYB2mvxc50T65Kds/K/bDc14lB3azZOwv0zKHDfy9+gx2pLCG1mOgKEoeBxRYvMJ
         yW+BoJHFyKnsgDQWbkXOa7fVrcQ6E50RS9OTQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GFyptxggJtejOE3476NS2ELCkdBoYiu1nTR47eTYahc=;
        b=Hs9NNyC/qX5cq/GvAq/M5lmWxp3+uJ2iz0k/xvkomQNH2SLJFfol2PIUqAVBbAJ8Q+
         i2x/k0h5ug5dm49xfJgSwCAXXdhSjRAhgA5D2khGujqrVgfgVnzVglZdQdq4DrivVpaL
         8+AibGgb8cYdOd9qxsX+KTkziFSPDaCbitSSq6Ry6mFd2KR16o6dW8z13UYtFcOWBRsR
         g+RXHBSWPqduA6CN23DZQlmAV7iFze0PB5b1SVMp5Uu1mx5Y2ypr+8pAWM0kg6RTw9nJ
         3bkq5lpOemyO3K0WgpMGUifSMd1YDDNzU23PtbmwKXcMrcIhPquIazihb5JN0vGLHjOo
         a/WA==
X-Gm-Message-State: AA+aEWY5ZP+EdAVu4aoteMNlfBp1265y2OlMYh9zC030k1s1hDAe5OKR
        OvxiTUoONkU5RcrkwgqGl12cZA==
X-Google-Smtp-Source: AFSGD/V7jUoNHm5E0zaXOp6CTWpeRPdEBKPD8aiZddI/mDF90EO+i4aR9/d6ouA/C4g14tbYEkNRhw==
X-Received: by 2002:aa7:80d7:: with SMTP id a23mr2319182pfn.86.1543450266639;
        Wed, 28 Nov 2018 16:11:06 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a4sm73880pgv.70.2018.11.28.16.11.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Nov 2018 16:11:05 -0800 (PST)
Date:   Wed, 28 Nov 2018 16:11:03 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, andy.gross@linaro.org,
        david.brown@linaro.org, rnayak@codeaurora.org,
        okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: Add a dummy enable function for GX gdsc
Message-ID: <20181129001103.GI24969@minitux>
References: <20181126165416.32519-1-jcrouse@codeaurora.org>
 <20181126165416.32519-3-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181126165416.32519-3-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 26 Nov 08:54 PST 2018, Jordan Crouse wrote:

> Most of the time the CPU should not be touching the GX
> domain on the GPU except for a very special use case when
> the CPU needs to force the GX headswitch off. Add a
> dummy enable function for the GX gdsc to simulate success
> so that the pm_runtime reference counting is correct.
> 
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/clk/qcom/gpucc-sdm845.c | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
> index 11222f487a65..7266e9a1d77e 100644
> --- a/drivers/clk/qcom/gpucc-sdm845.c
> +++ b/drivers/clk/qcom/gpucc-sdm845.c
> @@ -131,11 +131,37 @@ static struct gdsc gpu_cx_gdsc = {
>  	.flags = VOTABLE,
>  };
>  
> +/*
> + * On SDM845 the GPU GX domain is *almost* entirely controlled by the GMU
> + * running in the CX domain so the CPU doesn't need to know anything about the
> + * GX domain EXCEPT....
> + *
> + * Hardware constraints dictate that the GX be powered down before the CX. If
> + * the GMU crashes it could leave the GX on. In order to successfully bring back
> + * the device the CPU needs to disable the GX headswitch. There being no sane
> + * way to reach in and touch that register from deep inside the GPU driver we
> + * need to set up the infrastructure to be able to ensure that the GPU can
> + * ensure that the GX is off during this super special case. We do this by
> + * defining a GX gdsc with a dummy enable function and a "default" disable
> + * function.
> + *
> + * This allows us to attach with genpd_dev_pm_attach_by_name() in the GPU
> + * driver. During power up, nothing will happen from the CPU (and the GMU will
> + * power up normally but during power down this will ensure that the GX domain
> + * is *really* off - this gives us a semi standard way of doing what we need.
> + */
> +static int gx_gdsc_enable(struct generic_pm_domain *domain)
> +{
> +	/* Do nothing but give genpd the impression that we were successful */
> +	return 0;
> +}
> +
>  static struct gdsc gpu_gx_gdsc = {
>  	.gdscr = 0x100c,
>  	.clamp_io_ctrl = 0x1508,
>  	.pd = {
>  		.name = "gpu_gx_gdsc",
> +		.power_on = gx_gdsc_enable,
>  	},
>  	.pwrsts = PWRSTS_OFF_ON,
>  	.flags = CLAMP_IO | AON_RESET | POLL_CFG_GDSCR,
> -- 
> 2.18.0
> 
