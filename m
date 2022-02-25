Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1D5C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 07:27:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238132AbiBYH2A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 02:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238119AbiBYH17 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 02:27:59 -0500
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0272192C8F
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:27:27 -0800 (PST)
Received: by mail-pg1-x535.google.com with SMTP id 12so3940583pgd.0
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pZld643HuW0/07Bu4DSXyfjcKpraUhym1XI5gyrgNOk=;
        b=cuj/O6w4RHklkvb7BlBFffzE0inrWWOX0/PjEwewBYlkyZ+Xb7qs8hjGv/fNqGuRev
         tDWWhu0+q0fYtxyRueNE17EzLHL4FZn+Ei9+T7TxRzwxdaRfaNN13c/Wa/o30giD/OVW
         fhWbdFOJ+uawSxrMvwmKj7+3q0tyFg8kIa38NqZ6h81PVqeSCo4scYjutj8Ri/tbA2IY
         Wybrc7TGiwoZSkDvp6ovwMyz5Z/VUgfL7+xUF7lxRrtX9Mz6Q2cdmhU9mecBOTCluqq6
         vN8SpTGnCIp1/2KQs9lBue5k4ibFtzcdBi9x4/zOQGYsN/3OJHBCeSSj+0CsN1miXr9l
         bmZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pZld643HuW0/07Bu4DSXyfjcKpraUhym1XI5gyrgNOk=;
        b=8Cmw9eNWkFXAt9CvmnbYSqksssVkknBsNJdmvz0F+yUAcdT4VL9ud3lfoUqYdfS7Ex
         jtehNWeLMUFmCZhmdGMbhyZc6IAijtJApIckffVu48ks5RyB7osMjP+AKm6Bs3lfJzVN
         b14d2DPgnSrOluoi7qJiJnsdKhr/1MDX/1YxMHWLevBJQNtuOl1V//xuSnnI626KWkYm
         xsMZMmVpcfPcN5FnlAtxCutLv/6eTXf5ZUKIZOAf6Ckh49xhRWq2u3pVaybYk142cP3Z
         O7CB9/pbaVHCwirFFv8UB78tKT7snSVR8Ii8e93MtbqbGvmRP2Rr8aPrDwnKzVWvtLfy
         hvCA==
X-Gm-Message-State: AOAM533xrPxCbgddAj1PNQKbeHgaLs0/RHrAXzXZ5VdsoWrolLc6W510
        S3xseM6d8Z8IEj7Z/c9mvunG
X-Google-Smtp-Source: ABdhPJwFdPzXdeQZMtrt4sI0MD3SfbXz3OURh87Nc9aslImgzfiD/6+gpcAjiZGQiadInU/X1o/0GA==
X-Received: by 2002:a05:6a00:88e:b0:4d2:4829:156c with SMTP id q14-20020a056a00088e00b004d24829156cmr6500246pfj.47.1645774047427;
        Thu, 24 Feb 2022 23:27:27 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id p28-20020a056a000a1c00b004f3b355dcb1sm1959980pfh.58.2022.02.24.23.27.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:27:27 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:57:21 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/5] clk: qcom: Add SDX65 APCS clock controller support
Message-ID: <20220225072721.GE274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-6-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-6-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:25AM +0530, Rohit Agarwal wrote:
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
> index 5159a1d..1a641d4 100644
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
> +	  Support for the APCS Clock Controller on SDX55, SDX65 platforms. The
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
