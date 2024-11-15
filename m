Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6496E1D4605
	for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 15:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731684898; cv=none; b=KJAxus7IXQSnepQGZVOE/MkQg/BabohGvE5ejHan4GYORaZOEuTCo18UVDqGUCu913wT1p7umRISHTq+mXhDvzUQs1suP2Iz3YLF7PLqlz8EOzoQLI1gZlwweGLVHOBu1EBS07YqojBEgVgugfiQ2dDQDIdRTjmgIoOiwhdPZtA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731684898; c=relaxed/simple;
	bh=dQnjARzS/AnKZwgtg1T7takQkCSRf3J8h/Hib6wFviI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rI8EEb+RnheB1BBR+8sJzIwTVbJsGcUUarZ5QM7ZHekSghWM+/d4AtIttzs6ugO0hpY3dYJc50KqkREiBlzKu58g9uUUh32ndbNdguahAMfPJ6WF5rfhEWtrEhlFvT1hkHnMW+2l5JUsJf4M+55dGtXiDU5LyI0QcFH5O0Jieos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zbwUoabf; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zbwUoabf"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb56cb61baso6916391fa.1
        for <linux-clk@vger.kernel.org>; Fri, 15 Nov 2024 07:34:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731684894; x=1732289694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dHeNFseeeAQx+Spt2l14JUBz8lfSC/2shlVs6RcKDuM=;
        b=zbwUoabffesFWqH4dmWvbOAf1F4R+xcM5mMnHyo/vAX0XuiQuoyoRkjoRVRttby5GF
         8+549vB+NOek+i+gvqEDwDLgYyHlwo1uAgQqOS0oCGqRpAdGdENsNV1H7B54sJO/qlGT
         LkXiO/XQUffKdkA0vaOrfEBTaoudnWh1JteIb6pQNqnTZCKkVfyW1R2gPTo318lrjTVv
         D7hkJXHk+bBEht0wKpKuX9MxgbDwT+YacV7nWFknbitIzdvMiH4typbcIIG1qLBGPmce
         Q72Ovjsn9nmS8zrNeGvzb9pnKa+R98Xl/TmXwbupRqx35KqdvKD9hG3XzCL3pMTreUzV
         o5Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731684894; x=1732289694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dHeNFseeeAQx+Spt2l14JUBz8lfSC/2shlVs6RcKDuM=;
        b=FrsAeEf79ydDe+HooaQ4LeQfn/DgiPs7KHjGzEcrbWJa/mt7FBIdlLsHjUb1lPa8Rl
         CdRMROQPSLlBkXm+PqiB3ruIsqBRo7JJZahovzrSllITWPaJX0wolX2bWyRn674f8D53
         ryCpIGD6b1Y0ed/m6mzg4PhB44GnkFBu6V4AqIz/dcaV+iL5ZXb7E5702rbbtPYaAlAk
         gqkYoAzkgdRXG82gNcpGzxPW/9Qcpe9DBxxpTi/1bfrSi8MfgaxU1lspzgRG1QIHAEif
         7/DH8ro7BeFEeVwptbpHxkHDIC5gCkQcqzvbQVDyLq+2djNo89+FRj2S+HxjlgsjNM8l
         PT/g==
X-Forwarded-Encrypted: i=1; AJvYcCUdMXz8IBYrKIkivFRrYP3m7Czm2GRq67S2x3p/lypJOw7nu7TiggBVHTy94F8eBTi32YOBPL9QwAI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRgOf6xbm7dZhxcI2dIkoOQdF/DvE35ZL+fTIc8mE+FOvnQuY4
	fqpAE21Pevgl3aYBALwa1tFogz+B1nUzBF4SHSFROxsE8F/szOExxsehXmdIJ9c=
X-Google-Smtp-Source: AGHT+IEW5l/WeVrgWrjtiQZXI6urBEIRwJelO5ZIzGC2k/oo/nw6SCVuzL+ZADLQrfMpvY+bGIWA4A==
X-Received: by 2002:a05:651c:b0f:b0:2fa:d177:13e6 with SMTP id 38308e7fff4ca-2ff60693745mr22176481fa.21.1731684894375;
        Fri, 15 Nov 2024 07:34:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff59859fd5sm5773531fa.71.2024.11.15.07.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 07:34:52 -0800 (PST)
