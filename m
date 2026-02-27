Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2C0361DAC
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229857; cv=none; b=kvjl/KUOiJuozG8GYwd7GDZsLT43MWgmkqfmhtWPQpI32/OVXQBbM7g4cPCchZzuImD86kHU+itLf5uIbHkls6YfP31jkUpRtSlMi/LjpdAM3MFbHr2OF4UI/Q06+0CL3SXvrTq0mjellZEQ52/3iPcN9cS8xLj0m+maH/uYWPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229857; c=relaxed/simple;
	bh=Fn1+xlv4sVuLJvtcP8Y+Ff3UxlWJcj0ZhhG0o/CH5bc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c49q7EnAaNpo4ZN0GwZzXEoZ/ZtFtlOYY9NTdsMUGxQcdISdzuYTIc60EQctXxd4knFhJ0IcE2uNBYRjeAIpNX6EQ6lXCUJSzqDjXaJS3oG1HY1PAhQcitxSOzgwj4tJy4SFuVnQS+6Ia9gutPW3O8niuFFUY3+R5IlRBUlHFxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SJtbfJM2; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SJtbfJM2"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806ce0f97bso20770705e9.0
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:04:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229853; x=1772834653; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=QgYXSQoGqTg+lHfGXm2ZX+HC3rb5TB8gWO5tCTpe9Y4=;
        b=SJtbfJM2JXGKsipMMUxan3w8Im3SmZpVwPgsJJylriMMCUEd3/BHz1yNwCZrqk3xlv
         n7IaeSMSPLsWG6Op2Jt21jWRpNMK/xvECAoSITDIT9Rqq5uy6IlhGDA2ZGvGN86zzu1X
         bwIXf9LsVxW6uaa4821104Nhmu6pAKspuRp9qHBxXnEbB9EM89lIozJAOMjXZuMPj9GW
         DqdHZXeEOVC2kypCHGax4ySRn9VkBKBljllKSxiMFpNnaLlRclOhhBszlEzX3HqYasVu
         AYYc7n7CQDGeh7KbWV2mOzYE0TJvEsJ1OYYS6WlZbrs8MF0HUEjX3uWUj9fgaw5SMZwD
         twww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229853; x=1772834653;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QgYXSQoGqTg+lHfGXm2ZX+HC3rb5TB8gWO5tCTpe9Y4=;
        b=AbmMj5yh70eBc9BNCkSqmIEU19Rd4CC5jcapl9lSbFTlLEPCTXJ1gkYsgz5hmSj0rK
         GbSSLxpkxveRLZi9Q2DodZawY/25hYSazPa65JzZV1+5CWLHb4JF31slET282PaVsa+y
         CsnZjfwnkwKbG+V7TMH7f8+OFJMAWYM6z7lw+p4IO0vqoDB+5at2TBfEJ9yDrO19keEI
         UBoeZPZ0DwLFGr9hNOBbp0L6tSRrPlOAXnr4OpQsygS3swqGh9DDommblOpM9YaHAfST
         1/zDrN8vb9vOrKsKw7IXA/JiAQp2MS+7oicJmt5hb6vn/nrzaxgmox2kDViEBrNcvW2z
         RFHA==
X-Forwarded-Encrypted: i=1; AJvYcCUnUQ7VdhrJb1H1y56ClYKFy6YsTPNdNU3zHJNnELlAhT7NpO+8cmWt/JpNtNP7QnsE2jK0yvjCEC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmTD+KviS+Oc5yyHtjf8eiPlQhQdOeVYgejAoAZa552dw8kLjn
	yXhxyAIHPcU+0M98PR5ZdIwxvq+gRMzKb3jl0x1D2lvHsYRXYCwzD+QDE95gCdU8gXc=
X-Gm-Gg: ATEYQzzUqo96sftClWiwABbMnkJtQxYAfC3lsfZOmetbjI36zgFfVLJLV3hcvTbCton
	ObEPx7eNDwcALjwldoKwY3X/MvFyQjG9pS07EBQeIISSqq+3hMYhLNzWzb711aCmqLLMQQw4dJ3
	tlHgG+Xm8I6XNYcXndICCpS3bMMDM8vYWDJZWu5owmnmweFZyHGQSvauJq6hKmbUYndphl2o7Bd
	AWNS1W8WO/gW/Bgiad59G8DxnJPrGNfANnGm7dpxnxPGz5RHEGJrCW1WsveYsh1aPaxJIx3L/d4
	Tkmqdgz7XDIMn/yik7dOKQkgIMz1D72dQiY3E6LoQ4ZjmGJ2NJuRJiSb4Qjdcvjpc9ZNRVnKfP4
	eLLGYPGFV1YtI8OUV1GXq/EZek2D+fbioCPpMPNgKRPeKdKgigEbLyCEY5pb7WoJY/N/P9dawmn
	/pQWJPldXJUYsQK7GEiXBawTRif2i7j0dtdef6jfWffvUQOOqs0A5k6SRlq7fDZpGf/86YD+IbG
	2OyOmEUcfchT7xQUj3LYVJ8XAioM+NN524=
