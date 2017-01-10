Return-Path: <stanimir.varbanov@linaro.org>
Return-Path: <stanimir.varbanov@linaro.org>
Subject: Re: [PATCH] clk: qcom: gdsc: Fix handling of hw control
 enable/disable
To: Rajendra Nayak <rnayak@codeaurora.org>, sboyd@codeaurora.org,
 mturquette@baylibre.com
References: <1484027679-18397-1-git-send-email-rnayak@codeaurora.org>
Cc: linux-clk@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, sricharan@codeaurora.org
From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <db0b904e-4d28-b404-802b-7c2bcf0801e9@linaro.org>
Date: Tue, 10 Jan 2017 18:43:52 +0200
MIME-Version: 1.0
In-Reply-To: <1484027679-18397-1-git-send-email-rnayak@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

Hi Rajendra,

On 01/10/2017 07:54 AM, Rajendra Nayak wrote:
> Once a gdsc is brought in and out of HW control, there is a
> power down and up cycle which can take upto 1us. Polling on
> the gdsc status immediately after the hw control enable/disable
> can mislead software/firmware to belive the gdsc is already either on
> or off, while its yet to complete the power cycle.
> To avoid this add a 1us delay post a enable/disable of HW control
> mode.
> 
> Also after the HW control mode is disabled, poll on the status to
> check gdsc status reflects its 'on' before force disabling it
> in software.
> 
> Reported-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> ---
> 
> Stan,
> If there was a specific issue you saw with venus because of the missing
> delay and poll, can you check if this fixes any of that.

Something more about the issue.

I had re-designed venus driver on three platform drivers venus-core,
venus-dec and venus-enc in order to be able to control those three
power-domains (VENUS_GDSC, VENUS_CORE0_GDSC and VENUS_CORE1_GDSC).

After that I abstracted MMAGIC hw on a separate mmagic driver. This
driver just controls mmagic clocks and GDSC in its runtime_suspend and
runtime_resume methods.

The DT nodes looks like:

mmagic_video {
	compatible = "qcom,msm8996-mmagic";
	clocks = <&rpmcc MSM8996_RPM_SMD_MMAXI_CLK>,
		 <&mmcc MMSS_MMAGIC_AHB_CLK>,
		 <&mmcc MMSS_MMAGIC_CFG_AHB_CLK>,
		 <&mmcc MMAGIC_VIDEO_NOC_CFG_AHB_CLK>,
		 <&mmcc MMSS_MMAGIC_MAXI_CLK>,
		 <&mmcc MMAGIC_VIDEO_AXI_CLK>,
		 <&mmcc SMMU_VIDEO_AHB_CLK>,
		 <&mmcc SMMU_VIDEO_AXI_CLK>;
	power-domains = <&mmcc MMAGIC_VIDEO_GDSC>;

	video-codec {
		compatible = "qcom,msm8996-venus";
		clocks = <&mmcc VIDEO_CORE_CLK>,
			 <&mmcc VIDEO_AHB_CLK>,
			 <&mmcc VIDEO_AXI_CLK>,
			 <&mmcc VIDEO_MAXI_CLK>;
		power-domains = <&mmcc VENUS_GDSC>;
		...
	
		video-decoder {
			compatible = "venus-decoder";
			clocks = "subcore0";
			clock-names = <&mmcc VIDEO_SUBCORE0_CLK>;
			power-domains = <&mmcc VENUS_CORE0_GDSC>;
		};

		video-encoder {
			compatible = "venus-encoder";
			clocks = "subcore1";
			clock-names = <&mmcc VIDEO_SUBCORE1_CLK>;
			power-domains = <&mmcc VENUS_CORE1_GDSC>;
		};
	};
};

Note that mmagic_video is a parent dt node for smmu_video DT node so
that clocks and mmagic_video gdsc will be enabled once smmu driver is
instantiated by venus-core diriver.

Now when video-dec driver calls pm_runtime_get_sync() the sequence of
enabling is:

MMAGIC_VIDEO_GDSC -> MMAGIC clocks and SMMU clocks -> VENUS_GDSC ->
VIDEO clocks -> VENUS_CORE0_GDSC -> VIDEO subcore0 clock

When video-dec platform driver calls pm_runtime_put_sync() we should
disabling of GDSC and clocks in the reversed oder.

The issue comes when I have ran video decoder, the decoder hw finish
stream decoding and we want to suspend venus core. The issue is that
when I start disabling SMMU_VIDEO_AXI_CLK and/or MMAGIC_VIDEO_AXI_CLK
the system reboots.

I have added a delay (200ms) before disabling mmagic clocks and then
everything is fine again.

Any idea?

-- 
regards,
Stan
