Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC68136341
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 20:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729282796; cv=none; b=f0BmjngDvcnlA9PBx0g5I+8Kx6151lxslpnPXx8zFF5ZaBOUxWv0YaFN6UZJQeboZpiWg4hYlkJy6s/fWE4EnUiSJmHE8Pe/vXSC9wOsT33E69lk+7AZqMPnlGCVweN2SGN4qsF1SAtMyB5PLc9xwbEEEwdTqsuDEIr0NTouOt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729282796; c=relaxed/simple;
	bh=Y+D5/Eo3QysQH4KvaPnrku5nlmb78vR7241YASIl5kU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hjiq0egLmFuVj5A3uNbV+SLLn+wqy/0AlVuibuuzg2Frb+v8mvIuu2KKhoYD5PTFwCp8KKSCaflJHQWfXsCtI/Zl/TibqN1JtQTYjPMwqkdytrdKtvSOFIupTbjR6d6r6+3o57ccVqb26Z41X44Y+wPAYoX/Ym88o9dRsCja+LY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kmtLA19G; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kmtLA19G"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fb50e84ec7so22216041fa.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 13:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729282792; x=1729887592; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vxB35TFdNo1HQ9v+Gd35X07iGtBfxxpswJHGqT4Mnso=;
        b=kmtLA19GO7uEsIAPAO6+ixUXbqO8EhQ8V1DcnSgUDsgAewzJpkO7iOMtsDSlwLPVBj
         T8Abmb6e2SB4ojTAfTODwoFM/JT9vMBIDV9wq8TO8WbuI9NHKWOBrnrnpcZJ45XQlK+J
         MVjEFNBOwo/GniSmPdkMF3KZEPC8xdQusDtPFsg2+MVcdWKyBpHqfW821eD+A8ymq22q
         yYVsxYb2rG5g3qTUNQ3TzHsubRGGOaSV8mBpVS/NwZAjMQ+XpQuCkGJiHTWrOLsy8kWk
         UvuoiUa2c72SIADjo9qIlD4XtqS4V/2ylkB4F9fQJ6HaudGx1ZBYGwr8AujarOzY7gnv
         2YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729282792; x=1729887592;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vxB35TFdNo1HQ9v+Gd35X07iGtBfxxpswJHGqT4Mnso=;
        b=pBMOssRDObAeAHBsQWx3+2xefcusWBenQvDwE459/cwOFJYHcJsVqFHWmQ8Ai3QjIf
         SbeXNAGIlDxq2c10w/3Ucw7RD38CCoMud6OxlinTFgokQuUkrQuF28SVyfWFCyux7Pxp
         7f4lGRV9QmbkuUY6EJkz5avXyLiV44o8HQw47aW7Ii139+n2pYFgQjUJioDAG0kxkFRE
         nqHHpRiLf7ww9itsb9DST5P1C64lA2jyLLqc+66pO7Bi5jx9aEiQjV9/lvRduXD+MSRd
         5yaE+TRaNFxM9uKmF9PLy6dwUHs0ifX9E1AUcTy7b5hkskF9hcnEfrDYcUFGAKRTbpbd
         yrMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUo4bUjq5oZa2KqwsWxDHpskueYBuo4D9MdZEgP6d76NjOIwQSCCfbSszmHthN58uLBTAoCfNngIN8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlbKe/fjChMNsTP6tKRgJOYqH6rvY3NEpx0dcqFgSfKmSy6yEs
	GmA5BBiEIIJSi/RKNf1c77Vkt/3EBKAuq3FPQsLYq+/ZTc+RaaSZ5rlApiEoPv0=
X-Google-Smtp-Source: AGHT+IFl0JOJ9Ql+MS1HYMFl4Vn4k33gJTdS5AsVi6lJqIv4XPxojbwHk6qdoAtJUcRR9jCHYr4cZA==
X-Received: by 2002:a2e:4601:0:b0:2fb:599a:a900 with SMTP id 38308e7fff4ca-2fb82ea506cmr19762221fa.15.1729282792445;
        Fri, 18 Oct 2024 13:19:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2fb809b21a3sm2874301fa.30.2024.10.18.13.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:19:51 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:19:48 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
Message-ID: <7xwnojpxf2yhrug6imptivqojfunxqqeaxgmr7g3jv5iuj46d6@wna6yjl6qfgy>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:40AM +0530, Taniya Das wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   10 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-qcs615.c | 1588 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1599 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 30eb8236c9d80071a87e0332cfac7b667a08824a..bdb1c672dd90d96814b214afd234341e37e3c470 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -460,6 +460,16 @@ config QCM_DISPCC_2290
>  	  Say Y if you want to support display devices and functionality such as
>  	  splash screen.
>  
> +config QCS_CAMCC_615
> +	tristate "QCS615 Camera Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select QCS_GCC_615
> +	help
> +	  Support for the camera clock controller on Qualcomm Technologies, Inc
> +	  QCS615 devices.
> +	  Say Y if you want to support camera devices and functionality such as
> +	  capturing pictures.
> +
>  config QCS_GCC_404
>  	tristate "QCS404 Global Clock Controller"
>  	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 2b378667a63ff6eca843d7bef638a5422d35c3d3..f69c1bc13d3eca1859d9e849399e55175df869c3 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>  obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
>  obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
> +obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
>  obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>  obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
>  obj-$(CONFIG_QCS_TURING_404) += turingcc-qcs404.o
> diff --git a/drivers/clk/qcom/camcc-qcs615.c b/drivers/clk/qcom/camcc-qcs615.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..2341ddb57598eaaa7fa35300ae6635ff40da99ae
> --- /dev/null
> +++ b/drivers/clk/qcom/camcc-qcs615.c
> @@ -0,0 +1,1588 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/module.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,qcs615-camcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,

This doesn't match DT bindings.

> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_CAM_CC_PLL0_OUT_AUX,
> +	P_CAM_CC_PLL1_OUT_AUX,
> +	P_CAM_CC_PLL2_OUT_AUX2,
> +	P_CAM_CC_PLL2_OUT_EARLY,
> +	P_CAM_CC_PLL3_OUT_MAIN,
> +};
> +

Other than that LGTM. I didn't verify the actual values though.

-- 
With best wishes
Dmitry
