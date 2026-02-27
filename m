Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC1D35A3A0
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230087; cv=none; b=Sy8PsAb4t4KxxVvR5V++wujuxhYh+l+MBRiQcctbgiK9lL+X3SWMARcC/mwxZ07lE64kGWiZB/78V0oyf5HE6LHdjHUf/L0d4P4Ir4DVrZfg2Xasdaio6BIo2TaheTW1Lx8NZYMBculJP03BXof3iWTcby9gUpYem62faAZMJ+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230087; c=relaxed/simple;
	bh=tMJ8f5DPdRMekZbxffsBirzyWQULA5uML/MikBv/obs=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=iwEPVE7zLjwtAAjVJm2o3/j+uXhHW3bb8rOWKj/iEmoU6GBRA0Djhm3TkE2sV4uh0icKjJeonuGscBNwVq+xa+DqKYvwoxiSDk0u6nyG9OhgWWXkD7N7aRgZGO3dV/zSgYaaP9r1dJmEuMl5gG2fnuCE7OKhx8huipQZsVq+Ct0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gdaK3WVw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gdaK3WVw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-48378136adcso14850085e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230084; x=1772834884; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HgpWCIEAXYCKG3dNcgQ8wee+NuBqJAXrkSxrYQnWihQ=;
        b=gdaK3WVwLnVtPEKuXbfNJrmMr+K9024i6iPqO1O6f+hGAzqwMsW/1upa5DxQbCW6gd
         +zgqxjThXh4tbbkHP8pl80J1W3gR5fCZJcnxk3O+U5Qk8sWvKES/ZQ+WOdYrHj2Qfffy
         ThLCUub/uH0dLIdDtiQX4nerZXF0WoCrkHBm9MI1z3zfDlXLyoFvS1hsRk77nYsl8gYU
         LJkr/qsHrh+MquPLMZX10iLlY297cehJ2OqelfThwenTxxbMwbykOR2S/v6F6xLZFWoV
         HVDpQE/v/Lz8v6/5bRAp/LG+mb0l7H6NMe2QmNPRNaIcQtzW6Wd2ylsur/Ya8bMF+byz
         sbkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230084; x=1772834884;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HgpWCIEAXYCKG3dNcgQ8wee+NuBqJAXrkSxrYQnWihQ=;
        b=HI5vx/+MUktkxORuQqLOKHixX1mC+S54m8RuZwTEPvzMfwG9jSATj93FSVRmNafRVb
         uyNTWtTLyns2peLibpVQVkGfZa+B77GE1Fyd4A0bKNgHu0IhBvAlov19RaQF5hSfaipx
         DLtMhJ0z4fgE8huIljp1QHpSB2eQwxzvOt+DZedlkvYAgGaOudQyQRjJgmd3Jkub+/XF
         spZn7iZefzF8pNrsvnpBpv/OSA45dN8h27C8IZxVHqJpyurEF93dJXTPXnsBlt5mosb3
         coQEsLcOpoXVgSv2AC5qDdeDNgDLNl0+FI3yxrBf8DKZnM6FA6F9DM1Cx5pb3cCpVfaF
         YkyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK/mjb3IhkOnlo8rEJJiKT1c0ID2B2hgZARtoPbawiiEHgJ6AaEorfmsgJJ78L3wn9Ge9CJ5h+1Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDxWgiJ6UKjBXQ/XAhy2y4n48fwEa84ZLh5aYxbuAuM6JhcZZB
	jIdI39exJdj6+udskMMaby/wChL6uR+v0uaBT9vgdB7W3j5bVaVzExCdxhlRtl3W8j0=
X-Gm-Gg: ATEYQzwd4YBkEoRS3bJ/h1odF0Xbp1qAHAf9zTSNQxlwMPP6o26KIadIWr8S9fDFtUi
	KkSr+HyKIrrW7nuZRQYv/xAVKjEzbSYHEBkKQy7V1a7ZqXhuu76FFNMjHoV86025iFSFt6XjidK
	6Al96q/cswEWX4ooMBX3nVzOBpdQz44/ficWf32HBH4XJ7Jnb8OsaOnAEX9XRn0VZMHMrH0g0hJ
	yLbePo3plW0/mocn9lT2CuqcMavajiOh8TUn1FabdZNw/jQN7rnf0nN/9p7C5r+kHHHRvm1u8qW
	4TGIdkg5DXRB7logmX0sF0rzPmPeNTbZ2YasH++l16awIS4Jk/cyNU04RPQvCKxMENYw2OSahkq
	rvhtyiXB8IqRvOYEa19Y5uiRcwhGquCAYs7m0mV6YE3WBYZaKWdMx3YOXN+pdzpOss0OK9HXZtj
	3IOwXMnJVhL+E1qmOtjRhu1SlnpSF/Aa+gVkJonlsCE8S7jiEn8XqMYyZ3OokuTNkGvb2jxXgjL
	cUEZPCl8WPo2B2Szr0Y9ksZ
X-Received: by 2002:a05:600c:828c:b0:482:dbd7:a1c1 with SMTP id 5b1f17b1804b1-483c9c23c72mr64791835e9.34.1772230084419;
        Fri, 27 Feb 2026 14:08:04 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb776b0sm71746555e9.1.2026.02.27.14.08.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:08:04 -0800 (PST)
Message-ID: <485524056b1c9588e81793964ff6bc0458401148.camel@linaro.org>
Subject: Re: [PATCH v8 15/18] arm64: dts: qcom: x1e80100-t14s: Add on
 ov02c10 RGB sensor on CSIPHY4
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
Date: Fri, 27 Feb 2026 22:08:03 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-15-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-15-95517393bcb2@linaro.org>
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
> Switch on the ov02c10 RGB sensor on CSIPHY4.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  .../dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi    | 77 ++++++++++++++++=
++++++
>  1 file changed, 77 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi =
b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index ee49785c9d005..54bf21f1c6f37 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -9,6 +9,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
> @@ -866,6 +867,66 @@ vreg_l7m_2p8: ldo7 {
> =20
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
>  &gpu {
>  	status =3D "okay";
>  };
> @@ -1447,6 +1508,22 @@ &tlmm {
>  			       <72 2>, /* Secure EC I2C connection (?) */
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
>  	ec_int_n_default: ec-int-n-state {
>  		pins =3D "gpio66";
>  		function =3D "gpio";
