Return-Path: <SRS0=IRPH=3N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C091C32771
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 18:11:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 56CD92071A
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 18:11:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uzuCpiQ1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391398AbgAXSLO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jan 2020 13:11:14 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:34016 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388606AbgAXSLO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 13:11:14 -0500
Received: by mail-pg1-f196.google.com with SMTP id r11so1530388pgf.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 10:11:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=CCzHBAiUYjP95wXU9mQYF0+uRIjsah9R0x3etmFDEY8=;
        b=uzuCpiQ1dVOxOATCBmj/20+gDUOt209BcA+heoKERHrfdcxyD0qK7Z/1MBXKGiYEks
         LkNEYoBpenGK/UH4ifMIEOjMo3i+7E9v/lWp4xuxqcDUy8XCWE1qbxielOXaeARQaNVx
         lRuUCqxsaUPLe4WutYnCry7oWsAjM8k8OULNh4QNAoAmOzJzHH3pBufaBygZDluJP28Y
         +8erbrSDHEcl8qpyn4yXMbQNf/+TRMpBjkC2T0jmYJl/Ky6+wZqSiqbyXY+eU4h0eWig
         YPg5I6Z6PvpubcCLMkSayFiyK5O/EdjLBiQb2Au4dbwOlPWliDHx3IbiXU924Z2tRlF2
         /EBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CCzHBAiUYjP95wXU9mQYF0+uRIjsah9R0x3etmFDEY8=;
        b=oZoxrVlrXFp/JZ6NpgpoDrldHVN9KeqUnNJnO2WutyGWLtVIXvKJY/Uzi/eZjtThaM
         cBw04jv6Yn84EKWLhwdb06OKuv8leOD3Y10ox01Sd17Lc7p1kw8Jz0EZmXFEXQNRbZCG
         FuqnZvtK5XkpQ8d7K0ImNC2uyTuVkFI10SKkYq34ZHyheo/zbjO2BFADO7Y3h8JoLfYp
         1eE0Ka2OS4xtdjzlELJX8LoIDfeuN4wDZu53geGYjxCgcXPMcOBtSk5CK47utowo0Do7
         oqnan7RX81q/AyFVEIx9BPaNu3FemlFglD3/jQYmp+BYdiSlYTsJ43D/0OjErl0SfTNd
         xVNg==
X-Gm-Message-State: APjAAAWQgUq1NRW5dU3EOlk19gclk3EVLxDyzlmlGZNdYfGZMIvJGihQ
        3oFf2l5kVRZFSuXuZso5yEwhgQ==
X-Google-Smtp-Source: APXvYqyTSOAONtxOW8uB55Jrl2pFdLa+MIt408ryWT8YmFFBz4VJXa1j5fC2Tg+CV6A+4pzPJib2Pw==
X-Received: by 2002:a62:ed19:: with SMTP id u25mr4477271pfh.173.1579889473847;
        Fri, 24 Jan 2020 10:11:13 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q6sm7209136pgt.47.2020.01.24.10.11.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:11:13 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:10:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/7] dt-bindings: clock: Add RPMHCC bindings for SM8250
Message-ID: <20200124181038.GS1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-2-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-2-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:

> From: Taniya Das <tdas@codeaurora.org>
> 
> Add bindings and update documentation for clock rpmh driver on SM8250.
> 
> Signed-off-by: Taniya Das <tdas@codeaurora.org>
> Signed-off-by: Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
>  include/dt-bindings/clock/qcom,rpmh.h                    | 4 +++-
>  2 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> index 94e2f14..21398d1 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
> @@ -20,6 +20,7 @@ properties:
>        - qcom,sc7180-rpmh-clk
>        - qcom,sdm845-rpmh-clk
>        - qcom,sm8150-rpmh-clk
> +      - qcom,sm8250-rpmh-clk
>  
>    clocks:
>      maxItems: 1
> diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
> index edcab3f..2e6c54e 100644
> --- a/include/dt-bindings/clock/qcom,rpmh.h
> +++ b/include/dt-bindings/clock/qcom,rpmh.h
> @@ -1,5 +1,5 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> -/* Copyright (c) 2018, The Linux Foundation. All rights reserved. */
> +/* Copyright (c) 2018, 2020, The Linux Foundation. All rights reserved. */
>  
>  
>  #ifndef _DT_BINDINGS_CLK_MSM_RPMH_H
> @@ -19,5 +19,7 @@
>  #define RPMH_RF_CLK3				10
>  #define RPMH_RF_CLK3_A				11
>  #define RPMH_IPA_CLK				12
> +#define RPMH_LN_BB_CLK1				13
> +#define RPMH_LN_BB_CLK1_A			14
>  
>  #endif
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
