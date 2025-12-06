Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBAF2FD69F
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 13:53:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765029231; cv=none; b=qyt1E0O4gPIi2DOfOrJ909aIwQaqMLOhJ1Hh22Wr/+REXdQ+bGmRQvrhLeM4puFxRf0RuSIyUKzEmvN1mP0T8Fw2WHUVwNm8GcU/hq3sYoKjHKWpJ8X5K550ScfNNMmJV70gl+qxr66ewln2UmGKSSts6L4NFcEoGcvVr/2EUJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765029231; c=relaxed/simple;
	bh=XJ1kZElLzlV5nTpyDai2t1XWzD3uNtQZWO3ry65elLQ=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=q8HIZUF8CQ+P8/E7pbhYzpU0mVx3VjWROOuw7kPjQJMWWJR39nstp9Ch+JSUJ033uM1akpbkJ58m8HfFj8oCT9wy10O6Kfe2Eg8GrdcZRSP6xQDgN9PQfGn9YoXR/UlZOOr1EtjVc8yFaJEf1pi7Of5eyDJ/do6K+FVrp2qZ0DI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=JQhJ7qyi; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="JQhJ7qyi"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so640798366b.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 05:53:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765029225; x=1765634025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3ej50mL0PQBpJoaAzMT+aRzSelXZQe5+mjAA+ImPl78=;
        b=JQhJ7qyiwxi082vqMFw1c1IWfItIuT7XHfvNLOjvo8e2clNVpby6tc1jImbPBGyD7h
         XZ3SaDB16CQSzQ3IKJEP8ei+wfRWEaWWXlysuy7ovbNKx/HIyswnyEtrkjM9Gi6LM308
         iGrbG+5c2SpHCpsUUcc1mMf9+/ccfG36qJJjHOaVM1Kt/NXVIOkSNganjJW16WTYtXGA
         Y3hCpAUoMhnBTstuswmrjqBnyzEwCbOQDKmHccYsJNnmiNZHs1GRsnGP7BFg48wuGPu+
         X7en5sYzamecTlbzuugEdhmknTzoo1286G4n193QbNo73GQIXhwU565nJPRCZ3i7CeYw
         ALIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765029225; x=1765634025;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3ej50mL0PQBpJoaAzMT+aRzSelXZQe5+mjAA+ImPl78=;
        b=SLTZiqvY1rlHrtEMPhtxC7xIYlVu5WpCcliX352ajMN2H1jW9KmG544emP7mNcj6es
         lu5P3GgmJORtw4nanhPuyEb2DAFbdNkZPJPYQanDZYkV/W9JNkulZ+sWvQYMZ7ynP7eA
         28folPYZCXCD+JDb+ipNBD9JAZEw7zj4grC0rOkBAwO6aZQ7w2lJQUWl/EwUNUQpGJLW
         c3734nYOfERK+mR01jpdtEdBCfDVb/slJjkAbwPBInQCY1xL6s/w/QINOgU+RrNhQ9yp
         0JEcd+2kSUhhVy/0xilIIFA8k+B9Uc9jk+B7skFsB5TSTOpcO6AsuD84zHpqC0ifWNgY
         QU/w==
X-Forwarded-Encrypted: i=1; AJvYcCWB2/35IdAz7aMFuRBNyU/WOQNnwi2xmvogYxxSkHucuibfkf/NEI0MKgqcuztO2He/POcKaNFJQ90=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN7d4slzOTEwG2s8tcGkP3J6wyCuZlrBy6c+d6OBggyaqvg18m
	34Hj619gf58C+WhztABKVufgdIKCgeta4ZiyLqFreEIDkWqLZcmYTgnaiZI4wf6Dz5w=
X-Gm-Gg: ASbGncudeIAkM4pRdtP72S5P22Xmh1O8AkuFXpySQe/xmD39VoyROzlfUfzoYlbwBe5
	a+QahiAZHaX8uuwDlIWR1Dn/5CL9d5bwH49kIjjaje6oDMXJbL9sREZZduwAH4PtpkLsMLlEQa9
	Du5vtya2y496qhqx47fumEk8Lmyp7WLvkADsWVraJS58LvUDsDCFM7fNTlTCG2nCEQqQaxQmkYx
	74qjZ05eUpyppestALmzYLHa8vWPf5sD3TXGwEfxg39EXf0MdrT1mLidaR69dWFd3if4LwK2W2u
	DSE6Es02jtxWKGQ/aaTwyKHO6/uNv9IEkIOh++X9QcFy/Uuhxo/fBxOBMSTTSfB5En0vyTCQk5/
	HbcErR1m/quU+ZCbz4QTjhubf+XAONVgV2H84vHBtjLcTdMGS59Cvw7xP5DH47gwsnEeW2jquXM
	iYDeR8XaeU0ex/keQbGmk=
