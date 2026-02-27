Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC2C4779B6
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230010; cv=none; b=iQlZ31FRMliudoEO8OrDOw4McSb2OJlRXPv/WdrGCNwzfdcznEBiLxefonde7FAvWov7IXqyWinbAyCWZFz8qWMmTZz0Zo/VkhxtGYbHF3ABOLaUR8Uc+oEx8Q/4dgWHu0KKkGE5g97ZuVAzIIezakEXgyPmnp8nny1pLNLhj9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230010; c=relaxed/simple;
	bh=IIOCEw2t+0l72LMoF+mobRrMZmX5NBn1xnXPFaoBKs0=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AGGa2x3lJWln4fbL9/4auhP2ZCiVGFzm3wNIiNt9IJNAraxk5vxxdf3QyUTAS3bi+i/Ts5Vm+mSUH2N5kxeF8pL472pCtjhII2c6XePaMRx6ZrI5nrT5LqUhQ8M6JqGSsZREa/PzrCsGsaQZ3ePwEPlFZPNfDpDvNr4348H2ye8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jhCOfcDT; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jhCOfcDT"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-482f454be5bso33474195e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230008; x=1772834808; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=89iRGH0zqziCtR4XYNUtyhFhnoYfn28eiRVuc9YsATM=;
        b=jhCOfcDTHshPuWlToF+gdN8VogLay6L6JIl4340gZZsqjn3RlKADwuZicfS3beBvlY
         9MXWozCmHar8Ft26xBD2NqTdUMm4IdOxwfrCCanYS4vj2AOkEDI24BIFkOQbrbSudCSj
         YfqR2eae5QP16kf6mFBVUgr1JF/sCH9jpKzmxZzn1byTj0tN40Rap6zt8sYfk8KC7GAZ
         zVilwSlA81FcqISPIMRBnDYGzfks717ObK/VsuaYE/IS5sFCRPMjDHBMOY1fV1SPt0D1
         BON/wHrI6JM4uoZRHa5ngE8C2Jm3dOZVAWW5uzaVfogbjh7r4ThKaGsambkiDNobshNl
         E8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230008; x=1772834808;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=89iRGH0zqziCtR4XYNUtyhFhnoYfn28eiRVuc9YsATM=;
        b=aq8ZDlJMJFfngT+mCb0Y5ssj0d9PxmuxQU8DFZDVYSxcwo40QsNFtis04i6IPRhBWF
         0pTE3JSUcsIQi4/a9Dnq74dbM9H1mLdxJRyr+sdwOpNKqjLg49AvnET3SxJYNaoYSJIG
         YPl04yIfCWXEK/bPc/Uml8bO/AvhDZrl/VWpU+0NF8OLhs1APlvfY4fOSVT/iMTN0160
         TP4QVj2HNeDr+4S/GaPCEQTcQNiHhQyr9zKTb1GZErUbJbgyGGjqZNUPDRsJ9ejC5DN7
         f9WRNeZyGPn1OC1DdvuYVSs5iydSMXSPscmZedNsOIU02oBIevYXsR7yy6B5/gaekvYM
         jM1A==
X-Forwarded-Encrypted: i=1; AJvYcCU8VRz3bj2v4X+EFbspSamDLfSA5hFypK4/GJQvyelgdMzuVfRBF8d6+tQl2K8+A9QkIy2+d4ijRnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/qqf/eadMuqQbs69tGGkKA67aABfWMvA6Ya18UPXBB0ivBO51
	vtSM6VIudghVfTkPBNn9ymgnxg+bvroN74QPIFqIyxTroLH6KuoS1Z4uhAM3miPfHBE=
X-Gm-Gg: ATEYQzxhi1mbMYrHWx6BI4Lh90B+ZRCJ/+Q8dDZhkknL624W+08zl+T/nRps9nXIUOB
	K6KqosVsPi5IPzdIXazOgXw6xfks5EDagtdj5fvAfA1xzA6ftujLQN+TRnap/rfKqG1AjPElakc
	KQNIvqXq3elknKvEcfJoZfqn4jcMZdarC+JMSUuOSXTYy8M3gm86Zh4W/gnqQyvGn3yE1eCkoo6
	crvyXYR6HFDVn4bKcI5XbX0giLSb0R85Aq/2oSftIP5UgJDNiVuVt6O43CPCs/fxWkY6wtTDa8O
	eIfFb2WpMVrNg9lYvpj+PeZxLd5AOSr5shf/0x4cFilmlXXrM6abh41FGrLaisITutfu0G7vDeU
	wX9tldLmwJg9g422GWpz+qxhfyOypQitkVvrgsQ+WbD6XJIpk4Kp3mzAa87mr6yf1XcY/y8ckK3
	IUiwPVX0nCkUiDwGLX2I3X8rafYwuoJh2GIulDLTua+dMCi0zWkgjOHAXXTr+I3ALHns6L4zH4z
	FLximarhHp2p8nXTS6uHACZhhVvtNIg1c0=
