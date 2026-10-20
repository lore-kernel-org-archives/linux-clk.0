Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792497433;
	b=KJFAvrwd5LL6F02YcWuqWSydTTP9pCk2NVCSesA66Wg7lXhzVnWcZXGqxGslvcbVgw4e
	 VDVvPaR+zhNkqeiTEDrWeBy3ho/noIVepYdXkuGdzwYuYTW+PCc2fKo8tRVdtR8fdS6Bf
	 L/8RjJ1VnKznYGRtqXqVpLrnWhrXsFDtBb5F5XbNg90eld0oziJisqv2uM+By09b7EgHJ
	 Njy5rgshoQwXegxQHjOenbYLImxWPU5eSHKeF7a2J1Qo7NugV4SQxNWuzpueANdhjzjFd
	 c2IeP6WBscO019jGRXWPQhzteDH7t/s/pGQQuLOnhtbrB6mavn139iFvAhlC0g9fIVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792497433;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=kq6rZbpshN3DZ0bSrVhBHHv91P8HlcxbwLHISO06Hiw=;
	b=3cmtc/7trB2AUI8Df5kMn/ZifpVHtTkDTh4E3usTMyFwxAfC98YRY5VNQ7D7Ua+LE1RD
	 ZytlDpiIlkywUbq8wEaoIEuCvVgJKqZGutZsgKjoh3QZ9/2bkCj8ChntKTaz8cUQWy5NY
	 vV0TnPPza8WFAFwVweqygeF2sya8ni5KInG9RISJMAamBWzP6IG+ToT9MUTFWyLVhfBtw
	 doHpJE625zhOE/PNmbE8N3Y3TkSPFZPkriIiXWQO+h7bxGPbOLioKYvnuZFb9BCIRk8IJ
	 bZ5ajZrTH4xFAHJ4KiRGA0kzX9nrBzkVHIjGFrAPNMQ6b4vi08t0E6RSQq2v3dZIplQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oM8S1IK7;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B64A8606A31A;
	Tue, 20 Oct 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oM8S1IK7
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1EB11F000C9;
	Tue, 20 Oct 2026 11:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792497432;
	bh=kq6rZbpshN3DZ0bSrVhBHHv91P8HlcxbwLHISO06Hiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oM8S1IK7PeAK3jjWXnkQKyllj5j6iBjXPOP87oGc11AzqZ/ey1Njphkbw7bHfCmH4
	 evooRu8GjmMe8lB6OHwtXtxt29xcVDF9FcEr8jVK6OgPIAFoa6jbGDDKshT0ZRMcP6
	 TveNXtzaTjjIME2pwjmSh/jgOQfQJclpaXc0NhwHtFE2CFzZJLq9ieztzmhupChCq9
	 OGIZanHXDTIPdxMx0QloJfYDzC1vmxU32UKMoLlQXtuOWUya8zG9QipU7hzvvVEyqd
	 VQpxNZPNjcl9tUYU+LlS2fM4Qu/9gHpYWzgArIEgoZfGflj7L+g65CCzZGbIbVMG39
	 KaNLzZ71FNgVA==
Date: Tue, 20 Oct 2026 12:57:05 +0100
From: Lee Jones <lee@kernel.org>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	mfd@lists.linux.dev
Subject: Re: [PATCH v13 04/13] mfd: zx297520v3: Add a clock and reset MFD
 driver
Message-ID: <20261020115705.GC1795367@google.com>
References: <20260927-zx29clk-v13-0-70d8f673386c@gmail.com>
 <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260927-zx29clk-v13-4-70d8f673386c@gmail.com>

On Sun, 27 Sep 2026, Stefan Dösinger wrote:

