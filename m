Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438325;
	b=CZUNcOwnaXhKykeqxvpRnEe6Xs3UrpFQCECRFFqQqPQ7QTZ9YIxFSpXfZBOCu1h6B/FG
	 Ya9NUvWbpPxVgcilLrw6QDEuUQdT7noLlZH5qqslS/awx2gw/ghfKxoS3KOHM3u4WDavk
	 7OBHWurLRt+MblRn45G0vxjQPuoFH5qUQibBOl/tJoyWnh4jq7eTPfMaIDf3l4wldkCzx
	 7D0t1M/I4WFGMph2mZJhGsI2FHQJrSyxiIV1Vz/TYG8QFSXFHqJJ94yIdY0PwWf9wlqPc
	 0AfP9jhayFDlvvjWcn9/orvr43gOi5Wryw3jEody2RyJfYfKyEUn+JpQEC6rlpsUm4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438325;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=RL5W8o5n+ZQXF/3m0OY5QGBdUDJ/J3OtGNthRBW3czY=;
	b=13UJx12yigweKBg3Iu6qUOEk+BEit5yRptf2H/+cus3tAgYa5yRiJSW+7AJnc2od7cfZ
	 LwwSZEkMAKxpD5YLqqG/2YK+LOMjw78h8HUPcEaDjtdB9IFaCJmJMQE8MiYCErGKjO/Qi
	 gYGeqMvlm2gbHVKPj/JL/AbL9JkSJVmA9MBRExxzcX31Od+SFRmo/QjVDw2JI4Ex4IAA4
	 7xaLZKeuS3MH3VLYkoMXp52vq3WCU6XLaObbRPzOjOfQ/N6w9f9CoAeBHAAEXzpJdE2c0
	 Jn7iIE6nhvdzR9TYpr5/jg+nvn+VjJN6pndQEtkTMtwX9X3FyoKnehckHIURoQJY5Pw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxLE1hlv;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84362606A693;
	Mon, 23 Nov 2026 12:52:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VxLE1hlv
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA10B1F0093E;
	Mon, 23 Nov 2026 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438325;
	bh=RL5W8o5n+ZQXF/3m0OY5QGBdUDJ/J3OtGNthRBW3czY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VxLE1hlvm5/tVSh45vlyyqkvk2b83vnNm9zGRQgzj1vh9qsVY8akQCxuzgPA0OKGB
	 4aNkSi9q9+QYtwPKtTbPXoIYsyLRXGkoRVXEGIcH/hRB4lcHfa4HlGFgC6IQhpN57w
	 zLCvvNLp7kSht3CMbdUzk5aB//0fQd3rX/PAf7I5/VT3TZOPdsDHX1WlauiCOcQwIm
	 HiXGDMnc+HjN4IzOS+dqZe66eiDTPJn9Vr2mOpKISriJPXDUI0ZwBHkO3pPeuCTius
	 YvnRn+UfIcAablO2VKPDDCThz+b0vQP8271H9c5W8v5l1hfnK+ht+7aCoj7SlNHhAm
	 q+la6bNG5rt4g==
Message-ID: <sashiko-outbox-229269@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-8-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-8-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:52:04 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Low] arm64: dts: qcom: tissot: redundant pm8953_l2 and pm8953_l23
  overrides
- [Low] arm64: dts: qcom: tissot: sensor MCLK and unused MCLK2 pinctrl
  on cci node
- [Low] arm64: dts: qcom: tissot: non-generic camera node names and
  unsorted nodes
--

commit 32dade37fcf383efdbda253ebb3dd130e1b41698
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

