Return-Path: <SRS0=Vpf0=Q2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AF29C43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 07:02:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5B4B521848
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 07:02:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Uj58Q48O"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726814AbfBSHCy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Feb 2019 02:02:54 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40158 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725811AbfBSHCy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Feb 2019 02:02:54 -0500
Received: by mail-pl1-f195.google.com with SMTP id bj4so9959828plb.7
        for <linux-clk@vger.kernel.org>; Mon, 18 Feb 2019 23:02:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1hOcI0lLtRMTCRh8zihKEgLXOVKwdvIsonXWQ8Z+cUc=;
        b=Uj58Q48OGE70/2wDJup1INlHnUki8OgqN9V1MNHMC70JGiiN5QQn+B1JAirn8jmosR
         GAkTaUCRN9BdP4Mc39aSX4rBrbtW7D/Gy5JSjATO3EMd0XehBmm9zSOvq/zkO/3qNpWM
         3B8zrFWwBwvFnNmAqaF1B5hTDaqA27BJAhSs/ctTYMYIy2KkJ3d7UrO0RzEzNEJdSJzg
         fAozhVbhUk2/CCuUrXg9lR+gl1r+j4/061wlxkLbS2H49a/Ny5f/IiMrI6C9YJTJXtTT
         sM5eHHPQLvefkC9RjnX+anBqNrULDYEAS5UsjSZIng0viKnms2ti8+uZ/N2Qn2jFgPFa
         4i5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1hOcI0lLtRMTCRh8zihKEgLXOVKwdvIsonXWQ8Z+cUc=;
        b=Psw+hQQ56dAf+wiHaReh3ZLWHBSrltx/FMoKuWGb8AOgErZNH5ar4ZvasvsmevezdI
         4Sa/6s0e93d/kM3tugSpLsaDEIvn+7UvCgkyUMq1fugFsl5qEOZgQ/rZShOpX1CDSETl
         Y9RX9yN07VFugVAD0RkjzXYbKjfSfFeDkTjM32WiIoh3Ig0qlUdJimMe7MJDA+qqsRIY
         KmXK4YuiFo8MfDxddRxL+mldt/ggKM4HXaP7EyhpER/Zbot05bWZjXmgvHQiGbS5ih3b
         5k/O4p1RyRZ3H2Xb1ogY7LYM/jvhy5I2RChupRInyxtGdKPr8F5FlFZnWoXtZcrn+0ci
         zTOA==
X-Gm-Message-State: AHQUAuaHvqlfLWfoe4gZCGD4sSfPeJ3fd+DAaWk9bHTq0eZWBUEvXzsh
        KqQxcnOBeolVKfQDgsMFohE/hg==
X-Google-Smtp-Source: AHgI3IaBVutbIr7qRd4AQIrqqwfLPsAr6Bsj7a1Yt9UX5HiqRVpOcQpy/8uoD/IvlIL0aXtkATtjDg==
X-Received: by 2002:a17:902:b60e:: with SMTP id b14mr28485433pls.301.1550559773416;
        Mon, 18 Feb 2019 23:02:53 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q5sm21092022pga.71.2019.02.18.23.02.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 23:02:52 -0800 (PST)
Date:   Mon, 18 Feb 2019 23:02:50 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 5/8] remoteproc: qcom: wcss: populate hardcoded param
 using driver data
Message-ID: <20190219070250.GG13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-6-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-6-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Q6 based WiFi fw loading is supported across
> different targets, ex: IPQ8074/QCS404. In order to
> support different fw names/pas id etc, populate
> hardcoded param using driver data.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> ---
>  drivers/remoteproc/qcom_q6v5_wcss.c | 35 ++++++++++++++++++++++++-----
>  1 file changed, 29 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
> index f93e1e4a1cc0..f18b55227805 100644
> --- a/drivers/remoteproc/qcom_q6v5_wcss.c
> +++ b/drivers/remoteproc/qcom_q6v5_wcss.c
> @@ -8,6 +8,7 @@
>  #include <linux/kernel.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/module.h>
> +#include <linux/of_device.h>
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> @@ -16,7 +17,6 @@
>  #include "qcom_common.h"
>  #include "qcom_q6v5.h"
>  
> -#define WCSS_CRASH_REASON		421
>  

After this series you two compatibles, both specifying 421 as the
crash-reason SMEM item. So it's fine to just leave this as a define
until that's not the case.

[..]
> @@ -581,8 +598,14 @@ static int q6v5_wcss_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> +static const struct wcss_data wcss_ipq8074_res_init = {
> +	.firmware_name = "IPQ8074/q6_fw.mdt",
> +	.crash_reason_smem = 421,

Fill out "version"

> +};
> +
>  static const struct of_device_id q6v5_wcss_of_match[] = {
> -	{ .compatible = "qcom,ipq8074-wcss-pil" },
> +	{ .compatible = "qcom,ipq8074-wcss-pil", .data = &wcss_ipq8074_res_init },
> +
>  	{ },
>  };

Regards,
Bjorn
