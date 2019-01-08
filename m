Return-Path: <SRS0=Ml2J=PQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F119C43387
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 00:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DCC862085A
	for <linux-clk@archiver.kernel.org>; Tue,  8 Jan 2019 00:35:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="CgS2CFuT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726878AbfAHAf1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jan 2019 19:35:27 -0500
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2353 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbfAHAf1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Jan 2019 19:35:27 -0500
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5c33f0410000>; Mon, 07 Jan 2019 16:35:13 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Mon, 07 Jan 2019 16:35:25 -0800
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Mon, 07 Jan 2019 16:35:25 -0800
Received: from [10.19.108.132] (10.124.1.5) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Tue, 8 Jan
 2019 00:35:23 +0000
Subject: Re: [PATCH V4 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190104030702.8684-2-josephl@nvidia.com>
From:   Joseph Lo <josephl@nvidia.com>
Message-ID: <142f619f-9939-0d87-9fe7-2e72efa027a0@nvidia.com>
Date:   Tue, 8 Jan 2019 08:35:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190104030702.8684-2-josephl@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL104.nvidia.com (172.18.146.11) To
 HQMAIL101.nvidia.com (172.20.187.10)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1546907713; bh=r7avfY6qlkrVY3ctl0znB3cdUqkeD0OxhVEE8LbxIo8=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Language:
         Content-Transfer-Encoding;
        b=CgS2CFuTShjycpopHJc1w2Hb6nVO2y4TbjycuRvWkbYCvbePTicIZcNq2Sbrb4j8P
         LT6zuVWpVTYvZqGKA6oFsz/ittNUKCXBJgNRqHOXPv5M2boIHI9MN7RaTaRtHT6/8k
         SVGLqknJRos2gd20WhdsOXp10sCjLH8eDRul6GEUSQiYSgGfD/RDjWnEYPZN4354PM
         u0uy0eoGfVlSk6Ds1sUXECh9JIod2WdmblXDc3/H0HaJAati6biYOWdlKjDg9ZHfVi
         SYuEStacfCryKyxCCpeClIylXsjHxvRvcdv06ZVWSh/g/HElaoobJXlx7A181gPu8p
         TxF3VUdSfJFpA==
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 1/4/19 11:06 AM, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Add new properties to configure the DFLL PWM regulator support.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> *V4:
>   - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/
> *V3:
>   - no change
> *V2:
>   - update the binding strings and descriptions for
>   nvidia,pwm-tristate-microvolts
>   nvidia,pwm-min-microvolts
>   nvidia,pwm-voltage-step-microvolts
> ---

Hi Rob,

Could you help me to review this patch again?

Thanks,
Joseph

>   .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
>   1 file changed, 77 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> index dff236f524a7..5558bb5fcf2c 100644
> --- a/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> +++ b/Documentation/devicetree/bindings/clock/nvidia,tegra124-dfll.txt
> @@ -8,7 +8,6 @@ the fast CPU cluster. It consists of a free-running voltage controlled
>   oscillator connected to the CPU voltage rail (VDD_CPU), and a closed loop
>   control module that will automatically adjust the VDD_CPU voltage by
>   communicating with an off-chip PMIC either via an I2C bus or via PWM signals.
> -Currently only the I2C mode is supported by these bindings.
>   
>   Required properties:
>   - compatible : should be "nvidia,tegra124-dfll"
> @@ -45,10 +44,31 @@ Required properties for the control loop parameters:
>   Optional properties for the control loop parameters:
>   - nvidia,cg-scale: Boolean value, see the field DFLL_PARAMS_CG_SCALE in the TRM.
>   
> +Optional properties for mode selection:
> +- nvidia,pwm-to-pmic: Use PWM to control regulator rather then I2C.
> +
>   Required properties for I2C mode:
>   - nvidia,i2c-fs-rate: I2C transfer rate, if using full speed mode.
>   
> -Example:
> +Required properties for PWM mode:
> +- nvidia,pwm-period-nanoseconds: period of PWM square wave in nanoseconds.
> +- nvidia,pwm-tristate-microvolts: Regulator voltage in micro volts when PWM
> +  control is disabled and the PWM output is tristated. Note that this voltage is
> +  configured in hardware, typically via a resistor divider.
> +- nvidia,pwm-min-microvolts: Regulator voltage in micro volts when PWM control
> +  is enabled and PWM output is low. Hence, this is the minimum output voltage
> +  that the regulator supports when PWM control is enabled.
> +- nvidia,pwm-voltage-step-microvolts: Voltage increase in micro volts
> +  corresponding to a 1/33th increase in duty cycle. Eg the voltage for 2/33th
> +  duty cycle would be: nvidia,pwm-min-microvolts +
> +  nvidia,pwm-voltage-step-microvolts * 2.
> +- pinctrl-0: I/O pad configuration when PWM control is enabled.
> +- pinctrl-1: I/O pad configuration when PWM control is disabled.
> +- pinctrl-names: must include the following entries:
> +  - dvfs_pwm_enable: I/O pad configuration when PWM control is enabled.
> +  - dvfs_pwm_disable: I/O pad configuration when PWM control is disabled.
> +
> +Example for I2C:
>   
>   clock@70110000 {
>           compatible = "nvidia,tegra124-dfll";
> @@ -76,3 +96,58 @@ clock@70110000 {
>   
>           nvidia,i2c-fs-rate = <400000>;
>   };
> +
> +Example for PWM:
> +
> +clock@70110000 {
> +	compatible = "nvidia,tegra124-dfll";
> +	reg = <0 0x70110000 0 0x100>, /* DFLL control */
> +	      <0 0x70110000 0 0x100>, /* I2C output control */
> +	      <0 0x70110100 0 0x100>, /* Integrated I2C controller */
> +	      <0 0x70110200 0 0x100>; /* Look-up table RAM */
> +	interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +	clocks = <&tegra_car TEGRA210_CLK_DFLL_SOC>,
> +	         <&tegra_car TEGRA210_CLK_DFLL_REF>,
> +		 <&tegra_car TEGRA124_CLK_I2C5>;;
> +	clock-names = "soc", "ref", "i2c";
> +	resets = <&tegra_car TEGRA124_RST_DFLL_DVCO>;
> +	reset-names = "dvco";
> +	#clock-cells = <0>;
> +	clock-output-names = "dfllCPU_out";
> +
> +	nvidia,sample-rate = <25000>;
> +	nvidia,droop-ctrl = <0x00000f00>;
> +	nvidia,force-mode = <1>;
> +	nvidia,cf = <6>;
> +	nvidia,ci = <0>;
> +	nvidia,cg = <2>;
> +
> +	nvidia,pwm-min-microvolts = <708000>; /* 708mV */
> +	nvidia,pwm-period-nanoseconds = <2500>; /* 2.5us */
> +	nvidia,pwm-to-pmic;
> +	nvidia,pwm-tristate-microvolts = <1000000>;
> +	nvidia,pwm-voltage-step-microvolts = <19200>; /* 19.2mV */
> +
> +	pinctrl-names = "dvfs_pwm_enable", "dvfs_pwm_disable";
> +	pinctrl-0 = <&dvfs_pwm_active_state>;
> +	pinctrl-1 = <&dvfs_pwm_inactive_state>;
> +};
> +
> +/* pinmux nodes added for completeness. Binding doc can be found in:
> + * Documentation/devicetree/bindings/pinctrl/nvidia,tegra210-pinmux.txt
> + */
> +
> +pinmux: pinmux@700008d4 {
> +	dvfs_pwm_active_state: dvfs_pwm_active {
> +		dvfs_pwm_pbb1 {
> +			nvidia,pins = "dvfs_pwm_pbb1";
> +			nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +		};
> +	};
> +	dvfs_pwm_inactive_state: dvfs_pwm_inactive {
> +		dvfs_pwm_pbb1 {
> +			nvidia,pins = "dvfs_pwm_pbb1";
> +			nvidia,tristate = <TEGRA_PIN_ENABLE>;
> +		};
> +	};
> +};
> 
