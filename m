Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7CEA345EC0;
	Mon, 19 Oct 2026 05:05:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792386319; cv=none; b=qHo0yJyijWUlgmxW1w9UyBhp3TuMtcz2TKRs6bEjLvm0CgfICR1FtVSYFj7y7Wr6TlrVh4JFYjpSnzuB3FsAnITYtNWZMziigmcFEXIhwkTwJcswRUxNppzS+tS6nt/Iy64Akw9Xzgd7W/nqFqunfW5XDvMCqonYuYDS7E3edIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792386319; c=relaxed/simple;
	bh=NxhcC/alXNWfyATTRqBnPlSXDbDsnR85ckwxuqEPl4g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=CJKK72KH2dT68WXjfFdZQsbitxQSDlK36QcLTsxJoiiicDmCc4Adn/RKMcl3Wg8esIZ7Q9qha7rRKLsbp8hVc9YBNmh6Z7A8+QdEd4dTVpY6mrB7aRimDXYGNhQ8iZV2oGi9KGwLzaotx3zzFc7GdITFS8iLmtuVWPa68sdNntA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZONV8F9c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZONV8F9c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEA351F000C4;
	Mon, 19 Oct 2026 05:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792386313;
	bh=GzsfRT1M+pGum/bxVHMbtI0D+TpCiJSveTAvOkF/h84=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZONV8F9c+NrPOIi0dpFys7e6KEqK9VKw/t7dS8PVesopPZp/sa75/AUqSE6uwVHKL
	 RXCT0hNJHVH66g/vmDPyI8cg7c/UFZJzajSsL3SIvM6T6vI3iYg0KztL/Cke70m3gd
	 64WxsKshSYqhX+8GacbjR3tQDWXTWW0JqW5QMsRdLZvOtWZus4LQqwJobXa0Le5cbl
	 xMTQU71yLpp27LCQkoNxQuFF1f+VyGq6eeXL8O2C52WZluukdHY0AABgr0967jxqmy
	 StY6P5WglhREgYdshGI1WWnQB9obzsSuOtp33XjAtBdmcIPhTmXpscMO3TltzIqB2f
	 b8g+erVUhOo7w==
Message-ID: <sashiko-outbox-176658@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 4/5] arm64: ambarella: add ARCH_AMBARELLA and CV75
 EVK DT
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: linux-clk@vger.kernel.org, mfd@lists.linux.dev, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, lee@kernel.org
In-Reply-To: <20261019-cv75-soc-v10-4-d386065e2dd5@ambarella.com>
References: <20261019-cv75-soc-v10-0-d386065e2dd5@ambarella.com>
 <20261019-cv75-soc-v10-4-d386065e2dd5@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 05:05:12 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] arm64: dts: ambarella: uart0 permanently defers probe due to missi=
ng pinctrl
- [Medium] arm64: dts: ambarella: undocumented compatible strings and prope=
rties in cv75
- [Medium] arm64: dts: ambarella: gpio nodes use unmatched periphid and unp=
robed pinctrl
--

commit 7e36a79675aa487cf1bb15e171011853976e17db
Author: Long Zhao <longzhao@ambarella.com>

arm64: ambarella: add ARCH_AMBARELLA and CV75 EVK DT

This commit adds the ARCH_AMBARELLA platform configuration and introduces
the device tree files for the Ambarella CV75 SoC and CV75 EVK board to
support initial console bring-up.

> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index d2acfac730037..16d7e3a4c2d62 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -26,6 +26,12 @@ config ARCH_SUNXI
>  	help
>  	  This enables support for Allwinner sunxi based SoCs like the A64.
> =20
> +config ARCH_AMBARELLA
> +	bool "Ambarella SoC family"
> +	select PINCTRL
> +	help
> +	  This enables support for the ARM64 based Ambarella SoCs like CV75.
> +
>  config ARCH_ALPINE
>  	bool "Annapurna Labs Alpine platform"
>  	select ALPINE_MSI if PCI

[ ... ]

> diff --git a/arch/arm64/boot/dts/ambarella/cv75-evk.dts b/arch/arm64/boot=
/dts/ambarella/cv75-evk.dts
> new file mode 100644
> index 0000000000000..42a0fe24b83bd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ambarella/cv75-evk.dts
> @@ -0,0 +1,30 @@

[ ... ]

> +	chosen {
> +		stdout-path =3D &uart0;
> +	};
> +
> +	memory@200000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x00200000 0x0 0x07e00000>;
> +	};
> +};
> +
> +&uart0 {
> +	status =3D "okay";
> +};
> diff --git a/arch/arm64/boot/dts/ambarella/cv75.dtsi b/arch/arm64/boot/dt=
s/ambarella/cv75.dtsi
> new file mode 100644
> index 0000000000000..c36b6af48237a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ambarella/cv75.dtsi
> @@ -0,0 +1,177 @@

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
Will uart0 permanently defer probing on boot because no driver exists for
"ambarella,cv75-pinctrl"?

In arch/arm64/boot/dts/ambarella/cv75-evk.dts, uart0 is enabled as the
console via stdout-path =3D &uart0. In cv75.dtsi, uart0 specifies
pinctrl-0 =3D <&uart0_pins>, which is a child of pinctrl@e4010000
(compatible =3D "ambarella,cv75-pinctrl"). However, there is no driver in
the kernel tree matching "ambarella,cv75-pinctrl".

