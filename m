Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2F8F3D25D2;
	Fri, 28 Aug 2026 14:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925995; cv=none; b=bP+8BgOvl2PtSswv+/EW8//gdwBKr7bKWWqg9udsZi8tJEpCt4gtjZLxGVqmWHsOAN2Ah8OKyBAQC7gMrGT5l01+D5LZzZV5v1oeu9IZktikkwMt5fMji9jB4Muk5Owyh4Maqu725prf+uWKVM6kBM6qVkSJf9iLZsPORLiBFzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925995; c=relaxed/simple;
	bh=jmZMnXl3WDqHf8X63yyaKjcB5ogq1Fzlk2XEykl28m8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=lJGOHoYAorWcAIleK5+NZ9qPR2E7c9m8wwUrO5zregiuM/F1nBzCqB80zVyezMlJFhgcvQU0Owf2VPvhLQCK7e0g75J/e6s/vB6WI9xknKwwfMj9Mrb+KVJ+dyGLJjAqTjZdGxxzGGJxesPKSDjibIcSyw6lAcwlx2BexfziHus=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E0edP9pp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E0edP9pp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE8C71F000E9;
	Fri, 28 Aug 2026 14:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925993;
	bh=2LLM6BK0ct/YxVay0BuKRvKf4IxLqfPOzDDNYwSArWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=E0edP9ppMgmZIRj1TkDZl/Crulf0KnUqUMSmtRZjo1D74PskIE+6dJbJevW1x7JkS
	 UtHfvxjlU2YYNY5tGFLDWqiDSxkZ845WxVYiceX0I7Mi1drgVoyyqN4Md6rP24zYcy
	 E0LHKrlNFnkem7gkGczv5hbJHUkVvUxk/rILdsLW2vPMhbsVMs0qcZwsyM8rA1RLvD
	 2oWgWlSr4DoXfk7tIHjkq0LYRexeum6HGX2a40xl+ZqmtTfXVxEAcxG6tHwK8QV0Vf
	 HQqp1MVriwZWwaPUSfNaVBTWrr1Efg5SQbGvuKZ2QhORX2DYr7OmtNAzOfnZiU5NMA
	 Z/5jevDYQ2+5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 14/15] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-phy@lists.infradead.org, robh@kernel.org, lee@kernel.org, olteanv@gmail.com, dri-devel@lists.freedesktop.org, vkoul@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev
In-Reply-To: <20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 14:06:32 +0000
Message-Id: <20260828140632.AE8C71F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 4 potential issue(=
s) to consider:
- [High] Hardcoded exact physical address range for CMA reservation restric=
ts memory allocation and breaks smaller RAM variants.
- [High] The commit claims genpd powers the PD_VOUT domain on demand, but t=
his is functionally impossible due to missing PM runtime integration in the=
 HDMI subsystem driver.
- [Low] Duplicate 24MHz fixed-clock node introduced for `hdmi_phy`.
- [Low] The `dc8200` node provides only `"verisilicon,dc"` in its `compatib=
le` string, which violates the `verisilicon,dc.yaml` binding schema.
--

commit d117ce22b6b03137e7ca5305371a65afdcd406c9
Author: Michal Wilczynski <m.wilczynski@samsung.com>

riscv: dts: starfive: jh7110: Update DT for display subsystem

