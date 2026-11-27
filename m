Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797292;
	b=V3rP3U0hRMddRbz1IpFF1xPd/jvC4qne1WIBppdpid4w4MJ1/4cXWNHbPMRd+inUkEsF
	 CQgM/3xIEufzijNz6By6tsaTGjyFKaVWnRUN0hXLIkybAInQ3kKn6UzZwOosY0H6lr1+y
	 1eQIYpTwE2I8Evkip0iMIQe2qm67NHqDo/wriQ8uCBj/Vcbo8Wsth3UyEeE+qS48IFXCO
	 RxgvmbfXSBLTYPaD/A/Q43J1DrsS9eX4sj6sXKTLkXBcU3y8NRR2kywJ0xmq9g34ng+lF
	 v2oC3HpOCceSkMbXEqv2gmSVvoG+LrBYFjJ5Hf38Ox8HWNayrfs/+B+JULK678Lnpdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797292;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:
	 Cc:Subject:In-Reply-To:References:Message-ID:X-Sender:Content-Type:
	 Content-Transfer-Encoding;
	bh=c0qKPSezpyQX6145fZoLLQhWhdlg5ooKrELDhZsi1pk=;
	b=BBI4HVG3sxKrO3X3Q0q1V4v7pui8qyvHZVZWoxqsgxZiWcUZ/rVf2jd7GtRzaqQj1DOi
	 RsKRRwYs84pwsZC93ivvlh618m5VwuUKYXH8YI+p8Dc67oO+DyOzXKKdQTm59BkNEDW9g
	 L35ha6kcd6zgm5U6Qfgb5I1FvK7dh1QMIR9pT9IlKKQBN4Fs4Lt839E+0xfaWFL3ezOnj
	 X9FAmeVxMt5HAmblIZfINDk5DvURJ9h/wCLT01CLZiZKlLLZTc7CYs3jmkw4jjXtfUrz8
	 hhKhvNlHea7J0eDcEr3TtkTaEtz91v1kGTSGqeSje4eI2bXAVQO9mc87RdiwgKB+/Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=BfuOYT2u;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=vgM0Afhq;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DD41606A31E;
	Fri, 27 Nov 2026 16:34:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DD41606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=BfuOYT2u;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=vgM0Afhq
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795797273; bh=c0qKPSezpyQX6145fZoLLQh
	Whdlg5ooKrELDhZsi1pk=; b=BfuOYT2ut11PQPwRzzBin2s6kNOs3djGjBEZtpdknFMlGjQFtm
	Mhwg0o7fZymFzl2zizLmI6uJgAyCLVJYfoen7r6xxlVMLqPw2Zkkfzt/wT6A6t8aDL3rzHI8N+N
	fKzbUKF5PpKh5qrWF6nmW8YvtQ/kE/tnFDunFnQfT6H0cY+RU7Y7duL6Z7JU5Untd8BKGJi74is
	P4kps3yS3kx3BgxfF96ObakqmhF2aCtQztqQTJ/JGAyKbQvZoCZUR8xTykCFS6bwHRZ00AZgBnf
	C5fqYF4g/t7HjZdaluNfBjEDS0mtttOzJVD24I7q95w6kvN0+thz0FuoiTpJyPi1KSA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1795797273; bh=c0qKPSezpyQX6145fZoLLQh
	Whdlg5ooKrELDhZsi1pk=; b=vgM0AfhqbZqTUIbGj7xSYxVvg0MYuWqKGxZfEj5PyIeB4vuhAH
	sfr6dOSp2DjEMIsNNAIRAx/NnEyi9jVNKEDA==;
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Date: Fri, 27 Nov 2026 17:34:32 +0100
From: =?UTF-8?Q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?=
 <barnabas.czeman@mainlining.org>
To: Hikmah Gumelar <hikmahgumelar@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
 <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-clk@vger.kernel.org, u.kleine-koenig@baylibre.com
