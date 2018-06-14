Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from merlin.infradead.org ([205.233.59.134]:45684 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755261AbeFNUlH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Jun 2018 16:41:07 -0400
Subject: Re: [PATCH v8 02/10] firmware: xilinx: Add Zynqmp firmware driver
To: Jolly Shah <jolly.shah@xilinx.com>, ard.biesheuvel@linaro.org,
        mingo@kernel.org, gregkh@linuxfoundation.org,
        matt@codeblueprint.co.uk, sudeep.holla@arm.com,
        hkallweit1@gmail.com, keescook@chromium.org,
        dmitry.torokhov@gmail.com, mturquette@baylibre.com,
        sboyd@codeaurora.org, michal.simek@xilinx.com, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-clk@vger.kernel.org
Cc: rajanv@xilinx.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jolly Shah <jollys@xilinx.com>
References: <1529000862-11510-1-git-send-email-jollys@xilinx.com>
 <1529000862-11510-3-git-send-email-jollys@xilinx.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <7cd908ac-a0cc-3fd0-702f-d36a4e325a68@infradead.org>
Date: Thu, 14 Jun 2018 13:40:59 -0700
MIME-Version: 1.0
In-Reply-To: <1529000862-11510-3-git-send-email-jollys@xilinx.com>
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 06/14/2018 11:27 AM, Jolly Shah wrote:
> From: Rajan Vaja <rajanv@xilinx.com>
> 

Hi,

> diff --git a/drivers/firmware/xilinx/Kconfig b/drivers/firmware/xilinx/Kconfig
> new file mode 100644
> index 0000000..cce4e4f
> --- /dev/null
> +++ b/drivers/firmware/xilinx/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Kconfig for Xilinx firmwares
> +
> +menu "Zynq MPSoC Firmware Drivers"
> +	depends on ARCH_ZYNQMP
> +
> +config ZYNQMP_FIRMWARE
> +	bool "Enable Xilinx Zynq MPSoC firmware interface"
> +	help
> +	  Firmware interface driver is used by different to

used by different <what>?  Missing something there.

> +	  communicate with the firmware for various platform
> +	  management services.
> +	  Say yes to enable ZynqMP firmware interface driver.
> +	  In doubt, say N

	  If in doubt, say N.

> +
> +endmenu


-- 
~Randy
