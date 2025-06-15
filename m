Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D4520DD72
	for <linux-clk@vger.kernel.org>; Sun, 15 Jun 2025 02:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749955467; cv=none; b=Gwo1L+R92Zeb3YWcMyGrmyr6/yLafCIGalZ3xhcHNapbtcqQwQnKYk8U/UTobGvR6vNgYO68Q+fmCxi2kMUrzhRiPWYsu5qvbaz4dA2cNEADNtzEOjx8+uoBFlbp+t6E0MEIED+wOM9CyKnBsCS6iWpmMxwpgB3b8uQNH6Ig0Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749955467; c=relaxed/simple;
	bh=ftfadFkBwN6c4Q+bxoRmWpTQimjHPnHz3tsDx6LIPXk=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=P0vXZawoK8hCCrWEZmgW+vYcYs4WQg1Au0iNy2GXQWJZF2rJfLzflgWwb1k7UxBmwKDWAf8M7ek86czVUMRB8jRDF3y87JonEAR67FQipLE0jtT6KE1HBXp6hfNVkJdyqFWfrnpVdJKRB9PYEUFmQlB68rSTJ8Lfqmh2Ya//94E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=Mlk/SYgf; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="Mlk/SYgf"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-3dda399db09so32151395ab.3
        for <linux-clk@vger.kernel.org>; Sat, 14 Jun 2025 19:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749955464; x=1750560264; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rbzxunG6RY15WqWBqtdX/1STsWrnVaUnvPCKcLIK3YA=;
        b=Mlk/SYgfO+U7PeksswStuYDpZCGhz6gk7haORjwHvqnVXXli8XijkGDio6PkjOW2Tz
         QEZg69SLy4vbv3wSoTILoieaFjX/AaII0vkMzfHXtA7LmpqTzn42A6pN3J+hWedJIwQ0
         qcDspZWfaIeunHmtJh0CeJKzXcvdR0fpuSA2VfClCSOsVCkGo8psZ9npt44N2dm4bp90
         ODM7ryZTKO70JulBw9YmUn4lnWAo3wn8ObXjz5VDjhSz9NelOLLOA9A5OYZdWiDIViP8
         m1/9ReYznG/AF6lC060REOIHKVQx874/ch6GpJ9wELVjHrrGPvpzKus6ny3/N66A4wsZ
         Ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749955464; x=1750560264;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rbzxunG6RY15WqWBqtdX/1STsWrnVaUnvPCKcLIK3YA=;
        b=WKHoO3pOnRLnwDeJjFfP6cVJlKV9JThx0l/d2k8rb58hh7sWSOpjRKrqgeG6j6wv8Y
         SiGPSKCKNn2L9Ro1Ss8yel+CbHbpIi6wQVB1hoe3Mn4KH2A1LuJ0EsKyHc9trZixjk0P
         uDeMolMOvZs8OTrQIRSrcpRuozhysfRiAscUM44C5OQS91RaRxl/QLBrObjbO0vNcFcN
         Giimb1zgklpCc8lDWLEnm7KtWqpgjAY3oDeY1Suu90vdZorClcmN7Jr6IEmmVdp28wY2
         SKIzlvt//M427lyQVNZOrbD2MdLrfvrPWZ2OpO9Z61R1mIgwyPPcD8OcaXhWvWClLbq6
         Dk+g==
X-Forwarded-Encrypted: i=1; AJvYcCXDU7CPd/BhhepISKV7QYFKfVE3MZYT615dETBbSNAS/TAeZ+qsVMnds/c2q/ttGj1XQfzA/tRhHF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0txTUSY30UxcT1me4fvss+iks3lGw/+8hfI0yuzOUsqRmslPC
	fYRYGvTu3GS4icbcdwkyGkeuE6AsfpapjUaSeE38u455SG+RMs1RseuCGMijgOZ8lCdRP4oYTr9
	qwXo6
