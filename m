Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793753451;
	b=5j2lcz4UIUy776AuzfCqG/5CcsML4w01YWBZbAGLwAFOr/IqBqKZOdBfW/tmUuf0gN7+
	 6M+sN3WIFe0fRLQSEn2aPYLe5gFXS3qJRMh7HH2Fpyo8VOvVjpZ5T3Rlqv7UYuWOapPgE
	 8sNaIIz6wx7QvTAdvYurCWWIIriduN4LfAl7IiZa34Ukmt68g4MXomIghP9ycsIehsNpH
	 qRCUhzhBye4SsvfmkBet+ab8B/xbyVSXXnJ5Yy4R82XZtZqJARaEBqgnS8NbZ7pkviffE
	 8rmD4kBMFDpbHxUlEYezad4wVpBAefXwMq3H8X7hIeIpDC2ntjLPdnp5ysAInhYMHow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793753451;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=us9sjzz80J8JWnqQ17ntM6lrTLnq4sE3vnKyZ5//K2I=;
	b=qckWlWx9JNEf21awzsDhy0xjBeZ9dYoezMGjMivjtTVNzK3H+lyrMWJRDA9OUE9F1Kel
	 dlp0dXXRAve50QDmW4Hv6siBeQXai2oMu4ySFcMBdbevjfQCuwaVerCWwC9ydW40FUf7y
	 LpjcCvQmusx+WsyoN5gyA1i02fjhpYZNNLZypbe/HPr6RaPssBepghOdfP2v+JKx1GC2a
	 UKraJ60C+msvm+kTm8lvIDE5y6jIWBEkmUXp5GS6CK03WoG6tCyBCrT3Z/VWTlRPo9J/K
	 onZFYsWq3G868O7uTSIbMi/0iIYt41Pb0FlH0H039xlRXurubosCJeFxFKZNtU52LvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnK+wrYU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467D3606A31B;
	Wed,  4 Nov 2026 00:50:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=hnK+wrYU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E4D1F000C1;
	Wed,  4 Nov 2026 00:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793753450;
	bh=us9sjzz80J8JWnqQ17ntM6lrTLnq4sE3vnKyZ5//K2I=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hnK+wrYUVz3yRUaOa9ivCOmswcycLlWhwe09ulmVtSvUS9/wZx0y249Rhu708vK53
	 tIfqZ5nt6oP0+AAcPpsCuPelo5jlrWaf7TEaDQRucx7LQQ0o/RsNOv/isb+L+Jdici
	 g43tPmL4LYzQYlKDHbbZx8WsnCdUE6mHmKuVIscDQ7vG6Oewd48F2LaqRBi42u/upH
	 y+xyHBdcTNNurQI4lEIUlQhVKGnTx+RbK1qKege6lErSaIU5P3iy94uc1phDc+EfQb
	 4JVozf3qpVR7zKUVw7dchDZCvBFrZtnf7q5aYXX2/uDK/bdk/fWUGeNpWz379wxwPs
	 vIcyx2Fm50Myg==
Message-ID: <sashiko-outbox-196324@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/4] soc: toshiba: tc9564: add a new syscon driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Alex Elder" <elder@riscstar.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261104004332.2141282-3-elder@riscstar.com>
References: <20261104004332.2141282-1-elder@riscstar.com>
 <20261104004332.2141282-3-elder@riscstar.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 04 Nov 2026 00:50:50 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [Medium] soc: toshiba: SOC_TOSHIBA_TC9564_SYSCON depends on hidden MFD_CO=
RE
- [Low] soc: toshiba: MFD driver calling devm_mfd_add_devices() outside dri=
vers/mfd/
- [Low] soc: toshiba: Kconfig help and commit message mismatch tc9564-sysco=
n.c
--

commit 0d303444d1af16f91e36247fd63b0cb020f8be95
Author: Alex Elder <elder@riscstar.com>

soc: toshiba: tc9564: add a new syscon driver

