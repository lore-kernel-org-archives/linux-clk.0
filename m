Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B26312B170
	for <linux-clk@vger.kernel.org>; Fri,  5 Apr 2024 07:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712302726; cv=none; b=TnTHYsmZDOW6jimn2u3c1NiyhneXZld3ntpPzh3Yl+tVzbZn1H32D47F5TWE2nenRdb7p/ovNb19PYVsCz7ElH3F4he1sTelJ3vw1oswvL3l9jhu1Abi5deeZiENmwBCGChMd6weS3mqGLcNeYBhZxMVHyJr/tNIBVoQokWxQw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712302726; c=relaxed/simple;
	bh=xFcwRdTwA4TzkokrASxaN9DG3qMv3QQuyut1PFwZfZQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=aO/oJj9RsFsWQDnDuSV9fjcoT+De8hzEnpH6sSwuLLsLvHGGMW4ZFmntHbBsvpkyT6Yd0pDXIAhBgp5opei2zKAePU83JzJVgCzjhzkl8bc0OHNrq8X+LYRmCP7/ktHByo3g4P9vUWSrtJg+DpKUf+p4BzrDihPalHs5FuxsCEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQgyZXI3; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQgyZXI3"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4162bac959cso10013675e9.0
        for <linux-clk@vger.kernel.org>; Fri, 05 Apr 2024 00:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712302723; x=1712907523; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oRN7BO8gsn/Gv38F95MOeso16MuC+d8zGIKmfkHHaDA=;
        b=DQgyZXI3x1STatr+0V5Ro3Wk0y7erpHx4qLdWtvEXBILyNtVpuItEyFDo89+HGD7WE
         npdnvmeWQRs1q8SnfAXTkXrDwmobn9X6VTpDl9rHVi/WqjKQSnp/o4+ajvQI2L9hh6si
         MTT3K7L4VUCVHvsIOl8TKyh/E1p+Q1CMlLEL16Lq+Zk5jn56rnGpx3z3xKKlBM+kHAS6
         Wym1s2q3CTOTL/rPMZ0CgIkI5ANQpG6W1X3M9O81E81oRSCJ9hldOk4frB0u8BGJmRLu
         lVlpjKxa5bR8WG1FqmIZzOvNRC4K1sr+aidt+zX+ziwTEs/VG8L07rHAN0cvR9BoMh+T
         2K+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712302723; x=1712907523;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oRN7BO8gsn/Gv38F95MOeso16MuC+d8zGIKmfkHHaDA=;
        b=YR9RMrp5zyzUQAgd58kxVlLnmv5u0eE4ZfpElg59ELukHZ0UeNyMmObkrvnIIq5VOC
         q7RfNDrQuUG7LZfjYyD3RkgdREle0NnpaoXmn0Ng65P40fjOm+xntMImoCzd5RBH5OwP
         5UEabNt59yGQYAO8yNgCchFOUW409nrpNPhoccLdUPcqkdfk7ujGSL+HXjuXx/cy7c3T
         61H0YWw9HtQq0qNyhzOsCu6j1Tt3fuZ74H5lipYfyGFzdp2fWzhqm1bSmStaZDqdy+GP
         n5qksAfl1v1WLacIjqlhAPvgeid++/QUPqbTMz5VD7JKSHkNx2D+sKXR/mWwNUaa89+Z
         xE+g==
X-Forwarded-Encrypted: i=1; AJvYcCU3UYd/LMPJ/mRCQxDVklstT+o+RCsA7OsS2RXzKVbylC5+EcxofLvrHdW5NGIHw5wER4jSWbvwQUykIuEYlqRaFD5pbMzmLNQq
X-Gm-Message-State: AOJu0YzniMn2ABXOk7hmgqXuy+wYQxd5o8zeQ7wWG5IfIJLVXs4BZ7oy
	Emsk+2/vgrqkxDr5zXx/LKT8UcVLOEq8IuruXU48fUKsHk7fpKGJGDF1zTXJB7c=
X-Google-Smtp-Source: AGHT+IFwiMH8B1ar/OpUPlryON/lBUN5RQvLyQ7JRAx2qevkuOIGYn3OYMCBDXtlsBDfdcoJKEIrbw==
X-Received: by 2002:a5d:4906:0:b0:341:c589:8aea with SMTP id x6-20020a5d4906000000b00341c5898aeamr502410wrq.63.1712302722944;
        Fri, 05 Apr 2024 00:38:42 -0700 (PDT)
Received: from draszik.lan ([80.111.64.44])
        by smtp.gmail.com with ESMTPSA id p13-20020a5d638d000000b00343ad4bca7dsm1317091wru.85.2024.04.05.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 00:38:42 -0700 (PDT)
Message-ID: <391a874522a4141b4bc7f0314a9e50d27142123a.camel@linaro.org>
Subject: Re: [PATCH 05/17] arm64: dts: exynos: gs101: enable cmu-hsi2 clock
 controller
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: Peter Griffin <peter.griffin@linaro.org>, mturquette@baylibre.com, 
 sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
  vkoul@kernel.org, kishon@kernel.org, alim.akhtar@samsung.com,
 avri.altman@wdc.com,  bvanassche@acm.org, s.nawrocki@samsung.com,
 cw00.choi@samsung.com,  jejb@linux.ibm.com, martin.petersen@oracle.com,
 chanho61.park@samsung.com,  ebiggers@kernel.org
Cc: linux-scsi@vger.kernel.org, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, tudor.ambarus@linaro.org, 
	saravanak@google.com, willmcvicker@google.com
Date: Fri, 05 Apr 2024 08:38:41 +0100
In-Reply-To: <20240404122559.898930-6-peter.griffin@linaro.org>
References: <20240404122559.898930-1-peter.griffin@linaro.org>
	 <20240404122559.898930-6-peter.griffin@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.3-1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-04-04 at 13:25 +0100, Peter Griffin wrote:
> Enable the cmu_hsi2 clock management unit. It feeds some of
> the high speed interfaces such as PCIe and UFS.
>=20
> Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
> ---
> =C2=A0arch/arm64/boot/dts/exynos/google/gs101.dtsi | 12 ++++++++++++
> =C2=A01 file changed, 12 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/exynos/google/gs101.dtsi b/arch/arm64/bo=
ot/dts/exynos/google/gs101.dtsi
> index eddb6b326fde..38ac4fb1397e 100644
> --- a/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> +++ b/arch/arm64/boot/dts/exynos/google/gs101.dtsi
> @@ -1253,6 +1253,18 @@ pinctrl_hsi1: pinctrl@11840000 {
> =C2=A0			interrupts =3D <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH 0>;
> =C2=A0		};
> =C2=A0
> +		cmu_hsi2: clock-controller@14400000 {
> +			compatible =3D "google,gs101-cmu-hsi2";
> +			reg =3D <0x14400000 0x4000>;
> +			#clock-cells =3D <1>;
> +			clocks =3D <&ext_24_5m>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI2_BUS>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI2_PCIE>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI2_UFS_EMBD>,
> +				 <&cmu_top CLK_DOUT_CMU_HSI2_MMC_CARD>;
> +			clock-names =3D "oscclk", "bus", "pcie", "ufs_embd", "mmc_card";
> +		};

This doesn't build because you didn't add the clock ids in the binding patc=
h.

Other than that,

Reviewed-by: Andr=C3=A9 Draszik <andre.draszik@linaro.org>

> +
> =C2=A0		pinctrl_hsi2: pinctrl@14440000 {
> =C2=A0			compatible =3D "google,gs101-pinctrl";
> =C2=A0			reg =3D <0x14440000 0x00001000>;

