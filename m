Return-Path: <bjorn.andersson@linaro.org>
Return-Path: <bjorn.andersson@linaro.org>
Date: Sun, 13 Mar 2016 06:06:27 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: sboyd@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v6 2/2] clk: qcom: Add support for RPM Clocks
Message-ID: <20160313130627.GT21240@tuxbot>
References: <1450182602-6996-1-git-send-email-georgi.djakov@linaro.org>
 <1450182602-6996-3-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1450182602-6996-3-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue 15 Dec 04:30 PST 2015, Georgi Djakov wrote:

[..]
> diff --git a/drivers/clk/qcom/clk-rpm.c b/drivers/clk/qcom/clk-rpm.c
[..]
> +
> +static struct clk_rpm *apq8064_clks[] = {
> +	[QCOM_RPM_PXO_CLK] = &apq8064_pxo,
> +	[QCOM_RPM_CXO_CLK] = &apq8064_cxo,
> +	[QCOM_RPM_APPS_FABRIC_CLK] = &apq8064_afab_clk,
> +	[QCOM_RPM_CFPB_CLK] = &apq8064_cfpb_clk,
> +	[QCOM_RPM_DAYTONA_FABRIC_CLK] = &apq8064_daytona_clk,
> +	[QCOM_RPM_EBI1_CLK] = &apq8064_ebi1_clk,
> +	[QCOM_RPM_MM_FABRIC_CLK] = &apq8064_mmfab_clk,
> +	[QCOM_RPM_MMFPB_CLK] = &apq8064_mmfpb_clk,
> +	[QCOM_RPM_SYS_FABRIC_CLK] = &apq8064_sfab_clk,
> +	[QCOM_RPM_SFPB_CLK] = &apq8064_sfpb_clk,
> +	[QCOM_RPM_QDSS_CLK] = &apq8064_qdss_clk,
> +};
> +

I do believe we did discuss this, but fwiw, do we really want the rpm
resource identifiers here? Rather than something clock specific
(from qcom,rpmcc.h)?

Regards,
Bjorn
