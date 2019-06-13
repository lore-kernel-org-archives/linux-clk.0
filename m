Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 833B6C31E4A
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 15:38:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5756E2080A
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 15:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wsz0h2gx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728847AbfFMPiO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 11:38:14 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40841 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726424AbfFMPiN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 11:38:13 -0400
Received: by mail-pl1-f196.google.com with SMTP id a93so8319718pla.7
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2019 08:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NsCl+jcY3prb6sL8d4R7dMFJh2KQ7NpmK3YBOqHAoNM=;
        b=Wsz0h2gxegM8cTTN62AKR3fOsoZrE9ufIqMw3Peexu+eaBFtEUgcgEcawREWwquMoa
         A6o30acE27+qdgYeXPRKS+r+gY+CnxGpJTwfgeOFwDYU368HN5TEr+Km5RLfBSp4T1nf
         S1CUhNQI3bT7N7ZUFzPs+nK+0f/nE70Rc/QucXUDAK6VM329pQHw/R2ZF1zfn05Kyhbz
         AsmtdUR6uS9EJcgpqUSMqBHKximAI0zLDuPqCysCeUyY1x+vFd3q96o4A0qIolZeXMRx
         Ii5F9g4hxHf3JJsOlS7BoT3H6A9lCE/eaZdFX2/1i0RysQWtdujBX/+yVYQKDjLMzoqe
         Z4Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NsCl+jcY3prb6sL8d4R7dMFJh2KQ7NpmK3YBOqHAoNM=;
        b=OXnaDni4SE8Aw5ojiFdutABcQMb/zWm5ZggqSdZbB7lUROcMwFJGy/S07oiUA2YvvS
         k8wJqC9OM1WD1S0KBV4NeMwWZnpRDjULZuW0+cHdCTyJvl3WGO6DFqOs3HeYGJSwcvu3
         Bdx/88FV1tdWMRMdAnTxLr5dGH8N7Hi5U6MRRI201nZF+Cr+sy/Ycmmrb8+Lk0YXlJNB
         0G1sTWB0AKzWq2i10AFpFIJua+MGCzuSCmLI4dDQmPgda5MvOqIS+No1aDvtUDPRFh8U
         ZxNymXj1y5Rflt9C32szSav70USo61rza6yGNy/oqO2rzoJ2L7uNq4OtPEPQD7XIOB3N
         8IQw==
X-Gm-Message-State: APjAAAX1DatWGxSwGFmNRBpZJHuyyW6TP8rCA/84rDHRgSoQMzznXm90
        XNtCpQS+HvP0CN2iP6SGQ/E1yA==
X-Google-Smtp-Source: APXvYqw2bFFTvTat1VVEhfhx9vDMP+Oe+aWwmaNVtjrNNXdKoUetz2qyIKgh+6lRBxS2DNVjMTo5xA==
X-Received: by 2002:a17:902:9f93:: with SMTP id g19mr72995347plq.223.1560440293028;
        Thu, 13 Jun 2019 08:38:13 -0700 (PDT)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f10sm44348pfd.151.2019.06.13.08.38.12
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Jun 2019 08:38:12 -0700 (PDT)
Date:   Thu, 13 Jun 2019 08:38:10 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Amit Kucheria <amit.kucheria@linaro.org>
Subject: Re: [PATCH v2] clk: qcom: msm8916: Don't build by default
Message-ID: <20190613153810.GG6792@builder>
References: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d654907d-a3a2-a00f-d6f5-3a34ae25ebcf@free.fr>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 13 Jun 08:09 PDT 2019, Marc Gonzalez wrote:

> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> built by default. Let's bring them back in line with the rest.
> 
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>

This looks reasonable

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
> Changes from v1:
> - Drop the default altogether, instead of changing it to 'default MSM_GCC_8916'
> ---
>  drivers/clk/qcom/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index e1ff83cc361e..6461a1aa7325 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -21,7 +21,6 @@ if COMMON_CLK_QCOM
>  
>  config QCOM_A53PLL
>  	tristate "MSM8916 A53 PLL"
> -	default ARCH_QCOM
>  	help
>  	  Support for the A53 PLL on MSM8916 devices. It provides
>  	  the CPU with frequencies above 1GHz.
> @@ -31,7 +30,6 @@ config QCOM_A53PLL
>  config QCOM_CLK_APCS_MSM8916
>  	tristate "MSM8916 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
> -	default ARCH_QCOM
>  	help
>  	  Support for the APCS Clock Controller on msm8916 devices. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
> -- 
> 2.17.1
