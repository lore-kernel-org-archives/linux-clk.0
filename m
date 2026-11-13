Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794606264;
	b=GWsXsabPlCoWjoWNDQgNeKfMY/gG34q13WpSoVTH+vBhwXIvctfLXpnZHJfuhMSCfsCN
	 nV7DKaVpYR8rJfl5jhHxBoqypmyP7DCI35Uy79P0DbjHHQCCBEgtWVZieuOxRtxkWTduY
	 HMt+JQITyMhl8FX5kpZvQqcxlqrFatNnu/9ejajXN/n6yoc+2Iyjmon8RpkEkEZyOQsG2
	 eQYbRekFolC+yQeMaFXzsBsPOY/jz0mgycmVtuqSaj15iVcKgCvNwPbY+0A8r+ClL7BeS
	 kyx0dge5gpy52cP62/kne4YsDnoIFth7taWm7zfyy+7uDWUTB7idzQ3j7Vv2HCQ24ww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794606264;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f2D2fIyPEcKUjdmyv/cUn8Of2GF3CubdogwktqgtQl0=;
	b=EqUelARrilxxPTHEtakO88uYdywXz0VXzJs1O8wDNJnDhzsSK78Jdo/P5GneoVsHcNDy
	 Xre/y9G0GqMHl/1QtaxwWF2t08ZMi9vuzLuRJiYiir6OaasZPfqQhYRzb0TJPWGITgF43
	 AgABergnAx9pRSKfJ9VWX025nKXo2NcNWkZFslROOdmikTdqvB4lcMIb/h9e8RaZxqsvu
	 NpPj5g8TljQ1i3zvBpSxOlw1qyXUQEd5ywAcpwkxW1agkTuFcAYjohWsHNUcFGVnr8BqR
	 hboYRsuJv6zrIOKql3daQw6EMwxwNCDpBqWLT+8fMphuOskzI5dN2PrQXeVBIuvHU2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSJ6LsSO;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DF9606A330
	for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2026 21:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BSJ6LsSO
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FFB21F000C4;
	Fri, 13 Nov 2026 21:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794606264;
	bh=f2D2fIyPEcKUjdmyv/cUn8Of2GF3CubdogwktqgtQl0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=BSJ6LsSOG2cD5LBxYL+AKZyB/hNocLhAnpBrmCKFszzyo8ZikCOOkIJqWNrUm0UjF
	 lYjUwwN63WSXSq7DiNEyIOWz0OfXSDHpb8dOVBmtBQ9jh9OEqjHO2gqsyuF1zb+Nst
	 Hy+S9JTUl7THi3gNDSF4GTQCxrjCtY5QR3j0mRrOceaBPCTkF2o7BTq87NNnod8amz
	 DKJIczliAivUTovYdNXH91O90X0a1VuwC2cLz/fCp5VveFLLC/3PU1G8vN/3nMD71r
	 saDRiRNonU4YHXU3+pbxfLn1XDKMDEWX1EnvxM7BCicDWWbIcZvlAP+pMokWay4tyX
	 GxrEuF61xwwNQ==
Message-ID: <sashiko-outbox-213731@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] ARM: OMAP2+: ti81xx: use non-scalable voltage
 domains
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ettore Chimenti" <ettore.chimenti@linaro.org>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
References: <20261113-patch-ektor5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org>
 <20261113-patch-ektor5-dm8168-clk-v3-4-a42cd1edc5f3@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 21:44:23 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] ARM: OMAP2+: missing dsp/iva voltagedomains in
  omap3xxx_voltagedomains_init()
--

commit f91d235b9b0b435b6fa907b15b6dbcc1322df372
Author: Ettore Chimenti <ettore.chimenti@linaro.org>

ARM: OMAP2+: ti81xx: use non-scalable voltage domains

This commit switches TI81xx SoCs to register the non-scalable
voltagedomains_am35xx array in omap3xxx_voltagedomains_init() instead of
voltagedomains_omap3.

> diff --git a/arch/arm/mach-omap2/voltagedomains3xxx_data.c b/arch/arm/mac=
h-omap2/voltagedomains3xxx_data.c
> index e98a3f289c27a..478f5eb2a17f4 100644
> --- a/arch/arm/mach-omap2/voltagedomains3xxx_data.c
> +++ b/arch/arm/mach-omap2/voltagedomains3xxx_data.c
> @@ -119,7 +119,7 @@ void __init omap3xxx_voltagedomains_init(void)
>  	omap3_voltdm_mpu.vc_param =3D &omap3_mpu_vc_data;
>  	omap3_voltdm_core.vc_param =3D &omap3_core_vc_data;
> =20
> -	if (soc_is_am35xx())
> +	if (soc_is_am35xx() || soc_is_ti81xx())
>  		voltdms =3D voltagedomains_am35xx;

[Severity: Medium]
Does voltagedomains_am35xx provide all the voltage domains needed by the
DM814x powerdomains?

voltagedomains_am35xx only registers the "mpu_iva", "core" and "wakeup"
domains.  On DM814x, powerdomains_ti814x also includes gem_814x_pwrdm and
hdvpss_814x_pwrdm (with .voltdm.name =3D "dsp") as well as ivahd_814x_pwrdm
(with .voltdm.name =3D "iva").  Because ti81xx_pwrdm_operations does not
set .pwrdm_has_voltdm, omap3xxx_powerdomains_init() -> _pwrdm_register()
calls voltdm_lookup() for each domain, which fails with -EINVAL and leaves
those three powerdomains unregistered on DM814x.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261113-patch-ekto=
r5-dm8168-clk-v3-0-a42cd1edc5f3@linaro.org?part=3D4
