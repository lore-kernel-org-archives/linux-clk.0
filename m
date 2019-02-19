Return-Path: <SRS0=Vpf0=Q2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9543FC43381
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 06:45:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5F309217D9
	for <linux-clk@archiver.kernel.org>; Tue, 19 Feb 2019 06:45:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oSB4rS3y"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726470AbfBSGpO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Feb 2019 01:45:14 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42454 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725767AbfBSGpO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Feb 2019 01:45:14 -0500
Received: by mail-pl1-f196.google.com with SMTP id s1so9920171plp.9
        for <linux-clk@vger.kernel.org>; Mon, 18 Feb 2019 22:45:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=itpuDKkmlqWwaN7MySgHi1mDfzaILm04M1h/LPOSKek=;
        b=oSB4rS3yIhYL+nOm0XMUuKP8KR94HlenfGQnAmx+oCluGHJL/JJPFgY2E+tN5Thenu
         YfmRs+ANHQxN1r+NxvzgIWZxq3Ke/BhUtCf7nRrbNEU4Qs4xVVr0mwOQT+xSVBodnpbb
         YxZ/4krBtx82tGmk/1c52tuBjduAmYwla10dBoAsMOVd+QAu/JQGYAqLVk4+d7OINdG9
         VvnYKK9FcYlQ0MJxhVzl6WsQEWKC3TnVutEWR0mZnCKKCVH8mGkrdkZYu7rrXV1Gmx7/
         Yk2Vn2a7rcQjGdE94aShX6sqaU9pnnlLAjm9iz0t8CkA9gpTtP8KyiZXI2ArfBVh73nD
         iD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=itpuDKkmlqWwaN7MySgHi1mDfzaILm04M1h/LPOSKek=;
        b=ZIeRe0WsklqVauTHA34D7pn1Jrm4lZMvmBNBCanPkatMsWH3vNHoQT7VauiprW1g2L
         av+AiaejbPBfbZ3ZfYFt/s9dcmsM/+8I4j6tOnB81OGLk1AamRBpAfgu0LweEqaDLq9i
         PaTP10abrHkW2+AdPpyEayAhA22ggaOfXesG/fPTvxntWNYjjCdeYkaOOjcYiOPQo9qb
         Mbfl5lqgkNgza2CY36JJgtxS3bTAb9BX+ynSNpLBdvsve+/hR0/vLVHzRnhHn3WbHXyX
         vERbCVLkeR5Pa3nqovINdx5+aeeMXw3/7lLQO1aHyB4f4rKUxcYxR7qXFpcnFvIe1mn/
         qzxg==
X-Gm-Message-State: AHQUAuYDdCvpETk/HU1CELfCWuSq1mCGQvFo8YFNR7V4har2qFP1bDu3
        02xgekinYmGLI+Nv9g99iSs2yA==
X-Google-Smtp-Source: AHgI3IYhq75346Kk/axJYDaDqJynmVKnuBe+1meeTKx8AZWmYgBfG7CyVTnwkH3xK/AB/WV/+6MR5g==
X-Received: by 2002:a17:902:9307:: with SMTP id bc7mr13998827plb.234.1550558713800;
        Mon, 18 Feb 2019 22:45:13 -0800 (PST)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b197sm25213600pga.89.2019.02.18.22.45.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Feb 2019 22:45:12 -0800 (PST)
Date:   Mon, 18 Feb 2019 22:45:11 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/8] dt-bindings: clock: qcom: Add QCOM WCSS GCC clock
 bindings
Message-ID: <20190219064511.GD13018@tuxbook-pro>
References: <20190202152626.1006-1-govinds@codeaurora.org>
 <20190202152626.1006-2-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190202152626.1006-2-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 02 Feb 07:26 PST 2019, Govind Singh wrote:

> Add device tree bindings for WiFi QDSP gcc clock controls found in
> QCS404 soc.
> 
> Signed-off-by: Govind Singh <govinds@codeaurora.org>
> Reviewed-by: Rob Herring <robh@kernel.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  include/dt-bindings/clock/qcom,gcc-qcs404.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,gcc-qcs404.h b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> index 00ab0d77b38a..f5dfc1890870 100644
> --- a/include/dt-bindings/clock/qcom,gcc-qcs404.h
> +++ b/include/dt-bindings/clock/qcom,gcc-qcs404.h
> @@ -146,6 +146,8 @@
>  #define GCC_MDP_TBU_CLK					138
>  #define GCC_QDSS_DAP_CLK				139
>  #define GCC_DCC_XO_CLK					140
> +#define GCC_WCSS_Q6_AHB_CLK				141
> +#define GCC_WCSS_Q6_AXIM_CLK				142
>  
>  #define GCC_GENI_IR_BCR					0
>  #define GCC_USB_HS_BCR					1
> @@ -168,5 +170,6 @@
>  #define GCC_PCIE_0_CORE_STICKY_ARES			18
>  #define GCC_PCIE_0_SLEEP_ARES				19
>  #define GCC_PCIE_0_PIPE_ARES				20
> +#define GCC_WDSP_RESTART				21
>  
>  #endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
