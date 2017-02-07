Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-pg0-f51.google.com ([74.125.83.51]:35765 "EHLO
        mail-pg0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752892AbdBGFfo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 7 Feb 2017 00:35:44 -0500
Received: by mail-pg0-f51.google.com with SMTP id 194so35366398pgd.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Feb 2017 21:35:44 -0800 (PST)
Date: Mon, 6 Feb 2017 21:35:38 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: andy.gross@linaro.org, sboyd@codeaurora.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 1/2] arm: dts: qcom: msm8974: Add RPMCC DT node
Message-ID: <20170207053538.GE27837@minitux>
References: <20170203183614.28135-1-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20170203183614.28135-1-georgi.djakov@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Fri 03 Feb 10:36 PST 2017, Georgi Djakov wrote:

> Add the RPM Clock Controller DT node for msm8974-based platforms, so that
> drivers can use the clocks provided by the RPM processor.
> 
> Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  arch/arm/boot/dts/qcom-msm8974.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
> index d3e1a61b8671..4b4c61e2ee35 100644
> --- a/arch/arm/boot/dts/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
> @@ -2,6 +2,7 @@
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-msm8974.h>
> +#include <dt-bindings/clock/qcom,rpmcc.h>
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/reset/qcom,gcc-msm8974.h>
>  #include "skeleton.dtsi"
> @@ -760,6 +761,11 @@
>  				compatible = "qcom,rpm-msm8974";
>  				qcom,smd-channels = "rpm_requests";
>  
> +				rpmcc: clock-controller {
> +					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
> +					#clock-cells = <1>;
> +				};
> +
>  				pm8841-regulators {
>  					compatible = "qcom,rpm-pm8841-regulators";
>  