X-Google-Smtp-Source: AGHT+IEciA1pzJmS5inMQoEt22ysOMLQTEOeUJcVMkAR+tmMdkaOCWLIsjNKgnhR8yd7V7RIipoweA==
X-Received: by 2002:a17:907:2d26:b0:b75:7b39:88bc with SMTP id a640c23a62f3a-b7a247fb899mr236900666b.58.1765029224965;
        Sat, 06 Dec 2025 05:53:44 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f44d3d9esm607753066b.30.2025.12.06.05.53.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 05:53:44 -0800 (PST)
Message-ID: <a8185e0f-a3a2-44df-af37-1ad505ce9a7b@tuxon.dev>
Date: Sat, 6 Dec 2025 15:53:42 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 4/4] arm64: dts: microchip: add LAN969x support
To: Robert Marko <robert.marko@sartura.hr>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, gregkh@linuxfoundation.org,
 nicolas.ferre@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 richardcochran@gmail.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 daniel.machon@microchip.com, UNGLinuxDriver@microchip.com
Cc: luka.perkov@sartura.hr, Horatiu Vultur <horatiu.vultur@microchip.com>
References: <20251203122313.1287950-1-robert.marko@sartura.hr>
 <20251203122313.1287950-4-robert.marko@sartura.hr>
Content-Language: en-US
In-Reply-To: <20251203122313.1287950-4-robert.marko@sartura.hr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Robert,

On 12/3/25 14:21, Robert Marko wrote:
> Add support for Microchip LAN969x switch SoC, including the EV23X71A
> EVB board.

Could you please split SoC and board device trees in different patches?

> 
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> ---
>  arch/arm64/boot/dts/microchip/Makefile        |   2 +
>  .../boot/dts/microchip/lan9696-ev23x71a.dts   | 761 ++++++++++++++++++
>  arch/arm64/boot/dts/microchip/lan969x.dtsi    | 482 +++++++++++
>  3 files changed, 1245 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
>  create mode 100644 arch/arm64/boot/dts/microchip/lan969x.dtsi
> 
> diff --git a/arch/arm64/boot/dts/microchip/Makefile b/arch/arm64/boot/dts/microchip/Makefile
> index c6e0313eea0f..d02ac50aae79 100644
> --- a/arch/arm64/boot/dts/microchip/Makefile
> +++ b/arch/arm64/boot/dts/microchip/Makefile
> @@ -2,3 +2,5 @@
>  dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb125.dtb
>  dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb134.dtb sparx5_pcb134_emmc.dtb
>  dtb-$(CONFIG_ARCH_SPARX5) += sparx5_pcb135.dtb sparx5_pcb135_emmc.dtb
> +
> +dtb-$(CONFIG_ARCH_LAN969X) += lan9696-ev23x71a.dtb

Please keep it alphanumerically sorted, so before SPARCX5