> This driver registers child devices for the zx297520v3 clock and reset
> controllers. The clk-zx297520v3 and reset-zte-zx297520v3 submitted in
> the next patches will drive the respective functionalities.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> v13: Break out the MAINTAINERS change so Lee can selectively apply this
> patch. I made sure it compiles without the DT binding headers.
> 
> Lee, if you prefer, I can send this patch with the MAINTAINERS change
> folded in stand-alone (or as a pull request). It'll have to tricke into
> the clk tree before I can PR the bindings and clk driver though.
> 
> Changes v12:
> Added comments elaborating on the role of the driver and the hardware.
> 
> Regarding the names: zx297520v3 is the SoC's name (chip marking, boot
> messages). TOPCRM, MATRIXCRM, LSPCRM are ZTE's names for the MMIO blocks
> in their downstream sources. Sadly no datasheet is available. "clk",
> "reset" names for the child nodes are mine.
> 
> Regarding personal copyright: I am not affiliated with ZTE nor paid by
> them. This is my personal hobby project. I am using knowledge extracted
> from ZTE's kernel dumps, but not code.
> 
> Changes v10 (All Lee Jones):
> *) drop "select REGMAP_MMIO"
> *) Drop comment about unimplemented hwlocks
> *) Use MFD_CELL_[NAME|OF]
> *) Renamed the device type enum and its values
> *) Use device_get_match_data instead of the of_ variant
> *) Improved debug messages
> 
> Changes v9:
> Deassert the LSP reset and enable the LSP pclk here. In practice the
> boot rom needs to do that because it prints to an LSP-connected UART and
> reads the boot policy from the LSP connected flash chip.
> 
> In doing so, I migrated the match data to an enum as mfd.md suggests.
> 
> Changes v8:
> *) Remove .of_compatible from PHY mfd child
> 
> *) Move to drivers/mfd (Sashiko)
> 
> For me either soc/zte or mfd/ is fine. Note though that this MFD parent
> is very specific to the zx297520v3 SoC. I don't expect this to be reused
> anywhere else. There are two more MFD-ish devices in there: soc_sys at
> 0x140000, which I plan to handle in the same driver, and an i2c PMIC,
> which would get its own host driver.
> 
> *) Use PLATFORM_DEVID_AUTO (Sashiko). NONE was intentional as I only
> ever expect one instance, but I don't see any harm in doing the standard
> thing and use AUTO
> 
> *) On the suggestion not to put the link to mfd_cells[] into match data:
> I see that it is spelled out in Sashiko's mfd.md, written by Lee Jones,
> the MFD maintainer. I would appreciate some education on the rationale
> behind it: Putting a pointer into the void *data is a common pattern in
> the kernel. I don't understand in which situation this can possibly
> break?
> 
> Both structs are static const in the same compilation unit. data is a
> const void *, not a uintptr_t or kernel_ulong_t, so it seems passing a
> pointer is the intended use. What am I missing?
> 
> Changes v7:
> Add phy MFD child
> 
> Changes v6: Make the ZTE SoC driver section depend on HAS_IOMEM
> (Sashiko). The entire MFD section, which contains MFD_CORE, depends on
> HAS_IOMEM even with COMPILE_TEST.
> 
> Add a NULL ptr check for of_device_get_match_data (Sashiko). While not
> uniform, rave-sp, rohm-bd9576, atc260x, da9052-i2c protect against
> incorrect manual attachment that way.
> 
> Add lspclk here as well in an attempt to satisfy both Conor Dooley, who
> asks for MFD for top and matrix, and Philipp Zabel, who prefers aux but
> at least wants the reset driver limited to one driver type.
> 
> Changes v5: Use MFD instead of Aux bus for top and matrix crm because of
> extra functionality: Reboot in top, hwlock in Matrix.
> 
> LSP clocks stay with the aux bus and are thus not handled in this
> driver. The clk driver will bind directly to the lspcrm node.
> ---
>  drivers/mfd/Kconfig              |  12 +++++
>  drivers/mfd/Makefile             |   2 +
>  drivers/mfd/zte-zx297520v3-crm.c | 111 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 125 insertions(+)
> 
> diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
> index 857ca3bb0d5b..b30600f6ff0c 100644
> --- a/drivers/mfd/Kconfig
> +++ b/drivers/mfd/Kconfig
> @@ -2580,5 +2580,17 @@ config MFD_MAX7360
>  	  additional drivers must be enabled in order to use the functionality
>  	  of the device.
>  
> +config MFD_ZTE_ZX297520V3_CRM
> +	tristate "ZTE zx297520v3 Clock and Reset Manager"
> +	depends on ARCH_ZTE || COMPILE_TEST
> +	select MFD_CORE
> +	default SOC_ZX297520V3
> +	help
> +	  Say yes here to enable the driver for the ZTE zx297520v3 clock and
> +	  reset manager MFD driver. This driver provides the host device for
> +	  the clock and reset drivers and is required to boot the SoC. You
> +	  will also need to enable CLK_ZTE_ZX297520V3 and RESET_ZTE_ZX297520V3
> +	  to build the actual clock and reset child drivers.
> +
>  endmenu
>  endif
> diff --git a/drivers/mfd/Makefile b/drivers/mfd/Makefile
> index 72d3944b0ad8..ab0cba2042a2 100644
> --- a/drivers/mfd/Makefile
> +++ b/drivers/mfd/Makefile
> @@ -304,3 +304,5 @@ obj-$(CONFIG_MFD_RSMU_SPI)	+= rsmu_spi.o rsmu_core.o
>  obj-$(CONFIG_MFD_UPBOARD_FPGA)	+= upboard-fpga.o
>  
>  obj-$(CONFIG_MFD_LOONGSON_SE)	+= loongson-se.o
> +
> +obj-$(CONFIG_MFD_ZTE_ZX297520V3_CRM)	+= zte-zx297520v3-crm.o
> diff --git a/drivers/mfd/zte-zx297520v3-crm.c b/drivers/mfd/zte-zx297520v3-crm.c
> new file mode 100644
> index 000000000000..d896261a4d40
> --- /dev/null
> +++ b/drivers/mfd/zte-zx297520v3-crm.c
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2026 Stefan Dösinger
> + *
> + * This driver splits the ZTE zx297520v3 SoC's clock and reset management devices into MFD child
> + * nodes that are managed by independent drivers in their respective subsystems.
> + *
> + * ZTE's downstream kernel names the mmio regions "topcrm", "matrixcrm" and "lspcrm". For an
> + * explanation of how the controllers relate please see the DT binding documentation found in
> + * Documentation/devicetree/bindings/clock/zte,zx297520v3-*yaml.
> + *
> + * The controllers are primarily clock controllers, but they all have reset controls as well. Top
> + * and Matrix controllers have further auxiliary functions.

