Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB147AF4D
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:08:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230133; cv=none; b=W29jUkrGEPADX2my14o0Ge9hPUpB5zWOgcvIUZot4ChWMiLoDvRA+hZMqh1BnJYeiBElbpNnUlL5elnrLZz4qEib7H5pEKtwwDpV78VviommefCc/rtxFglzegiIyDkwNxKMWw2a0lDepAnMVr4RyRxZ/bnDYwu/g1IJJyNbx2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230133; c=relaxed/simple;
	bh=iNSxSIh+ll79sf4TNG2hK58H2dS4Xk6YssNMKaMP+fY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bq9K8nsi8uCo4mCZ6T2YGMwkQk5q4ZZ+0wtHJNTk51oZoIuxWVprMPB9JFJObfHqCFP84OeNyHj0a2IaORWEpatsMGh0uEU5bTq6+QXVQeqVRzT3rMYcs5Lenul0c/5IN/vPoMV724sRAj3pxj8MlwM8ebDA/yUodVaXCx4wcFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WgbcI9S2; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WgbcI9S2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4807068eacbso20736135e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:08:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230129; x=1772834929; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=5jgh0ia5KAYwXdV6WzubAimlSgIWZXu7hr9crI9YEOI=;
        b=WgbcI9S2wbLLbpaGOETf5fJaqkGxJ04SN2tQQinMal6ImkiaKMD0ac8IDGENgh3/Is
         +CotPYn7+GkPGqz3ZouuCG1zhhnH77+Yk7wyAKdNpDxzK1aDpJlTBcZmesUnz5217uR4
         wc7mSb9DbJb74t7UHVA20HIlNwSmS3Y5rmqTZRPSbYfnsVQhow0T/HjKpBA3tg7QbAMd
         8vEyJjIm2EEryPXKg4ERpue180FrTr62Mn5k11pqDlQQ9S40Z9UJRDu0rWyZPy7vedE8
         aSQhBwb4mWQYXOrOhbuUouln0/nezPL5niRj0NErSwoD9kcpfBGJ33rVu/Ui9PFL5ABb
         p+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230129; x=1772834929;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5jgh0ia5KAYwXdV6WzubAimlSgIWZXu7hr9crI9YEOI=;
        b=g8VdVWP1B6R91gQ7RaUvjt8he9PWCBlO3omdxOwJNibB/u9yDpRtuCKyW21eb40wyt
         ryUoQ7ci91wQithnJ7EDOXaxB4wRBZAY99oMTnXKgpezF5QcZbN6FHDXYe3O80cAXEBT
         2LEtLY9g05E98qJJJuZ/LzbNOvMcpVHmdVyA7lpLsZ7Dh2bpXw1FSY3hljGH8GGwoU7G
         zIcuYIe+gQz9dEEvRZIa+f4PFsK+31JuRyPp5DIwXR9XO0SA918GI4Z9fxWS1lhz0EJR
         jKbWmrh8C7XsimaDg6S4WhTdk5lamL12/KzliETx5wGhAeS2BQo6XB9V0awlzw2mTfcz
         TDHg==
X-Forwarded-Encrypted: i=1; AJvYcCXnf1GFm75wnQ99jlkwfvIRsLF6LpD2NwcKVBdNQnWWo/7ibWrPbL7Of3MvuRMy6KgTb8qdpmoMANk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHrLFsmT7++5KHDmiopfh6/9f3PMh16YqbE1Sfl8FEfSsOucve
	ngfUm7GXHJe9Ofjn5JZ9AshMvV/tIaDpf3BgBID5ssVTaRBSg7kzyJM6lVHwukT/28A=
X-Gm-Gg: ATEYQzyooSDOGKKyM6bdOCE19iVWcb9mOyOtwQ9Fse/ViwB3h1i4SRQwaIezpvuCk4d
	4cgWePEbligjlNkUhqAe7j7ZDHXsIQmQY+JCgJ2xaHev1E2tzeZ9ZLwhatPm18YxhjeLF+z9AFe
	/H21L/OYKFB+63eaUDKFy1xlg+K6yBDm7myt7qhrPNsELhHNk8jTTOqP4+IkF3iVnp8FYDeliDE
	SqqC4PiHXgTZ3d0eupQ57sRjrjQOz0rPLnpnI1k6OaMYP9+0Vg9auPDDF3GvJa7SQEGfl46ZovJ
	RbO9JiLhe6tu57HUGnM/bV3eqQWyUToCIafnwEa/6rU05gXLOZWYdUWRPCRoepho43f9QQk9NZz
	KZotkY98m++BEW8v4O3RcXFmYeEm7Uql5Wm3WEVfFv4rAZYGmVDm8p6utE/F1Wsqdiq3PJTrSB1
	722tfjXp/kuyqSJQ2R3krovZHt4janOtv9WvbJO5pqO7hDxYdB4VvYuHklb+V0cI8eOLzdveTHQ
	X84TFhH3f21zBHKDP8i+/ij
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr64166715e9.20.1772230128544;
        Fri, 27 Feb 2026 14:08:48 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb987b0sm66574165e9.13.2026.02.27.14.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:48 -0800 (PST)
Message-ID: <2932da190f788d2a11f6743bd87b6ff4a61938ca.camel@linaro.org>
Subject: Re: [PATCH v8 17/18] arm64: dts: qcom: x1e80100-lenovo-yoga-slim7x:
 Add ov02c10 RGB sensor on CSIPHY4
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
Date: Fri, 27 Feb 2026 22:08:47 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-17-95517393bcb2@linaro.org>
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
> Add in the RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  .../boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts  | 77 ++++++++++++++++=
++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts b/a=
rch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> index f10dff1da7f8e..f3f4841ad2c83 100644
> --- a/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> +++ b/arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dts
> @@ -7,6 +7,7 @@
> =20
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
>  #include "hamoa.dtsi"
> @@ -856,6 +857,66 @@ &gpu_zap_shader {
>  	firmware-name =3D "qcom/x1e80100/LENOVO/83ED/qcdxkmsuc8380.mbn";
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
> +				data-lanes =3D <0 1>;
> +				remote-endpoint =3D <&ov02c10_ep>;
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
> +		compatible =3D "ovti,ov02c10";
> +		reg =3D <0x36>;
> +
> +		reset-gpios =3D <&tlmm 237 GPIO_ACTIVE_LOW>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&cam_rgb_default>;
> +
> +		clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clocks =3D <&camcc CAM_CC_MCLK4_CLK>;
> +		assigned-clock-rates =3D <19200000>;
> +
> +		orientation =3D <0>; /* front facing */
> +
> +		avdd-supply =3D <&vreg_l7m_2p8>;
> +		dvdd-supply =3D <&vreg_l2m_1p2>;
> +		dovdd-supply =3D <&vreg_l4m_1p8>;
> +
> +		port {
> +			ov02c10_ep: endpoint {
> +				data-lanes =3D <1 2>;
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
> @@ -1403,6 +1464,22 @@ &tlmm {
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
