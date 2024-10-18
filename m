Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8CD207A34
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283140; cv=none; b=m4ZqnahaIqPiOfb2nkRs67uRNUSJJ3mj9KwQVHnKUYgL7RpgMNfWMq0yib0wDYbBV+OtUBO+XnOJem1Se226lISH8k/Y86HgIEezH8OcdLxqseH6+ET7a98xLCBxITj98HbsycabGd6HsGejmSAyu68zVD9pjEZMIKKT4Cq/hd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283140; c=relaxed/simple;
	bh=e9nuRSeQ1q6xv+eJrem9Vo+jNIm6tW5/uoKUlHGWxGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bd9x4PUwV51LkmnJOD4xa9JRET+5zHsxk8e9nMtOZHlvOMoOukPHXpvv7L+K3a/7arTbPNaGdU+Hz9I9BaJE4dsdV5JXzvq8xtQw9xu51BmsC3whjINP6m/ZVP52aB49I8BWrwWSG10yd3g/YqNAUQq61oroVpaXikh8993brH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IoW8156Z; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IoW8156Z"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-539f53973fdso1980182e87.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 13:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283135; x=1729887935; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AK9GjlpOWcciFUtS8LZdCQZ8A93JMW9M4qtDPBrqppA=;
        b=IoW8156ZTL0lt4JqTBCzhbkbVyrnaRgLy4kYwP+z8ECxyKoDM64eW/qiyCvj4uMUVC
         8RZT5HqoEKHiFVmddMDFSH0Wv1UCsm+iH6YOh9VcOf58y+z4CP9S71jUZyu7u8iTdLCi
         fqMOO35+3ol/9B3KcZtS4ODxQY7aRMw3NlUxxyP7SNuuLPpllQlD2rrYAk44k1bBtg6Z
         MJucVjAJcLUg7S7dLtgQ2yVHIPPWb1lBaXzu77oU2rf7+1KpSvj7IdWMgoG7rMoiQAPV
         Ubr2dr5L0Psl9G8yerhw1Fo03OlyMmukqFGYw9sTdV4F8mU6ZafcaTzt68eMe0sq1uEg
         DFEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283135; x=1729887935;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK9GjlpOWcciFUtS8LZdCQZ8A93JMW9M4qtDPBrqppA=;
        b=X0vpwcqieG+bRkgMTEFN7+2oSlDlXLT3vrMvVwzaPI4EQjeUgaaQQaTDzjgjeTX/K8
         3gaCHqTZBfFZdEwL3MhHDTaak1k7QxsbyXIm9hfVyHNIybWrghXImCxEAwnQNRUloUsf
         KcLnCgiiDPaW2AR+tlxrioqicfmsw3fZZaVAv+QRJMIrliBecBDtqGRCMZiECuG9cHm4
         bFzguVkNsp2BYBGiVGEULvkA5dcUmh0jwpPYlCyHqkjxGh2Ro/3n+Z/GDyW2qpNkaZl0
         mpsFsiHaKNhTqW6LlkBtN8xNmuY1eeekkR+0J6pcOGwY8yxNzbRdQDejhFrXYRXaX9yy
         lGKw==
X-Forwarded-Encrypted: i=1; AJvYcCVum+P6nMknaurSCzwKPYSTArOWoezsJbMH1Z14hhk9y7GD7XfkdTUSxKJQSBhKBpx3XPpxcWa6Uxs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZAS653HFYZ569X83czAYp6R7LDc3stgIeT8hPBt5krf7SG6Wc
	Zw0eC1EpTiHQQNJLr7VWS5oKN6RAOPEHgjMpj8R6iMR8ARXunb0nl9lZm0I3OWI=