This commit introduces a platform driver for the Toshiba TC9564 config
system controller, registering MFD child devices for the chip's clock
and reset controllers.

> diff --git a/drivers/soc/toshiba/Kconfig b/drivers/soc/toshiba/Kconfig
> new file mode 100644
> index 0000000000000..91adcbe71905c
> --- /dev/null
> +++ b/drivers/soc/toshiba/Kconfig
> @@ -0,0 +1,12 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config SOC_TOSHIBA_TC9564_SYSCON
> +	tristate "Toshiba TC9564 config system controller support"
> +	depends on TC9564_PCI
> +	depends on MFD_CORE
> +	default TC9564_PCI

[Severity: Medium]
Should SOC_TOSHIBA_TC9564_SYSCON use "select MFD_CORE" instead of
"depends on MFD_CORE"?

In drivers/mfd/Kconfig, MFD_CORE is a promptless helper symbol with
"default n":

    config MFD_CORE
        tristate
        select IRQ_DOMAIN
        default n

When a kernel configuration enables CONFIG_TC9564_PCI without any
unrelated MFD driver that selects MFD_CORE, the dependency on MFD_CORE
remains unmet and SOC_TOSHIBA_TC9564_SYSCON cannot be enabled.
Similarly, if TC9564_PCI is built-in (y) and only modular drivers select
MFD_CORE, SOC_TOSHIBA_TC9564_SYSCON is restricted to modular (m).

> +	help
> +	  This enables support for the config system controller for the
> +	  TC9564 SoC.  It implements an MMIO regmap to manage access to
> +	  two pages of I/O memory, and serves as a clock and reset
> +	  controller for IP blocks within the chip.

[Severity: Low]
Does this help text (and the commit message) accurately describe what
drivers/soc/toshiba/tc9564-syscon.c implements?

In tc9564_config_syscon_probe(), the driver only calls
devm_mfd_add_devices() to register the toshiba-tc9564-clock and
toshiba-tc9564-reset MFD cells; it does not set up an MMIO regmap (nor
does SOC_TOSHIBA_TC9564_SYSCON select MFD_SYSCON) or implement the clock
and reset controller providers itself. Could the help text and commit
description be updated to reflect that this driver instantiates the
clock and reset child devices?

[ ... ]

> diff --git a/drivers/soc/toshiba/tc9564-syscon.c b/drivers/soc/toshiba/tc=
9564-syscon.c
> new file mode 100644
> index 0000000000000..0d0e2422b82d0
> --- /dev/null
> +++ b/drivers/soc/toshiba/tc9564-syscon.c
> @@ -0,0 +1,42 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +/*
> + * Copyright (C) 2026 by RISCstar Solutions Corporation.  All rights res=
erved.
> + */
> +
> +#include <linux/device.h>
> +#include <linux/device-id/of.h>
> +#include <linux/mfd/core.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +
> +static const struct mfd_cell tc9564_config_syscon_cells[] =3D {
> +	MFD_CELL_NAME("toshiba-tc9564-clock"),
> +	MFD_CELL_NAME("toshiba-tc9564-reset"),
> +};
> +
> +static int tc9564_config_syscon_probe(struct platform_device *pdev)
> +{
> +	return devm_mfd_add_devices(&pdev->dev, PLATFORM_DEVID_AUTO,
> +				    tc9564_config_syscon_cells,
> +				    ARRAY_SIZE(tc9564_config_syscon_cells),
> +				    NULL, 0, NULL);
> +}

[Severity: Low]
Since tc9564_config_syscon_probe() in drivers/soc/toshiba/tc9564-syscon.c
is purely an MFD driver calling devm_mfd_add_devices() to register child
devices, should this driver be placed under drivers/mfd/ rather than
drivers/soc/toshiba/ (with an "mfd: tc9564: ..." commit subject prefix)
to follow MFD subsystem placement conventions?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261104004332.2141=
282-1-elder@riscstar.com?part=3D2
