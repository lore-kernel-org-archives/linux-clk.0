Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C610C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 06:23:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6B9C61168
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 06:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233385AbhDIGX0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 02:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233383AbhDIGX0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Apr 2021 02:23:26 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC5AAC061762
        for <linux-clk@vger.kernel.org>; Thu,  8 Apr 2021 23:23:13 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id x21-20020a17090a5315b029012c4a622e4aso2656086pjh.2
        for <linux-clk@vger.kernel.org>; Thu, 08 Apr 2021 23:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y7eM9NOxV0/YJgk1/+DqK+RAGiy7J8VSlaHOoYfGcZ0=;
        b=xg1e2XKIJGCnu9rtT3vQ5jB8J47gAp+cBscH1HOv5eTTP1BtFeOJcrzQqSKQZko3Zt
         1a1BkvQjmsGVUPKufSF9mVOi30trvnkjubP/h7LnZQZvpF3bs86nmmDhQS6j9WjzM4lH
         diprXRbSl5n2iLYp+wFaEHHDAfYH2k3qG1+hor+iFtWHNKdbt91/0dkHb/KGw3kXyjz7
         VVQxRzt6+cMQd0v6MG2MPT/kNA2Lm5wNl9owZI7YjPvhorRGAhAAeoaVpX10etZGsLjL
         l0FKEQNjXheMWLj3h3fxm3fz64Devx/ZQLHvNcu3FmUa100ctkxJ01Tgy0Np6tRcc9Mq
         YpHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y7eM9NOxV0/YJgk1/+DqK+RAGiy7J8VSlaHOoYfGcZ0=;
        b=QSjkVddYfrCwM1La0orvvS8XiVtrAz41dQSDC6HfYVyyAuGI0fjAtFJ+RNdj+hOQsB
         muQBK19MZxXuaVsMp0o5ZBdCwxh9ckHgZYwdO+PrqY5ARMSyLoiNwqy4CUXyMoGa4D2j
         eC6UsS65ovcMpyxhHjaJJa/BQ0nTKElPhada7p9AMgtTcGMVQSBG893EETRt5PGIqIRn
         41PzNkjgiDbR0So571CizqKQdnzG2mFekSIyUw7xx5eKImUmCX3ur73ieFO3SL8P9roQ
         CarMw88+SNk2AVsYdGdTc8vZzMEUDE7wTmz3V+GiKFC238J+ptyKzNIlDY6eRmKzVUkW
         nPCg==
X-Gm-Message-State: AOAM5316gP+30wuwOXXwQr6354xpY2ipV5ECD/0B9PW1DVpYmF0L6eEd
        aBiwHuA2btZ54Lu9Qakk/eF8
X-Google-Smtp-Source: ABdhPJwqcPnHiZfVT81sTN1xfVUQ5KL2PK9I3uMYKi0LR7nqL97u0wRp8MFM4ZN00uHgga7iSwz6WA==
X-Received: by 2002:a17:90b:1490:: with SMTP id js16mr11908041pjb.131.1617949393034;
        Thu, 08 Apr 2021 23:23:13 -0700 (PDT)
Received: from work ([103.77.37.131])
        by smtp.gmail.com with ESMTPSA id d24sm1090136pjw.37.2021.04.08.23.23.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Apr 2021 23:23:12 -0700 (PDT)
Date:   Fri, 9 Apr 2021 11:53:08 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Chen Hui <clare.chenhui@huawei.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH -next] clk: qcom: Add missing MODULE_DEVICE_TABLE
Message-ID: <20210409062308.GB4376@work>
References: <20210408135509.208921-1-clare.chenhui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210408135509.208921-1-clare.chenhui@huawei.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Apr 08, 2021 at 09:55:09PM +0800, Chen Hui wrote:
> Add missing MODULE_DEVICE_TABLE entries to support module autoloading,
> as these drivers can be compiled as external modules.
> 
> Signed-off-by: Chen Hui <clare.chenhui@huawei.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/a53-pll.c      | 1 +
>  drivers/clk/qcom/a7-pll.c       | 1 +
>  drivers/clk/qcom/apss-ipq-pll.c | 1 +
>  3 files changed, 3 insertions(+)
> 
> diff --git a/drivers/clk/qcom/a53-pll.c b/drivers/clk/qcom/a53-pll.c
> index 45cfc57bff92..af6ac17c7dae 100644
> --- a/drivers/clk/qcom/a53-pll.c
> +++ b/drivers/clk/qcom/a53-pll.c
> @@ -93,6 +93,7 @@ static const struct of_device_id qcom_a53pll_match_table[] = {
>  	{ .compatible = "qcom,msm8916-a53pll" },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, qcom_a53pll_match_table);
>  
>  static struct platform_driver qcom_a53pll_driver = {
>  	.probe = qcom_a53pll_probe,
> diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
> index e171d3caf2cf..c4a53e5db229 100644
> --- a/drivers/clk/qcom/a7-pll.c
> +++ b/drivers/clk/qcom/a7-pll.c
> @@ -86,6 +86,7 @@ static const struct of_device_id qcom_a7pll_match_table[] = {
>  	{ .compatible = "qcom,sdx55-a7pll" },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, qcom_a7pll_match_table);
>  
>  static struct platform_driver qcom_a7pll_driver = {
>  	.probe = qcom_a7pll_probe,
> diff --git a/drivers/clk/qcom/apss-ipq-pll.c b/drivers/clk/qcom/apss-ipq-pll.c
> index 30be87fb222a..bef7899ad0d6 100644
> --- a/drivers/clk/qcom/apss-ipq-pll.c
> +++ b/drivers/clk/qcom/apss-ipq-pll.c
> @@ -81,6 +81,7 @@ static const struct of_device_id apss_ipq_pll_match_table[] = {
>  	{ .compatible = "qcom,ipq6018-a53pll" },
>  	{ }
>  };
> +MODULE_DEVICE_TABLE(of, apss_ipq_pll_match_table);
>  
>  static struct platform_driver apss_ipq_pll_driver = {
>  	.probe = apss_ipq_pll_probe,
> -- 
> 2.17.1
> 
