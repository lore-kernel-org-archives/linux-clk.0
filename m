Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:37403 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754634AbeAIDhF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Jan 2018 22:37:05 -0500
Date: Mon, 8 Jan 2018 21:37:03 -0600
From: Rob Herring <robh@kernel.org>
To: Ilia Lin <ilialin@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, sboyd@codeaurora.org,
        devicetree@vger.kernel.org, mark.rutland@arm.com,
        will.deacon@arm.com, rnayak@codeaurora.org,
        amit.kucheria@linaro.org, nicolas.dechesne@linaro.org,
        celster@codeaurora.org, tfinkel@codeaurora.org
Subject: Re: [PATCH v2 05/11] clk: qcom: Add DT bindings for CPU clock driver
 for msm8996
Message-ID: <20180109033703.ra2ysibuv4s76xcm@rob-hp-laptop>
References: <1515064215-22202-1-git-send-email-ilialin@codeaurora.org>
 <1515064215-22202-6-git-send-email-ilialin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1515064215-22202-6-git-send-email-ilialin@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Jan 04, 2018 at 01:10:09PM +0200, Ilia Lin wrote:
> Signed-off-by: Ilia Lin <ilialin@codeaurora.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,kryocc.txt | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,kryocc.txt b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> new file mode 100644
> index 0000000..c45de03
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,kryocc.txt
> @@ -0,0 +1,17 @@
> +Qualcomm CPUSS clock controller for Kryo CPUs
> +----------------------------------------------------
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +
> +			"qcom,apcc-msm8996"

qcom-msm8996-apcc is the conventional order.

> +
> +- reg : shall contain base register location and length
> +- #clock-cells : shall contain 1
> +
> +Example:
> +	kryocc: clock-controller@6400000 {
> +		compatible = "qcom,apcc-msm8996";
> +		reg = <0x6400000 0x90000>;
> +		#clock-cells = <1>;
> +	};
> -- 
> 1.9.1
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