X-Gm-Gg: ASbGncu78wYVPF0VqoUHF0ArMR4Yynu/LaAeBy8J/FybLa7jkHB1FhfG3kptk0QD4vj
	evZqcNJYdpGzNa4ol+OIbkjInQsD58dLQNnbl0ATzHi8kklXifGuPTnEaihe9Eac8QJQaR0CoZp
	I3VDnW5nUJQw7SFplG73CWp5RN5CnBHMuaoi86J+CoGPnbogxWvkzqQPPdcDSa6CC7g4f/BXsrH
	BzV32ujp6q1Yn8HR2WHBsQO1RfHqf5Vik8x39TOteFMrYs92JUIQjy+kOqibz5tBY3CbuxVLwVL
	GZ9wDHTKFbKwPQjI3+M2uaDOzhGezfJtaf5yUm8i7658Dts+flovTcvA+ig4Rp3wq5fE0FqIp/H
	281OLyaxe5WVzez1nx0PUwJL0daVd3tMpIivL49ymzqaJWg==
X-Google-Smtp-Source: AGHT+IHISZVLCd5D9Kb53f6w+iLxxBcPwKrKGNw4SQF0RsqJBNbi5yorq4ZbdMHj/fKr3m7PjYJkbw==
X-Received: by 2002:a05:6e02:339c:b0:3dc:8b57:b759 with SMTP id e9e14a558f8ab-3de07cecdc9mr67362815ab.21.1749955463733;
        Sat, 14 Jun 2025 19:44:23 -0700 (PDT)
Received: from [10.211.55.5] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3de019b3fd0sm11282475ab.11.2025.06.14.19.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 19:44:23 -0700 (PDT)
Message-ID: <528522d9-0467-428c-820a-9e9c8a6166e7@riscstar.com>
Date: Sat, 14 Jun 2025 21:44:21 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 5/6] reset: spacemit: add support for SpacemiT CCU
 resets
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, dlan@gentoo.org
Cc: heylenay@4d2.org, inochiama@outlook.com, guodong@riscstar.com,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 spacemit@lists.linux.dev, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250613011139.1201702-1-elder@riscstar.com>
 <20250613011139.1201702-6-elder@riscstar.com>
Content-Language: en-US
In-Reply-To: <20250613011139.1201702-6-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/12/25 8:11 PM, Alex Elder wrote:
> Implement reset support for SpacemiT CCUs.  A SpacemiT reset controller
> device is an auxiliary device associated with a clock controller (CCU).
> 
> This patch defines the reset controllers for the MPMU, APBC, and MPMU
> CCUs, which already define clock controllers.  It also adds RCPU, RCPU2,
> and ACPB2 CCUs, which only define resets.
> 
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
> v11: Redefined combined reset definitions into individual ones

After I sent this, I realized the clocks use a different
naming convention for two of the PCIe symbols.  I think
reset should follow the same convention.

Yixun if you accept this series, would you mind updating
these?

   RESET_PCIE0_SLV -> RESET_PCIE0_SLAVE
   RESET_PCIE0_MSTR -> RESET_PCIE_MASTER

(And similar changes for PCIE1 and PCIE2.)

Thank you.

					-Alex