X-Received: by 2002:a05:600c:4fc8:b0:480:4a90:1b00 with SMTP id 5b1f17b1804b1-483c9bead27mr63982935e9.20.1772229852834;
        Fri, 27 Feb 2026 14:04:12 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd7031f3sm213289985e9.6.2026.02.27.14.04.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:04:12 -0800 (PST)
Message-ID: <e5ea9ca261ad05afdc30ab231f60c5d18c1007de.camel@linaro.org>
Subject: Re: [PATCH v8 09/18] arm64: dts: qcom: x1e80100: Add CCI definitions
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
	linux-media@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Konrad
 Dybcio <konrad.dybcio@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 22:04:11 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-9-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-9-95517393bcb2@linaro.org>
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
> Add in two CCI buses.
>=20
> One bus has two CCI bus master pinouts:
> cci_i2c_sda0 =3D gpio101
> cci_i2c_scl0 =3D gpio102
>=20
> cci_i2c_sda1 =3D gpio103
> cci_i2c_scl1 =3D gpio104
>=20
> The second bus has two CCI bus master pinouts:
> cci_i2c_sda2 =3D gpio105
> cci_i2c_scl2 =3D gpio106
>=20
> aon_cci_i2c_sda3 =3D gpio235
> aon_cci_i2c_scl3 =3D gpio236
>=20
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 149 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 149 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index f96411f481305..38f9da6ad9ca5 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -5465,6 +5465,83 @@ videocc: clock-controller@aaf0000 {
>  			#power-domain-cells =3D <1>;
>  		};
> =20
> +		cci0: cci@ac15000 {
> +			compatible =3D "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg =3D <0 0x0ac15000 0 0x1000>;
> +
> +			interrupts =3D <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_0_CLK>;
> +			clock-names =3D "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 =3D <&cci0_default>;
> +			pinctrl-1 =3D <&cci0_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			status =3D "disabled";
> +
> +			cci0_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci0_i2c1: i2c-bus@1 {
> +				reg =3D <1>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> +
> +		cci1: cci@ac16000 {
> +			compatible =3D "qcom,x1e80100-cci", "qcom,msm8996-cci";
> +			reg =3D <0 0x0ac16000 0 0x1000>;
> +
> +			interrupts =3D <GIC_SPI 271 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,
> +				 <&camcc CAM_CC_CCI_1_CLK>;
> +			clock-names =3D "camnoc_axi",
> +				      "cpas_ahb",
> +				      "cci";
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			pinctrl-0 =3D <&cci1_default>;
> +			pinctrl-1 =3D <&cci1_sleep>;
> +			pinctrl-names =3D "default", "sleep";
> +
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +
> +			status =3D "disabled";
> +
> +			cci1_i2c0: i2c-bus@0 {
> +				reg =3D <0>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +
> +			cci1_i2c1: i2c-bus@1 {
> +				reg =3D <1>;
> +				clock-frequency =3D <1000000>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +			};
> +		};
> =20
>  		camcc: clock-controller@ade0000 {
>  			compatible =3D "qcom,x1e80100-camcc";
> @@ -6116,6 +6193,78 @@ tlmm: pinctrl@f100000 {
>  			gpio-ranges =3D <&tlmm 0 0 239>;
>  			wakeup-parent =3D <&pdc>;
> =20
> +			cci0_default: cci0-default-state {
> +				cci0_i2c0_default: cci0-i2c0-default-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins =3D "gpio101", "gpio102";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci0_i2c1_default: cci0-i2c1-default-pins {
> +					/* cci_i2c_sda1, cci_i2c_scl1 */
> +					pins =3D "gpio103", "gpio104";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci0_sleep: cci0-sleep-state {
> +				cci0_i2c0_sleep: cci0-i2c0-sleep-pins {
> +					/* cci_i2c_sda0, cci_i2c_scl0 */
> +					pins =3D "gpio101", "gpio102";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci0_i2c1_sleep: cci0-i2c1-sleep-pins {
> +					/* cci_i2c_sda1, cci_i2c_scl1 */
> +					pins =3D "gpio103", "gpio104";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1-default-state {
> +				cci1_i2c0_default: cci1-i2c0-default-pins {
> +					/* cci_i2c_sda2, cci_i2c_scl2 */
> +					pins =3D "gpio105", "gpio106";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +
> +				cci1_i2c1_default: cci1-i2c1-default-pins {
> +					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
> +					pins =3D "gpio235", "gpio236";
> +					function =3D "aon_cci";
> +					drive-strength =3D <2>;
> +					bias-pull-up;
> +				};
> +			};
> +
> +			cci1_sleep: cci1-sleep-state {
> +				cci1_i2c0_sleep: cci1-i2c0-sleep-pins {
> +					/* cci_i2c_sda2, cci_i2c_scl2 */
> +					pins =3D "gpio105", "gpio106";
> +					function =3D "cci_i2c";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +
> +				cci1_i2c1_sleep: cci1-i2c1-sleep-pins {
> +					/* aon_cci_i2c_sda3, aon_cci_i2c_scl3 */
> +					pins =3D "gpio235", "gpio236";
> +					function =3D "aon_cci";
> +					drive-strength =3D <2>;
> +					bias-pull-down;
> +				};
> +			};
> +
>  			edp0_hpd_default: edp0-hpd-default-state {
>  				pins =3D "gpio119";
>  				function =3D "edp0_hot";