This commit enables the CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the
OmniVision OV12A10 rear and Samsung S5K5E8 front camera sensors in the
Xiaomi Mi A1 device tree.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> index fccb9c4360cae..5d4fd7f420420 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> @@ -308,6 +308,20 @@ ts_int_default: ts-int-default-state {
>  		drive-strength =3D <2>;
>  		bias-pull-up;
>  	};
> +
> +	cam_sensor_rear_default: cam-sensor-rear-default-state {
> +		pins =3D "gpio33", "gpio39", "gpio62";
> +		function =3D "gpio";
> +		bias-disable;
> +		drive-strength =3D <2>;
> +	};
> +
> +	cam_sensor_front_default: cam-sensor-front-default-state {
> +		pins =3D "gpio129";
> +		function =3D "gpio";
> +		bias-disable;
> +		drive-strength =3D <2>;
> +	};
>  };
> =20
>  &uart_0 {
> @@ -325,3 +339,103 @@ &usb3_dwc3 {
>  	/delete-property/ usb-role-switch;
>  	dr_mode =3D "peripheral";
>  };
> +
> +&camss {
> +	status =3D "okay";
> +	vdda-supply =3D <&pm8953_s3>;
> +
> +	ports {
> +		port@0 {
> +			reg =3D <0>;
> +			csiphy0_ep: endpoint {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <0 1 2 3>;
> +				remote-endpoint =3D <&rear_cam_ep>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg =3D <2>;
> +			csiphy2_ep: endpoint {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <0 1>;
> +				remote-endpoint =3D <&front_cam_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&cci0_default>,
> +		    <&cci1_default>,
> +		    <&camss_mclk0_default>,
> +		    <&camss_mclk1_default>,
> +		    <&camss_mclk2_default>;
> +
> +	status =3D "okay";
> +};

[Severity: Low]
Should camss_mclk0_default and camss_mclk1_default be attached to their
respective camera sensor nodes instead of &cci, and camss_mclk2_default be
dropped?

The CCI node in msm8953.dtsi already configures cci0_default and
cci1_default, while GCC_CAMSS_MCLK0_CLK and GCC_CAMSS_MCLK1_CLK belong to
the rear and front sensors and MCLK2 (gpio28) is unused on this board.
Putting the MCLK pinctrl states on &cci ties sensor clock pin muxing to the
I2C controller and claims an unused pin, whereas &cci only needs
status =3D "okay".

> +
> +&cci_i2c0 {
> +	camera-sensor@10 {
> +		compatible =3D "ovti,ov12a10";
> +		reg =3D <0x10>;
> +		clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
> +		pinctrl-0 =3D <&cam_sensor_rear_default>;
> +		pinctrl-names =3D "default";
> +		reset-gpios =3D <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pwdn-gpios =3D <&tlmm 39 GPIO_ACTIVE_LOW>;
> +		vana-gpios =3D <&tlmm 62 GPIO_ACTIVE_HIGH>;
> +		avdd-supply =3D <&pm8953_l22>;
> +		dvdd-supply =3D <&pm8953_l2>;
> +		dovdd-supply =3D <&pm8953_l6>;
> +		rotation =3D <270>;
> +		orientation =3D <1>;
> +		status =3D "okay";
> +		port {
> +			rear_cam_ep: endpoint {
> +				data-lanes =3D <0 1 2 3>;
> +				remote-endpoint =3D <&csiphy0_ep>;
> +				link-frequencies =3D /bits/ 64 <216000000>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci_i2c1 {
> +	camera-sensor@2d {
> +		compatible =3D "samsung,s5k5e8";
> +		reg =3D <0x2d>;
> +
> +		clocks =3D <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		pinctrl-0 =3D <&cam_sensor_front_default>;
> +		pinctrl-names =3D "default";
> +
> +		reset-gpios =3D <&tlmm 129 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply =3D <&pm8953_l22>;
> +		dvdd-supply =3D <&pm8953_l23>;
> +		dovdd-supply =3D <&pm8953_l6>;
> +		rotation =3D <90>;
> +		orientation =3D <0>;
> +
> +		status =3D "okay";
> +
> +		port {
> +			front_cam_ep: endpoint {
> +				data-lanes =3D <0 1>;
> +				remote-endpoint =3D <&csiphy2_ep>;
> +				link-frequencies =3D /bits/ 64 <418000000>;
> +			};
> +		};
> +	};
> +};

[Severity: Low]
This isn't a bug, but the Devicetree specification and Qualcomm DTS style
use generic camera@10 and camera@2d node names rather than
camera-sensor@10 and camera-sensor@2d.

Also, status =3D "okay" is redundant on new board-level child nodes, and the
new &camss, &cci, &cci_i2c0, &cci_i2c1 references and &tlmm pinctrl states
are appended at the end rather than kept in alphabetical order with the
rest of this file.

> +
> +&pm8953_l23 {
> +	regulator-min-microvolt =3D <1200000>;
> +};
> +
> +&pm8953_l2 {
> +	regulator-min-microvolt =3D <1200000>;
> +	regulator-max-microvolt =3D <1225000>;
> +};

[Severity: Low]
Are these &pm8953_l23 and &pm8953_l2 overrides redundant?  Both regulators
are already defined earlier in this file under &rpm_requests with
regulator-min-microvolt =3D <1200000> and regulator-max-microvolt =3D <1225=
000>.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D7
