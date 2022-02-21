Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C361C433F5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Feb 2022 05:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344576AbiBUFgb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Feb 2022 00:36:31 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:45974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237230AbiBUFga (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Feb 2022 00:36:30 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 707B84AE21
        for <linux-clk@vger.kernel.org>; Sun, 20 Feb 2022 21:36:08 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id p8so7787265pfh.8
        for <linux-clk@vger.kernel.org>; Sun, 20 Feb 2022 21:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EAQyTnkUAM1IyjIOYRpB8FD6IRTMq3X88oxk+zMSmuw=;
        b=HGX6JqZPd7SOhy7rGlrb+9QbVSbS8V8qseTxZvNxl2bz6WJXcFhPXCcrBaNKCsYMZy
         k91+IS6zV/GAPkDueN1i+jCDQ7bzLTgPQBCZTVgycMH/seYvMVUZrGZ+t3oefUnZVtuM
         nvQgi5b3KlzMgHuV7+AhT5UUuUc5FmEbcGANWBa/54/Oa8eyUIq2P0Eqd4jF0Rvw4MRk
         LbUx2/7cJFtPncbG8fxUOaPFnKbf/XyzXxYu+q02Fo6Iau/4EGz9lQ5kPPhJh4Hg9ejq
         oR5hyuuPCQnb8kAWw1qSNOv3KyoIDjNibV/T1ZayhSGDefjWPKJwX1lM+H+329pnRM+z
         E/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EAQyTnkUAM1IyjIOYRpB8FD6IRTMq3X88oxk+zMSmuw=;
        b=2Cxg2cwG7RZ5UZIy2gabN0lHxSue0Ey7TNAhinkDFp5uZNB5MBHB7megAIyJ03ZdvN
         3gPN1WveNlcvbctX1OMy6kX4txH115KQMhrHE2fRtFtG3oZVpspke+slI1N315PY+qiz
         PwnHSXdvzQZRaOvsJursoapMtnV+ZN2+4dC2M9DNkTTo9zp5hJHCSc20kFCXsQ6YSITo
         8jDU78gjKU0CGAWOSRLNPfUjPCrLesHpajBUzGNUwyxJfPLFy5Iab/vPRbJnnq0ViZOi
         GUgOOWPfpaLO/nX5LoFL0uwMr+L8H+Dh/zZ+JuWJrh+AzAQ9Ysbd74SpBwJSwBxWm2I1
         XXjw==
X-Gm-Message-State: AOAM531ju4TMMD/3njyPZTD5OoSERoHqBJcahcbntACBTzKeQBDi86FF
        h1hqU9irjKbu140OY+lvpDhP
X-Google-Smtp-Source: ABdhPJyWPfzuqcZjoJhZxxBokayrbHM72NFJNCELyFIV5od8JvOEyY9VZKHm9DCOUQ3CewuEaVvnSw==
X-Received: by 2002:a05:6a00:c95:b0:4e1:1f5a:35cf with SMTP id a21-20020a056a000c9500b004e11f5a35cfmr18794483pfv.56.1645421767940;
        Sun, 20 Feb 2022 21:36:07 -0800 (PST)
Received: from thinkpad ([220.158.158.223])
        by smtp.gmail.com with ESMTPSA id u6sm588982pfk.203.2022.02.20.21.36.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Feb 2022 21:36:07 -0800 (PST)
Date:   Mon, 21 Feb 2022 11:06:03 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] clk: qcom: Add SDX65 APCS clock controller support
Message-ID: <20220221053603.GB15108@thinkpad>
References: <1645420953-21176-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645420953-21176-8-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645420953-21176-8-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 21, 2022 at 10:52:33AM +0530, Rohit Agarwal wrote:
> Update APCS Kconfig to reflect support for SDX65
> APCS clock controller.
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
> index 5159a1d..a2fa9af 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -55,13 +55,13 @@ config QCOM_CLK_APCC_MSM8996
>  	  drivers for dynamic power management.
>  
>  config QCOM_CLK_APCS_SDX55
> -	tristate "SDX55 APCS Clock Controller"
> +	tristate "SDX55 and SDX65 APCS Clock Controller"
>  	depends on QCOM_APCS_IPC || COMPILE_TEST
>  	help
> -	  Support for the APCS Clock Controller on SDX55 platform. The
> +	  Support for the APCS Clock Controller on SDX55, SDX65 platform. The
>  	  APCS is managing the mux and divider which feeds the CPUs.
>  	  Say Y if you want to support CPU frequency scaling on devices
> -	  such as SDX55.
> +	  such as SDX55, SDX65.
>  
>  config QCOM_CLK_RPM
>  	tristate "RPM based Clock Controller"
> -- 
> 2.7.4
> 