> 
>   drivers/reset/Kconfig            |   9 +
>   drivers/reset/Makefile           |   1 +
>   drivers/reset/reset-spacemit.c   | 304 +++++++++++++++++++++++++++++++
>   include/soc/spacemit/k1-syscon.h |  30 +++
>   4 files changed, 344 insertions(+)
>   create mode 100644 drivers/reset/reset-spacemit.c
> 
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d85be5899da6a..49f5d914172e1 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -270,6 +270,15 @@ config RESET_SOCFPGA
>   	  This enables the reset driver for the SoCFPGA ARMv7 platforms. This
>   	  driver gets initialized early during platform init calls.
>   
> +config RESET_SPACEMIT
> +	tristate "SpacemiT reset driver"
> +	depends on ARCH_SPACEMIT || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	default ARCH_SPACEMIT
> +	help
> +	  This enables the reset controller driver for SpacemiT SoCs,
> +	  including the K1.
> +
>   config RESET_SUNPLUS
>   	bool "Sunplus SoCs Reset Driver" if COMPILE_TEST
>   	default ARCH_SUNPLUS
> diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> index 91e6348e33511..35344abe4a756 100644
> --- a/drivers/reset/Makefile
> +++ b/drivers/reset/Makefile
> @@ -35,6 +35,7 @@ obj-$(CONFIG_RESET_RZV2H_USB2PHY) += reset-rzv2h-usb2phy.o
>   obj-$(CONFIG_RESET_SCMI) += reset-scmi.o
>   obj-$(CONFIG_RESET_SIMPLE) += reset-simple.o
>   obj-$(CONFIG_RESET_SOCFPGA) += reset-socfpga.o
> +obj-$(CONFIG_RESET_SPACEMIT) += reset-spacemit.o
>   obj-$(CONFIG_RESET_SUNPLUS) += reset-sunplus.o
>   obj-$(CONFIG_RESET_SUNXI) += reset-sunxi.o
>   obj-$(CONFIG_RESET_TH1520) += reset-th1520.o
> diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
> new file mode 100644
> index 0000000000000..8f6b211df7b3f
> --- /dev/null
> +++ b/drivers/reset/reset-spacemit.c
> @@ -0,0 +1,304 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/* SpacemiT reset controller driver */
> +
> +#include <linux/auxiliary_bus.h>
> +#include <linux/container_of.h>
> +#include <linux/device.h>
> +#include <linux/module.h>
> +#include <linux/regmap.h>
> +#include <linux/reset-controller.h>
> +#include <linux/types.h>
> +
> +#include <soc/spacemit/k1-syscon.h>
> +#include <dt-bindings/clock/spacemit,k1-syscon.h>
> +
> +struct ccu_reset_data {
> +	u32 offset;
> +	u32 assert_mask;
> +	u32 deassert_mask;
> +};
> +
> +struct ccu_reset_controller_data {
> +	const struct ccu_reset_data *reset_data;	/* array */
> +	size_t count;
> +};
> +
> +struct ccu_reset_controller {
> +	struct reset_controller_dev rcdev;
> +	const struct ccu_reset_controller_data *data;
> +	struct regmap *regmap;
> +};
> +
> +#define RESET_DATA(_offset, _assert_mask, _deassert_mask)	\
> +	{							\
> +		.offset		= (_offset),			\
> +		.assert_mask	= (_assert_mask),		\
> +		.deassert_mask	= (_deassert_mask),		\
> +	}
> +
> +static const struct ccu_reset_data k1_mpmu_resets[] = {
> +	[RESET_WDT]	= RESET_DATA(MPMU_WDTPCR,		BIT(2), 0),
> +};
> +
> +static const struct ccu_reset_controller_data k1_mpmu_reset_data = {
> +	.reset_data	= k1_mpmu_resets,
> +	.count		= ARRAY_SIZE(k1_mpmu_resets),
> +};
> +
> +static const struct ccu_reset_data k1_apbc_resets[] = {
> +	[RESET_UART0]	= RESET_DATA(APBC_UART1_CLK_RST,	BIT(2),	0),
> +	[RESET_UART2]	= RESET_DATA(APBC_UART2_CLK_RST,	BIT(2), 0),
> +	[RESET_GPIO]	= RESET_DATA(APBC_GPIO_CLK_RST,		BIT(2), 0),
> +	[RESET_PWM0]	= RESET_DATA(APBC_PWM0_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM1]	= RESET_DATA(APBC_PWM1_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM2]	= RESET_DATA(APBC_PWM2_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM3]	= RESET_DATA(APBC_PWM3_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM4]	= RESET_DATA(APBC_PWM4_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM5]	= RESET_DATA(APBC_PWM5_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM6]	= RESET_DATA(APBC_PWM6_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM7]	= RESET_DATA(APBC_PWM7_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM8]	= RESET_DATA(APBC_PWM8_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM9]	= RESET_DATA(APBC_PWM9_CLK_RST,		BIT(2), BIT(0)),
> +	[RESET_PWM10]	= RESET_DATA(APBC_PWM10_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM11]	= RESET_DATA(APBC_PWM11_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM12]	= RESET_DATA(APBC_PWM12_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM13]	= RESET_DATA(APBC_PWM13_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM14]	= RESET_DATA(APBC_PWM14_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM15]	= RESET_DATA(APBC_PWM15_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM16]	= RESET_DATA(APBC_PWM16_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM17]	= RESET_DATA(APBC_PWM17_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM18]	= RESET_DATA(APBC_PWM18_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_PWM19]	= RESET_DATA(APBC_PWM19_CLK_RST,	BIT(2), BIT(0)),
> +	[RESET_SSP3]	= RESET_DATA(APBC_SSP3_CLK_RST,		BIT(2), 0),
> +	[RESET_UART3]	= RESET_DATA(APBC_UART3_CLK_RST,	BIT(2), 0),
> +	[RESET_RTC]	= RESET_DATA(APBC_RTC_CLK_RST,		BIT(2), 0),
> +	[RESET_TWSI0]	= RESET_DATA(APBC_TWSI0_CLK_RST,	BIT(2), 0),
> +	[RESET_TIMERS1]	= RESET_DATA(APBC_TIMERS1_CLK_RST,	BIT(2), 0),
> +	[RESET_AIB]	= RESET_DATA(APBC_AIB_CLK_RST,		BIT(2), 0),
> +	[RESET_TIMERS2]	= RESET_DATA(APBC_TIMERS2_CLK_RST,	BIT(2), 0),
> +	[RESET_ONEWIRE]	= RESET_DATA(APBC_ONEWIRE_CLK_RST,	BIT(2), 0),
> +	[RESET_SSPA0]	= RESET_DATA(APBC_SSPA0_CLK_RST,	BIT(2), 0),
> +	[RESET_SSPA1]	= RESET_DATA(APBC_SSPA1_CLK_RST,	BIT(2), 0),
> +	[RESET_DRO]	= RESET_DATA(APBC_DRO_CLK_RST,		BIT(2), 0),
> +	[RESET_IR]	= RESET_DATA(APBC_IR_CLK_RST,		BIT(2), 0),
> +	[RESET_TWSI1]	= RESET_DATA(APBC_TWSI1_CLK_RST,	BIT(2), 0),
> +	[RESET_TSEN]	= RESET_DATA(APBC_TSEN_CLK_RST,		BIT(2), 0),
> +	[RESET_TWSI2]	= RESET_DATA(APBC_TWSI2_CLK_RST,	BIT(2), 0),
> +	[RESET_TWSI4]	= RESET_DATA(APBC_TWSI4_CLK_RST,	BIT(2), 0),
> +	[RESET_TWSI5]	= RESET_DATA(APBC_TWSI5_CLK_RST,	BIT(2), 0),
> +	[RESET_TWSI6]	= RESET_DATA(APBC_TWSI6_CLK_RST,	BIT(2), 0),
> +	[RESET_TWSI7]	= RESET_DATA(APBC_TWSI7_CLK_RST,	BIT(2), 0),
> +	[RESET_TWSI8]	= RESET_DATA(APBC_TWSI8_CLK_RST,	BIT(2), 0),
> +	[RESET_IPC_AP2AUD] = RESET_DATA(APBC_IPC_AP2AUD_CLK_RST, BIT(2), 0),
> +	[RESET_UART4]	= RESET_DATA(APBC_UART4_CLK_RST,	BIT(2), 0),
> +	[RESET_UART5]	= RESET_DATA(APBC_UART5_CLK_RST,	BIT(2), 0),
> +	[RESET_UART6]	= RESET_DATA(APBC_UART6_CLK_RST,	BIT(2), 0),
> +	[RESET_UART7]	= RESET_DATA(APBC_UART7_CLK_RST,	BIT(2), 0),
> +	[RESET_UART8]	= RESET_DATA(APBC_UART8_CLK_RST,	BIT(2), 0),
> +	[RESET_UART9]	= RESET_DATA(APBC_UART9_CLK_RST,	BIT(2), 0),
> +	[RESET_CAN0]	= RESET_DATA(APBC_CAN0_CLK_RST,		BIT(2), 0),
> +};
> +
> +static const struct ccu_reset_controller_data k1_apbc_reset_data = {
> +	.reset_data	= k1_apbc_resets,
> +	.count		= ARRAY_SIZE(k1_apbc_resets),
> +};
> +
> +static const struct ccu_reset_data k1_apmu_resets[] = {
> +	[RESET_CCIC_4X]	= RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_CCIC1_PHY] = RESET_DATA(APMU_CCIC_CLK_RES_CTRL,	0, BIT(2)),
> +	[RESET_SDH_AXI]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_SDH0]	= RESET_DATA(APMU_SDH0_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_SDH1]	= RESET_DATA(APMU_SDH1_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_SDH2]	= RESET_DATA(APMU_SDH2_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_USBP1_AXI] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(4)),
> +	[RESET_USB_AXI]	= RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_USB30_AHB] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(9)),
> +	[RESET_USB30_VCC] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(10)),
> +	[RESET_USB30_PHY] = RESET_DATA(APMU_USB_CLK_RES_CTRL,	0, BIT(11)),
> +	[RESET_QSPI]	= RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_QSPI_BUS] = RESET_DATA(APMU_QSPI_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_DMA]	= RESET_DATA(APMU_DMA_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_AES]	= RESET_DATA(APMU_AES_CLK_RES_CTRL,	0, BIT(4)),
> +	[RESET_VPU]	= RESET_DATA(APMU_VPU_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_GPU]	= RESET_DATA(APMU_GPU_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_EMMC]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_EMMC_X]	= RESET_DATA(APMU_PMUA_EM_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_AUDIO_SYS] = RESET_DATA(APMU_AUDIO_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_AUDIO_MCU] = RESET_DATA(APMU_AUDIO_CLK_RES_CTRL, 0, BIT(2)),
> +	[RESET_AUDIO_APMU] = RESET_DATA(APMU_AUDIO_CLK_RES_CTRL, 0, BIT(3)),
> +	[RESET_HDMI]	= RESET_DATA(APMU_HDMI_CLK_RES_CTRL,	0, BIT(9)),
> +	[RESET_PCIE0_DBI] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0, 0, BIT(3)),
> +	[RESET_PCIE0_SLV] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0, 0, BIT(4)),
> +	[RESET_PCIE0_MSTR] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0, 0, BIT(5)),
> +	[RESET_PCIE0_GLB] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_0, BIT(8), 0),
> +	[RESET_PCIE1_DBI] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1, 0, BIT(3)),
> +	[RESET_PCIE1_SLV] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1, 0, BIT(4)),
> +	[RESET_PCIE1_MSTR] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1, 0, BIT(5)),
> +	[RESET_PCIE1_GLB] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_1, BIT(8), 0),
> +	[RESET_PCIE2_DBI] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2, 0, BIT(3)),
> +	[RESET_PCIE2_SLV] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2, 0, BIT(4)),
> +	[RESET_PCIE2_MSTR] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2, 0, BIT(5)),
> +	[RESET_PCIE2_GLB] = RESET_DATA(APMU_PCIE_CLK_RES_CTRL_2, BIT(8), 0),
> +	[RESET_EMAC0]	= RESET_DATA(APMU_EMAC0_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_EMAC1]	= RESET_DATA(APMU_EMAC1_CLK_RES_CTRL,	0, BIT(1)),
> +	[RESET_JPG]	= RESET_DATA(APMU_JPG_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_CCIC2PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(2)),
> +	[RESET_CCIC3PHY] = RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(29)),
> +	[RESET_CSI]	= RESET_DATA(APMU_CSI_CCIC2_CLK_RES_CTRL, 0, BIT(1)),
> +	[RESET_ISP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(0)),
> +	[RESET_ISP_CPP]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(27)),
> +	[RESET_ISP_BUS]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(3)),
> +	[RESET_ISP_CI]	= RESET_DATA(APMU_ISP_CLK_RES_CTRL,	0, BIT(16)),
> +	[RESET_DPU_MCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL2,	0, BIT(9)),
> +	[RESET_DPU_ESC]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(3)),
> +	[RESET_DPU_HCLK] = RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(4)),
> +	[RESET_DPU_SPIBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(4)),
> +	[RESET_DPU_SPI_HBUS] = RESET_DATA(APMU_LCD_SPI_CLK_RES_CTRL, 0, BIT(2)),
> +	[RESET_V2D]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(27)),
> +	[RESET_MIPI]	= RESET_DATA(APMU_LCD_CLK_RES_CTRL1,	0, BIT(15)),
> +	[RESET_MC]	= RESET_DATA(APMU_PMUA_MC_CTRL,		0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k1_apmu_reset_data = {
> +	.reset_data	= k1_apmu_resets,
> +	.count		= ARRAY_SIZE(k1_apmu_resets),
> +};
> +
> +static const struct ccu_reset_data k1_rcpu_resets[] = {
> +	[RESET_RCPU_SSP0]	= RESET_DATA(RCPU_SSP0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_I2C0]	= RESET_DATA(RCPU_I2C0_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART1]	= RESET_DATA(RCPU_UART1_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_IR]		= RESET_DATA(RCPU_CAN_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_CAN]	= RESET_DATA(RCPU_IR_CLK_RST,	0, BIT(0)),
> +	[RESET_RCPU_UART0]	= RESET_DATA(RCPU_UART0_CLK_RST, 0, BIT(0)),
> +	[RESET_RCPU_HDMI_AUDIO]	= RESET_DATA(AUDIO_HDMI_CLK_CTRL, 0, BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k1_rcpu_reset_data = {
> +	.reset_data	= k1_rcpu_resets,
> +	.count		= ARRAY_SIZE(k1_rcpu_resets),
> +};
> +
> +static const struct ccu_reset_data k1_rcpu2_resets[] = {
> +	[RESET_RCPU2_PWM0]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM1]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM2]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM3]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM4]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM5]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM6]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM7]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM8]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +	[RESET_RCPU2_PWM9]	= RESET_DATA(RCPU2_PWM9_CLK_RST, BIT(2), BIT(0)),
> +};
> +
> +static const struct ccu_reset_controller_data k1_rcpu2_reset_data = {
> +	.reset_data	= k1_rcpu2_resets,
> +	.count		= ARRAY_SIZE(k1_rcpu2_resets),
> +};
> +
> +static const struct ccu_reset_data k1_apbc2_resets[] = {
> +	[RESET_APBC2_UART1]	= RESET_DATA(APBC2_UART1_CLK_RST, BIT(2), 0),
> +	[RESET_APBC2_SSP2]	= RESET_DATA(APBC2_SSP2_CLK_RST, BIT(2), 0),
> +	[RESET_APBC2_TWSI3]	= RESET_DATA(APBC2_TWSI3_CLK_RST, BIT(2), 0),
> +	[RESET_APBC2_RTC]	= RESET_DATA(APBC2_RTC_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC2_TIMERS0]	= RESET_DATA(APBC2_TIMERS0_CLK_RST, BIT(2), 0),
> +	[RESET_APBC2_KPC]	= RESET_DATA(APBC2_KPC_CLK_RST,	BIT(2), 0),
> +	[RESET_APBC2_GPIO]	= RESET_DATA(APBC2_GPIO_CLK_RST, BIT(2), 0),
> +};
> +
> +static const struct ccu_reset_controller_data k1_apbc2_reset_data = {
> +	.reset_data	= k1_apbc2_resets,
> +	.count		= ARRAY_SIZE(k1_apbc2_resets),
> +};
> +
> +static int spacemit_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	struct ccu_reset_controller *controller;
> +	const struct ccu_reset_data *data;
> +	u32 mask;
> +	u32 val;
> +
> +	controller = container_of(rcdev, struct ccu_reset_controller, rcdev);
> +	data = &controller->data->reset_data[id];
> +	mask = data->assert_mask | data->deassert_mask;
> +	val = assert ? data->assert_mask : data->deassert_mask;
> +
> +	return regmap_update_bits(controller->regmap, data->offset, mask, val);
> +}
> +
> +static int spacemit_reset_assert(struct reset_controller_dev *rcdev,
> +				 unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, true);
> +}
> +
> +static int spacemit_reset_deassert(struct reset_controller_dev *rcdev,
> +				   unsigned long id)
> +{
> +	return spacemit_reset_update(rcdev, id, false);
> +}
> +
> +static const struct reset_control_ops spacemit_reset_control_ops = {
> +	.assert		= spacemit_reset_assert,
> +	.deassert	= spacemit_reset_deassert,
> +};
> +
> +static int spacemit_reset_controller_register(struct device *dev,
> +					      struct ccu_reset_controller *controller)
> +{
> +	struct reset_controller_dev *rcdev = &controller->rcdev;
> +
> +	rcdev->ops = &spacemit_reset_control_ops;
> +	rcdev->owner = THIS_MODULE;
> +	rcdev->of_node = dev->of_node;
> +	rcdev->nr_resets = controller->data->count;
> +
> +	return devm_reset_controller_register(dev, &controller->rcdev);
> +}
> +
> +static int spacemit_reset_probe(struct auxiliary_device *adev,
> +				const struct auxiliary_device_id *id)
> +{
> +	struct spacemit_ccu_adev *rdev = to_spacemit_ccu_adev(adev);
> +	struct ccu_reset_controller *controller;
> +	struct device *dev = &adev->dev;
> +
> +	controller = devm_kzalloc(dev, sizeof(*controller), GFP_KERNEL);
> +	if (!controller)
> +		return -ENOMEM;
> +	controller->data = (const struct ccu_reset_controller_data *)id->driver_data;
> +	controller->regmap = rdev->regmap;
> +
> +	return spacemit_reset_controller_register(dev, controller);
> +}
> +
> +#define K1_AUX_DEV_ID(_unit) \
> +	{ \
> +		.name = "spacemit_ccu_k1." #_unit "-reset", \
> +		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> +	}
> +
> +static const struct auxiliary_device_id spacemit_reset_ids[] = {
> +	K1_AUX_DEV_ID(mpmu),
> +	K1_AUX_DEV_ID(apbc),
> +	K1_AUX_DEV_ID(apmu),
> +	K1_AUX_DEV_ID(rcpu),
> +	K1_AUX_DEV_ID(rcpu2),
> +	K1_AUX_DEV_ID(apbc2),
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(auxiliary, spacemit_reset_ids);
> +
> +static struct auxiliary_driver spacemit_k1_reset_driver = {
> +	.probe          = spacemit_reset_probe,
> +	.id_table       = spacemit_reset_ids,
> +};
> +module_auxiliary_driver(spacemit_k1_reset_driver);
> +
> +MODULE_AUTHOR("Alex Elder <elder@kernel.org>");
> +MODULE_DESCRIPTION("SpacemiT reset controller driver");
> +MODULE_LICENSE("GPL");
> diff --git a/include/soc/spacemit/k1-syscon.h b/include/soc/spacemit/k1-syscon.h
> index 53eff7691f33d..c59bd7a38e5b4 100644
> --- a/include/soc/spacemit/k1-syscon.h
> +++ b/include/soc/spacemit/k1-syscon.h
> @@ -127,4 +127,34 @@ to_spacemit_ccu_adev(struct auxiliary_device *adev)
>   #define APMU_EMAC0_CLK_RES_CTRL		0x3e4
>   #define APMU_EMAC1_CLK_RES_CTRL		0x3ec
>   
> +/* RCPU register offsets */
> +#define RCPU_SSP0_CLK_RST		0x0028
> +#define RCPU_I2C0_CLK_RST		0x0030
> +#define RCPU_UART1_CLK_RST		0x003c
> +#define RCPU_CAN_CLK_RST		0x0048
> +#define RCPU_IR_CLK_RST			0x004c
> +#define RCPU_UART0_CLK_RST		0x00d8
> +#define AUDIO_HDMI_CLK_CTRL		0x2044
> +
> +/* RCPU2 register offsets */
> +#define RCPU2_PWM0_CLK_RST		0x0000
> +#define RCPU2_PWM1_CLK_RST		0x0004
> +#define RCPU2_PWM2_CLK_RST		0x0008
> +#define RCPU2_PWM3_CLK_RST		0x000c
> +#define RCPU2_PWM4_CLK_RST		0x0010
> +#define RCPU2_PWM5_CLK_RST		0x0014
> +#define RCPU2_PWM6_CLK_RST		0x0018
> +#define RCPU2_PWM7_CLK_RST		0x001c
> +#define RCPU2_PWM8_CLK_RST		0x0020
> +#define RCPU2_PWM9_CLK_RST		0x0024
> +
> +/* APBC2 register offsets */
> +#define APBC2_UART1_CLK_RST		0x0000
> +#define APBC2_SSP2_CLK_RST		0x0004
> +#define APBC2_TWSI3_CLK_RST		0x0008
> +#define APBC2_RTC_CLK_RST		0x000c
> +#define APBC2_TIMERS0_CLK_RST		0x0010
> +#define APBC2_KPC_CLK_RST		0x0014
> +#define APBC2_GPIO_CLK_RST		0x001c
> +
>   #endif /* __SOC_K1_SYSCON_H__ */

