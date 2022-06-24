Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F0FCCA47E
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 17:25:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232276AbiFXRZj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 13:25:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231127AbiFXRZZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 13:25:25 -0400
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C262B77043
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 10:23:35 -0700 (PDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-fe023ab520so4620804fac.10
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XbZbGNfhjt2oAj/A489g96X9oJYW0QO+shnAI190mdI=;
        b=XoIJcUUWicQDBxKC3woD+J63DN5sxq7Pqr+oVtUxMqwMx4eXujTcPUx8CNYqNCYu4z
         dDO2aECNhRmjWFWSAI7wS0sEYxVrgt2Sw5IO0QSctJ/2n5Gt+nsqNTG9zOkVtD6uUcWH
         7r8vkr0bSYftg4ku9svIF35kcLp5hQcXGcpSqCvJBQQdJjbFlTtWtormkMZdDWM7TmEK
         CzPNcDgCe/4H477IST0MQS+NIl/FLMTNbALaC/rJwLI0bqb73LM4MvPU7ej9lPiIRdaF
         6ZzP3Fv9jRmVZOBhc62vbziQHm+Ot4gSyBwPzDp2JZmv+JZRyi9RdcgyN8GQQD/NV8Da
         obIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XbZbGNfhjt2oAj/A489g96X9oJYW0QO+shnAI190mdI=;
        b=v2PisAeT3HXqqffoTu0nAgLvj6QU64Xmm7OC0iKcZfEb+zZX33h3dbzgCY2D0wrAId
         a1aC+ykbOqjPihco6yAxsQxkK/YVLdRi8MF6LTvkcZQ6FJSCcxY9ylD8XhcgmOseP8oC
         AZVvFJIb0efoDCdDz1xGpQSp8E/WK8i3a0em7GWao/5gRSMMpLBMTIvp6M405gpBtSZk
         9ZRTSu6sWMmgwHJwgJaQdddjMfiHfLFx3nwjagRVA9/e1YAuJ6tEP8NZc3Ufnk1Kwq0d
         HIKdqLWH6PQzxEivw7DEUGSIsgfdG/9THpgBQO5jP7+2eXDQHzku1CfYPUmbaEMZy0RC
         Xz/A==
X-Gm-Message-State: AJIora8IHV/Jv7WbfxbXW0Q5HqO+AoyY5QlirtGrSky8JRCJzqNPYiun
        5WLptSBismfpg4Tcc4u1tJt+DNXMWAfPdA==
X-Google-Smtp-Source: AGRyM1sKhr3pirbcv0CxaXGtVfvWOuyImVuIFPfkXT9D9ljaDRYy+4WEVjyBnifzu6Uu+nZl+ETnGw==
X-Received: by 2002:a05:6870:4348:b0:f1:ec31:10e7 with SMTP id x8-20020a056870434800b000f1ec3110e7mr41315oah.156.1656091412759;
        Fri, 24 Jun 2022 10:23:32 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j79-20020acaeb52000000b0032f0eb4aad5sm1387143oih.46.2022.06.24.10.23.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 10:23:32 -0700 (PDT)
Date:   Fri, 24 Jun 2022 12:23:30 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v8 2/7] arm64: dts: qcom: sm8450: Add description of
 camera clock controller
Message-ID: <YrXzEqtfLi2vmTXE@builder.lan>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
 <20220624115917.2524868-3-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624115917.2524868-3-vladimir.zapolskiy@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 24 Jun 06:59 CDT 2022, Vladimir Zapolskiy wrote:

> Add description of QCOM SM8450 camera clock controller.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Changes from v7 to v8:
> * rebased on top of v5.19-rc2,
> * minor improvement to the commit message.
> 
> Changes from v6 to v7:
> * rebased on top of v5.19-rc1.
> 
> Changes from v5 to v6:
> * rebased on top of linux-next.
> 
> Changes from v3 to v5:
> * none.
> 
> Changes from v2 to v3:
> * account a renamed header file.
> 
> Changes from v1 to v2:
> * disabled camcc device tree node by default.
> 
>  arch/arm64/boot/dts/qcom/sm8450.dtsi | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> index 7d08fad76371..fad813a21df5 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-sm8450.h>
>  #include <dt-bindings/clock/qcom,rpmh.h>
> +#include <dt-bindings/clock/qcom,sm8450-camcc.h>
>  #include <dt-bindings/dma/qcom-gpi.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/mailbox/qcom-ipcc.h>
> @@ -2288,6 +2289,25 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
>  			};
>  		};
>  
> +		camcc: clock-controller@ade0000 {
> +			compatible = "qcom,sm8450-camcc";
> +			reg = <0 0x0ade0000 0 0x20000>;
> +			status = "disabled";

Please put the status last.

Regards,
Bjorn

> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK>,
> +				 <&rpmhcc RPMH_CXO_CLK_A>,
> +				 <&sleep_clk>;
> +			clock-names = "iface",
> +				      "bi_tcxo",
> +				      "bi_tcxo_ao",
> +				      "sleep_clk";
> +			power-domains = <&rpmhpd SM8450_MMCX>;
> +			required-opps = <&rpmhpd_opp_low_svs>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		pdc: interrupt-controller@b220000 {
>  			compatible = "qcom,sm8450-pdc", "qcom,pdc";
>  			reg = <0 0x0b220000 0 0x30000>, <0 0x174000f0 0 0x64>;
> -- 
> 2.33.0
> 
