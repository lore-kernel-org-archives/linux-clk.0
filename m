Received: from mail-oi2-f13.google.com (mail-oi2-f13.google.com [74.125.231.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 121AF231842
	for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 21:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790456549; cv=none; b=WXmZSjXBsb7DEnz5pTSq2m7pdnWh6jGkHnlGzXxax6b3F39roRmwmTtwyg1p1PNNdJtydDhIDP7sWgNPAfRScsIQSeyKeTVjUduGLH71YEaXx8Y1zqV1d+Gw63ED6E+iCbSRkQCESOaGIfWGf6KCnLiVRFrBA0wLwU5NyZFel/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790456549; c=relaxed/simple;
	bh=oKlgpUwogy4n8jO2YzlW21J/gVx4tTvZr8pjZX41r9M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QUhaL4OvU1jmk/gmKwIgdK8fOlVbl/+KnaIiQ8KwvOTQSt0PLfh9xgidfbMIIwhHvZbojT8LTw6FOjrnX6dhYfhurQVAHFYrhdqhy5VZ4KOKa3yvuIue+N9LafED8jSsJgjD8qSGJTvawxCr/l8hjkGAQDFpoMM8Q9IjNBaa818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=naKdssL7; arc=none smtp.client-ip=74.125.231.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="naKdssL7"
Received: by mail-oi2-f13.google.com with SMTP id 5614622812f47-4c66ba0b762so454395b6e.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Sep 2026 14:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790456546; x=1791061346; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OZYJxWPc9C+n+TRzZEeTCHwldMyVX7+kX2+qIHrbpf4=;
        b=naKdssL7oqEUUC5I95xAIusguCgny1etk9Xv5SN1epD6l7CP39j0KZpbAze+OR1uIH
         MwMXbrgQw/Bye6biFzNdfndoGIT6omQdnDI4sT/p/Om5XlXXYdqGNFlDxy4Z+nZi8Yaa
         9XjVMWmKmMFZCD/D8ahAHwn0lI2ST4eAre4nfHaNEBgCcy/4IejhqVu4YeEY+BmF5WzC
         8xLWB72Z3wqmnq+6DfhJnKbZxy4zszMTCbGDu/j8we8tbB7ubrN01lkFeSe8dLu9zLEJ
         xil6hbYfsdfZ6i5zHNL+RqCIZ7R2gacBNxa95U92q+hWxUdZ+2AMXsu32Sjk7Glu+Oat
         t74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790456546; x=1791061346;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OZYJxWPc9C+n+TRzZEeTCHwldMyVX7+kX2+qIHrbpf4=;
        b=K5iE3MoP82YqAvVKcH3YgXeFDxNcCLpLU6F5MWpsc0eJ+9SZSochdSxG9W20SbTx2e
         vDSxHqvNt8hj8Y8beZGJ82v5RItxBegVHzddagCP0skXjLdfJlxLmOoQho85jAak3Vji
         rTrq30TDERaZ4mhJPyZagC98TCuJmdnEihwjvWwdc9NwYPC5+nESkDqQlbjfMiGOgy16
         XBb5A49uyu+4p7fGrT6zf2hSZDKCEtwcOx7tUMgIiZAZKXA1vuJNDpSmJxelzpFt6pOm
         2+SucpF6jZ8BtHu8TAJxjiK4AqFwGDZcx6toGArK/cRnk1rMOnXdFm9xz3LG5zAX+Zu8
         llkA==
X-Forwarded-Encrypted: i=1; AKwUvByT/jp33+0kyL1VdPXde5hSjAJ4KqUBD970AQdh4glE2O6osw0Lj2KkbcYkhrLwUrtt1/1RmJb28ww=@vger.kernel.org
X-Gm-Message-State: AFuF++m3iXH2g2ZvNVsPh+IpUjAanRyY0yfi6bzRxZM51ssJzi9iV6s7
	0Hgwinmf+6OCSl0g4fzvh1uVLBq+kyOUoi4Vhc6R9+I1XiZMq+z72HbQ
X-Gm-Gg: AYBFou3Z4rmHfqN5S6z+KbYuITdEcTulB3cCPrHoURLMUdB8iHPXn/otWTtDA7DLjGW
	SXmfaDq4IxRBCK61jhdWnyNGvI4xH0kkYstk7S5ktk4hlTUc2nkV445OeHtx1BVgKlxm4a4cPY6
	124PSBjL4Rb5NP5TbiUN97opJg8Pg59atb7N3dVvgrA4qIzlGWggqXrpZthxJl0ZKCC/iiRaRqd
	IblLwtPnNKPuceGluxAuFsnsGdrau4NhMr2jVA/0PimEB7hM9FL0/i5oImrPAAw+iRGi1MrxJjx
	rK/NqbLIBADgejkb62fKAjUN42Qj8fkgLqUbF4rUF6fku7ik+DwdsqhFRxBUHykBUa6QVosrVWk
	fOVYvrStUsehsO6l1nsLAch0pWhIwPKwFJir+UwI+HVvW7g1Zlf9dbzNzlq2qKzFwihHEnPnJt1
	C4CloebE+ZK52Qgkb8PWQtjkUH0jQ21I0jriS/YtcOoNib3Xztv9Mqc9ibCr/gt+3r72I3jAOOq
	9PL20IcWWM8Gu5Q/mZMVtJ6c4wUkd50aMKqwCd87Nip2g==
X-Received: by 2002:a05:6808:1827:b0:495:f643:763f with SMTP id 5614622812f47-4d72a547e4fmr9371433b6e.7.1790456545671;
        Sat, 26 Sep 2026 14:02:25 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4dbf620264asm5389150b6e.8.2026.09.26.14.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 14:02:24 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: junhui.liu@pigmoral.tech
Cc: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 7/8] clk: sunxi-ng: a733: Add bus clock gates
Date: Sat, 26 Sep 2026 17:02:22 -0400
Message-ID: <20260926210222.283703-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <DLOXXXFCEB5G.15XI8896GM7B7@pigmoral.tech>
References: <20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.tech> <20260921-a733-clk-v4-7-9c184ebe9ac1@pigmoral.tech> <20260921200512.3179109-1-enzo.adriano.code@gmail.com> <DLLYUYMR3CZT.17I8APGBH9H8S@pigmoral.tech> <20260926020313.911537-1-enzo.adriano.code@gmail.com> <DLOXXXFCEB5G.15XI8896GM7B7@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3047756000385934014=="
Content-Transfer-Encoding: 8bit

--===============3047756000385934014==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Hi Junhui,

Attached are the exact minimal board DTS and SoC DTSI used for both runs,
plus the configuration extracted from the tested Image and reproduction
notes. I rebuilt the DTB from the recorded source and recovered config;
it matches the tested 4497-byte DTB byte-for-byte (SHA-256):

  4c7b762757392334e8b7ac525e60bf5757ec23b34efdcc949d2093c238b1ed16

The support archive contains the two local integration/comparator diffs,
the four A733 clock/reset headers, source history and short UART excerpts.
Applying the 19 published patches and these local diffs to v7.3-rc1
reproduces the tested source tree. This is the minimal diagnostic DT,
not my newer DTS work; its fixed card supply is part of that test setup.

Both the September 21 failing run and September 26 clk_ignore_unused run
report identical firmware banners:

  U-Boot 2018.07-12-boot-aw2501-gb2d229198b2-dirty
  (Jan 06 2026 - 03:45:33 +0000) Allwinner Technology
  BL31: v2.5(debug):5fc237a6a
  BL31: Built : 09:05:28, Feb 26 2025

These tests used the vendor firmware already installed on the A7S;
I did not build or flash U-Boot or TF-A for them. Unfortunately, I cannot
establish the original installation/download image, the U-Boot dirty
delta, or the BL31 source/build inputs. I also do not have verified hashes
of the installed firmware binaries. Earlier source-correlation records
point to Radxa's downstream U-Boot, but the retained candidate build is
a different revision and is not a reproducible source for this firmware.

reproduce.txt includes the actual ext4load/booti commands and bootargs.
In particular, I set the U-Boot environment variable drm_debug=1 as well
as including it in bootargs. U-Boot reports FDT fixup errors and "update
dts" before Linux, also on the successful run; the excerpts retain those
messages. The DTB hash above describes the file loaded into RAM. I did
not capture the final post-fixup tree passed to Linux, so I cannot yet
rule out a firmware or DT-fixup difference from your A7A.

Assisted-by: Codex:gpt-6

Regards,
Enzo

--===============3047756000385934014==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sun60i-a733-cubie-a7s.dts"
MIME-Version: 1.0

// SPDX-License-Identifier: (GPL-2.0-only OR MIT)

/dts-v1/;

#include "sun60i-a733.dtsi"

/ {
	model = "Radxa Cubie A7S";
	compatible = "radxa,cubie-a7s", "allwinner,sun60i-a733";

	aliases {
		serial0 = &uart0;
		mmc0 = &mmc0;
	};

	chosen {
		stdout-path = "serial0:115200n8";
	};

	hosc: hosc-clk {
		compatible = "fixed-clock";
		#clock-cells = <0>;
		clock-frequency = <26000000>;
		clock-output-names = "hosc";
	};

	reg_vcc3v3: regulator-3v3 {
		compatible = "regulator-fixed";
		regulator-name = "vcc-3v3";
		regulator-min-microvolt = <3300000>;
		regulator-max-microvolt = <3300000>;
		regulator-always-on;
	};
};

&mmc0 {
	vmmc-supply = <&reg_vcc3v3>;
	bus-width = <4>;
	no-mmc;
	no-sdio;
	status = "okay";
};

&uart0 {
	pinctrl-names = "default";
	pinctrl-0 = <&uart0_pb9_pb10_pins>;
	status = "okay";
};

--===============3047756000385934014==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="sun60i-a733.dtsi"
MIME-Version: 1.0

// SPDX-License-Identifier: (GPL-2.0-only OR MIT)

#include <dt-bindings/interrupt-controller/arm-gic.h>
#include <dt-bindings/clock/allwinner,sun60i-a733-ccu.h>
#include <dt-bindings/clock/allwinner,sun60i-a733-r-ccu.h>
#include <dt-bindings/clock/sun6i-rtc.h>
#include <dt-bindings/reset/allwinner,sun60i-a733-ccu.h>
#include <dt-bindings/reset/allwinner,sun60i-a733-r-ccu.h>

/ {
	interrupt-parent = <&gic>;
	#address-cells = <2>;
	#size-cells = <2>;

	cpus {
		#address-cells = <1>;
		#size-cells = <0>;

		cpu0: cpu@0 {
			compatible = "arm,cortex-a55";
			device_type = "cpu";
			reg = <0x000>;
			enable-method = "psci";
			capacity-dmips-mhz = <530>;
		};

		cpu1: cpu@100 {
			compatible = "arm,cortex-a55";
			device_type = "cpu";
			reg = <0x100>;
			enable-method = "psci";
			capacity-dmips-mhz = <530>;
		};

		cpu2: cpu@200 {
			compatible = "arm,cortex-a55";
			device_type = "cpu";
			reg = <0x200>;
			enable-method = "psci";
			capacity-dmips-mhz = <530>;
		};

		cpu3: cpu@300 {
			compatible = "arm,cortex-a55";
			device_type = "cpu";
			reg = <0x300>;
			enable-method = "psci";
			capacity-dmips-mhz = <530>;
		};

		cpu4: cpu@400 {
			compatible = "arm,cortex-a55";
			device_type = "cpu";
			reg = <0x400>;
			enable-method = "psci";
			capacity-dmips-mhz = <530>;
		};

		cpu5: cpu@500 {
			compatible = "arm,cortex-a55";
			device_type = "cpu";
			reg = <0x500>;
			enable-method = "psci";
			capacity-dmips-mhz = <530>;
		};

		cpu6: cpu@600 {
			compatible = "arm,cortex-a76";
			device_type = "cpu";
			reg = <0x600>;
			enable-method = "psci";
			capacity-dmips-mhz = <1024>;
		};

		cpu7: cpu@700 {
			compatible = "arm,cortex-a76";
			device_type = "cpu";
			reg = <0x700>;
			enable-method = "psci";
			capacity-dmips-mhz = <1024>;
		};
	};

	psci {
		compatible = "arm,psci-1.0", "arm,psci-0.2";
		method = "smc";
	};

	timer {
		compatible = "arm,armv8-timer";
		arm,no-tick-in-suspend;
		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH>,
			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH>;
	};

	soc@0 {
		compatible = "simple-bus";
		#address-cells = <1>;
		#size-cells = <1>;
		ranges = <0x0 0x0 0x0 0x40000000>;

		pio: pinctrl@2000000 {
			compatible = "allwinner,sun60i-a733-pinctrl";
			reg = <0x02000000 0x600>;
			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 85 IRQ_TYPE_LEVEL_HIGH>,
				     <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&ccu CLK_APB1>, <&hosc>, <&rtc CLK_OSC32K>;
			clock-names = "apb", "hosc", "losc";
			gpio-controller;
			#gpio-cells = <3>;
			interrupt-controller;
			#interrupt-cells = <3>;

			mmc0_pins: mmc0-pins {
				pins = "PF0", "PF1", "PF2",
				       "PF3", "PF4", "PF5";
				allwinner,pinmux = <2>;
				function = "mmc0";
				drive-strength = <30>;
				bias-pull-up;
			};

			uart0_pb9_pb10_pins: uart0-pb9-pb10-pins {
				pins = "PB9", "PB10";
				allwinner,pinmux = <2>;
				function = "uart0";
			};
		};

		ccu: clock-controller@2002000 {
			compatible = "allwinner,sun60i-a733-ccu";
			reg = <0x02002000 0x2000>;
			clocks = <&hosc>, <&rtc CLK_OSC32K>,
				 <&rtc CLK_IOSC>, <&rtc CLK_OSC32K_FANOUT>;
			clock-names = "hosc", "losc", "iosc", "losc-fanout";
			#clock-cells = <1>;
			#reset-cells = <1>;
		};

		uart0: serial@2500000 {
			compatible = "snps,dw-apb-uart";
			reg = <0x02500000 0x400>;
			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
			reg-shift = <2>;
			reg-io-width = <4>;
			clocks = <&ccu CLK_BUS_UART0>;
			resets = <&ccu RST_BUS_UART0>;
			status = "disabled";
		};

		gic: interrupt-controller@3400000 {
			compatible = "arm,gic-v3";
			#interrupt-cells = <3>;
			interrupt-controller;
			reg = <0x03400000 0x10000>,
			      <0x03460000 0x100000>;
		};

		mmc0: mmc@4020000 {
			compatible = "allwinner,sun60i-a733-mmc",
				     "allwinner,sun20i-d1-mmc";
			reg = <0x04020000 0x1000>;
			interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&ccu CLK_BUS_MMC0>, <&ccu CLK_MMC0>;
			clock-names = "ahb", "mmc";
			resets = <&ccu RST_BUS_MMC0>;
			reset-names = "ahb";
			pinctrl-names = "default";
			pinctrl-0 = <&mmc0_pins>;
			max-frequency = <200000000>;
			cap-sd-highspeed;
			status = "disabled";
			#address-cells = <1>;
			#size-cells = <0>;
		};

		r_ccu: clock-controller@7010000 {
			compatible = "allwinner,sun60i-a733-r-ccu";
			reg = <0x07010000 0x230>;
			clocks = <&hosc>, <&rtc CLK_OSC32K>,
				 <&rtc CLK_IOSC>, <&ccu CLK_SYS_24M>,
				 <&ccu CLK_PLL_PERIPH0_200M>,
				 <&ccu CLK_PLL_PERIPH0_300M>,
				 <&ccu CLK_PLL_PERIPH1_300M>;
			clock-names = "hosc", "losc", "iosc", "sys-24m",
				      "pll-periph0-200m", "pll-periph0-300m",
				      "pll-periph1-300m";
			#clock-cells = <1>;
			#reset-cells = <1>;
		};

		rtc: rtc@7090000 {
			compatible = "allwinner,sun60i-a733-rtc",
				     "allwinner,sun50i-r329-rtc";
			reg = <0x07090000 0x400>;
			interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&r_ccu CLK_BUS_R_RTC>, <&hosc>,
				 <&r_ccu CLK_R_AHB>;
			clock-names = "bus", "hosc", "ahb";
			#clock-cells = <1>;
		};
	};
};

--===============3047756000385934014==
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment; filename="reproduce.txt"
MIME-Version: 1.0

Exact minimal DT used for the CCU v4 A7S diagnostic
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

This is the small test DT, NOT the newer private DTS v2. The board explicitly=
 enables
UART0 and MMC0. It retains the fixed 3.3 V card supply
used for this diagnostic, not a validated PMIC/card supply description.

Base: v7.3-rc1, cee9395acd8043be0644b25c34bfa86623f2b935.
Local tested source head: 937756dcfb9fd853c91269c45d106026cca26607.
Local commit hashes are recorded for identity, not advertised as public refs.

Reconstruct in a disposable Linux checkout at that base:
1. Apply the four single-divider patches:
   https://lore.kernel.org/all/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigm=
oral.tech/
2. Apply all eight CCU v4 patches:
   https://lore.kernel.org/all/20260921-a733-clk-v4-0-9c184ebe9ac1@pigmoral.t=
ech/
3. Apply minimal-dt-integration.diff from reproduction-support.tar.gz.
   This includes the board binding, Makefile entry and the two attached DT
   sources, using the CCU v4 binding header names.
4. Apply all seven pinctrl patches:
   https://lore.kernel.org/all/20260910133519.459011-1-andre.przywara@arm.com/
5. Apply ahb-cpus-comparator.diff. This is the one-line CLK_IS_CRITICAL
   diagnostic change, not a submitted fix.

The support archive also contains the four A733 clock/reset binding headers
from the exact tested commit. Compare them with those installed by CCU v4;
do not replace them with a newer version. arm-gic.h, irq.h and sun6i-rtc.h
are supplied by the base tree. source-history.txt records all local commits.

Use b4 am to retrieve each series and git am to apply its resulting mailbox.
Apply the two local diff files with git apply. Then, from the checkout:

  mkdir -p ../a733-test-build
  gzip -dc /path/to/tested.config.gz > ../a733-test-build/.config
  make O=3D../a733-test-build ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-=
 olddefconfig
  make O=3D../a733-test-build ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu-=
 -j8 allwinner/sun60i-a733-cubie-a7s.dtb

The configuration was extracted from the exact tested Image with
scripts/extract-ikconfig, not copied from a later tracing build directory.
Compiler recorded in that Image/config: aarch64-linux-gnu-gcc
(Ubuntu 15.2.0-16ubuntu1) 15.2.0; binutils banner: 2.46.
The isolated DTB rebuild matches the original, size 4497 bytes, SHA256:
4c7b762757392334e8b7ac525e60bf5757ec23b34efdcc949d2093c238b1ed16

Original payloads (not attached):
Image, 42928640 bytes:
14d1415a80258170616f97e5b55e1b8d3dac4f9d67d4d870a0582e5e569a0f63
initramfs.cpio.gz, 5680294 bytes:
37675cf26adc7b1a1ab8f9e1d6613523b561149ec4b7c710c877d9bf352b8db0
The userspace is an initramfs /bin/sh smoke harness. These instructions
reproduce the DT; no byte-identical rebuilt Image or initramfs is claimed.

Boot commands and firmware caveat
-------------------------------
The successful run loaded from the existing vendor eMMC filesystem using
ext4load mmc 0:3, directly into RAM. No firmware was flashed for these tests.
The recorded staging directory was
/home/radxa/a733-ccu-v4-clk-ignore-unused-r2-20260926.
Commands below preserve the recorded arguments and payload CRC checks:

  setenv drm_debug 1
  setenv kernel_addr_r 0x40080000
  setenv ramdisk_addr_r 0x4c000000
  setenv fdt_addr_r 0x4fa00000
  setenv bootargs console=3DttyS0,115200n8 earlycon=3Duart8250,mmio32,0x02500=
000 loglevel=3D8 ignore_loglevel drm_debug=3D1 ro rootflags=3Dnoload rdinit=
=3D/bin/sh init=3D/bin/sh clk_ignore_unused
  ext4load mmc 0:3 0x40080000 /home/radxa/a733-ccu-v4-clk-ignore-unused-r2-20=
260926/Image
  crc32 0x40080000 0x28f0a00
  ext4load mmc 0:3 0x4c000000 /home/radxa/a733-ccu-v4-clk-ignore-unused-r2-20=
260926/initramfs.cpio.gz
  crc32 0x4c000000 0x56aca6
  ext4load mmc 0:3 0x4fa00000 /home/radxa/a733-ccu-v4-clk-ignore-unused-r2-20=
260926/sun60i-a733-cubie-a7s.dtb
  crc32 0x4fa00000 0x1191
  fdt addr 0x4fa00000
  booti 0x40080000 0x4c000000:0x56aca6 0x4fa00000

Expected CRCs: Image 3449b907; initramfs 2bc19206; DTB 3fe3901c.
For the earlier failing comparator, clk_ignore_unused was absent; payload
bytes were identical. Staging directory differed. No saveenv was issued.
The drm_debug environment variable was set separately from bootargs.

Both UART captures show the same U-Boot and BL31 version/build banners;
see the two excerpts in the support archive. U-Boot reports FDT fixup errors
and "update dts" before Linux, including in the successful run. The attached
DT sources/hash identify the file loaded into RAM, not an asserted exact
post-fixup DT presented to Linux. No final flattened DT dump was captured.
No claim is made that U-Boot's fixups are identical to those on the A7A.

Firmware origin
---------------
These runs used the vendor firmware already installed on this A7S.
U-Boot: 2018.07-12-boot-aw2501-gb2d229198b2-dirty
        Jan 06 2026 - 03:45:33 +0000, Allwinner Technology
BL31:   v2.5(debug):5fc237a6a
        Built: 09:05:28, Feb 26 2025

I cannot identify the original download/installation image or provide a
verified installed-binary hash. The installation history is unknown.
Earlier local source-correlation records associate the U-Boot banner with
Radxa's downstream U-Boot repository, but this does not identify its dirty
changes or reproduce the installed bytes. The retained candidate U-Boot
build in those records has a different revision (8f59d3cea4d). The BL31
source repository and build inputs remain unknown. No nearby firmware binary
is supplied or represented as the firmware used by these tests.

--===============3047756000385934014==
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="tested.config.gz"
MIME-Version: 1.0

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

--===============3047756000385934014==
Content-Type: application/gzip
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="reproduction-support.tar.gz"
MIME-Version: 1.0

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

--===============3047756000385934014==--