This final paragraph is semi-useful.  The other two can be removed.

By all means add this kind of thing to the Git log, but the driver
history and rework doesn't belong here.  Talk about what it is and what
it does.

The reset of the code seems fine.

> + */
> +
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +#include <linux/errno.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/platform_device.h>
> +#include <linux/property.h>
> +#include <linux/reset.h>
> +
> +enum zx_device_type {
> +	TYPE_INVALID = 0,
> +	TYPE_TOPCRM,
> +	TYPE_MATRIXCRM,
> +	TYPE_LSPCRM,
> +};
> +
> +static const struct mfd_cell zx297520v3_topcrm_cells[] = {
> +	MFD_CELL_NAME("zx297520v3-topclk"),
> +	MFD_CELL_NAME("zx297520v3-topreset"),
> +	MFD_CELL_OF("reboot", NULL, NULL, 0, 0, "syscon-reboot"),
> +	MFD_CELL_NAME("zx297520v3-usb-phy"),
> +};
> +
> +static const struct mfd_cell zx297520v3_matrixcrm_cells[] = {
> +	MFD_CELL_NAME("zx297520v3-matrixclk"),
> +	MFD_CELL_NAME("zx297520v3-matrixreset"),
> +};
> +
> +static const struct mfd_cell zx297520v3_lspcrm_cells[] = {
> +	MFD_CELL_NAME("zx297520v3-lspclk"),
> +	MFD_CELL_NAME("zx297520v3-lspreset"),
> +};
> +
> +static int zx297520v3_crm_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	const struct mfd_cell *cells;
> +	struct reset_control *reset;
> +	enum zx_device_type type;
> +	unsigned int num_cells;
> +	struct clk *pclk;
> +
> +	type = (enum zx_device_type)(kernel_ulong_t)device_get_match_data(dev);
> +	switch (type) {
> +	case TYPE_TOPCRM:
> +		cells = zx297520v3_topcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_topcrm_cells);
> +		break;
> +
> +	case TYPE_MATRIXCRM:
> +		cells = zx297520v3_matrixcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_matrixcrm_cells);
> +		break;
> +
> +	case TYPE_LSPCRM:
> +		cells = zx297520v3_lspcrm_cells;
> +		num_cells = ARRAY_SIZE(zx297520v3_lspcrm_cells);
> +
> +		pclk = devm_clk_get_enabled(dev, "pclk");
> +		if (IS_ERR(pclk))
> +			return dev_err_probe(dev, PTR_ERR(pclk), "Could not get 'pclk'\n");
> +
> +		reset = devm_reset_control_get_exclusive_deasserted(dev, NULL);
> +		if (IS_ERR(reset))
> +			return dev_err_probe(dev, PTR_ERR(reset),
> +					     "Failed to deassert reset control\n");
> +		break;
> +
> +	default:
> +		return -ENODEV;
> +	}
> +
> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO, cells, num_cells, NULL, 0, NULL);
> +}
> +
> +static const struct of_device_id of_match_zx297520v3_crm[] = {
> +	{ .compatible = "zte,zx297520v3-topcrm", .data = (void *)TYPE_TOPCRM },
> +	{ .compatible = "zte,zx297520v3-matrixcrm", .data = (void *)TYPE_MATRIXCRM },
> +	{ .compatible = "zte,zx297520v3-lspcrm", .data = (void *)TYPE_LSPCRM },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, of_match_zx297520v3_crm);
> +
> +static struct platform_driver zx297520v3_crm = {
> +	.probe = zx297520v3_crm_probe,
> +	.driver = {
> +		.name = "zx297520v3-crm",
> +		.of_match_table = of_match_zx297520v3_crm,
> +	},
> +};
> +module_platform_driver(zx297520v3_crm);
> +
> +MODULE_AUTHOR("Stefan Dösinger <stefandoesinger@gmail.com>");
> +MODULE_DESCRIPTION("ZTE zx297520v3 CRM driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.55.0
> 

-- 
Lee Jones