Date: Fri, 15 Nov 2024 17:34:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Trilok Soni <quic_tsoni@quicinc.com>, 
	Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/7] clk: qcom: Add support for GCC clock controller
 on SM8750
Message-ID: <n4h4jvxrsyahgmxedfsifhgmarw4rzn2cbg5pcvzo4ll3edziq@vgpvjco5hyb4>
References: <20241112002807.2804021-1-quic_molvera@quicinc.com>
 <20241112002807.2804021-6-quic_molvera@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241112002807.2804021-6-quic_molvera@quicinc.com>

On Mon, Nov 11, 2024 at 04:28:05PM -0800, Melody Olvera wrote:
> From: Taniya Das <quic_tdas@quicinc.com>
> 
> Add support for GCC Clock Controller for SM8750 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm8750.c | 3274 +++++++++++++++++++++++++++++++++
>  3 files changed, 3284 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm8750.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index ef89d686cbc4..26bfb607235b 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -1130,6 +1130,15 @@ config SM_GCC_8650
>  	  Say Y if you want to use peripheral devices such as UART,
>  	  SPI, I2C, USB, SD/UFS, PCIe etc.
>  
> +config SM_GCC_8750
> +	tristate "SM8750 Global Clock Controller"
> +	depends on ARM64 || COMPILE_TEST
> +	select QCOM_GDSC
> +	help
> +	  Support for the global clock controller on SM8750 devices.
> +	  Say Y if you want to use peripheral devices such as UART,
> +	  SPI, I2C, USB, SD/UFS, PCIe etc.
> +
>  config SM_GPUCC_4450
>  	tristate "SM4450 Graphics Clock Controller"
>  	depends on ARM64 || COMPILE_TEST
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index b09dbdc210eb..1875018d1100 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -143,6 +143,7 @@ obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
>  obj-$(CONFIG_SM_GCC_8450) += gcc-sm8450.o
>  obj-$(CONFIG_SM_GCC_8550) += gcc-sm8550.o
>  obj-$(CONFIG_SM_GCC_8650) += gcc-sm8650.o
> +obj-$(CONFIG_SM_GCC_8750) += gcc-sm8750.o
>  obj-$(CONFIG_SM_GPUCC_4450) += gpucc-sm4450.o
>  obj-$(CONFIG_SM_GPUCC_6115) += gpucc-sm6115.o
>  obj-$(CONFIG_SM_GPUCC_6125) += gpucc-sm6125.o
> diff --git a/drivers/clk/qcom/gcc-sm8750.c b/drivers/clk/qcom/gcc-sm8750.c
> new file mode 100644
> index 000000000000..faaefa42a039
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm8750.c
> @@ -0,0 +1,3274 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/*
> + * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include <dt-bindings/clock/qcom,sm8750-gcc.h>
> +
> +#include "clk-alpha-pll.h"
> +#include "clk-branch.h"
> +#include "clk-pll.h"
> +#include "clk-rcg.h"
> +#include "clk-regmap.h"
> +#include "clk-regmap-divider.h"
> +#include "clk-regmap-mux.h"
> +#include "clk-regmap-phy-mux.h"
> +#include "common.h"
> +#include "gdsc.h"
> +#include "reset.h"
> +
> +enum {
> +	DT_BI_TCXO,
> +	DT_BI_TCXO_AO,
> +	DT_PCIE_0_PIPE_CLK,
> +	DT_SLEEP_CLK,
> +	DT_UFS_PHY_RX_SYMBOL_0_CLK,
> +	DT_UFS_PHY_RX_SYMBOL_1_CLK,
> +	DT_UFS_PHY_TX_SYMBOL_0_CLK,
> +	DT_USB3_PHY_WRAPPER_GCC_USB30_PIPE_CLK,

This doesn't match Documentation/devicetree/bindings/clock/qcom,sm8650-gcc.yaml

> +};
> +

-- 
With best wishes
Dmitry
