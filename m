Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795681014;
	b=zl6uWKgcCau1Xq1FKOHYErvqmE8SyB9x9hrimxzUc+WuvXQ0RK945s59Cs0AY93QOjKd
	 74fGxblO5DQuMDw+1/vSH7OwoDD9mwbZE7ez8XjWaTvcmzpkgNqpvue6+weYDm1qtacv9
	 e+BtB7R+UeYhw8IHxqR0bcolJE5I5s9FhkuDbsB3hyIHars1u1GJmonuNIPmW5WmM7ocF
	 z33d2nL6jt53LelUH5L9pAWfz1eM4CZbqPC0i9Bq8O5G2ujeYfxgBu6ivyK9pNeyzCvpB
	 9gL/8FJR+eQAh9GN4MP9IAXSb4Hv8uOIFESWHqarS2qkhPcXz0yRlNAtx+yLb8XcHmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795681014;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
	bh=N/cEzKcepYsGi3Rr32SGnZ2whiJRMg9YAJGcOs7d3pE=;
	b=EYhNaea7Vg+XzE+G4SdpzVQKg+fJYFRK/qUIDIqX2fL/2J80avggSkNfLg6f3uLFIVE+
	 yNlTJY0CuWMBlPekrSNh4e9OOG0AxsUGqGd378AmygLv/QZGS9YHiC5iC+4zgFah/bCyE
	 6cZyH2l1mRc2rKB7OV7l7mUAZl9o2JY8zsrKlCoQIMVZ/Bt/KYLm5bDSvStYFb5TwMM1/
	 QTQa2LMo47EdsewxXsgld3Fix/vzRAW3K8kuxE7VUEdyPpXYcmnEzNxjz/uc8CuP8SRfl
	 R9+dTJpHbMqU84Afon69RoTyeXg7eM3+sG6anR4U7pb/LBXrNxon9GnQ28AdKCNWoPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b="JH/+eCCL";
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432A4606A321;
	Thu, 26 Nov 2026 08:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 432A4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=JH/+eCCL
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 6ADDE1A1809;
	Thu, 26 Nov 2026 08:16:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3441C60237;
	Thu, 26 Nov 2026 08:16:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D29F111E6835E;
	Thu, 26 Nov 2026 09:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795681011; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=N/cEzKcepYsGi3Rr32SGnZ2whiJRMg9YAJGcOs7d3pE=;
	b=JH/+eCCLMcYtMAzvglxXXC+fGv/9T9mHlOPKeKUNwFxSdqCzdn78ULd5UpxXkrp4JbZC8l
	OEKf0NHTs/7KFL4j5HsL3fB5AMLKfg9TeHoEKWr8m/83+F0IP+vHXJGZIDhaiJeopJ78Rn
	NEsxpoTA1C5SXccCLA55tSlyRvuaK5iuc8alnQlZYJ47hKhobKCSYKYq0YpZRq+mvd0SyV
	UF7vC6+x/OcRtAitIZEQ7UVMlhatVc7llFU1I+DqKLkKFREOFdmmnF98FCH2J6DlxQMVvt
	XtHQelZwZbqh/5ZwnsZOTEsC9RUg7s6i1tQtwb/Ma1UFKmPL+ZyoWCayhJzJdg==
Message-ID: <0828126f-54fd-43af-94ee-35d1047378db@bootlin.com>
Date: Thu, 26 Nov 2026 09:16:45 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: dts: synaptics: add SL2610 family RDK
 boards
To: Jisheng Zhang <jszhang@kernel.org>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>, Linus Walleij <linusw@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20261115102401.3520-1-jszhang@kernel.org>
 <20261115102401.3520-14-jszhang@kernel.org>