With CONFIG_ARCH_AMBARELLA selecting CONFIG_PINCTRL and arm64 defconfig
enabling CONFIG_MODULES=3Dy, fw_devlink (via parse_pinctrl_n() ->
device_links_check_suppliers()) will hold off probing uart0 waiting for
the pinctrl supplier. Even after fw_devlink times out or if fw_devlink=3Doff
is passed, the probe path runs:

really_probe()
  -> pinctrl_bind_pins()
    -> devm_pinctrl_get()
      -> create_pinctrl()
        -> pinctrl_dt_to_map()
          -> dt_to_map_one_config()

In drivers/pinctrl/devicetree.c:dt_to_map_one_config(), when
get_pinctrl_dev_from_of_node() fails to find a registered pinctrl_dev for
pinctrl@e4010000 and walks up to the root node without pinctrl-use-default
set:

		if (!np_pctldev || of_node_is_root(np_pctldev)) {
			of_node_put(np_pctldev);
			ret =3D -ENODEV;
			/* keep deferring if modules are enabled */
			if (IS_ENABLED(CONFIG_MODULES) && !allow_default && ret < 0)
				ret =3D -EPROBE_DEFER;
			return ret;
		}

This returns -EPROBE_DEFER to pinctrl_bind_pins(), aborting really_probe()
before dw8250_probe() can bind the serial console. Should pinctrl-0 and
pinctrl-names be omitted from uart0 (or the pinctrl node disabled/omitted)
until the pinctrl driver is present?

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
> +
> +			gpio1: gpio@e4014000 {
> +				compatible =3D "ambarella,cv75-gpio", "arm,primecell";
> +				reg =3D <0xe4014000 0x1000>;
> +				clocks =3D <&rct CV75_GCLK_APB>;
> +				clock-names =3D "apb_pclk";
> +				interrupts =3D <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl 0 32 32>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				arm,primecell-periphid =3D <0x000e8061>;
> +			};
> +
> +			gpio2: gpio@e4015000 {
> +				compatible =3D "ambarella,cv75-gpio", "arm,primecell";
> +				reg =3D <0xe4015000 0x1000>;
> +				clocks =3D <&rct CV75_GCLK_APB>;
> +				clock-names =3D "apb_pclk";
> +				interrupts =3D <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +				gpio-ranges =3D <&pinctrl 0 64 32>;
> +				interrupt-controller;
> +				#interrupt-cells =3D <2>;
> +				arm,primecell-periphid =3D <0x000e8061>;
> +			};
> +		};

[Severity: Medium]
Are binding schemas missing for the newly introduced compatible strings and
properties in cv75.dtsi?

Running make dtbs_check on cv75-evk.dtb will fail validation because
several compatible strings and vendor properties are not documented under
Documentation/devicetree/bindings/:

- scratchpad@e002e000 uses compatible =3D "ambarella,cv75-sec-scratchpad",
  "syscon", which is not listed in
  Documentation/devicetree/bindings/mfd/syscon.yaml.
- serial@e4000000 uses compatible =3D "ambarella,cv75-uart",
  "snps,dw-apb-uart", which is not listed in
  Documentation/devicetree/bindings/serial/snps-dw-apb-uart.yaml.
- pinctrl@e4010000 uses compatible =3D "ambarella,cv75-pinctrl" along with
  ambarella,drive-strength-syscon and ambarella,pull-syscon, which have no
  binding schema in the tree.
- gpio@e4013000, gpio@e4014000, and gpio@e4015000 use
  compatible =3D "ambarella,cv75-gpio", "arm,primecell", which is not
  documented in any binding schema.

[Severity: Medium]
How are gpio0, gpio1, and gpio2 expected to bind to a driver with
arm,primecell-periphid =3D <0x000e8061>?

Because "arm,primecell" is in compatible, of_platform_bus_create()
registers gpio0, gpio1, and gpio2 as struct amba_device instances on the
AMBA bus, where amba_match() -> amba_lookup() matches exclusively against
periphid. No amba_driver in the tree matches 0x000e8061; for example,
drivers/gpio/gpio-pl061.c has:

static const struct amba_id pl061_ids[] =3D {
	{
		.id	=3D 0x00041061,
		.mask	=3D 0x000fffff,
	},
	{ 0, 0 },
};

(and PL061 only supports 8 GPIO lines per block rather than 32). In
addition, gpio-ranges =3D <&pinctrl ... 32> references the unprobed
pinctrl@e4010000 node, which would cause of_gpiochip_add_pin_range() ->
of_pinctrl_get() to return -EPROBE_DEFER. Is there a separate GPIO and
pinctrl driver series that these nodes depend on?

[ ... ]

> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index ad3bd3d9507b2..454f07a6a6a6f 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -36,6 +36,7 @@ CONFIG_CRASH_DUMP=3Dy
>  CONFIG_ARCH_ACTIONS=3Dy
>  CONFIG_ARCH_AIROHA=3Dy
>  CONFIG_ARCH_SUNXI=3Dy
> +CONFIG_ARCH_AMBARELLA=3Dy
>  CONFIG_ARCH_ALPINE=3Dy
>  CONFIG_ARCH_APPLE=3Dy
>  CONFIG_ARCH_ARTPEC=3Dy

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-cv75-soc-v=
10-0-d386065e2dd5@ambarella.com?part=3D4
