Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084306;
	b=Wqlydo10V5ZwOcVz5WuVcryxcaZksFbhd5UMyeSO4l/+OQ/PL3V3jyOh68I8G9ezamp8
	 gUJjKF+WuH/nzDF0NC5/2JkdyrTYgvHa8bk2oX69ia/lRvTtzsKjl6OeefD9pJP35ynCA
	 UNHia1C69N2FhoWa7Nj7ehPQAYmbuNK3uggsPDICaD2fGZLaIYDfGsAR9ConbIjw2Qybj
	 KrdW/ZhzJa0b25DN8kAJlAAFwwxHZ9UKklI2kWjSo/h6Iie8SpS34Iy39LAByiiATrrxU
	 erByrKh6zOp1xLPO3iCxvuo9s/OYIkQst7kcbQvz8pTrcu9QjpUaYT3J7wDHpBAIusg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084306;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=f8LB2Xe2f4qCE6lFzUXlv5rwp12pQtaIiGjTeWVuQHg=;
	b=Av5sbmrSNOtuQqf9I4WSoYf/GQ7zSomNQ30vvnYFf1xZMR49UbGFwWUQ5XhIJ0Ez4QbQ
	 C4EV8x2MI8gtu4+AdwTVy2jd9zLPMgfuw07KxuSADPED9dFs+p9Jr+PIwYP4WM5Dq0SSK
	 tm6x2j9CBY/jvR9hyXw5kfI9VNyxZE7gNicDiGyGx/CUVt7AQ67Nie5iEINH0rsQA0Yd9
	 PXC1tHeRAUTLmP+XwG5ooM9dAUumvMwvcToeepauGH+sxRBr/wiVbL4RR/vJAOt5o+Mg/
	 2MqHFBR4w850dprJZsDbzuJlD9rPWO/CPogIZA8CdhABPfXfZK0PiFX/IjnKKJUyXvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0l0jS5w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E10606A325;
	Thu, 19 Nov 2026 10:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F0l0jS5w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39B4C1F000C5;
	Thu, 19 Nov 2026 10:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795084305;
	bh=f8LB2Xe2f4qCE6lFzUXlv5rwp12pQtaIiGjTeWVuQHg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=F0l0jS5w4DohO1lJw2vlpZ79kpolruD5SanYl0uQjnSyDkU08dylydZPx5R0ZcSWM
	 M1sh7qopLugauj53NHEMrJoGcRQgJo79xJE9B1Y+wFk9F/ClhV4ybbR3syReI74gR2
	 Skb0ylzPILU/c+lfbWNRkFvS4ZK95XvT9pFQ5evvgnnbLs0DmowjZgaXCvGsgGii2e
	 3rsYrLJnXBXMLa/vdZ0RPrNV2IoRW82QTQIVD6msyn8F2/PlNPkfWIiX8yEIbaTuaq
	 Vd76BugpIsl/zug4uAx86RqE34mL2bY+3gD/PTWgZSDMojeebD+QspxQWj88CLsonP
	 4PcIhDJmqcPOw==
Message-ID: <sashiko-outbox-222956@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v12 5/6] arm64: dts: ambarella: add CV75 SoC and EVK
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261119-cv75-soc-v12-5-e5a03cca8b05@ambarella.com>
References: <20261119-cv75-soc-v12-0-e5a03cca8b05@ambarella.com>
 <20261119-cv75-soc-v12-5-e5a03cca8b05@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 19 Nov 2026 10:31:44 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential
issues to consider:
- [High] arm64: dts: ambarella: uart0 console fails probe due to unbound
  pinctrl-0
- [Medium] arm64: dts: ambarella: apb simple-bus reg causes -EBUSY in
  amba_device_add()
- [Medium] arm64: dts: ambarella: undocumented compatible strings and
  properties in cv75
- [Medium] arm64: dts: ambarella: gpio nodes use unmatched periphid and
  unprobed pinctrl
- [Low] arm64: dts: ambarella: cpu@1 unit-address mismatches reg =3D
  <0x100> in cv75
--

commit e70f7e3684557e5b6677d7d83d584310569d7473
Author: Long Zhao <longzhao@ambarella.com>

arm64: dts: ambarella: add CV75 SoC and EVK

This commit adds the minimal Devicetree files for the Ambarella CV75 SoC and
CV75 EVK board, along with Makefile and arm64 defconfig entries.

> diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dt=
s/ambarella/cv75.dtsi
> new file mode 100644
> index 0000000000000..c36b6af48237a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
> @@ -0,0 +1,177 @@

[ ... ]

> +		cpu@1 {
> +			compatible =3D "arm,cortex-a76";
> +			device_type =3D "cpu";
> +			reg =3D <0x100>;
> +			enable-method =3D "psci";
> +		};

[Severity: Low]
Should this node be named cpu@100 to match reg =3D <0x100>?  The mismatch
triggers a unit_address_vs_reg warning from dtc and fails dtbs_check against
cpus.yaml.

