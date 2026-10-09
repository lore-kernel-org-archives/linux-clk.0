Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CC83D9526;
	Fri,  9 Oct 2026 12:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791550663; cv=none; b=GsbtUnIwPmh0aw/SPv65bNef/iO7DkEusMRRATnmojPBI64P1rHb3H+E/DngS4+QwhYTFO/vxZWQq/VKTADO40mPOzGbfgH+VYlCKsevWLdnDiPnm/wnhnOTVeAY+vGs0dizpdAyeuYWjadejRAwXP23nF9SvoBBSxnjmXyMfUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791550663; c=relaxed/simple;
	bh=Tyrq/xjXiv1plUEH212fv1+CETzN5rlenbbvRTMBiIQ=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=FOZHUwPsRL4u6M+mmP7hdURhRpq/tQLd8M6mIHR1HVaVIyvfULA88mc3ExCpV/E2xEl+hfFUPy6OwOo1431+hHAD+HSqSQXs6OVjWHVjLtFD5LuQC9V1W2T2Afbb0JMMq9wA5A5grIyrkUsYItSkNes4JtF88/ZnpSo9wfWzwqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vh4YjXeu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vh4YjXeu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 713481F000FF;
	Fri,  9 Oct 2026 12:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791550661;
	bh=lXESbwQHtM0asBnKwsagY2fIN0QxF2+vnXwn4xKzrDA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Vh4YjXeuxQbRLb597mgaVgqRf+u9DSTrWONzXhe9IkLTVKQay5Q4fWBclcaJV2MiH
	 0TeyEs7/m2c2qEvub4cG84V9T5sYw+JIX/UupWywMqX2PGh9BJjpPlNOQ8S2BXyzhX
	 xjyWOKYOYiLSzHs/AQN+mo829lPd7PhZvy5OD28m6R5/qxNItT97fKaJFexXIJA4on
	 HBrRLbjWXYyYn61lX1F2ljtq7RgWXzoLtwKLfkMFMRfVFHOfc/+7epo+SB5QQ3+GbS
	 Grf20Z/Ok1ZfjgiZ8X6AzDnXKs5qwOqz4xDa18XKuXon1VeOIg32mNw/2HCKBQZjzo
	 GeLfy3z6XoC+Q==
Message-ID: <sashiko-outbox-165576@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 11/14] arm64: dts: exynos8855: add cmu_top &
 cmu_peric clock DT nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009120137.2801911-12-raghav.s@samsung.com>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114402epcas5p22abf62d79b588db3e9f66641ed22fbd9@epcas5p2.samsung.com>
 <20261009120137.2801911-12-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 12:57:40 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] dts: missing samsung,sysreg in exynos8855-clock DT binding schema
--

commit 66386d316c3e67ff06e1d52fb1215f90cf5a7e17
Author: Raghav Sharma <raghav.s@samsung.com>

arm64: dts: exynos8855: add cmu_top & cmu_peric clock DT nodes

This commit adds the required device tree nodes for the cmu_top and
cmu_peric blocks. It also adds the sysreg_peric node, which contains
the DRCG and MEMCLK SFR bits used in the clock driver.

> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot=
/dts/exynos/exynos8855.dtsi
> index 0333b80eba845..2e5dc79d66bc7 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi
[ ... ]
> @@ -170,12 +171,43 @@ pinctrl_cmgp: pinctrl@12030000 {
[ ... ]
> +		cmu_peric: clock-controller@15400000 {
> +			compatible =3D "samsung,exynos8855-cmu-peric";
> +			reg =3D <0x15400000 0x10000>;
> +			#clock-cells =3D <1>;
> +
> +			clocks =3D <&oscclk>,
> +				 <&cmu_top CLKCMU_DOUT_PERIC_NOC>,
> +				 <&cmu_top CLKCMU_DOUT_PERIC_MMC_CARD>,
> +				 <&cmu_top CLKCMU_DOUT_PERIC_IP>;
> +			clock-names =3D "oscclk",
> +				      "bus",
> +				      "mmc_card",
> +				      "ip";
> +			samsung,sysreg =3D <&sysreg_peric>;

[Severity: Low]
Does this undocumented property cause make dtbs_check validation to fail?

The samsung,sysreg property is assigned here in the cmu_peric device tree
node, but it does not appear to be defined in the corresponding binding sch=
ema
Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml.

Since the schema enforces additionalProperties: false, adding an undocument=
ed
property here violates the schema. It also appears follow-up patches in the
series continue to add samsung,sysreg properties for other CMU blocks (e.g.,
sysreg_usb, sysreg_peris) without updating the schema to allow it. Should t=
he
binding schema be updated to define samsung,sysreg?

> +		};
> +
> +		sysreg_peric: syscon@15420000 {
> +			compatible =3D "samsung,exynos8855-peric-sysreg",
> +				      "syscon";
> +			reg =3D <0x15420000 0x10000>;
> +			clocks =3D <&cmu_peric CLK_GOUT_SYSREG_PERIC>;
> +		};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120137.2801=
911-1-raghav.s@samsung.com?part=3D11
