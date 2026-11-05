Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793878110;
	b=2XBDqqafHFQer66VoWYk0KgcBMbL+pjPA9s5b3RDHtIMiL/DkxfJlSfnOqFo3r/GTGh3
	 HYijejb1DRpO2QeoyUYc2gpz5+espPpofqVs+bzfNJi6/Tzk2SDiqw8Jf6E7JHWsoTHkn
	 WqYSDnQwX8+ign3Y7Q2ubzgnP63Wq6bD1DJqrxZKoXO1BYspM0MAULb2KvAmwZjb6rd0d
	 AdZzjCCU2Xr8j1zNrNCgQMjNu42QzxN3cfLJyL6ehX8KlPFuCSkXXkXh8HpM0T4N5tEU9
	 agf3RmxggEpr7JJ1f9JRyPCgCgOjr+NC6ANq2e+VkL1OMpYBXaFDS4d6DzwBWVf9ZYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793878110;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ARNDoGZ23sDfxNbuMPH7UkCSG1pXm//dZNj/PnmkDbw=;
	b=c9/4jdYlQxZEqJT+zdZ6B9YAgQdAQtOacXJREps+ruzZlNqq8lX7Ffm497eI1BNXjYSU
	 WzBFtFFuJtevce0MiEUWtXz37Nw7xMlmhCc2QWBrwpkW9Y1nbNtgmrkI5YC1HZbZC1Kcy
	 cmR3hLYEgbp88XJ6qZckgauFABqGwqJ9kwHWqhnEpdphG2lx0OmyQViGt0GHwZKy8XPar
	 1+QwoK5xfxu5jzd6eWmPp7OVjQ7LXzM2y1tsswwswW0sQLRr9w/uFG2VhNnas9zI3k0r6
	 Adm4kZedT5Em259PFVWJfplgDL8t4hLEteIhBJJ2cxfkqsu5TSkaigWmTjPRoatcz5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIXeUw4x;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA6E3606A328;
	Thu,  5 Nov 2026 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=FIXeUw4x
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 462F21F000C1;
	Thu,  5 Nov 2026 11:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793878109;
	bh=ARNDoGZ23sDfxNbuMPH7UkCSG1pXm//dZNj/PnmkDbw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FIXeUw4xi1qZ++8gXCNsHjbzHKEraQRu+YrdR7TO1Q8+f8y6nIYXUeqAGqN1Wv+YJ
	 G3bdqJGeoaNdTC+q12h/ZWboWfIZ5rWA/jxBWAqsYgAzQE2Vrg8DSPIbA3YnD21JJP
	 qg87fAGp5daZrhzh8Tg/3ab8uVUotblnJzWl1AYpLqf+j5hwiXkqN6itmK338Px1J+
	 avyjp97K0UzeBvlz+cbRiYYl/LRs8hpSqlfs+edgr6zmrY1BQEpkIGbYPShfAzLWTK
	 d9hpokMmT8MVfWK+PS0bVEmEpDTo3oDyp6hWwLD41fqUIZYjF0FkNAp2Goon+zGhUd
	 vRA+UMANmtymw==
Message-ID: <sashiko-outbox-198948@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 4/5] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261105-cv75-soc-v11-4-aa6ee0b2380d@ambarella.com>
References: <20261105-cv75-soc-v11-0-aa6ee0b2380d@ambarella.com>
 <20261105-cv75-soc-v11-4-aa6ee0b2380d@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 05 Nov 2026 11:28:28 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] arm64: dts: ambarella: uart0 permanently defers probe due to missi=
ng pinctrl
- [Medium] arm64: dts: ambarella: undocumented compatible strings and prope=
rties in cv75
- [Medium] arm64: dts: ambarella: gpio nodes use unmatched periphid and unp=
robed pinctrl
- [Medium] arm64: dts: ambarella: apb simple-bus reg blocks child AMBA gpio=
 registration
- [Low] arm64: dts: ambarella: cpu@1 unit-address mismatches reg value 0x10=
0 in cv75
--

commit 2577b890c9c87bc36cb977c573e3558792596572
Author: Long Zhao <longzhao@ambarella.com>

arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT

This commit enables ARCH_AMBARELLA and adds a minimal device tree for the
Ambarella CV75 SoC and EVK board with RCT clocks, UART, pinctrl, and GPIO
banks.

> diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dt=
s/ambarella/cv75.dtsi
> new file mode 100644
> index 0000000000000..c36b6af48237a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
> @@ -0,0 +1,177 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Ambarella CV75 SoC
> + *
> + * Boot peripheral: UART0 console.
> + * Clocks: a single ambarella,cv75-rct provider.
> + */
> +
> +#include <dt-bindings/clock/ambarella,cv75-rct.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	compatible =3D "ambarella,cv75";
> +	interrupt-parent =3D <&gic>;
> +	#address-cells =3D <2>;
> +	#size-cells =3D <2>;
> +
> +	cpus {
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		cpu@0 {
> +			compatible =3D "arm,cortex-a76";
> +			device_type =3D "cpu";
> +			reg =3D <0x000>;
> +			enable-method =3D "psci";
> +		};
> +
> +		cpu@1 {
> +			compatible =3D "arm,cortex-a76";
> +			device_type =3D "cpu";
> +			reg =3D <0x100>;
> +			enable-method =3D "psci";
> +		};

[Severity: Low]
In arch/arm64/boot/dts/ambarella/cv75.dtsi, the second CPU node is named
cpu@1 while its reg property is <0x100>. Does this trigger a
unit_address_vs_reg warning during W=3D1 builds and dtbs_check? Should the
node unit-address match the reg property as cpu@100 (or reg =3D <0x1> if
MPIDR Aff0 is 1)?

[ ... ]

> +	soc {
> +		compatible =3D "simple-bus";
> +		#address-cells =3D <2>;
> +		#size-cells =3D <2>;
> +		ranges;
> +
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
Does specifying reg =3D <0xff 0xe4000000 0x0 0x01000000> on the
apb@ffe4000000 simple-bus node block registration of the child AMBA GPIO
devices (gpio0, gpio1, and gpio2) with -EBUSY?

During of_platform_default_populate(), of_platform_bus_create() creates a
platform_device for apb@ffe4000000, and platform_device_add() calls
insert_resource(&iomem_resource, r), reserving [mem 0xffe4000000-0xffe4ffff=
ff]
as a top-level child of iomem_resource.

When of_platform_bus_create() then iterates over the child "arm,primecell"
nodes (gpio@e4013000, gpio@e4014000, and gpio@e4015000), it calls:

of_amba_device_create()
  amba_device_add(dev, &iomem_resource)
    request_resource(&iomem_resource, &dev->res)

Because __request_resource() checks direct children of iomem_resource, it
collides with the parent bus reservation and returns -EBUSY, causing
amba_device_add() to fail for each GPIO controller.

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

[Severity: High]
As reported by Sashiko on v10 [1], will uart0 (enabled as stdout-path in
arch/arm64/boot/dts/ambarella/cv75-evk.dts) permanently defer probing with
-EPROBE_DEFER because no driver exists for "ambarella,cv75-pinctrl"?

In arch/arm64/Kconfig.platforms, ARCH_AMBARELLA selects PINCTRL, and the
arm64 defconfig enables both CONFIG_ARCH_AMBARELLA=3Dy and CONFIG_MODULES=
=3Dy.
Because uart0 declares pinctrl-0 =3D <&uart0_pins> referencing
pinctrl@e4010000, fw_devlink (parse_pinctrl_n() ->
device_links_check_suppliers()) blocks uart0 waiting for the pinctrl
supplier.

Even if fw_devlink times out or is disabled, really_probe() calls:

pinctrl_bind_pins()
  devm_pinctrl_get()
    create_pinctrl()
      pinctrl_dt_to_map()
        dt_to_map_one_config()

In drivers/pinctrl/devicetree.c:dt_to_map_one_config(), when
get_pinctrl_dev_from_of_node() finds no registered pinctrl_dev for
pinctrl@e4010000 and walks up to the root node without pinctrl-use-default:

		if (!np_pctldev || of_node_is_root(np_pctldev)) {
			of_node_put(np_pctldev);
			ret =3D -ENODEV;
			/* keep deferring if modules are enabled */
			if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
				ret =3D -EPROBE_DEFER;
			return ret;
		}

This returns -EPROBE_DEFER whenever CONFIG_MODULES is enabled, preventing
dw8250_probe() from ever binding the serial console.

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
As reported by Sashiko on v10 [1], can gpio0, gpio1, and gpio2 bind to any
driver in the kernel tree?

Because "arm,primecell" is in compatible, of_platform_bus_create()
instantiates these nodes as struct amba_device objects with periphid
0x000e8061. In drivers/amba/bus.c, amba_match() matches AMBA devices solely
against pcdrv->id_table via amba_lookup(). However, drivers/gpio/gpio-pl061=
.c
only matches periphid 0x00041061 (and supports 8 lines per block rather than
32):

static const struct amba_id pl061_ids[] =3D {
	{
		.id	=3D 0x00041061,
		.mask	=3D 0x000fffff,
	},
	{ 0, 0 },
};

In addition, each GPIO node specifies gpio-ranges referencing &pinctrl
("ambarella,cv75-pinctrl"), which has no driver in the tree, so
of_gpiochip_add_pin_range() would also defer probing with -EPROBE_DEFER when
of_pinctrl_get() fails to find a registered pinctrl device.

[Severity: Medium]
As reported by Sashiko on v10 [1], does make dtbs_check fail on
cv75-evk.dtb due to undocumented compatible strings and properties in
arch/arm64/boot/dts/ambarella/cv75.dtsi?

Specifically, there do not appear to be Devicetree binding schemas covering:
- "ambarella,cv75-sec-scratchpad" in scratchpad@e002e000 (not in
  Documentation/devicetree/bindings/mfd/syscon.yaml)
- "ambarella,cv75-uart" in serial@e4000000 (not in
  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml)
- "ambarella,cv75-pinctrl", ambarella,drive-strength-syscon, and
  ambarella,pull-syscon in pinctrl@e4010000
- "ambarella,cv75-gpio" in gpio@e4013000, gpio@e4014000, and gpio@e4015000
- the reg properties on the simple-bus nodes ahb@ffe0000000 and
  apb@ffe4000000

[1] https://lore.kernel.org/r/20261019-cv75-soc-v10-4-d386065e2dd5@ambarell=
a.com

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261105-cv75-soc-v=
11-0-aa6ee0b2380d@ambarella.com?part=3D4
