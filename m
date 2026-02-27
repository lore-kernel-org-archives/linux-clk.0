Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86F29478858
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772230149; cv=none; b=t5YK+4m0Hb9oQ65N0nLYbk1ocUP7pGx4jX2a8nT2KmUen+vnJkXUtl9BApxZTuju/Da7m83bFRMxQE3gKzh4GzLjZVEi1RRbvz4CN55S8MbqHSZCrV9mPz6wOJHmGwXmewhkUC+4hhX33JjSJqcUqdCY1KZfsnxsWs1ocwh99s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772230149; c=relaxed/simple;
	bh=98AkFDXlrR4iB9QpwA3UCjqYK/P3OoGUgzoZ5+HkqJA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hgXuAMAOj81K6MLSMn82qpDtzin9o0ZIL7f2u9CTejmzgKUkd7iEIq0wNZyirGFzHHYINwAxOAEjgchAzzY0T04ImkEjAwd4Yp1Ue/naU747ca6q1OdBiQJBeI/2j908d0E0pf9xIVFFikIJQ4C2qovuW/Xpjfmdvc8lP4h7gCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b6r6vM59; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b6r6vM59"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso22428775e9.3
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772230146; x=1772834946; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z7RecgdQ+C16NSEzjvh/jMB3DYPgqDT/tnpgvTYFMx8=;
        b=b6r6vM5959f7MFQ6SU+hHYn4BDOI73DUOFn8WWqhV9LXOioOcmhT+w8ZWomJqrKumH
         hUCrGzhYqPF/MIAiqzdQGBp0M8IdiBeF/gtFzCoO6Cd81RbzJsZVXN0Sbr9Stu0A7xDv
         7xGOd3PRdqlnP+huXi169tTcM75OfDtnQCTisKCZOvv0vM3utlHYUI+sdsPpRphjcgfQ
         Xor5s9siT6u8dRrfhJphd7WuWmV/S4/wg+KG5vI4UGy2ClPnxgzQWXkJf2U7Fkl1uHwV
         kwxBknLSpzgsCtFUU40jdVPEuTUdzTP2Q+6Y0ETgGLkO+DGTRUKQL8KxjrYD8EJZqOP2
         bA2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772230146; x=1772834946;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z7RecgdQ+C16NSEzjvh/jMB3DYPgqDT/tnpgvTYFMx8=;
        b=orYSIKyoCwwHh5BeX5cuYxpgfY7AJwkSga7VDabmlm4xef+Vq7HQ6gEadgSth3qgP8
         h7HMYeTkcNTCCrD9zwqiiXPnzrxNJox/2b1sIRCNUQVsV6XjuMJX/X6fOlqBu9U17Ump
         bL8ikw5IIL2lnKt7qiXahfbtkTbtivLVc3DsrSN/61dFp4gyOd7QXUmWByh7oQQSacgP
         snpoZgvW6G7obWAo/aU+9TyYcWTYO2QlzxZ5C1NYO7EyHOsVZRiwkxlqBiouENbadYxA
         dhne46HFF0gtDsVs5KlXRSO7ObsdDiwiPsiXSmqa4EEoTVL3QqYv9X1z6CRRhbvCLOtF
         6H0g==
X-Forwarded-Encrypted: i=1; AJvYcCV7toiRidquI2mhH3j+6wdu3JhrWPyqDk3F6sOUuEtro/F520OYU6EZoGeH9bFRp3tjmozU8H0nflQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+ABM+6I8AQQUmrh0YY0vsHuOv6g3Dt668yXV9rV7rX1sm4qS
	Hc80i0UETlXw6CLt/EUOr39OxmGN09w7a8eBoRFDXrfZ1XDiorXQdJyMo18dgwsgFLM=
X-Gm-Gg: ATEYQzxU4FWf4zcagEaWJf5qiSHMsMBhb24hjSJ5/mm7tF10Y5Nn7mZ+PPCM/dK1ykX
	DyBMLNwtJhODi6MYXqHa9L0ZPXzCIi1ho4d4WstkTOtXzIbc1sOfb6YWKaQ0h218OjUfYWTflG1
	hCWIVezoXUcNh1GGlCHn7tRLdgZTitNi+FXjjdgXyf7yZcGvAdji3SRO3sQcmQOJHS7174Yh+RI
	bLDiLY2vuIOsit/1vH+vA4Jnyk7AOWBXbjWfPPVeN1z+wiSuQTvSW+vxmecfbXZM5Oc238VTT3v
	5ndvd6PjBJVgdL6v4eMLIiNEFEndQ04ryiCdcAwjI3/SFInIGZhJTLAqoKu+uceSgyenywcO9ar
	MNYWUnXGzV6gfkb90FH0e9iha0m50zJF50R6dT34Gq7ksiPFAAOraiq34FxUCnGQkUZS3EH1rdZ
	iCJhHc+AJIUoLUwL4vNrXg98nDvVB9EfZKLwUV2Z3weQkLaOV+7v412otqaByZfJ62oXhim9C/L
	zSPRqU6ImBT3aVC1fuRyLIY
X-Received: by 2002:a05:600c:1f06:b0:483:c12b:fe3c with SMTP id 5b1f17b1804b1-483c9bc555dmr63260965e9.4.1772230145893;
        Fri, 27 Feb 2026 14:09:05 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c7645b9sm8751392f8f.27.2026.02.27.14.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:09:05 -0800 (PST)
Message-ID: <27ecee1c897683c7b49b7ac8e31523b41d401668.camel@linaro.org>
Subject: Re: [PATCH v8 18/18] arm64: dts: qcom:
 x1e80100-dell-inspiron14-7441: Switch on CAMSS RGB sensor
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
Date: Fri, 27 Feb 2026 22:09:04 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-18-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-18-95517393bcb2@linaro.org>
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
> Inspiron14 has a ov02e10 sensor on CSIPHY4. Enable the list of dependenci=
es
> now.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 61 +++++++++++++++++++++++=
++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boo=
t/dts/qcom/x1-dell-thena.dtsi
> index bf04a12b16bc9..d21963e52ee48 100644
> --- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
> @@ -10,6 +10,7 @@
>  #include <dt-bindings/input/gpio-keys.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/leds/common.h>
> +#include <dt-bindings/phy/phy.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> =20
>  #include "hamoa-pmics.dtsi"
> @@ -792,6 +793,66 @@ vreg_l3j_0p8: ldo3 {
>  	};
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
> +				remote-endpoint =3D <&ov02e10_ep>;
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
> +	camera@10 {
> +		compatible =3D "ovti,ov02e10";
> +		reg =3D <0x10>;
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
> +		avdd-supply =3D <&vreg_l7b_2p8>;
> +		dvdd-supply =3D <&vreg_l7b_2p8>;
> +		dovdd-supply =3D <&vreg_cam_1p8>;
> +
> +		port {
> +			ov02e10_ep: endpoint {
> +				data-lanes =3D <1 2>;
> +				link-frequencies =3D /bits/ 64 <360000000>;
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
