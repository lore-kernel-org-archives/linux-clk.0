Return-Path: <georgi.djakov@linaro.org>
Return-Path: <georgi.djakov@linaro.org>
From: Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH v5 1/6] clk: qcom: Add support for SMD-RPM Clocks
To: sboyd@codeaurora.org, agross@codeaurora.org
References: <1449151376-25930-1-git-send-email-georgi.djakov@linaro.org>
 <1449151376-25930-2-git-send-email-georgi.djakov@linaro.org>
Cc: Georgi Djakov <georgi.djakov@linaro.org>, mturquette@baylibre.com,
 linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Message-ID: <56656288.8090207@linaro.org>
Date: Mon, 7 Dec 2015 12:42:16 +0200
MIME-Version: 1.0
In-Reply-To: <1449151376-25930-2-git-send-email-georgi.djakov@linaro.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 3.12.15 г. 16:02, Georgi Djakov wrote:
> This adds initial support for clocks controlled by the Resource
> Power Manager (RPM) processor on some Qualcomm SoCs, which use
> the qcom_smd_rpm driver to communicate with RPM.
> Such platforms are msm8916, apq8084 and msm8974.
> 
> The RPM is a dedicated hardware engine for managing the shared
> SoC resources in order to keep the lowest power profile. It
> communicates with other hardware subsystems via shared memory
> and accepts clock requests, aggregates the requests and turns
> the clocks on/off or scales them on demand.
> 
> This driver is based on the codeaurora.org driver:
> https://www.codeaurora.org/cgit/quic/la/kernel/msm-3.10/tree/drivers/clk/qcom/clock-rpm.c
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
> ---
[..]
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -2,6 +2,9 @@ config QCOM_GDSC
>  	bool
>  	select PM_GENERIC_DOMAINS if PM
>  
> +config QCOM_RPMCC
> +	bool
> +
>  config COMMON_CLK_QCOM
>  	tristate "Support for Qualcomm's clock controllers"
>  	depends on OF
> @@ -9,6 +12,14 @@ config COMMON_CLK_QCOM
>  	select REGMAP_MMIO
>  	select RESET_CONTROLLER
>  
> +config QCOM_CLK_SMD_RPM
> +	tristate "RPM over SMD based Clock Controller"
> +	depends on COMMON_CLK_QCOM

This should be:
	depends on COMMON_CLK_QCOM && QCOM_SMD_RPM

And also for patch 3/6 it should be && MFD_QCOM_RPM
Will resend.

> +	select QCOM_RPMCC
> +	help
> +	  Support for the clocks exposed by the Resource Power Manager
> +	  processor on devices like apq8016, apq8084 and msm8974.
> +
>  config APQ_GCC_8084
>  	tristate "APQ8084 Global Clock Controller"
>  	select QCOM_GDSC
