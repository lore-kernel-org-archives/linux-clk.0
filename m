Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A792D592C;
	Fri,  4 Sep 2026 14:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788530601; cv=none; b=Y1KhsWgvlspj5ghlhAE/AaVOmd38DOZluynMAbE/dC+GrSlL6vBJ4ViVxyGrFkWDyG6OQs6H7OEah6CszPQO0ljmmZ9KI4sw5FcdPG3bPubsURWmV7w8JHbXKKhdlcyU+8UbiTgvaxFKGzBeo+t3e+DzGhOKOZ+z3MhnBOcvbL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788530601; c=relaxed/simple;
	bh=slKlh3kIn5/hNsnu4ihwuZLk/OIRSScMk+e9b8tv/3Y=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=kvRqRSq2h4k0cehQTLIMAEyitT9LGnSLcqpQNdKqy4yuH38r6nGAiAmW+OV/J08Q0yW/Luh1aMLIln+WYbazfT34CtibPooiW8uEdbGBwxlonunc3Mnyr6/8DADtak7q+N42ar36oF7zF/BPxzYHXfa2H4HuZWfhdQeC8ZASTBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ufs6l3Sv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ufs6l3Sv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 374F31F00A3D;
	Fri,  4 Sep 2026 14:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788530599;
	bh=L5ybqdL8dPYtT+lWuTUqYs52Xgyz3jjU5YZiKTCi0Io=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ufs6l3SvOAB5bnN0We5SXjbHp0hLpvSzma6h9aXRfGFB0K4zvx6HVkJjC86aTSWEG
	 na52ly1NkGVs0jTfk6YCkgRCQbAEdjcXmrkZhqblJt96c1QAS85GC6YGEaJcFzyU0b
	 sdZAl+qVas2o4ZkBd04KBGIinap2g+JdRDTYdMbGSsWD7utPk/Q8jizVeL9VpYYk5J
	 9xtkWp9kLic/pwZ8Ovw/wGdflVsclCDdSD8a2/S5irc7akKx6jB8ca80D90TsO8lYH
	 5480TwUCuCz4WuXUT8lrK9LVVUKYd9e6bdsBsKg6CV5ICCgbVT6VovJPpXC4fpt5e4
	 pm4jYez9R2LpA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 18/19] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: neil.armstrong@linaro.org, vkoul@kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, olteanv@gmail.com, linux-phy@lists.infradead.org, dri-devel@lists.freedesktop.org, mfd@lists.linux.dev
In-Reply-To: <20260904-jh7110-clean-send-v3-18-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-18-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 14:03:18 +0000
Message-Id: <20260904140319.374F31F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] The HDMI HPD (Hot Plug Detect) pin is incorrectly configured to dr=
ive a logic HIGH output, causing electrical contention and breaking hotplug=
 detection.
- [Medium] Hardware peripheral nodes in the SoC dtsi lack 'status =3D "disa=
bled"', which will break DT validation for custom boards.
- [Low] The device tree introduces a redundant `xin24m` fixed-clock which d=
uplicates the existing `osc` clock.
--

commit ca7f9b150e9f3d43ce6202c42577591e3273c2a4
Author: Michal Wilczynski <m.wilczynski@samsung.com>

riscv: dts: starfive: jh7110: Update DT for display subsystem

Activate the display subsystem by describing the video output subsystem,
which the documentation calls dom_vout_top, as a bus node covering the
whole 0x29400000 region.

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
[ ... ]
> @@ -351,6 +430,40 @@ &syscrg {
>  };
> =20
>  &sysgpio {
> +	hdmi_pins: hdmi-0 {
> +		hdmi-cec-pins {
> +			pinmux =3D <GPIOMUX(14, GPOUT_SYS_HDMI_CEC_SDA,
> +					      GPOEN_SYS_HDMI_CEC_SDA,
> +					      GPI_SYS_HDMI_CEC_SDA)>;
> +			input-enable;
> +			bias-pull-up;
> +		};
> +
> +		hdmi-hpd-pins {
> +			pinmux =3D <GPIOMUX(15, GPOUT_HIGH,
> +					      GPOEN_ENABLE,
> +					      GPI_SYS_HDMI_HPD)>;

[Severity: High]
Does this configuration incorrectly drive a logic HIGH output on the HPD pi=
n?

The HDMI HPD (Hot Plug Detect) pin is structurally an input driven by the
external HDMI sink. By statically driving the output driver HIGH from the S=
oC
side (using GPOEN_ENABLE and GPOUT_HIGH), the physical line is held high
regardless of what the monitor tries to drive.

Can this break hotplug detection logic and cause electrical contention if t=
he
monitor pulls it low? Standard input pins usually use GPOEN_DISABLE to prev=
ent
driving the line.

> +			input-enable;
> +			bias-disable; /* external pull-up */
> +		};
[ ... ]
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7110.dtsi
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
Is this xin24m fixed-clock redundant?

The board's 24MHz oscillator is typically already modeled via an existing o=
sc
node which receives its frequency from board-specific common files.=20

Does adding xin24m here unnecessarily duplicate the existing oscillator
node rather than reusing it?

>  	soc {
>  		compatible =3D "simple-bus";
>  		interrupt-parent =3D <&plic>;
[ ... ]
> @@ -1199,22 +1200,81 @@ csi_phy: phy@19820000 {
>  			#phy-cells =3D <0>;
>  		};
> =20
> +		vout_subsystem: display-subsystem@29400000 {
> +			compatible =3D "starfive,jh7110-vout-subsystem";
> +			reg =3D <0x0 0x29400000 0x0 0x200000>;
> +			ranges;
> +			#address-cells =3D <2>;
> +			#size-cells =3D <2>;
> +			clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
> +			dma-noncoherent;
>  			power-domains =3D <&pwrc JH7110_PD_VOUT>;
> +			resets =3D <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> +
> +			dc8200: display@29400000 {
> +				compatible =3D "starfive,jh7110-dc8200", "verisilicon,dc";
> +				reg =3D <0x0 0x29400000 0x0 0x2800>;

[Severity: Medium]
Should this hardware peripheral node include status =3D "disabled";?

Hardware peripheral nodes in the SoC dtsi are generally disabled by default.
Because the dc8200 node requires board-specific properties (like ports) that
are only provided in jh7110-common.dtsi, leaving it active by default here
can cause DT schema validation failures.

Can this break dtbs_check or cause driver probe crashes on custom boards th=
at
include jh7110.dtsi but do not wire up the display components?

> +				clocks =3D <&voutcrg JH7110_VOUTCLK_DC8200_CORE>,
[ ... ]
> +				reset-names =3D "core", "axi", "ahb";
> +			};
> +
> +			hdmi_subsystem: hdmi@29590000 {
> +				compatible =3D "starfive,jh7110-hdmi-subsystem";
> +				reg =3D <0x0 0x29590000 0x0 0x4000>;

[Severity: Medium]
Should the hdmi_subsystem node also include status =3D "disabled";?

Similar to the dc8200 node, leaving this active by default can lead to
validation errors if it is left unconfigured by board files.

> +
> +				hdmi_controller: controller {
[ ... ]
> +				hdmi_phy: phy {
> +					compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +					clocks =3D <&xin24m>;

[Severity: Low]
Should this consume the standard <&osc> clock instead of <&xin24m>?

If the xin24m node is redundant as mentioned above, this would likely need
to be updated to point to the main oscillator node.

> +					#clock-cells =3D <0>;
> +					#phy-cells =3D <0>;
> +				};
> +			};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D18
