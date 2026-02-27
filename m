Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C2F313285
	for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 22:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772229900; cv=none; b=ba+0LOOxG/gO5eYcW1HWKg3y0LFWTnzneY1xAu1o6TQAxGWBc5fJXMW+2TNURF7qhaoNiEztWc+QqMXYRKJxDZkGd8zv5s6+o/tcCaKDZm8c7KqCYG6v7jH6wscTNtj6W5fY42ILClhXCYObyr2RTq1nxJ79m2zss6XOtk0wg30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772229900; c=relaxed/simple;
	bh=WdTiESiUJi/ZikpLnYLLZMIv85uQ1DUOgxKPLUY9MdQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OKduVBRA5eZDIijB2Z1kxG0XClYS11L0oaeKaZUa+8gcm1s3WqNCm6Jj9E1mfyi6jfTtnzvMNe983isspmaYKDvxVkAYaZ6g+D5xUjARcJYyjd2Iv8Nq5z/sm5c8+xyMEMeDNqkpl5VH7pt7uLm9Wms0X1RvdKIKSUo/JRpzptI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AJcKJuZI; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AJcKJuZI"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4834826e5a0so27877775e9.2
        for <linux-clk@vger.kernel.org>; Fri, 27 Feb 2026 14:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1772229897; x=1772834697; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Sf0cyeh31BT7bMM/+RaM1JIokednPwrHLYxxTyQtLrI=;
        b=AJcKJuZIEQ3muyZdHiC9tl4ufGPOxdzCB5oQkiGFfVnNMD8rIhl8c3/+PiMJZsTHYC
         uz43+Sep2GLdN9vVDlVtpLoQq1smyD0SS667mvw7+hoLjTB5BgMkq1Fq8c3jTYVxX2zx
         x+E47SSyzlUDL8djcNVebgkx8itVVJjKHLeJsylXd6/eCkYsgLnpOXaI9zH5tTMxiPd6
         9DR89RGbpVA1MGol4SlbDWGT5qKc5gEI4hTSU/+iACDLbygW+4jeNf1I1S7I79tKbJsn
         sjIajdn2IKZ/ZrMWX/8g7Z0hYq081EwYGP655GPWgnjyPB0A3DO/z9VAaN1D5MvU4QGS
         sMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772229897; x=1772834697;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sf0cyeh31BT7bMM/+RaM1JIokednPwrHLYxxTyQtLrI=;
        b=UN/54b3wJlUJrQUv83u8PDVIiUQ+2JnA5Z4D+dR2u4MjKxnn5MBqrZ3eyPM9P1nsAR
         rYWqssMJca6WUuSpdFin4dMtTdTRGfMaQlgvXiWvJei5oYrBV3haBMpYsZa5NRIDt3Iz
         XCSmdfjtCkjYt6g100zZCGvC3MA9tZX7KoFP1NtCk33OUMJRftRQye2hV74CTIkKKRcQ
         GcT2Me1SGY1ENOOzMonJUpQ/R8WkEN5hWVN41uMBI+0jnQvX53pOIQqcv3ZJ6TSANbY/
         J0MfdI6sYakMoIzNZamR9mI4QU1z0u2l7JJXYoJwohdPgD+9pameOZ3DV+ityAKZhody
         8nLg==
X-Forwarded-Encrypted: i=1; AJvYcCUBkGZ3rY1Ah+UzZkrqq/JARpXxeWMrRkdOJHQxSWe6KJd7wTblc02OChe3rLmKMmYa/zfg5EW6mxU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxFMwUvo19d5iBwI/R4s8NBU6T8aqnuEFcasZlBqGCRimM+CJd
	dS1I4gPWFCvQrT9kdTNKFzRgilqR8cS6kuhWpX0/hpuq3upcljyR5Nz3u66EtZjJ9bM=
X-Gm-Gg: ATEYQzweNe9/PZ/mvx0iyj9c71JODG/zm7zDsbLmxFmNTMa1gQVURkqFrC2FRM/oR1M
	1PHqFAMFipoHhXDWsdbFLJtkcUMO13oNJ8UJPLdSmAfhpAdw7GoX+rO+OtgJslzr8zZn1C4hTTO
	lc3zyJlrKP0V/xtNzlQ5xLy2GZMvyXfiJKehYrpWGlZ13+O/8R/iZDLlE1NeUEubKlice+Zw0Jy
	ZS3IxZxDN6DcRlyMO0whZxfV0axC/Djbh4KIwU0kXhGInl+5d/cLoZPSQ32OYkg1dArjOROtH/8
	nM78F4xycBx2H48MAo3/Q00QGU0sJ2XGONgl4cqPGTtWMeUr147WEyoh6HzF5dlzItAXI8hjf5E
	ZGI3rZOIXRbs2AYbkp5vPJ67B46dk9jXTNpaoA86FJBDZr72ABLCg/FHFmzXKbXioSkPARdFKDO
	Q6JTqbc/ytEpoWI86mA2vhw0k2UMGGxbIV11S8tfEDvJuj4d5yJA2FUp9HBaj8/nbdcI8vNh16d
	iuT8eoSz/Nra3GReMQMwRBqUwJhpmGqRdI=
