Return-Path: <sboyd@codeaurora.org>
Date: Fri, 20 Nov 2015 16:39:53 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Georgi Djakov <georgi.djakov@linaro.org>
Cc: agross@codeaurora.org, mturquette@baylibre.com,
	linux-clk@vger.kernel.org, bjorn.andersson@sonymobile.com,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v4 4/5] clk: qcom: Add RPM clock controller driver
Message-ID: <20151121003953.GD28998@codeaurora.org>
References: <1447941480-27487-1-git-send-email-georgi.djakov@linaro.org>
 <1447941480-27487-5-git-send-email-georgi.djakov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1447941480-27487-5-git-send-email-georgi.djakov@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On 11/19, Georgi Djakov wrote:
> diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> new file mode 100644
> index 000000000000..bd0fd0cd50dc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/qcom,rpmcc.txt
> @@ -0,0 +1,35 @@
> +Qualcomm RPM Clock Controller Binding
> +------------------------------------------------
> +The RPM is a dedicated hardware engine for managing the shared
> +SoC resources in order to keep the lowest power profile. It
> +communicates with other hardware subsystems via shared memory
> +and accepts clock requests, aggregates the requests and turns
> +the clocks on/off or scales them on demand.
> +
> +Required properties :
> +- compatible : shall contain only one of the following:
> +
> +			"qcom,rpmcc-msm8916"

We need to add qcom,rpmcc as a generic compatible as well.

> +
> +- #clock-cells : shall contain 1
> +
> +Example:
> +	smd {
> +		compatible = "qcom,smd";
> +
> +		rpm {
> +			interrupts = <0 168 1>;
> +			qcom,ipc = <&apcs 8 0>;
> +			qcom,smd-edge = <15>;
> +
> +			rpm_requests {
> +				compatible = "qcom,rpm-msm8916";
> +				qcom,smd-channels = "rpm_requests";
> +
> +				rpmcc: qcom,rpmcc {
> +					compatible = "qcom,rpmcc-msm8916";
And here in the example too.

> +					#clock-cells = <1>;
> +				};
> +			};
> +		};
> +	};

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