> \ No newline at end of file
> diff --git a/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> new file mode 100644
> index 000000000000..6bbddad2a0b9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts
> @@ -0,0 +1,761 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025 Microchip Technology Inc. and its subsidiaries.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include "lan969x.dtsi"
> +
> +/ {
> +	model = "Microchip EV23X71A";
> +	compatible = "microchip,ev23x71a", "microchip,lan969x";
> +
> +	aliases {
> +		serial0 = &usart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-restart {
> +		compatible = "gpio-restart";
> +		gpios = <&gpio 60 GPIO_ACTIVE_LOW>;
> +		open-source;
> +		priority = <200>;
> +	};
> +
> +	i2c-mux {
> +		compatible = "i2c-mux-gpio";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		i2c-parent = <&i2c3>;
> +

This line could be dropped.

> +		mux-gpios = <&sgpio_out 0 1 GPIO_ACTIVE_HIGH
> +			     &sgpio_out 0 2 GPIO_ACTIVE_HIGH
> +			     &sgpio_out 0 3 GPIO_ACTIVE_HIGH>;

Enclose each entry in <>. See
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n179

> +		idle-state = <0x8>;
> +
> +		i2c_sfp0: i2c@0 {
> +			reg = <0x0>;
> +		};
> +
> +		i2c_sfp1: i2c@1 {
> +			reg = <0x1>;
> +		};
> +
> +		i2c_sfp2: i2c@2 {
> +			reg = <0x2>;
> +		};
> +
> +		i2c_sfp3: i2c@3 {
> +			reg = <0x3>;
> +		};
> +
> +		i2c_poe: i2c@7 {
> +			reg = <0x7>;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-status {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&gpio 61 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-sfp1-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <0>;
> +			gpios = <&sgpio_out 6 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp1-yellow {
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <0>;
> +			gpios = <&sgpio_out 6 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp2-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <1>;
> +			gpios = <&sgpio_out 7 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp2-yellow {
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <1>;
> +			gpios = <&sgpio_out 7 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp3-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <2>;
> +			gpios = <&sgpio_out 8 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp3-yellow {
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <2>;
> +			gpios = <&sgpio_out 8 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp4-green {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <3>;
> +			gpios = <&sgpio_out 9 0 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +
> +		led-sfp4-yellow {
> +			color = <LED_COLOR_ID_YELLOW>;
> +			function = LED_FUNCTION_LAN;
> +			function-enumerator = <3>;
> +			gpios = <&sgpio_out 9 1 GPIO_ACTIVE_LOW>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	mux-controller {
> +		compatible = "gpio-mux";
> +		#mux-control-cells = <0>;
> +

This line could be dropped.

> +		mux-gpios = <&sgpio_out 1 2 GPIO_ACTIVE_LOW>,
> +			    <&sgpio_out 1 3 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	sfp0: sfp0 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp0>;
> +		tx-disable-gpios = <&sgpio_out 6 2 GPIO_ACTIVE_HIGH>;
> +		los-gpios = <&sgpio_in 6 0 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sgpio_in 6 1 GPIO_ACTIVE_LOW>;
> +		tx-fault-gpios = <&sgpio_in 6 2 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sfp1: sfp1 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp1>;
> +		tx-disable-gpios = <&sgpio_out 7 2 GPIO_ACTIVE_HIGH>;
> +		los-gpios = <&sgpio_in 7 0 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sgpio_in 7 1 GPIO_ACTIVE_LOW>;
> +		tx-fault-gpios = <&sgpio_in 7 2 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sfp2: sfp2 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp2>;
> +		tx-disable-gpios = <&sgpio_out 8 2 GPIO_ACTIVE_HIGH>;
> +		los-gpios = <&sgpio_in 8 0 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sgpio_in 8 1 GPIO_ACTIVE_LOW>;
> +		tx-fault-gpios = <&sgpio_in 8 2 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	sfp3: sfp3 {
> +		compatible = "sff,sfp";
> +		i2c-bus = <&i2c_sfp3>;
> +		tx-disable-gpios = <&sgpio_out 9 2 GPIO_ACTIVE_HIGH>;
> +		los-gpios = <&sgpio_in 9 0 GPIO_ACTIVE_HIGH>;
> +		mod-def0-gpios = <&sgpio_in 9 1 GPIO_ACTIVE_LOW>;
> +		tx-fault-gpios = <&sgpio_in 9 2 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&flx0 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
> +	status = "okay";
> +};
> +
> +&usart0 {
> +	pinctrl-0 = <&fc0_pins>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};

Although, I understand why flexcom inner node labels were kept near their
corresponding parent labels (and I know there is at least one board file
that follow this approach), I tend to go forward with the approach that was
proposed by Horatiu in [1], thus everything alphanumerically sorted, if
everyone is OK with this.

[1]
https://lore.kernel.org/all/20251201082629.2326339-3-horatiu.vultur@microchip.com

> +
> +&flx2 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_SPI>;
> +	status = "okay";
> +};
> +
> +&spi2 {
> +	pinctrl-0 = <&fc2_pins>;
> +	pinctrl-names = "default";
> +	cs-gpios = <&gpio 63 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +};
> +
> +&flx3 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_TWI>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	pinctrl-0 = <&fc3_pins>;
> +	pinctrl-names = "default";
> +	i2c-analog-filter;
> +	i2c-digital-filter;
> +	i2c-digital-filter-width-ns = <35>;
> +	i2c-sda-hold-time-ns = <1500>;
> +	status = "okay";
> +};
> +
> +&gpio {
> +	emmc_sd_pins: emmc-sd-pins {
> +		/* eMMC_SD - CMD, CLK, D0, D1, D2, D3, D4, D5, D6, D7, RSTN */
> +		pins = "GPIO_14", "GPIO_15", "GPIO_16", "GPIO_17",
> +		       "GPIO_18", "GPIO_19", "GPIO_20", "GPIO_21",
> +		       "GPIO_22", "GPIO_23", "GPIO_24";
> +		function = "emmc_sd";
> +	};
> +
> +	fan_pins: fan-pins {
> +		pins = "GPIO_25", "GPIO_26";
> +		function = "fan";
> +	};
> +
> +	fc0_pins: fc0-pins {
> +		pins = "GPIO_3", "GPIO_4";
> +		function = "fc";
> +	};
> +
> +	fc2_pins: fc2-pins {
> +		pins = "GPIO_64", "GPIO_65", "GPIO_66";
> +		function = "fc";
> +	};
> +
> +	fc3_pins: fc3-pins {
> +		pins = "GPIO_55", "GPIO_56";
> +		function = "fc";
> +	};
> +
> +	mdio_pins: mdio-pins {
> +		pins = "GPIO_9", "GPIO_10";
> +		function = "miim";
> +	};
> +
> +	mdio_irq_pins: mdio-irq-pins {
> +		pins = "GPIO_11";
> +		function = "miim_irq";
> +	};
> +
> +	sgpio_pins: sgpio-pins {
> +		/* SCK, D0, D1, LD */
> +		pins = "GPIO_5", "GPIO_6", "GPIO_7", "GPIO_8";
> +		function = "sgpio_a";
> +	};
> +
> +	usb_ulpi_pins: usb-ulpi-pins {
> +		pins = "GPIO_30", "GPIO_31", "GPIO_32", "GPIO_33",
> +		"GPIO_34", "GPIO_35", "GPIO_36", "GPIO_37",

Please align it to the above "GPIO_30" as it has been done for emmc.

> +		"GPIO_38", "GPIO_39", "GPIO_40", "GPIO_41";
> +		function = "usb_ulpi";
> +	};
> +
> +	usb_rst_pins: usb-rst-pins {
> +		pins = "GPIO_12";
> +		function = "usb2phy_rst";
> +	};
> +
> +	usb_over_pins: usb-over-pins {
> +		pins = "GPIO_13";
> +		function = "usb_over_detect";
> +	};
> +
> +	usb_power_pins: usb-power-pins {
> +		pins = "GPIO_1";
> +		function = "usb_power";
> +	};
> +
> +	ptp_out_pins: ptp-out-pins {
> +		pins = "GPIO_58";
> +		function = "ptpsync_4";
> +	};
> +
> +	ptp_ext_pins: ptp-ext-pins {
> +		pins = "GPIO_59";
> +		function = "ptpsync_5";
> +	};
> +};
> +
> +&tmon {

Keep entries alphanumerically sorted, thus after mdio0.

> +	pinctrl-0 = <&fan_pins>;
> +	pinctrl-names = "default";
> +};
> +
> +&mdio0 {
> +	pinctrl-0 = <&mdio_pins>, <&mdio_irq_pins>;
> +	pinctrl-names = "default";
> +	reset-gpios = <&gpio 62 GPIO_ACTIVE_LOW>;
> +	status = "okay";
> +
> +	phy3: phy@3 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <3>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy4: phy@4 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <4>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy5: phy@5 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <5>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy6: phy@6 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <6>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy7: phy@7 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <7>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy8: phy@8 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <8>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy9: phy@9 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <9>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy10: phy@10 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <10>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy11: phy@11 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <11>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy12: phy@12 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <12>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy13: phy@13 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <13>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy14: phy@14 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <14>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy15: phy@15 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <15>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy16: phy@16 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <16>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy17: phy@17 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <17>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy18: phy@18 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <18>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy19: phy@19 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <19>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy20: phy@20 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <20>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy21: phy@21 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <21>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy22: phy@22 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <22>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy23: phy@23 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <23>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy24: phy@24 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <24>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy25: phy@25 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <25>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy26: phy@26 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <26>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +
> +	phy27: phy@27 {
> +		compatible = "ethernet-phy-ieee802.3-c22";
> +		reg = <27>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gpio>;
> +	};
> +};
> +
> +&serdes {
> +	status = "okay";
> +};
> +
> +&sgpio {
> +	pinctrl-0 = <&sgpio_pins>;
> +	pinctrl-names = "default";
> +

Please drop this line.

> +	microchip,sgpio-port-ranges = <0 1>, <6 9>;
> +	status = "okay";
> +
> +	gpio@0 {
> +		ngpios = <128>;
> +	};
> +	gpio@1 {
> +		ngpios = <128>;
> +	};
> +};
> +
> +&switch {
> +	pinctrl-0 = <&ptp_out_pins>, <&ptp_ext_pins>;
> +	pinctrl-names = "default";
> +

Plese drop this line.

> +	status = "okay";

And add one here.

> +	ethernet-ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port0: port@0 {
> +			reg = <0>;
> +			microchip,bandwidth = <1000>;

Vendor specific properties goes at the end of the node, before status,
according to this:
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/Documentation/devicetree/bindings/dts-coding-style.rst#n122.
Valid for the rest of the port nodes.

> +			phy-handle = <&phy4>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 0>;
> +		};
> +
> +		port1: port@1 {
> +			reg = <1>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy5>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 0>;
> +		};
> +
> +		port2: port@2 {
> +			reg = <2>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy6>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 0>;
> +		};
> +
> +		port3: port@3 {
> +			reg = <3>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy7>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 0>;
> +		};
> +
> +		port4: port@4 {
> +			reg = <4>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy8>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 1>;
> +		};
> +
> +		port5: port@5 {
> +			reg = <5>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy9>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 1>;
> +		};
> +
> +		port6: port@6 {
> +			reg = <6>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy10>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 1>;
> +		};
> +
> +		port7: port@7 {
> +			reg = <7>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy11>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 1>;
> +		};
> +
> +		port8: port@8 {
> +			reg = <8>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy12>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 2>;
> +		};
> +
> +		port9: port@9 {
> +			reg = <9>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy13>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 2>;
> +		};
> +
> +		port10: port@10 {
> +			reg = <10>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy14>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 2>;
> +		};
> +
> +		port11: port@11 {
> +			reg = <11>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy15>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 2>;
> +		};
> +
> +		port12: port@12 {
> +			reg = <12>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy16>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 3>;
> +		};
> +
> +		port13: port@13 {
> +			reg = <13>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy17>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 3>;
> +		};
> +
> +		port14: port@14 {
> +			reg = <14>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy18>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 3>;
> +		};
> +
> +		port15: port@15 {
> +			reg = <15>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy19>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 3>;
> +		};
> +
> +		port16: port@16 {
> +			reg = <16>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy20>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 4>;
> +		};
> +
> +		port17: port@17 {
> +			reg = <17>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy21>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 4>;
> +		};
> +
> +		port18: port@18 {
> +			reg = <18>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy22>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 4>;
> +		};
> +
> +		port19: port@19 {
> +			reg = <19>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy23>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 4>;
> +		};
> +
> +		port20: port@20 {
> +			reg = <20>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy24>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 5>;
> +		};
> +
> +		port21: port@21 {
> +			reg = <21>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy25>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 5>;
> +		};
> +
> +		port22: port@22 {
> +			reg = <22>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy26>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 5>;
> +		};
> +
> +		port23: port@23 {
> +			reg = <23>;
> +			microchip,bandwidth = <1000>;
> +			phy-handle = <&phy27>;
> +			phy-mode = "qsgmii";
> +			phys = <&serdes 5>;
> +		};
> +
> +		port24: port@24 {
> +			reg = <24>;
> +			microchip,bandwidth = <10000>;
> +			phys = <&serdes 6>;
> +			phy-mode = "10gbase-r";
> +			sfp = <&sfp0>;
> +			microchip,sd-sgpio = <24>;
> +			managed = "in-band-status";
> +		};
> +
> +		port25: port@25 {
> +			reg = <25>;
> +			microchip,bandwidth = <10000>;
> +			phys = <&serdes 7>;
> +			phy-mode = "10gbase-r";
> +			sfp = <&sfp1>;
> +			microchip,sd-sgpio = <28>;
> +			managed = "in-band-status";
> +		};
> +
> +		port26: port@26 {
> +			reg = <26>;
> +			microchip,bandwidth = <10000>;
> +			phys = <&serdes 8>;
> +			phy-mode = "10gbase-r";
> +			sfp = <&sfp2>;
> +			microchip,sd-sgpio = <32>;
> +			managed = "in-band-status";
> +		};
> +
> +		port27: port@27 {
> +			reg = <27>;
> +			microchip,bandwidth = <10000>;
> +			phys = <&serdes 9>;
> +			phy-mode = "10gbase-r";
> +			sfp = <&sfp3>;
> +			microchip,sd-sgpio = <36>;
> +			managed = "in-band-status";
> +		};
> +
> +		port29: port@29 {
> +			reg = <29>;
> +			microchip,bandwidth = <1000>;
> +			phys = <&serdes 11>;
> +			phy-handle = <&phy3>;
> +			phy-mode = "rgmii";

From chekpatch:

WARNING: phy-mode "rgmii" without comment -- delays on the PCB should be
described, otherwise use "rgmii-id"
#779: FILE: arch/arm64/boot/dts/microchip/lan9696-ev23x71a.dts:750:
+                       phy-mode = "rgmii";

> +			rx-internal-delay-ps = <1000>;
> +			tx-internal-delay-ps = <1000>;
> +		};
> +	};
> +};
> +
> +&usb {
> +	status = "okay";

Status should be the last property in this node according to the links
shared above.

> +	pinctrl-0 = <&usb_ulpi_pins>, <&usb_rst_pins>, <&usb_over_pins>, <&usb_power_pins>;
> +	pinctrl-names = "default";
> +};
> diff --git a/arch/arm64/boot/dts/microchip/lan969x.dtsi b/arch/arm64/boot/dts/microchip/lan969x.dtsi
> new file mode 100644
> index 000000000000..39ea1999c801
> --- /dev/null
> +++ b/arch/arm64/boot/dts/microchip/lan969x.dtsi
> @@ -0,0 +1,482 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> +/*
> + * Copyright (c) 2025 Microchip Technology Inc. and its subsidiaries.
> + */
> +
> +#include <dt-bindings/clock/microchip,lan969x.h>
> +#include <dt-bindings/dma/at91.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/mfd/at91-usart.h>
> +#include <dt-bindings/mfd/atmel-flexcom.h>
> +

As Conor mentioned, all nodes are missing SoC specific compatibles.

> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	model = "Microchip LAN969x";
> +	compatible = "microchip,lan969x";
> +	interrupt-parent = <&gic>;
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};

Keep it alphanumerically sorted.

> +
> +	clocks {
> +		fx100_clk: fx100-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <320000000>;
> +		};
> +
> +		cpu_clk: cpu-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <1000000000>;
> +		};
> +
> +		ddr_clk: ddr-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <600000000>;
> +		};
> +
> +		fabric_clk: fabric-clk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <250000000>;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a53";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			next-level-cache = <&l2_0>;
> +		};
> +
> +		l2_0: l2-cache {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +		};
> +	};
> +
> +	pmu {
> +		compatible = "arm,cortex-a53-pmu";
> +		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>, /* Secure Phys IRQ */
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>, /* Non-secure Phys IRQ */
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>, /* Virt IRQ */
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>; /* Hyp IRQ */
> +	};
> +
> +	axi: axi {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		usb: usb@300000 {
> +			compatible = "microchip,lan9691-dwc3", "snps,dwc3";
> +			reg = <0x300000 0x80000>;
> +			interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clks GCK_GATE_USB_DRD>,
> +				 <&clks GCK_ID_USB_REFCLK>;
> +			clock-names = "bus_early", "ref";
> +			assigned-clocks = <&clks GCK_ID_USB_REFCLK>;
> +			assigned-clock-rates = <60000000>;
> +			maximum-speed = "high-speed";
> +			dr_mode = "host";
> +			status = "disabled";
> +		};
> +
> +		flx0: flexcom@e0040000 {
> +			compatible = "atmel,sama5d2-flexcom";
> +			reg = <0xe0040000 0x100>;

ranges would be here according to the dts coding style pointed above.

> +			clocks = <&clks GCK_ID_FLEXCOM0>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0xe0040000 0x800>;
> +			status = "disabled";
> +
> +			usart0: serial@200 {
> +				compatible = "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;

Please keep vendor specific properties toward the end of the node as
pointed above.

> +				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
> +				       <&dma AT91_XDMAC_DT_PERID(2)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "usart";
> +				atmel,fifo-size = <32>;
> +				status = "disabled";
> +			};
> +
> +			spi0: spi@400 {
> +				compatible = "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
> +				       <&dma AT91_XDMAC_DT_PERID(2)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "spi_clk";
> +				atmel,fifo-size = <32>;

Please move this line before the status one.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c0: i2c@600 {
> +				compatible = "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
> +				       <&dma AT91_XDMAC_DT_PERID(2)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx1: flexcom@e0044000 {
> +			compatible = "atmel,sama5d2-flexcom";
> +			reg = <0xe0044000 0x100>;

Please move the ranges here.

> +			clocks = <&clks GCK_ID_FLEXCOM1>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0xe0044000 0x800>;
> +			status = "disabled";
> +
> +			usart1: serial@200 {
> +				compatible = "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;

Please move this one close to atmel,fifo-size

> +				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
> +				       <&dma AT91_XDMAC_DT_PERID(2)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "usart";
> +				atmel,fifo-size = <32>;
> +				status = "disabled";
> +			};
> +
> +			spi1: spi@400 {
> +				compatible = "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
> +				       <&dma AT91_XDMAC_DT_PERID(2)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "spi_clk";
> +				atmel,fifo-size = <32>;

Please move this one before status.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c1: i2c@600 {
> +				compatible = "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(3)>,
> +				       <&dma AT91_XDMAC_DT_PERID(2)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		trng: rng@e0048000 {
> +			compatible = "atmel,at91sam9g45-trng";
> +			reg = <0xe0048000 0x100>;
> +			clocks = <&fabric_clk>;
> +			status = "disabled";
> +		};
> +
> +		aes: crypto@e004c000 {
> +			compatible = "atmel,at91sam9g46-aes";
> +			reg = <0xe004c000 0x100>;
> +			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&dma AT91_XDMAC_DT_PERID(12)>,
> +			       <&dma AT91_XDMAC_DT_PERID(13)>;
> +			dma-names = "tx", "rx";
> +			clocks = <&fabric_clk>;
> +			clock-names = "aes_clk";
> +			status = "disabled";
> +		};
> +
> +		flx2: flexcom@e0060000 {
> +			compatible = "atmel,sama5d2-flexcom";
> +			reg = <0xe0060000 0x100>;

ranges would go here.

> +			clocks = <&clks GCK_ID_FLEXCOM2>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0xe0060000 0x800>;
> +			status = "disabled";
> +
> +			usart2: serial@200 {
> +				compatible = "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;

Please move this close to atmel,fifo-size.

> +				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(7)>,
> +				       <&dma AT91_XDMAC_DT_PERID(6)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "usart";
> +				atmel,fifo-size = <32>;
> +				status = "disabled";
> +			};
> +
> +			spi2: spi@400 {
> +				compatible = "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(7)>,
> +				       <&dma AT91_XDMAC_DT_PERID(6)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "spi_clk";
> +				atmel,fifo-size = <32>;

Please move this one before status.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c2: i2c@600 {
> +				compatible = "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&fabric_clk>;

No DMA for this node?

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		flx3: flexcom@e0064000 {
> +			compatible = "atmel,sama5d2-flexcom";
> +			reg = <0xe0064000 0x100>;

ranges would go here.

> +			clocks = <&clks GCK_ID_FLEXCOM3>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x0 0xe0064000 0x800>;
> +			status = "disabled";
> +
> +			usart3: serial@200 {
> +				compatible = "atmel,at91sam9260-usart";
> +				reg = <0x200 0x200>;
> +				atmel,usart-mode = <AT91_USART_MODE_SERIAL>;

This line should go close to atmel,fifo-size

> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(9)>,
> +				       <&dma AT91_XDMAC_DT_PERID(8)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "usart";
> +				atmel,fifo-size = <32>;
> +				status = "disabled";
> +			};
> +
> +			spi3: spi@400 {
> +				compatible = "atmel,at91rm9200-spi";
> +				reg = <0x400 0x200>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(9)>,
> +				       <&dma AT91_XDMAC_DT_PERID(8)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				clock-names = "spi_clk";
> +				atmel,fifo-size = <32>;

Please move this one before status.

> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +
> +			i2c3: i2c@600 {
> +				compatible = "microchip,sam9x60-i2c";
> +				reg = <0x600 0x200>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				dmas = <&dma AT91_XDMAC_DT_PERID(9)>,
> +				       <&dma AT91_XDMAC_DT_PERID(8)>;
> +				dma-names = "tx", "rx";
> +				clocks = <&fabric_clk>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				status = "disabled";
> +			};
> +		};
> +
> +		dma: dma-controller@e0068000 {
> +			compatible = "microchip,sama7g5-dma";
> +			reg = <0xe0068000 0x1000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <16>;
> +			#dma-cells = <1>;
> +			clocks = <&fabric_clk>;
> +			clock-names = "dma_clk";
> +		};
> +
> +		sha: crypto@e006c000 {
> +			compatible = "atmel,at91sam9g46-sha";
> +			reg = <0xe006c000 0xec>;
> +			interrupts = <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&dma AT91_XDMAC_DT_PERID(14)>;
> +			dma-names = "tx";
> +			clocks = <&fabric_clk>;
> +			clock-names = "sha_clk";
> +			status = "disabled";
> +		};
> +
> +		timer: timer@e008c000 {
> +			compatible = "snps,dw-apb-timer";
> +			reg = <0xe008c000 0x400>;
> +			clocks = <&fabric_clk>;
> +			clock-names = "timer";
> +			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		watchdog: watchdog@e0090000 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0xe0090000 0x1000>;
> +			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&fabric_clk>;
> +		};
> +
> +		cpu_ctrl: syscon@e00c0000 {
> +			compatible = "microchip,lan966x-cpu-syscon", "syscon";
> +			reg = <0xe00c0000 0x350>;
> +		};
> +
> +		switch: switch@e00c0000 {
> +			compatible = "microchip,lan9691-switch";
> +			reg = <0xe00c0000 0x0010000>,
> +			      <0xe2010000 0x1410000>;
> +			reg-names = "cpu", "devices";
> +			interrupt-names = "xtr", "fdma", "ptp";
> +			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 88 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI  9 IRQ_TYPE_LEVEL_HIGH>;
> +			resets = <&reset 0>;
> +			reset-names = "switch";
> +			status = "disabled";
> +		};
> +
> +		clks: clock-controller@e00c00b4 {
> +			compatible = "microchip,lan9691-gck";
> +			#clock-cells = <1>;
> +			clocks = <&cpu_clk>, <&ddr_clk>, <&fx100_clk>;
> +			clock-names = "cpu", "ddr", "sys";
> +			reg = <0xe00c00b4 0x30>, <0xe00c0308 0x4>;

This line should go after compatible. Please check the dts coding style
pointed above.

> +		};
> +
> +		reset: reset-controller@e201000c {
> +			compatible = "microchip,lan9691-switch-reset",
> +				     "microchip,lan966x-switch-reset";
> +			reg = <0xe201000c 0x4>;
> +			reg-names = "gcb";
> +			#reset-cells = <1>;
> +			cpu-syscon = <&cpu_ctrl>;
> +		};
> +
> +		gpio: pinctrl@e20100d4 {
> +			compatible = "microchip,lan9691-pinctrl";
> +			reg = <0xe20100d4 0xd4>,
> +			      <0xe2010370 0xa8>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&gpio 0 0 66>;
> +			interrupt-controller;
> +			interrupts = <GIC_SPI 15 IRQ_TYPE_LEVEL_HIGH>;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		mdio0: mdio@e20101a8 {
> +			compatible = "mscc,ocelot-miim";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xe20101a8 0x24>;

Same here, please follow the dts coding style.

> +			clocks = <&fx100_clk>;
> +			status = "disabled";
> +		};
> +
> +		mdio1: mdio@e20101cc {
> +			compatible = "mscc,ocelot-miim";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0xe20101cc 0x24>;

Same here

> +			clocks = <&fx100_clk>;
> +			status = "disabled";
> +		};
> +
> +		sgpio: gpio@e2010230 {
> +			compatible = "microchip,sparx5-sgpio";
> +			reg = <0xe2010230 0x118>;
> +			clocks = <&fx100_clk>;
> +			resets = <&reset 0>;
> +			reset-names = "switch";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +
> +			sgpio_in: gpio@0 {
> +				compatible = "microchip,sparx5-sgpio-bank";
> +				reg = <0>;
> +				gpio-controller;
> +				#gpio-cells = <3>;
> +				interrupts = <GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
> +				interrupt-controller;
> +				#interrupt-cells = <3>;
> +			};
> +
> +			sgpio_out: gpio@1 {
> +				compatible = "microchip,sparx5-sgpio-bank";
> +				reg = <1>;
> +				gpio-controller;
> +				#gpio-cells = <3>;
> +			};
> +		};
> +
> +		tmon: hwmon@e2020100 {
> +			compatible = "microchip,sparx5-temp";
> +			reg = <0xe2020100 0xc>;
> +			clocks = <&fx100_clk>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
> +		serdes: serdes@e3410000 {
> +			compatible = "microchip,lan9691-serdes";
> +			#phy-cells = <1>;
> +			clocks = <&fabric_clk>;
> +			reg = <0xe3410000 0x150000>;

Same here.

> +		};
> +
> +		gic: interrupt-controller@e8c11000 {
> +			compatible = "arm,gic-400";
> +			#interrupt-cells = <3>;
> +			interrupt-controller;
> +			reg = <0xe8c11000 0x1000>, /* Distributor GICD_ */
> +			      <0xe8c12000 0x2000>, /* CPU interface GICC_ */
> +			      <0xe8c14000 0x2000>, /* Virt interface control */
> +			      <0xe8c16000 0x2000>; /* Virt CPU interface */

Same here.

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +	};
> +};

Thank you,
Claudiu
