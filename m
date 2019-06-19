Return-Path: <SRS0=vPCn=US=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75E24C31E5E
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 13:47:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4FBD12183F
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jun 2019 13:47:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MJOoT/Yd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726047AbfFSNr7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jun 2019 09:47:59 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:33994 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726149AbfFSNr6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jun 2019 09:47:58 -0400
Received: by mail-lf1-f65.google.com with SMTP id y198so12201055lfa.1
        for <linux-clk@vger.kernel.org>; Wed, 19 Jun 2019 06:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=V71TuYyJBQZMB8iSTLXwUqcPqDsSqQpONYCVL0IqAhs=;
        b=MJOoT/Yd96siJFdM1ZwK2VE2ScNBN91KlC4JlWQlIBDbuv21irtE71wJSE/AcmUZNG
         9NNIF0I4HzkMYGPtmukksDUGGEvId+jvDucWOIlSBemb8+fT6iAExWUMMaHrQYWmkjpy
         x1PKyydf+QGK6jfpVyGSoyK6ZSd7eEUpphuVakwWsEYdjjNJZN8YPn4CGejJENpHLUB1
         o5bP9QWP2kC63ltwUJP+M2sZ9/C6oCsaI2XG7N2GX+Rr1fHStFzft3Pb18DmLOgxg4o+
         +aWANI/xzKrYGSQOWjz9ocRYdT3EWQjee8gRUQ/2FmXwcncVKzoC7TTmLfqjwrYzeD5D
         53VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V71TuYyJBQZMB8iSTLXwUqcPqDsSqQpONYCVL0IqAhs=;
        b=IaD14diZVnEXigWY20w/RA7UeWyTH3K1r6G7AP3y/Db+i7uBDdr4+LR1x+zwSKRrtZ
         qL/4ep/JChTY9WR374p+HnCgDZxSX3MOXfm5Mb/ZbGBRPSjWP9KF2gJHySY2g1pTkVYo
         52ng9tsXlNzA2SYukoUKsIv7/5B8ZrhHBHo9v/BnZQXKCEtk58aPGd6zouumLptsnHOb
         6Lso0QUgHEN7ybeQ12s++HP22s+q3yUVyH7zUz3MOwjoPoF5Y2Kir5h6N0M9g3XGfGeM
         XJvCkxMkrn6QepXFp5Iykdes7I/YCsv7WOEzaCD+dg1HgZEX2vZvYRKJL0DNkKQLj7gF
         O9NQ==
X-Gm-Message-State: APjAAAW0RAFyN3xlXDxi1pJNAw3ybw7RIeQmKf+pINm5ZFQcBVvFw9ag
        cfvPtzFZ2slsir6MRRe7cjmMGg==
X-Google-Smtp-Source: APXvYqwSwOMeWjRGmbgc5tZsilRBhTUIfIdyXVUsHSm8TUNydzV9hn40uq0Asa2OvzPidjC4UmcQsA==
X-Received: by 2002:ac2:514b:: with SMTP id q11mr3245922lfd.33.1560952076792;
        Wed, 19 Jun 2019 06:47:56 -0700 (PDT)
Received: from macbook.djakov.com ([212.45.67.2])
        by smtp.googlemail.com with ESMTPSA id p27sm2723672lfo.16.2019.06.19.06.47.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Jun 2019 06:47:56 -0700 (PDT)
Subject: Re: [PATCH v3] clk: qcom: msm8916: Don't build drivers by default
To:     Marc Gonzalez <marc.w.gonzalez@free.fr>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        Amit Kucheria <amit.kucheria@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
References: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
From:   Georgi Djakov <georgi.djakov@linaro.org>
Message-ID: <fe935706-b18d-8966-a447-c1fb2be25c85@linaro.org>
Date:   Wed, 19 Jun 2019 16:47:53 +0300
MIME-Version: 1.0
In-Reply-To: <0171956f-b367-9f3b-f690-71657d8c50ec@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19.06.19 14:44, Marc Gonzalez wrote:
> QCOM_A53PLL and QCOM_CLK_APCS_MSM8916 stand out as the only options
> built by default. List them in defconfig after dropping the default.
> 
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Marc Gonzalez <marc.w.gonzalez@free.fr>
> ---
>  arch/arm64/configs/defconfig | 2 ++
>  drivers/clk/qcom/Kconfig     | 2 --
>  2 files changed, 2 insertions(+), 2 deletions(-)

Hi Marc,

Sorry, I wasn't very clear. IMHO the defconfig change should be a
separate patch and the v2 of this patch is ok as it is. It would just
make things easier to merge.

Thanks,
Georgi
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 5a8e853833cf..3277944626c2 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -658,6 +658,8 @@ CONFIG_CLK_IMX8MQ=y
>  CONFIG_CLK_IMX8QXP=y
>  CONFIG_TI_SCI_CLK=y
>  CONFIG_COMMON_CLK_QCOM=y
> +CONFIG_QCOM_A53PLL=y
> +CONFIG_QCOM_CLK_APCS_MSM8916=y
>  CONFIG_QCOM_CLK_SMD_RPM=y
>  CONFIG_QCOM_CLK_RPMH=y
>  CONFIG_IPQ_GCC_8074=y
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
> 

