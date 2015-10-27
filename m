Return-Path: <sboyd@codeaurora.org>
Date: Tue, 27 Oct 2015 16:17:16 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v3 1/8] arm64: dts: qcom: 8x16: Add fixed rate on-board
 oscillator
Message-ID: <20151027231716.GS19782@codeaurora.org>
References: <1445360280-2347-1-git-send-email-georgi.djakov@linaro.org>
 <1445360280-2347-2-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445360280-2347-2-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 10/20, Georgi Djakov wrote:
> diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> index 8748fcca70f4..355a2acea796 100644
> --- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
> @@ -80,6 +80,15 @@
>  			     <GIC_PPI 1 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
>  	};
>  
> +	clocks {
> +		xo_board: xo_board {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <19200000>;
> +			clock-output-names = "xo_board";

clock-output-names isn't necessary here because the node name is
the same and we use that by default.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
