Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70C84C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 14 Feb 2022 08:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236335AbiBNIm3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Feb 2022 03:42:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238791AbiBNIm2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Feb 2022 03:42:28 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 426E44DF55
        for <linux-clk@vger.kernel.org>; Mon, 14 Feb 2022 00:42:21 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id l8so3977515pls.7
        for <linux-clk@vger.kernel.org>; Mon, 14 Feb 2022 00:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=om10mUpejbJWUSl+oKv7hdu5u2DA1s9HkiMQ82sYUAw=;
        b=DwYjUL2M5vN9u5GSZWfneFbfKYD/XtnvhQ6kdHNBAaYJeqPjkbWUq2QAQMDHEloIFd
         RvB+mwa9JudXdD3yDgqHxY3hPy7RGthkOnhYFBoN0uws4Ih7TFa9Kvdw+xr8rDM65m/4
         Q3svi0WFknCPUkGuNeXLXsE2zsROJ5T9jhVJScD8FyqwOnXYfMgriv/QJNMVhCHQxUtD
         gO49U1h1Gvut+t11tOvSL4LvVz1N2k2Jsc2jSsHOy93zqvPwTjcwo1MkRN+V/kEyCtZ7
         COGVEGfLcwszFP3G6w3ac5Y5yCvh/aaaeCO/+ogPOxoKNZJndg+eimonapqAXjkn7x0Q
         JTfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=om10mUpejbJWUSl+oKv7hdu5u2DA1s9HkiMQ82sYUAw=;
        b=GxMJYzkrIf1MF2Bjt5XAL5m3zbK03XAITAw5/pJhLzV9Gv2F0pHXsSN1ons92wvW9S
         rUXmUf+2SCrczx6ynZdjeArMfQlbCoph9C3dcOMiiBpiTnIISsMcSeOs+Cw4oClhMZ14
         UIcUivG6V22rGottL7tnBulqGh6UqwOd5LTFbmURkYzo3bxAA3oQCOmONgh58e9/Hg5t
         dbmznnjaarng984oCLT5TWf1QVJKFYR0AyHEgZ3nguXYAZ061illw/FReJKnC6FoyVT2
         SUAWUxHB8r4fGSYNkmaJu240GKxLQjBtaBO7dVWyIbmHgs8xT7WxsFLVNk2oIWQl9pgL
         ilwQ==
X-Gm-Message-State: AOAM5326b2y69QLLrZZyNonT3oEl0t8idwTAZnC809dDjEFHOI9co4KD
        tRZ/63SxXIje3nx8dgwkzyU7
X-Google-Smtp-Source: ABdhPJz2L+vYIrd6gH1aswuxDV7nrpQGPEDq4OozV3dNhmi56+qiaNU1hNR8ox/iWDFmonVtDvD8CQ==
X-Received: by 2002:a17:902:ec8f:: with SMTP id x15mr13170014plg.10.1644828140657;
        Mon, 14 Feb 2022 00:42:20 -0800 (PST)
Received: from thinkpad ([2409:4072:817:5a6f:3104:62c0:1941:5033])
        by smtp.gmail.com with ESMTPSA id a10sm8523467pfk.153.2022.02.14.00.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Feb 2022 00:42:20 -0800 (PST)
Date:   Mon, 14 Feb 2022 14:12:14 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/8] clk: qcom: Add A7 PLL support for SDX65
Message-ID: <20220214084214.GD3494@thinkpad>
References: <1644821987-27343-1-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1644821987-27343-1-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 14, 2022 at 12:29:47PM +0530, Rohit Agarwal wrote:
> Add support for PLL found in Qualcomm SDX65 platforms which is used to
> provide clock to the Cortex A7 CPU via a mux. This PLL can provide high
> frequency clock to the CPU above 1GHz as compared to the other sources
> like GPLL0.
> 
> In this driver, the power domain is attached to the cpudev. This is
> required for CPUFreq functionality and there seems to be no better place
> to do other than this driver (no dedicated CPUFreq driver).
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig  | 6 +++---
>  drivers/clk/qcom/a7-pll.c | 1 +
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 6cd0634..1904ba1 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -29,11 +29,11 @@ config QCOM_A53PLL
>  	  devices.
>  
>  config QCOM_A7PLL
> -	tristate "SDX55 A7 PLL"
> +	tristate "SDX55 like A7 PLL"

A7 PLL driver for SDX55 and SDX65

>  	help
> -	  Support for the A7 PLL on SDX55 devices. It provides the CPU with
> +	  Support for the A7 PLL on SDX55 like devices. It provides the CPU with
>  	  frequencies above 1GHz.
> -	  Say Y if you want to support higher CPU frequencies on SDX55
> +	  Say Y if you want to support higher CPU frequencies on SDX55 like

Say Y if you want to support higher CPU frequencies on devices such as SDX55 and
SDX65.

Thanks,
Mani

>  	  devices.
>  
>  config QCOM_CLK_APCS_MSM8916
> diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
> index c4a53e5..adb2121 100644
> --- a/drivers/clk/qcom/a7-pll.c
> +++ b/drivers/clk/qcom/a7-pll.c
> @@ -84,6 +84,7 @@ static int qcom_a7pll_probe(struct platform_device *pdev)
>  
>  static const struct of_device_id qcom_a7pll_match_table[] = {
>  	{ .compatible = "qcom,sdx55-a7pll" },
> +	{ .compatible = "qcom,sdx65-a7pll" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, qcom_a7pll_match_table);
> -- 
> 2.7.4
> 
