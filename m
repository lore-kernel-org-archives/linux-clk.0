Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795438146;
	b=LUOoj6lUByWszMj6VP9mLdvfFQhKGQcGJ6ph+9bHncDOAM+Y3WvDxLztDbOxdUJd9KIt
	 OmbHTtHRSGGOmr/pPA3GFCUUo/Viwb7rYwKW3v7s6f8ImIvOqrj5xxVcQuah9bhm2u9qJ
	 ne6BMUCVeB5jWLYQpVmu+/XgW9X4R9V1Fa6wkuB990TeQlCMBmxNOAgGrK8UxWi3zaj0u
	 e+EFIgSaCufLsL2S8BC+gB5/wP6qa3kDSgwhzjTQ70KOghm07ABIe3RqvOEsjAJymJgaP
	 /+YJIGQXrJe7Pb6Ip+NZlNAlfNcB0YPvnSnDCsBX5WVzEvFWVXN57eOOFrIXYwijNlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795438146;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ClaVrzyn2eIXIvK+7DuI6AtAqSoQrEoZ1zEDeyX5I3I=;
	b=KxUEv7Y6bGswJvy8W5mVHhWVc6LF80ErEMk6Jju9BZqq5GZImLzw7rLOZCvZb1Wq2B1L
	 eiIRzJMslFo8XfrWe5LwRx6WSfDU6I9K/x5Upu0x667feerEiihFuroW+YxQ74hZxSC/B
	 gC94Bv0P/syT2z7rl9R7k95p61WVKQxxj+8BID1qTt7rg8MYiNp9e4iOil1xp4FDA0Qkc
	 fodz2aqhEwdwompxqmdXsL8fQx9FisrDkWLwqWc7vxGlCTVHmT7Z0zGs/WrrPvvBSA7cZ
	 DRuZsW/E9x3PFR0Yo8fbtkyckK+AoEDYAbr4abLBtls2etNBqVxMRAiZVsUxMvlYbsg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xl38hrN5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D7F606A332;
	Mon, 23 Nov 2026 12:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Xl38hrN5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91C561F000EE;
	Mon, 23 Nov 2026 12:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795438145;
	bh=ClaVrzyn2eIXIvK+7DuI6AtAqSoQrEoZ1zEDeyX5I3I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Xl38hrN52zetpjaBLwuDKPwabiCpq4LcFT0n6x1v+NR/nZ2AFNL6i1Av98mundJxW
	 25pg6RjzP6kfIBGH3XyJNjf9Gky+IM4AQBTlFj11J/fuEJLAXNt6PMnRnj79QS5o34
	 HcOBLQYEJF4X3+i2Pz7+bIFN+p7UMkawI8i1ADWoT7vyHlbhMaEmtFJWlm+LkkC6cl
	 x9bZcCQTRLEtEbijN5R4+bMOHJmA/pDLtZ7BRxIfecY+wEpvvQ7kDsnRaPuDqb8HVu
	 cWlt4WezvyXvEuo9iVAj3dAvZM9nTV+hk9xQJzOKaLLUIFMlamGPchalaplnkmUU5w
	 hAVy8k6riwkXw==
Message-ID: <sashiko-outbox-229265@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: msm8953: add CAMSS node and
 MCLK pinctrl states
Reply-To: sashiko-reviews@lists.linux.dev
To: "Hikmah Gumelar" <hikmahgumelar@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, media-ci@linuxtv.org
In-Reply-To: <20261123123546.152162-7-hikmahgumelar@gmail.com>
References: <20261123110805.119610-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-1-hikmahgumelar@gmail.com>
 <20261123123546.152162-7-hikmahgumelar@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 12:49:05 +0000
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
- [Medium] arm64: dts: qcom: msm8953: undocumented interconnects on
  camss@1b00020
- [Low] arm64: dts: qcom: msm8953: camss@1b00020 placed out of address
  order
- [Low] arm64: dts: qcom: msm8953: camss_mclk pinctrl states placed out
  of order
--

commit 27cc0ba26aa55e15a280cb981915e46ef83e3448
Author: Hikmah Gumelar <hikmahgumelar@gmail.com>

arm64: dts: qcom: msm8953: add CAMSS node and MCLK pinctrl states

This commit adds the camera subsystem (CAMSS) device node and MCLK0/1/2
pinctrl state nodes to the Qualcomm MSM8953 SoC devicetree.

> diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/=
qcom/msm8953.dtsi
> index 753167c3f8619..2e64fb8bbb2ee 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
> +++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
> @@ -902,6 +902,27 @@ sdc1_cmd_off: sdc1-cmd-off-state {
>  				drive-strength =3D <2>;
>  			};
> =20
> +			camss_mclk0_default: camss-mclk0-default-state {
> +				pins =3D "gpio26";
> +				function =3D "cam_mclk";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
> +			camss_mclk1_default: camss-mclk1-default-state {
> +				pins =3D "gpio27";
> +				function =3D "cam_mclk";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
> +			camss_mclk2_default: camss-mclk2-default-state {
> +				pins =3D "gpio28";
> +				function =3D "cam_mclk";
> +				drive-strength =3D <2>;
> +				bias-disable;
> +			};
> +
>  			sdc1_data_on: sdc1-data-on-state {
>  				pins =3D "sdc1_data";
>  				bias-pull-up;

[Severity: Low]
Should these pinctrl state nodes for gpio26, gpio27, and gpio28 be placed
between i2c_6_sleep (gpio22, gpio23) and cci0_default (gpio29, gpio30)
instead of splitting the sdc1_* states?  Commit 589deb6bc275 ("arm64:
dts: qcom: msm8953: Re-sort tlmm pinctrl states") sorted the tlmm child
nodes by the pins property.

> @@ -1257,6 +1278,140 @@ cci_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		camss: camss@1b00020 {
> +			compatible =3D "qcom,msm8953-camss";

[Severity: Low]
Should camss@1b00020 be placed before cci@1b0c000 (immediately after
display-subsystem@1a00000) to keep child nodes under soc@0 sorted in
ascending unit-address order?

[ ... ]

> +			interconnects =3D <&snoc_mm MAS_VFE0 RPM_ACTIVE_TAG
> +					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
> +					<&snoc_mm MAS_VFE1 RPM_ACTIVE_TAG
> +					 &bimc SLV_EBI RPM_ACTIVE_TAG>,
> +					<&bimc MAS_APPS_PROC RPM_ACTIVE_TAG
> +					 &pcnoc SLV_CAMERA_SS_CFG RPM_ACTIVE_TAG>;
> +			interconnect-names =3D "cam_vfe0_mem",
> +					     "cam_vfe1_mem",
> +					     "cam_ahb";

[Severity: Medium]
Does adding interconnects and interconnect-names here cause dtbs_check
validation failures for all boards that include msm8953.dtsi?
Documentation/devicetree/bindings/media/qcom,msm8953-camss.yaml specifies
additionalProperties: false and does not document interconnects or
interconnect-names.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123123546.1521=
62-1-hikmahgumelar@gmail.com?part=3D6