X-Google-Smtp-Source: AGHT+IFMTlzv5g4qUtfX1TintmsLBocdxD75zUVXsk0YyPr6fsy8Fi5Lmut+T+XNEtKsz3N5oaywyA==
X-Received: by 2002:a05:6512:ac2:b0:539:fc9a:12e1 with SMTP id 2adb3069b0e04-53a0c7532c5mr2465574e87.27.1729283134900;
        Fri, 18 Oct 2024 13:25:34 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a1520480asm319613e87.211.2024.10.18.13.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:25:34 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:25:33 +0300
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
Subject: Re: [PATCH 06/11] clk: qcom: dispcc-qcs615: Add QCS615 display clock
 controller driver
Message-ID: <zsgdwc6klccdbytdysgl342zllgmb7ttatjh4tnug3unyl7vl3@tlptei23yozn>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-6-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:42AM +0530, Taniya Das wrote:
> Add support for the display clock controller for display clients to
> be able to request for the clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig         |   9 +
>  drivers/clk/qcom/Makefile        |   1 +
>  drivers/clk/qcom/dispcc-qcs615.c | 786 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 796 insertions(+)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index bdb1c672dd90d96814b214afd234341e37e3c470..d0c815e8e4789958151742a8269d7d6f2245b26c 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -460,6 +460,15 @@ config QCM_DISPCC_2290
>  	  Say Y if you want to support display devices and functionality such as
>  	  splash screen.
>  
> +config QCS_DISPCC_615
> +	tristate "QCS615 Display Clock Controller"
> +	select QCM_GCC_615
> +	help
> +	  Support for the display clock controller on Qualcomm Technologies, Inc
> +	  QCS615 devices.
> +	  Say Y if you want to support display devices and functionality such as
> +	  splash screen.
> +
>  config QCS_CAMCC_615
>  	tristate "QCS615 Camera Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index f69c1bc13d3eca1859d9e849399e55175df869c3..f2be0c678127c8f78c5ee708993ebef273d02f19 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_QCOM_CLK_RPMH) += clk-rpmh.o
>  obj-$(CONFIG_QCOM_CLK_SMD_RPM) += clk-smd-rpm.o
>  obj-$(CONFIG_QCM_GCC_2290) += gcc-qcm2290.o
>  obj-$(CONFIG_QCM_DISPCC_2290) += dispcc-qcm2290.o
> +obj-$(CONFIG_QCS_DISPCC_615) += dispcc-qcs615.o
>  obj-$(CONFIG_QCS_CAMCC_615) += camcc-qcs615.o
>  obj-$(CONFIG_QCS_GCC_404) += gcc-qcs404.o
>  obj-$(CONFIG_QCS_Q6SSTOP_404) += q6sstop-qcs404.o
> diff --git a/drivers/clk/qcom/dispcc-qcs615.c b/drivers/clk/qcom/dispcc-qcs615.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..cc40a9a8a682ba58d9fa9db21e89a05cc75be8a5
> --- /dev/null
> +++ b/drivers/clk/qcom/dispcc-qcs615.c
> @@ -0,0 +1,786 @@
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
> +#include <dt-bindings/clock/qcom,qcs615-dispcc.h>
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
> +	DT_GPLL0,
> +	DT_DSI0_PHY_PLL_OUT_BYTECLK,
> +	DT_DSI0_PHY_PLL_OUT_DSICLK,
> +	DT_DSI1_PHY_PLL_OUT_DSICLK,

Is there a DSI 1 PLL on this platform?

> +	DT_DP_PHY_PLL_LINK_CLK,
> +	DT_DP_PHY_PLL_VCO_DIV_CLK,
> +};
> +
> +enum {
> +	P_BI_TCXO,
> +	P_DISP_CC_PLL0_OUT_MAIN,
> +	P_DP_PHY_PLL_LINK_CLK,
> +	P_DP_PHY_PLL_VCO_DIV_CLK,
> +	P_DSI0_PHY_PLL_OUT_BYTECLK,
> +	P_DSI0_PHY_PLL_OUT_DSICLK,
> +	P_DSI1_PHY_PLL_OUT_DSICLK,
> +	P_GPLL0_OUT_MAIN,
> +};
> +

-- 
With best wishes
Dmitry