X-Received: by 2002:a05:600c:314a:b0:477:58:7cf4 with SMTP id 5b1f17b1804b1-483c9ba7e58mr65379815e9.4.1772229896953;
        Fri, 27 Feb 2026 14:04:56 -0800 (PST)
Received: from [192.168.16.154] (host86-188-11-239.range86-188.btcentralplus.com. [86.188.11.239])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfb9d9c6sm67853935e9.14.2026.02.27.14.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 14:04:56 -0800 (PST)
Message-ID: <d41febac2dcb913b98ca47dc681cf5d186225f20.camel@linaro.org>
Subject: Re: [PATCH v8 10/18] arm64: dts: qcom: x1e80100: Add MIPI CSI PHY
 nodes
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
Date: Fri, 27 Feb 2026 22:04:55 +0000
In-Reply-To: <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
References: 
	<20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-0-95517393bcb2@linaro.org>
	 <20260225-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v8-10-95517393bcb2@linaro.org>
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
> Add csiphy nodes for
>=20
> - csiphy0
> - csiphy1
> - csiphy2
> - csiphy4
>=20
> The irregular naming of the PHYs comes directly from the hardware which f=
or
> whatever reason skipped csiphy3.
>=20
> Separating the nodes from CAMSS as we have done with the sensor I2C bus a=
ka
> the CCI interface is justified since the CSIPHYs have their own pinouts a=
nd
> voltage rails.
>=20
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Christopher Obbard <christopher.obbard@linaro.org>
Tested-by: Christopher Obbard <christopher.obbard@linaro.org>

>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 115 ++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 115 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qc=
om/hamoa.dtsi
> index 38f9da6ad9ca5..9c5ebe1b48ecd 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
> @@ -707,6 +707,25 @@ smem_mem: smem@ffe00000 {
>  		};
>  	};
> =20
> +	csiphy_opp_table: opp-table-csiphy {
> +		compatible =3D "operating-points-v2";
> +
> +		opp-300000000 {
> +			opp-hz =3D /bits/ 64 <300000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs_d1>;
> +		};
> +
> +		opp-400000000 {
> +			opp-hz =3D /bits/ 64 <400000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>;
> +		};
> +
> +		opp-480000000 {
> +			opp-hz =3D /bits/ 64 <480000000>;
> +			required-opps =3D <&rpmhpd_opp_low_svs>;
> +		};
> +	};
> +
>  	qup_opp_table_100mhz: opp-table-qup100mhz {
>  		compatible =3D "operating-points-v2";
> =20
> @@ -5543,6 +5562,102 @@ cci1_i2c1: i2c-bus@1 {
>  			};
>  		};
> =20
> +		csiphy0: csiphy@ace4000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace4000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY0_CLK>,
> +				 <&camcc CAM_CC_CSI0PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 477 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		csiphy1: csiphy@ace6000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace6000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY1_CLK>,
> +				 <&camcc CAM_CC_CSI1PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 478 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		csiphy2: csiphy@ace8000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0ace8000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY2_CLK>,
> +				 <&camcc CAM_CC_CSI2PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 479 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
> +		csiphy4: csiphy@acec000 {
> +			compatible =3D "qcom,x1e80100-csi2-phy";
> +			reg =3D <0 0x0acec000 0 0x2000>;
> +
> +			clocks =3D <&camcc CAM_CC_CSIPHY4_CLK>,
> +				 <&camcc CAM_CC_CSI4PHYTIMER_CLK>,
> +				 <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>;
> +			clock-names =3D "csiphy",
> +				      "csiphy_timer",
> +				      "camnoc_axi",
> +				      "cpas_ahb";
> +
> +			operating-points-v2 =3D <&csiphy_opp_table>;
> +
> +			interrupts =3D <GIC_SPI 122 IRQ_TYPE_EDGE_RISING>;
> +
> +			power-domains =3D <&camcc CAM_CC_TITAN_TOP_GDSC>;
> +
> +			#phy-cells =3D <1>;
> +
> +			status =3D "disabled";
> +		};
> +
>  		camcc: clock-controller@ade0000 {
>  			compatible =3D "qcom,x1e80100-camcc";
>  			reg =3D <0 0x0ade0000 0 0x20000>;
