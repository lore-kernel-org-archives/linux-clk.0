Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47BD3C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 07:26:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238106AbiBYH0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 02:26:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238074AbiBYH0r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 02:26:47 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F895254570
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:26:15 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id i1so4087055plr.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=sJpiVWUtGJ1toTI22lBTbfejdWwjSpAkjXdT/oJlX68=;
        b=VkXvJvHWbBSHCoPEo4aSMInYMxICD5boQSdW7eVwiHfE/OH0V+8iUnrw8DLBpon7UZ
         5WLM6s77jLEr3D+IfsvsQ16/EZIUQghT7cW5MF4ATNb4WnJr610ZYmecWXJi535m+k3F
         SvW1DJ42wL4I5FUzfqRBP/SWStFV5T92Tuor2KPC+voyks6LSPpitedTwg3aITvZGdz2
         it1lTxTwNSvB7JPpIsPkyKf3Rw2GYiWdkqPO03Vz9GAGf61q6I88nXm0lGy9Du3ltPa3
         KNPyHoScqmU7ghMck3SJf11Qy5AVAlYXtUYK9+fWD1mYS6nUeyvu4fYIhJ2E8HiWaeyy
         iADQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=sJpiVWUtGJ1toTI22lBTbfejdWwjSpAkjXdT/oJlX68=;
        b=iZftrfZx1Gc9o5OsIcB6WcCMnkyj+t1dcdQL9FiuusKHu+EQNBt8sB6C6AvZialEJO
         dJ+VHcFYTeGozzG4FFFx0KMNnRrgP41PQOpRppSINPlpOjtFwCwhhcrfNqTzF6WK+XBQ
         WrPg9x6I1/S2//VRkkYLEty+5BiEXBLWnWr5pLfRnFfddvOxXIYrpGsFGl64VS/PxY+N
         xl8JFr3N/qp/ChzumjLC8GPRKqCFHiMJ1x45PEwqzTuYgl9TzI7+snURNvD/jOhkZo2A
         T1bZVbL4XleSQDlYW7GQFIQyGt6uKo9pki073RMHWUsFp7WnCX5KE6DKntYpM6PGMW0J
         12lg==
X-Gm-Message-State: AOAM533ZsXzy/vNzxqKVOlXAY9bAcXwcB8OOd4/kIgmXAngJ5cRI7UPk
        hQCrPt2amJFfO03+PDDcMWDQ
X-Google-Smtp-Source: ABdhPJzap2PgLSv2mmmnlDYOEhoOwG726uf7EFnyz2n5bBiUAD5Vn+YQ91B1Nif1JvVNOC5Lbf7ZEA==
X-Received: by 2002:a17:90a:2849:b0:1bc:50a8:6970 with SMTP id p9-20020a17090a284900b001bc50a86970mr1922546pjf.193.1645773975145;
        Thu, 24 Feb 2022 23:26:15 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id b3-20020a056a00114300b004cc39630bfcsm1843792pfm.207.2022.02.24.23.26.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:26:14 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:56:09 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/5] clk: qcom: Add A7 PLL support for SDX65
Message-ID: <20220225072609.GB274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-3-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-3-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:22AM +0530, Rohit Agarwal wrote:
> Update A7 PLL Kconfig to reflect support for SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  drivers/clk/qcom/Kconfig | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 42c8741..5159a1d 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -29,11 +29,11 @@ config QCOM_A53PLL
>  	  devices.
>  
>  config QCOM_A7PLL
> -	tristate "SDX55 A7 PLL"
> +	tristate "A7 PLL driver for SDX55 and SDX65"
>  	help
> -	  Support for the A7 PLL on SDX55 devices. It provides the CPU with
> +	  Support for the A7 PLL on SDX55 and SDX65 devices. It provides the CPU with
>  	  frequencies above 1GHz.
> -	  Say Y if you want to support higher CPU frequencies on SDX55
> +	  Say Y if you want to support higher CPU frequencies on SDX55 and SDX65
>  	  devices.
>  
>  config QCOM_CLK_APCS_MSM8916
> -- 
> 2.7.4
> 
