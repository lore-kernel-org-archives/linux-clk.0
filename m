Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36111 "EHLO
        mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751020AbcKRD4W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Nov 2016 22:56:22 -0500
Received: by mail-oi0-f47.google.com with SMTP id v84so76617236oie.3
        for <linux-clk@vger.kernel.org>; Thu, 17 Nov 2016 19:56:22 -0800 (PST)
Date: Thu, 17 Nov 2016 21:56:19 -0600
From: Andy Gross <andy.gross@linaro.org>
To: Ritesh Harjani <riteshh@codeaurora.org>
Cc: ulf.hansson@linaro.org, linux-mmc@vger.kernel.org,
        adrian.hunter@intel.com, sboyd@codeaurora.org,
        shawn.lin@rock-chips.com, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, david.brown@linaro.org,
        linux-arm-msm@vger.kernel.org, georgi.djakov@linaro.org,
        alex.lemberg@sandisk.com, mateusz.nowak@intel.com,
        Yuliy.Izrailov@sandisk.com, asutoshd@codeaurora.org,
        david.griego@linaro.org, stummala@codeaurora.org,
        venkatg@codeaurora.org, rnayak@codeaurora.org,
        pramod.gurav@linaro.org, jeremymc@redhat.com
Subject: Re: [PATCH v8 04/16] ARM: dts: Add xo to sdhc clock node on qcom
 platforms
Message-ID: <20161118035619.GA6400@hector>
References: <1479312052-22396-5-git-send-email-riteshh@codeaurora.org>
 <1479343419-29326-1-git-send-email-riteshh@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1479343419-29326-1-git-send-email-riteshh@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Nov 17, 2016 at 06:13:39AM +0530, Ritesh Harjani wrote:
> Add xo entry to sdhc clock node on all qcom platforms.
> 
> Signed-off-by: Ritesh Harjani <riteshh@codeaurora.org>
> ---
>  arch/arm/boot/dts/qcom-apq8084.dtsi   | 16 ++++++++++------
>  arch/arm/boot/dts/qcom-msm8974.dtsi   | 16 ++++++++++------
>  arch/arm64/boot/dts/qcom/msm8916.dtsi | 10 ++++++----
>  arch/arm64/boot/dts/qcom/msm8996.dtsi |  9 +++++----
>  4 files changed, 31 insertions(+), 20 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8084.dtsi b/arch/arm/boot/dts/qcom-apq8084.dtsi
> index 39eb7a4..f756cbb 100644
> --- a/arch/arm/boot/dts/qcom-apq8084.dtsi
> +++ b/arch/arm/boot/dts/qcom-apq8084.dtsi
> @@ -182,13 +182,13 @@
>  	};
>  
>  	clocks {
> -		xo_board {
> +		xo_board: xo_board {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <19200000>;
>  		};
>  
> -		sleep_clk {
> +		sleep_clk: sleep_clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
>  			clock-frequency = <32768>;
> @@ -416,8 +416,10 @@
>  			reg-names = "hc_mem", "core_mem";
>  			interrupts = <0 123 0>, <0 138 0>;
>  			interrupt-names = "hc_irq", "pwr_irq";
> -			clocks = <&gcc GCC_SDCC1_APPS_CLK>, <&gcc GCC_SDCC1_AHB_CLK>;
> -			clock-names = "core", "iface";
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +				 <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&xo_board 0>;

With clock-cells = <0>, this should be <&xo_board>

Somehow this passes the dtc compiler.  But it is still incorrect.  Please fix
all instances of this to use the correct number of cells in the xo_board
references.


Andy