This commit activates the display subsystem by adding the dc8200, hdmi, and
voutcrg nodes as direct soc children. It models the monolithic hdmi node as
a container with hdmi_phy and hdmi_controller children. It also configures
clock, DMA properties, and CMA reservations.

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index a7a1c09a2c907..7aadc35f4a6aa 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -33,6 +33,25 @@ memory@40000000 {
>  		bootph-pre-ram;
>  	};
> =20
> +	reserved-memory {
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
> +		/* vout applies for space from this CMA
> +		 * Without this CMA reservation,
> +		 * vout may not work properly.
> +		 */
> +		linux,cma {
> +			compatible =3D "shared-dma-pool";
> +			reusable;
> +			size =3D <0x0 0x20000000>;
> +			alignment =3D <0x0 0x1000>;
> +			alloc-ranges =3D <0x0 0x70000000 0x0 0x20000000>;
> +			linux,cma-default;

[Severity: High]
Could this alloc-ranges configuration break boot on systems with less
memory or conflicting bootloader placements?

The property alloc-ranges =3D <0x0 0x70000000 0x0 0x20000000> combined with
size =3D <0x0 0x20000000> forces the 512MB CMA pool exactly at physical add=
ress
0x70000000.

On a board with only 1GB of RAM (ranging from 0x40000000 to 0x80000000),
the top 256MB of this requested region falls completely outside of physical
memory, which would guarantee an allocation failure.

Additionally, if a bootloader dynamically places the DTB or initrd anywhere
within this narrow 512MB slice, CMA reservation will conflict and silently
fail.

> +		};
> +	};
> +
[ ... ]
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
> index 9c3e4598747eb..024e33b0e97cb 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
[ ... ]
> @@ -352,6 +346,13 @@ tdm_ext: tdm-ext-clock {
>  		#clock-cells =3D <0>;
>  	};
> =20
> +	xin24m: xin24m {
> +		compatible =3D "fixed-clock";
> +		#clock-cells =3D <0>;
> +		clock-frequency =3D <24000000>;
> +		clock-output-names =3D "xin24m";
> +	};
> +

[Severity: Low]
Does this introduce a redundant clock definition?

The jh7110.dtsi and jh7110-common.dtsi files already define an osc clock
node representing the 24MHz physical oscillator on the board. Introducing a
new xin24m fixed-clock node with the exact same 24MHz frequency seems
redundant and creates a hardware modeling flaw in the Device Tree.

Should the hdmi_phy node reference the existing <&osc> clock instead?

>  	soc {
>  		compatible =3D "simple-bus";
>  		interrupt-parent =3D <&plic>;
> @@ -1199,22 +1200,92 @@ csi_phy: phy@19820000 {
>  			#phy-cells =3D <0>;
>  		};
> =20
> +		dc8200: display@29400000 {
> +			compatible =3D "verisilicon,dc";

[Severity: Low]
Is this missing the SoC-specific compatible string required by the binding
schema?

The verisilicon,dc.yaml schema requires the compatible property to be an
array of two items: an SoC-specific string (e.g., thead,th1520-dc8200 or
starfive,jh7110-dc8200) followed by verisilicon,dc.

Specifying only compatible =3D "verisilicon,dc" violates the standard rule =
for
IP block instances and will cause dtbs_check validation to fail.

> +			reg =3D <0x0 0x29400000 0x0 0x2800>;
[ ... ]
> +		hdmi_subsystem: hdmi@29590000 {
> +			compatible =3D "starfive,jh7110-hdmi-subsystem";
> +			reg =3D <0x0 0x29590000 0x0 0x4000>;
> +
> +			/*
> +			 * This MFD's PHY child is the first device in the vout
> +			 * region to touch registers, so it owns the NoC display
> +			 * bus clock + reset that gate access to the region.
> +			 * PD_VOUT is powered on by genpd via power-domains.
> +			 */
> +			power-domains =3D <&pwrc JH7110_PD_VOUT>;

[Severity: High]
Is the claim that genpd powers this domain on demand functionally possible
without PM runtime integration in the HDMI subsystem driver?

The commit message states "genpd powers the domain on demand", and the
hdmi_subsystem node relies on this for PD_VOUT. However, the driver in
drivers/soc/starfive/jh7110-hdmi-subsystem.c does not appear to call
pm_runtime_enable().

Because the container has PM runtime disabled, any pm_runtime_get_sync()
calls from its children will return -EACCES and fail to propagate to genpd.

The hardware appears to only work because the voutcrg clock controller
driver unconditionally calls pm_runtime_resume_and_get() in its probe
function without releasing it. This forcefully pins the PD_VOUT domain ON
indefinitely, which circumvents the on-demand power management expectation.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D14
