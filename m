Return-Path: <SRS0=Rxbn=UL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32873C31E46
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 19:13:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 00C0320B7C
	for <linux-clk@archiver.kernel.org>; Wed, 12 Jun 2019 19:13:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WcncelRI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728399AbfFLTND (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 12 Jun 2019 15:13:03 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43738 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727496AbfFLTND (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Jun 2019 15:13:03 -0400
Received: by mail-pg1-f195.google.com with SMTP id f25so9440759pgv.10
        for <linux-clk@vger.kernel.org>; Wed, 12 Jun 2019 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=T+RRgg1K5LwClEl17mECCpFAJnPrxCkPYv4gJ/BZlgo=;
        b=WcncelRIf/GhuCYp31jFfmC/CT6gi9hyGO8tZtDqa3S6I763xjCea8yODKmDo/SK0M
         Oz4BKUZU5706cuMRBI8ksIz3TVzUDglZHgHYxOdna+5Qrfxp0bQwAsSIvqWUXP+8Gua7
         HQSKA+I8pSN/RBDfOimd6xuTlV7zM/uzwRhMVC6MlsqKZ2k5261Q7gOubWik/0DuTaAy
         lR8yYhu9rqIBuncO7aBzMKZIdXgZD+tJC9+FYWt6lwj/EgH575dhO9h/8ufCZlgD0Jq1
         BH89C/yWVhXL8M005z/KdU1z6hDilRA8Se3NkE38zClneJphRKvB3hj7NwMxmQKBJl4Y
         6BgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=T+RRgg1K5LwClEl17mECCpFAJnPrxCkPYv4gJ/BZlgo=;
        b=POJhBpyk8Y1GtqXB8ArpPsiSy+MoUVuisJHN+nNu/lqyBFT5PwWRHv+oOR3iNkKU0G
         UNYeDGmF9BYGCPFyUw3evzGxLtq3i1ozB2tCJ9DpiGdAMizJPezOjKSie5abPGNXkhQG
         BOeoisuW54qCmJO+awb9WPFwRV/G8oUsXG39BPyDnf7a6Ql1G28WWqiEB6urqyB00zcp
         bbit2m1mNylVtcnYVgs1j52XpFKgjmi2zgnxE1Ikj+tx7RoNiQxzOcaOlHV2E/7mNhl4
         TZEImXzILAObwE+dH5RMGz9kMuUoRTpIfe2q3Jvltcz4Llh2Vgfd2TT4EjCVVLTs03Z3
         dswQ==
X-Gm-Message-State: APjAAAXW5CY03NqjZYYXt02U/JpiA0LTOLu+kwy2bwP2rLYyb63Cggz0
        AdvbFTJgzt6GWy9ZYyYvVJll+A==
X-Google-Smtp-Source: APXvYqwILt61lSMu2MlpNBfbNURs3gIUH9XAmDY/cSvzbtjVDYAc25LwFlB5j4/TEyd5sKywi+jDuw==
X-Received: by 2002:a63:31d8:: with SMTP id x207mr25147871pgx.403.1560366782531;
        Wed, 12 Jun 2019 12:13:02 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id j2sm308430pfb.157.2019.06.12.12.13.01
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 12 Jun 2019 12:13:01 -0700 (PDT)
Date:   Wed, 12 Jun 2019 12:13:47 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v1] clk: qcom: msm8916: Don't build support by default
Message-ID: <20190612191347.GE22737@tuxbook-pro>
References: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49b95f19-4da6-4491-6ed7-5238ecfc35a8@free.fr>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 12 Jun 08:52 PDT 2019, Marc Gonzalez wrote:

> Build QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 by default only when
> we're building MSM_GCC_8916.
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

Not sure why these are default at all.

But both drivers are used on platforms other than 8916 as well, so if
anything a fix would be to rename the APCS_MSM8916 to something more
generic (such as QCOM_CLK_APCS_GLOBAL) - but then the content should be
updated and the APCS mailbox driver as well...

Regards,
Bjorn

> ---
>  drivers/clk/qcom/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83cc361e..d5b065f64afc 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -21,7 +21,7 @@ if COMMON_CLK_QCOM
>  
>  config QCOM_A53PLL
>  	tristate "MSM8916 A53 PLL"
> -	default ARCH_QCOM
> +	default MSM_GCC_8916
>  	help
>  	  Support for the A53 PLL on MSM8916 devices. It provides
>  	  the CPU with frequencies above 1GHz.
> @@ -31,7 +31,7 @@ config QCOM_A53PLL
>  config QCOM_CLK_APCS_MSM8916
>  	tristate "MSM8916 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
> -	default ARCH_QCOM
> +	default MSM_GCC_8916
>  	help
>  	  Support for the APCS Clock Controller on msm8916 devices. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
> -- 
> 2.17.1