[ ... ]

> +		ahb@ffe0000000 {
> +			compatible =3D "simple-bus";
> +			reg =3D <0xff 0xe0000000 0x0 0x01000000>;
> +			ranges =3D <0xe0000000 0xff 0xe0000000 0x01000000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;
> +
> +			s_scratchpad_syscon: scratchpad@e002e000 {
> +				compatible =3D "ambarella,cv75-sec-scratchpad", "syscon";
> +				reg =3D <0xe002e000 0x1000>;
> +			};
> +		};
> +
> +		apb@ffe4000000 {
> +			compatible =3D "simple-bus";
> +			reg =3D <0xff 0xe4000000 0x0 0x01000000>;
> +			ranges =3D <0xe4000000 0xff 0xe4000000 0x01000000>;
> +			#address-cells =3D <1>;
> +			#size-cells =3D <1>;

[Severity: Medium]
Does specifying a reg property on apb@ffe4000000 (and ahb@ffe0000000) preve=
nt
the child arm,primecell GPIO devices from registering?

When of_platform_bus_create() populates apb@ffe4000000, platform_device_add=
()
inserts [0xffe4000000 - 0xffe4ffffff] directly into iomem_resource.  For the
child arm,primecell GPIO nodes, of_amba_device_create() calls
amba_device_add() with parent =3D &iomem_resource, which uses
request_resource(&iomem_resource, &dev->res) instead of nesting inside the =
bus
resource and fails with -EBUSY.  Dropping reg from these simple-bus nodes (=
and
keeping ranges) avoids the top-level resource conflict and satisfies
simple-bus.yaml.

> +
> +			uart0: serial@e4000000 {
> +				compatible =3D "ambarella,cv75-uart", "snps,dw-apb-uart";
> +				reg =3D <0xe4000000 0x1000>;
> +				clocks =3D <&rct CV75_GCLK_UART0>;
> +				interrupts =3D <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
> +				reg-shift =3D <2>;
> +				reg-io-width =3D <4>;
> +				pinctrl-names =3D "default";
> +				pinctrl-0 =3D <&uart0_pins>;
> +
> +				status =3D "disabled";
> +			};

[Severity: High]
Will uart0 permanently defer probing on cv75-evk because pinctrl-0 referenc=
es
&uart0_pins under pinctrl@e4010000?

No driver in the tree matches "ambarella,cv75-pinctrl", so no pinctrl_dev is
registered for pinctrl@e4010000.  When serial@e4000000 is enabled as the
console in cv75-evk.dts, really_probe() -> pinctrl_bind_pins() ->
dt_to_map_one_config() cannot find the pinctrl supplier and returns
-EPROBE_DEFER whenever CONFIG_MODULES is enabled, leaving the board without=
 a
serial console.

> +
> +			pinctrl: pinctrl@e4010000 {
> +				compatible =3D "ambarella,cv75-pinctrl";
> +				reg =3D <0xe4010000 0x1000>;
> +				ambarella,drive-strength-syscon =3D <&rct>;
> +				ambarella,pull-syscon =3D <&s_scratchpad_syscon>;
> +
> +				uart0_pins: uart0-pins {
> +					function =3D "uart0";
> +					groups =3D "uart0";
> +				};
> +			};

[Severity: Medium]
Are the Devicetree binding schemas for the new compatible strings and
properties in this file missing from the series?

"ambarella,cv75-sec-scratchpad", "ambarella,cv75-uart",
"ambarella,cv75-pinctrl" (along with ambarella,drive-strength-syscon and
ambarella,pull-syscon), and "ambarella,cv75-gpio" are not documented under
Documentation/devicetree/bindings/, causing make dtbs_check to fail on
cv75-evk.dtb.

> +
> +			gpio0: gpio@e4013000 {
> +				compatible =3D "ambarella,cv75-gpio", "arm,primecell";
> +				reg =3D <0xe4013000 0x1000>;
> +				clocks =3D <&rct CV75_GCLK_APB>;
> +				clock-names =3D "apb_pclk";
> +				interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl 0 0 32>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				arm,primecell-periphid =3D <0x000e8061>;
> +			};

[Severity: Medium]
Can gpio0, gpio1, and gpio2 bind to any in-tree driver with
arm,primecell-periphid =3D <0x000e8061> and gpio-ranges =3D <&pinctrl ...>?

Because "arm,primecell" is in compatible, these nodes are created as AMBA
devices that match only on periphid, and no AMBA driver in the tree matches
0x000e8061 (gpio-pl061 only matches 0x00041061 with 8 lines per block rather
than 32).  In addition, gpio-ranges points to &pinctrl, which has no driver=
 in
the tree and would cause of_gpiochip_add_pin_range() to defer with
-EPROBE_DEFER.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-cv75-soc-v=
12-0-e5a03cca8b05@ambarella.com?part=3D5