X-Received: by 2002:a05:600c:608a:b0:47e:e2b8:66e6 with SMTP id 5b1f17b1804b1-483c9934dd3mr76689115e9.14.1772230007672;
        Fri, 27 Feb 2026 14:06:47 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75df90sm246321165e9.14.2026.02.27.14.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:06:47 -0800 (PST)
Message-ID: <148be140e22947a1f3524f24d8f55218650d3f2e.camel@linaro.org>
Subject: Re: [PATCH v8 13/18] arm64: dts: qcom: x1e80100-crd: Add ov08x40
 RGB sensor on CSIPHY4
From: Christopher Obbard <christopher.obbard@linaro.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Bjorn Andersson	
 <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Robert
 Foss	 <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, Mauro Carvalho
 Chehab	 <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue
 <bod@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 27 Feb 2026 22:06:46 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-13-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-13-95517393bcb2@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Bryan,

On Wed, 2026-02-25 at 15:11 +0000, Bryan O'Donoghue wrote:
> Define ov08x40 on cci1_i2c1. The RGB sensor appears on the AON CCI pins
> connected to CSIPHY4 in four lane mode.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/x1-crd.dtsi | 76 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 76 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1-crd.dtsi b/arch/arm64/boot/dts/q=
com/x1-crd.dtsi
> index c89f5ad0aed56..d47404c71b80b 100644
> --- a/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-crd.dtsi
> @@ -6,6 +6,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
> @@ -901,6 +902,65 @@ &gpu {
>  	status =3D "okay";
>  };
> =20
> +&camss {
> +	status =3D "okay";
> +
> +	ports {
> +		/*
> +		 * port0 =3D> csiphy0
> +		 * port1 =3D> csiphy1
> +		 * port2 =3D> csiphy2
> +		 * port3 =3D> csiphy4
> +		 */
> +		port@3 {
> +			camss_csiphy4_inep0: endpoint@0 {
> +				clock-lanes =3D <7>;
> +				data-lanes =3D <0 1 2 3>;
> +				remote-endpoint =3D <&ov08x40_ep>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci1 {
> +	status =3D "okay";
> +};
> +
> +&cci1_i2c1 {
> +	camera@36 {
> +		compatible =3D "ovti,ov08x40";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +		pinctrl-names =3D "default";
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <0>; /* front facing */
> +
> +		avdd-supply =3D <&vreg_l7b_2p8>;
> +		dovdd-supply =3D <&vreg_l3m_1p8>;
> +
> +		port {
> +			ov08x40_ep: endpoint {
> +				data-lanes =3D <1 2 3 4>;
> +				link-frequencies =3D /bits/ 64 <400000000>;
> +				remote-endpoint =3D <&camss_csiphy4_inep0>;
> +			};
> +		};
> +	};
> +};
> +
> +&csiphy4 {
> +	vdda-0p8-supply =3D <&vreg_l2c_0p8>;
> +	vdda-1p2-supply =3D <&vreg_l1c_1p2>;
> +
> +	status =3D "okay";
> +};
> +
>  &i2c0 {
>  	clock-frequency =3D <400000>;
> =20
> @@ -1515,6 +1575,22 @@ &tlmm {
>  			       <44 4>, /* SPI (TPM) */
>  			       <238 1>; /* UFS Reset */
> =20
> +	cam_rgb_default: cam-rgb-default-state {
> +		mclk-pins {
> +			pins =3D "gpio100";
> +			function =3D "cam_aon";
> +			drive-strength =3D <16>;
> +			bias-disable;
> +		};
> +
> +		reset-n-pins {
> +			pins =3D "gpio237";
> +			function =3D "gpio";
> +			drive-strength =3D <2>;
> +			bias-disable;
> +		};
> +	};
> +
>  	edp_reg_en: edp-reg-en-state {
>  		pins =3D "gpio70";
>  		function =3D "gpio";