Content-Language: en-US, fr
From: Richard GENOUD <richard.genoud@bootlin.com>
Organization: Bootlin
In-Reply-To: <20261115102401.3520-14-jszhang@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Le 15/11/2026 à 11:23, Jisheng Zhang a écrit :
> Add device trees for the SL2611, SL2613, SL2615, SL2617 and SL2619
> reference development kits. Share their common console, memory, pin
> configuration and regulator descriptions and enable the populated
> peripherals.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>   arch/arm64/boot/dts/synaptics/Makefile        |   5 +
>   arch/arm64/boot/dts/synaptics/sl2611-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2613-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2615-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2617-rdk.dts  |  16 +++
>   arch/arm64/boot/dts/synaptics/sl2619-rdk.dts  |  16 +++
>   .../boot/dts/synaptics/sl261x-rdk-common.dtsi | 135 ++++++++++++++++++
>   7 files changed, 220 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
>   create mode 100644 arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> 
> diff --git a/arch/arm64/boot/dts/synaptics/Makefile b/arch/arm64/boot/dts/synaptics/Makefile
> index de71ddda6835..810d0d08c2de 100644
> --- a/arch/arm64/boot/dts/synaptics/Makefile
> +++ b/arch/arm64/boot/dts/synaptics/Makefile
> @@ -2,3 +2,8 @@
>   # Berlin SoC Family
>   dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-dmp.dtb
>   dtb-$(CONFIG_ARCH_BERLIN) += berlin4ct-stb.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2611-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2613-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2615-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2617-rdk.dtb
> +dtb-$(CONFIG_ARCH_BERLIN) += sl2619-rdk.dtb
> diff --git a/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> new file mode 100644
> index 000000000000..585872307834
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2611-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2611.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2611 RDK";
> +	compatible = "syna,sl2611-rdk", "syna,sl2611";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> new file mode 100644
> index 000000000000..de75c9fab6a2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2613-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2613.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2613 RDK";
> +	compatible = "syna,sl2613-rdk", "syna,sl2613";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> new file mode 100644
> index 000000000000..ae03638a3a53
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2615-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2615.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2615 RDK";
> +	compatible = "syna,sl2615-rdk", "syna,sl2615";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> new file mode 100644
> index 000000000000..ba4ea21ac505
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2617-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2617.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2617 RDK";
> +	compatible = "syna,sl2617-rdk", "syna,sl2617";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> new file mode 100644
> index 000000000000..58901ac2a050
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl2619-rdk.dts
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sl2619.dtsi"
> +#include "sl261x-rdk-common.dtsi"
> +
> +/ {
> +	model = "Synaptics SL2619 RDK";
> +	compatible = "syna,sl2619-rdk", "syna,sl2619";
> +};
> diff --git a/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> new file mode 100644
> index 000000000000..78a9b28fdf99
> --- /dev/null
> +++ b/arch/arm64/boot/dts/synaptics/sl261x-rdk-common.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Synaptics Incorporated
> + *
> + * Author: Jisheng Zhang <jszhang@kernel.org>
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +
> +/ {
> +	aliases {
> +		serial0 = &sm_uart0;
> +		serial1 = &sm_uart1;
> +		serial2 = &sm_uart2;
> +		serial3 = &sm_uart3;
> +		serial4 = &soc_uart0;
> +		serial5 = &soc_uart1;
> +		serial6 = &soc_uart2;
> +		serial7 = &soc_uart3;
> +		i2c0 = &sm_i2c0;
> +		i2c1 = &sm_i2c1;
> +		i2c2 = &soc_i2c0;
> +		i2c3 = &soc_i2c1;
> +		spi1 = &sm_spi1;
> +		spi2 = &soc_spi0;
> +		spi3 = &soc_spi1;
> +		spi4 = &soc_spi2;
> +		spi5 = &soc_spi3;
> +	};
> +
> +	cpus {
> +		cpu@0 {
> +			cpu0-supply = <&vcore>;
> +		};
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "earlycon";
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&pinctrl {
> +	soc_i2c0_pmux: soc_i2c0-pmux {
> +		groups = "GPIO23", "GPIO24";
> +		function = "tw2";
> +		drive-strength = <7>;
> +	};
> +};
> +
> +&sm_pinctrl {
> +	sm_i2c0_pmux: i2c0-pmux {
> +		groups = "SM_GPIO12", "SM_GPIO13";
> +		function = "tw0";
> +		drive-strength = <7>;
> +	};
> +
> +	sm_i2c1_pmux: i2c1-pmux {
> +		groups = "SM_GPIO3", "SM_GPIO4";
> +		function = "tw1";
> +		drive-strength = <7>;
> +	};
> +
> +	vcore_gpio_pmux: vcore-gpio-pmux {
> +		groups = "SM_GPIO5";
> +		function = "gpio";
> +	};
> +};
> +
> +&sm_uart0 {
> +	status = "okay";
This will be needed at early boot, so please add:
	bootph-all;

 > +};
 > +

And also:
&sm_clk {
	bootph-all;
};

Regards,
Richard

> +&sm_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sm_i2c0_pmux>;
> +	clock-frequency = <100000>;
> +
> +	expander0: gpio@43 {
> +		compatible = "fcs,fxl6408";
> +		reg = <0x43>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +
> +	expander1: gpio@44 {
> +		compatible = "fcs,fxl6408";
> +		reg = <0x44>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +	};
> +};
> +
> +&sm_i2c1 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sm_i2c1_pmux>;
> +	clock-frequency = <100000>;
> +
> +	vcore: regulator@60 {
> +		compatible = "silergy,sy8827n";
> +		reg = <0x60>;
> +		regulator-name = "vcore";
> +		regulator-min-microvolt = <700000>;
> +		regulator-max-microvolt = <987500>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-active-discharge = <0>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&vcore_gpio_pmux>;
> +		enable-gpios = <&portc 5 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&soc_i2c0 {
> +	status = "okay";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&soc_i2c0_pmux>;
> +	clock-frequency = <100000>;
> +};
> +
> +&sm_uart1 {
> +	status = "okay";
> +};
