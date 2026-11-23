Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448780;
	b=bmB8XWrcNLX7A0kbPgdZXGtlMZxH43i6KBhoMCHQjh3ToGBXmEBX51t6ghWhInQypaLu
	 P9Q1QWkKibrV3JiQCQzjFBnVeV9mR0BqlTH8US9ih8wIwJpG+xxVgPwgNfSlKPswnbYf+
	 TqZtCWj/TSaXEQcCX5Ff3m7SLlhU0RQrkS5yasqXorsYKYNw73LW+btoV77rcJ3dY1vOB
	 BzxInSgX/92dicrKCySqfNeQRrexpPJNkVhQ7ggQeY5fYqHAc30P4SMDvf4VmM3P9IVkO
	 IEgpgJiLJyQ357xrv1qPFiE6mmX0uXg4y4O2qZ7/roxe0pBV3WEgqLcKGK22FHfBviQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448780;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=09xU7ClFEgQBGI1uNF1+/hcxvFo8UWiszBeC8hjBVyU=;
	b=UFnGrspt/jPWNTihYEenEqSE29ERblxz8bde4QTGlPmDMyNe8AQrMhDrFSRRo5FMsNTU
	 voOpMbyKXg1L33MtFDvWq2BZhlfgoSOJNiYw+e/oBJ153FRMPSo+Hp5LGsAmyqV7NDEtc
	 DXXUfj6713vJBmWmWyjTiFYYxt9bj4ssyZtb1ikPwxvCA0YgnP+zJ7euEHahSyRBW55vU
	 PWkjlDj2jUsqYh482haq+5HOvJYKa0a3Dnh9ziKyxmlarXy4egX05tY0pQWRnz5zv7hg1
	 gl0FHeSTgCns1mWVp+7YbR9yD+MfsONuYLysBMEZler0qAJUBAyDCOtdyGmEmU806sA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuvblYos;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16A606A31A;
	Mon, 23 Nov 2026 15:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VuvblYos
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F1B1F000D0;
	Mon, 23 Nov 2026 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795448780;
	bh=09xU7ClFEgQBGI1uNF1+/hcxvFo8UWiszBeC8hjBVyU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VuvblYosDatND6/kBcqUI7uopAMsmOTfq2VEjAfxnVv+Ak5wZDCFUmHzOND76Tjvv
	 NsUHUieUjs/BvNJ2U2STGLtd99UxCkxYKy08J2hr/AE+drN3MhwRW4CmIQzjqQWHjj
	 8kS8+Bj/ha5I8+Vh+0qqPg6fYGfYySFiNwsTf2LP0nY7zPhzU1+998lzfcgHCJVSbU
	 0CMGNakM5Sb4Gbps6v9NcPmAU+wiT3wdtn6dRKFvXbM9T7Q7ciQpL12Ajekip3a3O9
	 9u/BqD2FvappDDtELlK/KRTXIiI6byW0dmxagXJ2kwy/0zlwnnioDB2Ich/Gvl75m0
	 z+6lSh1IVd0mw==
Message-ID: <sashiko-outbox-229602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 7/7] arm64: dts: qcom: msm8953-xiaomi-tissot: enable
 front and rear cameras
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123152722.168879-8-hikmahgumelar@gmail.com>
References: <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-1-hikmahgumelar@gmail.com>
 <20261123152722.168879-8-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 15:46:19 +0000
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
- [High] arm64: dts: qcom: 1-based data-lanes in camss endpoints break
  camss_probe()
- [High] arm64: dts: qcom: powerdown-gpios in camera@10 ignored by
  ov12a10_probe()
- [Medium] arm64: dts: qcom: missing vdd_l23-supply parent for camera@2d
  dvdd-supply
--

commit f90e380b7cfcacb30ebf79d76d723184343a3304
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

arm64: dts: qcom: msm8953-xiaomi-tissot: enable front and rear cameras

This commit enables CAMSS, CCI, CSIPHY0/CSIPHY2 ports, and the OmniVision
OV12A10 rear and Samsung S5K5E8 front camera sensors on the Xiaomi Mi A1.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts b/arch/ar=
m64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> index fccb9c4360cae..e41cbd4d01b28 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-xiaomi-tissot.dts

