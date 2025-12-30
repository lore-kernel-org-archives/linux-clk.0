Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE6299931;
	Tue, 30 Dec 2025 12:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767096691; cv=none; b=lRd1JMXod+jNqQ5P+JaO+yyJznzS8ok/DLIT3r+l8p+78fS4a3s+LOqkOVaQJg8ZsBLfEw41Gm6b1oiJs1fDe4vNcVt0JpORfmzQIc6S/fhjVQJdJpxQqQUYYWfeGE0kNvVJ4OHf7wNVZM4pW/iDI6jgu+zeH22DPjL41RQGQXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767096691; c=relaxed/simple;
	bh=JRHAmqYP0OgI6O0+KV8XT4f5uNH8I6LuEq/9u7m5AOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BTT3/Bc2zP1OcfdF1ahkluMOXI0UhD03LFL3l2095W/fadsgck1+XocIG5s6kwe1oT1Oh6XWnLl//wXq2Pfz0aaVdXvrZNd2Nh425hssTkgzHC21xtCxfz4c5FJlo63CpqnJGqwIKQtcjxRpLMNdQvrViLO5TrukBABhRozBYgA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rqfTYaTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rqfTYaTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31D15C4CEFB;
	Tue, 30 Dec 2025 12:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767096690;
	bh=JRHAmqYP0OgI6O0+KV8XT4f5uNH8I6LuEq/9u7m5AOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqfTYaTlvAKgWF3rJB5nATYZ50aeCrraSVMyBIFXmv5xB6ZzDmg2UYvRip8GjKG2a
	 YYTmtIOA0/9qRLfce3d7FUHl4VxkpYhgmDux7CrP9N2123Vh1ZD0GzjBxtigzCjTOp
	 vJGULKUjGgM6NglY9yC/nOGvOVqVCkx+0DUj6TjYnwKrZ3PS8+9pNb60ZTrdXIdlVs
	 JTOmhF1wi6itYxICV4Rnau7DlzO8UhSl3LXXJ2ERhH0GJl3Au9VYMeqhfxh6aAFV+3
	 xRPV2VLr/c/j8cm6voZ35xca9bVW+EaW23GEiOxN2z50w861D859PwioXo2DnRFJuf
	 i5tc1CMzmLb5g==
Date: Tue, 30 Dec 2025 13:11:28 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH 1/9] dt-bindings: clock: Add Realtek RTD1625 Clock &
 Reset Controller
Message-ID: <20251230-yak-of-luxurious-holiness-fcbaf2@quoll>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
 <20251229075313.27254-2-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-2-eleanor.lin@realtek.com>

On Mon, Dec 29, 2025 at 03:53:05PM +0800, Yu-Chun Lin wrote:
> Add DT binding schema for Realtek RTD1625 clock and reset controller
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  .../bindings/clock/realtek,rtd1625-clk.yaml   |  53 ++++++
>  MAINTAINERS                                   |   9 +
>  .../dt-bindings/clock/realtek,rtd1625-clk.h   | 165 ++++++++++++++++++
>  3 files changed, 227 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
>  create mode 100644 include/dt-bindings/clock/realtek,rtd1625-clk.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
> new file mode 100644
> index 000000000000..dd636c6e9c66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/realtek,rtd1625-clk.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/realtek,rtd1625-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Realtek RTD1625 Clock & Reset Controller
> +
> +maintainers:
> +  - Yu-Chun Lin <eleanor.lin@realtek.com>
> +
> +description: |
> +  The Realtek RTD1625 Clock Controller manages and distributes clock
> +  signals to various controllers and implements a Reset Controller for the
> +  SoC peripherals.
> +
> +  Clocks are referenced by unique identifiers, which are defined as
> +  preprocessor macros in dt-bindings/clock/realtek,rtd1625-clk.h. Client

This part is fine, although too long for simple refernce to clock IDs.

> +  device nodes within the Device Tree use these identifiers to specify the
> +  specific clock and reset signals they require.

This is completely redundant. Do not explain us how DTS works. We all
know that.

> +
> +properties:
> +  compatible:
> +    enum:
> +      - realtek,rtd1625-crt-clk
> +      - realtek,rtd1625-iso-clk
> +      - realtek,rtd1625-iso-s-clk

What is the difference between iso and iso-s?

> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@98000000 {
> +      compatible = "realtek,rtd1625-crt-clk";
> +      reg = <98000000 0x1000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 12f49de7fe03..9cc78e867a4e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -21968,6 +21968,15 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/net/dsa/realtek.yaml
>  F:	drivers/net/dsa/realtek/*
>  
> +REALTEK SOC CLOCK AND RESET BINDINGS
> +M:	Cheng-Yu Lee <cylee12@realtek.com>
> +M:	Yu-Chun Lin <eleanor.lin@realtek.com>
> +L:	devicetree@vger.kernel.org
> +L:	linux-clk@vger.kernel.org
> +S:	Supported
> +F:	Documentation/devicetree/bindings/clock/realtek*
> +F:	include/dt-bindings/clock/realtek*
> +
>  REALTEK SPI-NAND
>  M:	Chris Packham <chris.packham@alliedtelesis.co.nz>
>  S:	Maintained
> diff --git a/include/dt-bindings/clock/realtek,rtd1625-clk.h b/include/dt-bindings/clock/realtek,rtd1625-clk.h
> new file mode 100644
> index 000000000000..553884d7806a
> --- /dev/null
> +++ b/include/dt-bindings/clock/realtek,rtd1625-clk.h
> @@ -0,0 +1,165 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2025 Realtek Semiconductor Corp.
> + */
> +#ifndef __DT_BINDINGS_RTK_CLOCK_RTD1625_H
> +#define __DT_BINDINGS_RTK_CLOCK_RTD1625_H
> +
> +#define RTD1625_CRT_CLK_EN_MISC           0
> +#define RTD1625_CRT_CLK_EN_PCIE0          1
> +#define RTD1625_CRT_CLK_EN_DIP            2
> +#define RTD1625_CRT_CLK_EN_GSPI           3
> +#define RTD1625_CRT_CLK_EN_ISO_MISC       5
> +#define RTD1625_CRT_CLK_EN_SDS            6
> +#define RTD1625_CRT_CLK_EN_HDMI           7
> +#define RTD1625_CRT_CLK_EN_GPU            9
> +#define RTD1625_CRT_CLK_EN_VE1            10
> +#define RTD1625_CRT_CLK_EN_VE2            11
> +#define RTD1625_CRT_CLK_EN_MD             18
> +#define RTD1625_CRT_CLK_EN_TP             19
> +#define RTD1625_CRT_CLK_EN_RCIC           20
> +#define RTD1625_CRT_CLK_EN_NF             21
> +#define RTD1625_CRT_CLK_EN_EMMC           22
> +#define RTD1625_CRT_CLK_EN_SD             23
> +#define RTD1625_CRT_CLK_EN_SDIO_IP        24
> +#define RTD1625_CRT_CLK_EN_MIPI_CSI       25
> +#define RTD1625_CRT_CLK_EN_EMMC_IP        26
> +#define RTD1625_CRT_CLK_EN_SDIO           27
> +#define RTD1625_CRT_CLK_EN_SD_IP          28
> +#define RTD1625_CRT_CLK_EN_TPB            30
> +#define RTD1625_CRT_CLK_EN_MISC_SC1       31
> +#define RTD1625_CRT_CLK_EN_MISC_I2C_3     32
> +#define RTD1625_CRT_CLK_EN_ACPU           33
> +#define RTD1625_CRT_CLK_EN_JPEG           34
> +#define RTD1625_CRT_CLK_EN_MISC_SC0       37
> +#define RTD1625_CRT_CLK_EN_HDMIRX         45
> +#define RTD1625_CRT_CLK_EN_HSE            46
> +#define RTD1625_CRT_CLK_EN_FAN            49
> +#define RTD1625_CRT_CLK_EN_SATA_WRAP_SYS  52
> +#define RTD1625_CRT_CLK_EN_SATA_WRAP_SYSH 53
> +#define RTD1625_CRT_CLK_EN_SATA_MAC_SYSH  54
> +#define RTD1625_CRT_CLK_EN_R2RDSC         55
> +#define RTD1625_CRT_CLK_EN_TPC            56
> +#define RTD1625_CRT_CLK_EN_PCIE1          57
> +#define RTD1625_CRT_CLK_EN_MISC_I2C_4     58
> +#define RTD1625_CRT_CLK_EN_MISC_I2C_5     59
> +#define RTD1625_CRT_CLK_EN_TSIO           60
> +#define RTD1625_CRT_CLK_EN_VE4            61
> +#define RTD1625_CRT_CLK_EN_EDP            62
> +#define RTD1625_CRT_CLK_EN_TSIO_TRX       63
> +#define RTD1625_CRT_CLK_EN_PCIE2          64
> +#define RTD1625_CRT_CLK_EN_EARC           66
> +#define RTD1625_CRT_CLK_EN_LITE           67
> +#define RTD1625_CRT_CLK_EN_MIPI_DSI       68
> +#define RTD1625_CRT_CLK_EN_NPUPP          69
> +#define RTD1625_CRT_CLK_EN_NPU            70
> +#define RTD1625_CRT_CLK_EN_AUCPU0         71
> +#define RTD1625_CRT_CLK_EN_AUCPU1         72
> +#define RTD1625_CRT_CLK_EN_NSRAM          73
> +#define RTD1625_CRT_CLK_EN_HDMITOP        74
> +#define RTD1625_CRT_CLK_EN_AUCPU_ISO_NPU  76
> +#define RTD1625_CRT_CLK_EN_KEYLADDER      77
> +#define RTD1625_CRT_CLK_EN_IFCP_KLM       78
> +#define RTD1625_CRT_CLK_EN_IFCP           79
> +#define RTD1625_CRT_CLK_EN_MDL_GENPW      80
> +#define RTD1625_CRT_CLK_EN_MDL_CHIP       81
> +#define RTD1625_CRT_CLK_EN_MDL_IP         82
> +#define RTD1625_CRT_CLK_EN_MDLM2M         83
> +#define RTD1625_CRT_CLK_EN_MDL_XTAL       84
> +#define RTD1625_CRT_CLK_EN_TEST_MUX       85
> +#define RTD1625_CRT_CLK_EN_DLA            86
> +#define RTD1625_CRT_CLK_EN_TPCW           88
> +#define RTD1625_CRT_CLK_EN_GPU_TS_SRC     89
> +#define RTD1625_CRT_CLK_EN_VI             91
> +#define RTD1625_CRT_CLK_EN_LVDS1          92
> +#define RTD1625_CRT_CLK_EN_LVDS2          93
> +#define RTD1625_CRT_CLK_EN_AUCPU          94
> +#define RTD1625_CRT_CLK_EN_UR1            96
> +#define RTD1625_CRT_CLK_EN_UR2            97
> +#define RTD1625_CRT_CLK_EN_UR3            98
> +#define RTD1625_CRT_CLK_EN_UR4            99
> +#define RTD1625_CRT_CLK_EN_UR5            100
> +#define RTD1625_CRT_CLK_EN_UR6            101
> +#define RTD1625_CRT_CLK_EN_UR7            102
> +#define RTD1625_CRT_CLK_EN_UR8            103
> +#define RTD1625_CRT_CLK_EN_UR9            104
> +#define RTD1625_CRT_CLK_EN_UR_TOP         105
> +#define RTD1625_CRT_CLK_EN_MISC_I2C_7     110
> +#define RTD1625_CRT_CLK_EN_MISC_I2C_6     111
> +#define RTD1625_CRT_CLK_EN_SPI0           112
> +#define RTD1625_CRT_CLK_EN_SPI1           113
> +#define RTD1625_CRT_CLK_EN_SPI2           114
> +#define RTD1625_CRT_CLK_EN_LSADC0         120
> +#define RTD1625_CRT_CLK_EN_LSADC1         121
> +#define RTD1625_CRT_CLK_EN_ISOMIS_DMA     122
> +#define RTD1625_CRT_CLK_EN_DPTX           124
> +#define RTD1625_CRT_CLK_EN_NPU_MIPI_CSI   125
> +#define RTD1625_CRT_CLK_EN_EDPTX          126
> +#define RTD1625_CRT_CLK_HIFI              128
> +#define RTD1625_CRT_CLK_NPU_MIPI_CSI      129
> +#define RTD1625_CRT_CLK_NPU               130
> +#define RTD1625_CRT_CLK_NPU_SYSH          132
> +#define RTD1625_CRT_CLK_HIFI_SCPU         133
> +#define RTD1625_CRT_CLK_GPU               134
> +#define RTD1625_CRT_CLK_GPU2D             135
> +#define RTD1625_CRT_CLK_MIPI_DSI_PCLK     136
> +#define RTD1625_CRT_CLK_VE1               137
> +#define RTD1625_CRT_CLK_VE2               138
> +#define RTD1625_CRT_CLK_VE4               139
> +#define RTD1625_CRT_CLK_SYS               141
> +#define RTD1625_CRT_CLK_SYSH              142
> +#define RTD1625_CRT_PLL_SDIO_REF          145
> +#define RTD1625_CRT_PLL_CR_REF            146
> +#define RTD1625_CRT_PLL_EMMC_REF          147
> +#define RTD1625_CRT_CLK_MIS_SC0           148
> +#define RTD1625_CRT_CLK_MIS_SC1           149
> +#define RTD1625_CRT_PLL_SCPU              150
> +#define RTD1625_CRT_PLL_VE1               151
> +#define RTD1625_CRT_PLL_DDSA              152
> +#define RTD1625_CRT_PLL_PSAUDA1           153
> +#define RTD1625_CRT_PLL_PSAUDA2           154
> +#define RTD1625_CRT_PLL_BUS               155
> +#define RTD1625_CRT_PLL_SDIO              156
> +#define RTD1625_CRT_PLL_SDIO_VP0          157
> +#define RTD1625_CRT_PLL_SDIO_VP1          158
> +#define RTD1625_CRT_PLL_DCSB              159
> +#define RTD1625_CRT_PLL_GPU               160
> +#define RTD1625_CRT_PLL_NPU               161
> +#define RTD1625_CRT_PLL_VE2               162
> +#define RTD1625_CRT_PLL_HIFI              163
> +#define RTD1625_CRT_PLL_SD                164
> +#define RTD1625_CRT_PLL_SD_VP0            165
> +#define RTD1625_CRT_PLL_SD_VP1            166
> +#define RTD1625_CRT_PLL_EMMC              167
> +#define RTD1625_CRT_PLL_EMMC_VP0          168
> +#define RTD1625_CRT_PLL_EMMC_VP1          169
> +#define RTD1625_CRT_PLL_ACPU              170
> +#define RTD1625_CRT_CLK_DET               171
> +#define RTD1625_CRT_CLK_MAX               172

Drop, not a binding (explained also many times on the mailing lists).

Blank line.

> +#define RTD1625_ISO_CLK_EN_USB_P4         0
> +#define RTD1625_ISO_CLK_EN_USB_P3         1
> +#define RTD1625_ISO_CLK_EN_MISC_CEC0      2
> +#define RTD1625_ISO_CLK_EN_CBUSRX_SYS     3
> +#define RTD1625_ISO_CLK_EN_CBUSTX_SYS     4
> +#define RTD1625_ISO_CLK_EN_CBUS_SYS       5
> +#define RTD1625_ISO_CLK_EN_CBUS_OSC       6
> +#define RTD1625_ISO_CLK_EN_MISC_UR0       8
> +#define RTD1625_ISO_CLK_EN_I2C0           9
> +#define RTD1625_ISO_CLK_EN_I2C1           10
> +#define RTD1625_ISO_CLK_EN_ETN_250M       11
> +#define RTD1625_ISO_CLK_EN_ETN_SYS        12
> +#define RTD1625_ISO_CLK_EN_USB_DRD        13
> +#define RTD1625_ISO_CLK_EN_USB_HOST       14
> +#define RTD1625_ISO_CLK_EN_USB_U3_HOST    15
> +#define RTD1625_ISO_CLK_EN_USB            16
> +#define RTD1625_ISO_CLK_EN_VTC            17
> +#define RTD1625_ISO_CLK_EN_MISC_VFD       18
> +#define RTD1625_ISO_CLK_MAX               19

Ditto

> +#define RTD1625_ISO_S_CLK_EN_ISOM_MIS     0
> +#define RTD1625_ISO_S_CLK_EN_ISOM_GPIOM   1
> +#define RTD1625_ISO_S_CLK_EN_TIMER7       2
> +#define RTD1625_ISO_S_CLK_EN_IRDA         3
> +#define RTD1625_ISO_S_CLK_EN_UR10         4
> +#define RTD1625_ISO_S_CLK_MAX             5

Drop

> +
> +#endif /* __DT_BINDINGS_RTK_CLOCK_RTD1625_H */
> -- 
> 2.34.1
> 