Subject: Re: [PATCH v4 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
In-Reply-To: <20261125123146.379057-8-hikmahgumelar@gmail.com>
References: <20261125123146.379057-1-hikmahgumelar@gmail.com>
 <20261125123146.379057-8-hikmahgumelar@gmail.com>
Message-ID: <eae86bfe27d119c6170b25de5a917df3@mainlining.org>
X-Sender: barnabas.czeman@mainlining.org
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 2026-11-25 13:31, Hikmah Gumelar wrote:
> Enable CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision OV12A10
> 
> rear and Samsung S5K5E8 front image sensors on the Xiaomi Mi A1.
> 
> Signed-off-by: Hikmah Gumelar <hikmahgumelar@gmail.com>
> ---
>  .../boot/dts/qcom/msm8953-xiaomi-tissot.dts   | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts 
> b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> index fccb9c4360ca..87db6b18d191 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> @@ -74,6 +74,108 @@ vph_pwr: vph-pwr-regulator {
>  		regulator-always-on;
>  		regulator-boot-on;
>  	};
nitpick: add an empty line here
> +	vreg_cam_avdd: regulator-cam-avdd {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vreg_cam_avdd";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		gpio = <&tlmm 62 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-0 = <&cam_vreg_avdd_default>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&camss {
> +	vdda-supply = <&pm8953_s3>;
> +	status = "okay";
> +
> +	ports {
> +		port@0 {
> +			reg = <0>;
> +
> +			csiphy0_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&rear_cam_ep>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg = <2>;
> +
> +			csiphy2_ep: endpoint {
> +				clock-lanes = <7>;
> +				data-lanes = <0 1>;
> +				remote-endpoint = <&front_cam_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c0 {
> +	camera@10 {
> +		compatible = "ovti,ov12a10";
> +		reg = <0x10>;
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK0_CLK>;
> +		assigned-clock-rates = <24000000>;
> +		pinctrl-0 = <&cam_sensor_rear_default &camss_mclk0_default>;
> +		pinctrl-names = "default";
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		powerdown-gpios = <&tlmm 39 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_cam_avdd>;
> +		dvdd-supply = <&pm8953_l2>;
> +		dovdd-supply = <&pm8953_l6>;
> +
> +		rotation = <270>;
> +		orientation = <1>;
> +
> +		port {
> +			rear_cam_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				link-frequencies = /bits/ 64 <216000000>;
> +				remote-endpoint = <&csiphy0_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci_i2c1 {
> +	camera@2d {
> +		compatible = "samsung,s5k5e8";
xiaomi-tissot can come with ov5675 also.
> +		reg = <0x2d>;
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +		pinctrl-0 = <&cam_sensor_front_default &camss_mclk1_default>;
> +		pinctrl-names = "default";
> +
> +		reset-gpios = <&tlmm 129 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&pm8953_l22>;
> +		dvdd-supply = <&pm8953_l23>;
> +		dovdd-supply = <&pm8953_l6>;
> +
> +		rotation = <90>;
> +		orientation = <0>;
> +
> +		port {
> +			front_cam_ep: endpoint {
> +				data-lanes = <1 2>;
> +				link-frequencies = /bits/ 64 <418000000>;
> +				remote-endpoint = <&csiphy2_ep>;
> +			};
> +		};
> +	};
>  };
> 
>  &hsusb_phy {
> @@ -154,6 +256,7 @@ &pmi8950_wled {
>  };
> 
>  &rpm_requests {
> +	vdd_l23-supply = <&pm8953_s3>;
It should be placed under vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
>  	regulators {
>  		compatible = "qcom,rpm-pm8953-regulators";
> 
> @@ -302,6 +405,27 @@ gpio_hall_sensor_default: gpio-hall-sensor-state {
>  		bias-pull-up;
>  	};
> 
> +	cam_sensor_front_default: cam-sensor-front-default-state {
> +		pins = "gpio129";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_sensor_rear_default: cam-sensor-rear-default-state {
> +		pins = "gpio33", "gpio39";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
> +	cam_vreg_avdd_default: cam-vreg-avdd-default-state {
> +		pins = "gpio62";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-disable;
> +	};
> +
>  	ts_int_default: ts-int-default-state {
>  		pins = "gpio65";
>  		function = "gpio";