[ ... ]

> +&camss {
> +	vdda-supply =3D <&pm8953_s3>;
> +	status =3D "okay";
> +
> +	ports {
> +		port@0 {
> +			reg =3D <0>;
> +
> +			csiphy0_ep: endpoint {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <1 2 3 4>;
> +				remote-endpoint =3D <&rear_cam_ep>;
> +			};
> +		};
> +
> +		port@2 {
> +			reg =3D <2>;
> +
> +			csiphy2_ep: endpoint {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <1 2>;
> +				remote-endpoint =3D <&front_cam_ep>;
> +			};
> +		};
> +	};
> +};

[Severity: High]
Should data-lanes in csiphy0_ep and csiphy2_ep be 0-based (<0 1 2 3> and
<0 1>)?

On MSM8953, the CAMSS endpoints connect directly to sensor endpoints
rather than standalone PHY nodes, so camss_detect_legacy_phy() sets
camss->legacy_phy =3D true and camss_parse_ports() passes lane_base =3D 0 to
camss_parse_endpoint_node():

drivers/media/platform/qcom/camss/camss.c:camss_parse_endpoint_node() {
    ...
	for (i =3D 0; i < lncfg->num_data; i++) {
		u8 lane =3D mipi_csi2->data_lanes[i];

		if (lane < lane_base || lane - lane_base >=3D MSM_CSIPHY_MAX_DATA_LANE) {
			dev_err(dev, "invalid data-lane %u\n", lane);
			return -EINVAL;
		}

		lncfg->data[i].pos =3D mipi_csi2->data_lanes[i] - lane_base;
    ...
}

Because MSM_CSIPHY_MAX_DATA_LANE is 4, lane 4 in csiphy0_ep fails this
check and aborts camss_probe() with -EINVAL.  In csiphy2_ep, <1 2> with
lane_base =3D 0 shifts lncfg->data[i].pos to physical data lanes 1 and 2
instead of lanes 0 and 1.

> +
> +&cci {
> +	status =3D "okay";
> +};
> +
> +&cci_i2c0 {
> +	camera@10 {
> +		compatible =3D "ovti,ov12a10";
> +		reg =3D <0x10>;
> +
> +		clocks =3D <&gcc GCC_CAMSS_MCLK0_CLK>;
> +		pinctrl-0 =3D <&cam_sensor_rear_default &camss_mclk0_default>;
> +		pinctrl-names =3D "default";
> +
> +		reset-gpios =3D <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		powerdown-gpios =3D <&tlmm 39 GPIO_ACTIVE_LOW>;

[Severity: High]
Will ov12a10_probe() ignore powerdown-gpios here?

ov12a10_probe() requests the GPIO with con_id "pwdn" via
devm_gpiod_get_optional(dev, "pwdn", GPIOD_OUT_HIGH), and gpiolib has no
OF rename entry mapping "pwdn" to "powerdown-gpios".  The lookup silently
returns NULL, so ov12a10_power_on() and ov12a10_power_off() never drive
GPIO 39 and the rear sensor stays powered down.

[ ... ]

> +&cci_i2c1 {
> +	camera@2d {
> +		compatible =3D "samsung,s5k5e8";
> +		reg =3D <0x2d>;
> +
> +		clocks =3D <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		pinctrl-0 =3D <&cam_sensor_front_default &camss_mclk1_default>;
> +		pinctrl-names =3D "default";
> +
> +		reset-gpios =3D <&tlmm 129 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply =3D <&pm8953_l22>;
> +		dvdd-supply =3D <&pm8953_l23>;
> +		dovdd-supply =3D <&pm8953_l6>;

[Severity: Medium]
Does the rpm-pm8953-regulators node also need vdd_l23-supply =3D
<&pm8953_s3>?

camera@2d is the first consumer of pm8953_l23 in this device tree, and
rpm_pm8953_regulators in drivers/regulator/qcom_smd-regulator.c defines
"vdd_l23" as l23's parent supply.  Without vdd_l23-supply in the
regulators node, pm8953_l23 falls back to dummy-regulator and enabling
dvdd-supply in s5k5e8_power_on() does not vote for pm8953_s3.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123152722.1688=
79-1-hikmahgumelar@gmail.com?part=3D7
