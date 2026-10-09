Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F2043DEC7;
	Fri,  9 Oct 2026 13:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791551462; cv=none; b=rIls2nW6ivNHF1Vr30PgeFk3lJD2f4hvNk5SfDP0BHT3e+BULk70vV0Sl5hwvGOGi+1se4xJbn7HNFgP7I2cVFTK4Hs8h84I5XW1Ox0Nm+AasxKCY0dZf027/yVHIhDm+Z/vGZwxXfV5JjntW2PLB9MjYUDEHzhUAQi7NC1Jlfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791551462; c=relaxed/simple;
	bh=/wQ1zn73xroNfiWIcvfm1HB77YiiUBSLBW7ZyGzgMQA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=PIl9VBrk5Z2Ma9yJxZHjytasO2Yr7KoWKzhGvFkLxjAaPhQYlcuLat+l1BvVVSC0EllOMJr9Vf5Lrhf2mjZd0zO4cCnY97TPcSZSpPCdBlD2c0GJWH5zJAZiOvPCSkVtmaKu801AotmRxxBK9fHlidMFl33JP92wkWYeya1yECs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JCMIENLS; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JCMIENLS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 807D01F000FF;
	Fri,  9 Oct 2026 13:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791551460;
	bh=InxXSENapAzRVXW4MI0tLdncN62pm7XXo9U5afURNAc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JCMIENLSb+jcD2eiqanGy4K5wwUk95Itv2q5NbMQybRLykkX/TNHk7+Z5Ac1+z9xN
	 fMKwtdnXRe2WV7hVS20OmygBaNpIrfIHxb+DBmEPmtBYkHM+HBh2tGbrYG4RMhQsHA
	 aswbP8ARapaxAskABIWSsMkP2uRk/8H9djbdvNXhmmKfhHvTv7AppIPTJ78Mqqn+D4
	 shUzY+kIjkfJQBvtGF5TIyrTw1gOLGBjn4XnOq2f943hRkLzEx0XKPdG5BhkyJQFxr
	 PWWaChkC+KACKQa6/ZghoKhCZ+sLvIIjyXJkmRUGHffANn/5ZOW3Psr64X0qsnmcN0
	 HVoVsO6ILWlkQ==
Message-ID: <sashiko-outbox-165602@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 13/14] arm64: dts: exynos8855: add cmu_hsi clock DT
 nodes
Reply-To: sashiko-reviews@lists.linux.dev
To: "Raghav Sharma" <raghav.s@samsung.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261009120137.2801911-14-raghav.s@samsung.com>
References: <20261009120137.2801911-1-raghav.s@samsung.com>
 <CGME20261009114408epcas5p343508b4fd7022f917fcdda74e58ab154@epcas5p3.samsung.com>
 <20261009120137.2801911-14-raghav.s@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 13:11:00 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [High] clk: samsung: exynos8855: heap buffer overflow during cmu_hsi regi=
stration
- [Low] dt-bindings: clock: samsung,exynos8855: missing samsung,sysreg prop=
erty in schema
--

commit bbcbd2201fb19f5e477dc2859ff29864327a9378
Author: Raghav Sharma <raghav.s@samsung.com>

arm64: dts: exynos8855: add cmu_hsi clock DT nodes

This commit adds the required dt node for the cmu_hsi block. It also adds
the sysreg_hsi node which contains bits for DRCG and MEMCLK that are used
by the clock driver.

> diff --git a/arch/arm64/boot/dts/exynos/exynos8855.dtsi b/arch/arm64/boot=
/dts/exynos/exynos8855.dtsi
> index b461de6a75483..3dd7a4c4c609f 100644
> --- a/arch/arm64/boot/dts/exynos/exynos8855.dtsi
> +++ b/arch/arm64/boot/dts/exynos/exynos8855.dtsi

[ ... ]

> @@ -241,6 +241,27 @@ pinctrl_pericmmc: pinctrl@154f0000 {
>  			interrupts =3D <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>;
>  		};
> =20
> +		cmu_hsi: clock-controller@17000000 {

[Severity: High]
Does exposing this node in the device tree trigger a heap buffer overflow
during driver probe?

Looking at the cmu_hsi clock provider in
drivers/clk/samsung/clk-exynos8855.c, the array size for the hardware
pointers is defined as:

#define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)

Since CLK_GOUT_SYSREG_HSI evaluates to 4, this allocates an array of 5 elem=
ents
during samsung_clk_init(). However,
include/dt-bindings/clock/samsung,exynos8855.h defines higher clock IDs
for this provider:

#define CLK_GOUT_SYSREG_HSI                4
#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6

When samsung_clk_register_gate() iterates over hsi_gate_clks and registers
IDs up to 6 (CLK_GOUT_UFS_EMBD_UNIPRO_HSI), it appears it will write out of
bounds:

drivers/clk/samsung/clk.c:samsung_clk_add_lookup() {
    ...
    ctx->clk_data.hws[id] =3D clk_hw;
    ...
}

Should CLKS_NR_HSI be defined using the highest clock ID instead to prevent
memory corruption when this node probes?

> +			compatible =3D "samsung,exynos8855-cmu-hsi";
> +			reg =3D <0x17000000 0x10000>;
> +			#clock-cells =3D <1>;
> +
> +			clocks =3D <&oscclk>,
> +				 <&cmu_top CLKCMU_DOUT_HSI_NOC>,
> +				 <&cmu_top CLKCMU_DOUT_HSI_UFS_EMBD>;
> +			clock-names =3D "oscclk",
> +				      "bus",
> +				      "ufs_embd";
> +			samsung,sysreg =3D <&sysreg_hsi>;

[Severity: Low]
Will this cause a device tree schema validation failure when running
make dtbs_check?

The samsung,sysreg property does not appear to be defined in the schema at
Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml,
which restricts additions globally via additionalProperties: false.

> +		};

[ ... ]

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261009120137.2801=
911-1-raghav.s@samsung.com?part=3D13
