Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A53377541;
	Fri, 28 Aug 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925587; cv=none; b=DwJNrTSFPIhsZR5sKFgt1V+3moftIh62xwn689lQhFYkJ0W75wtRu+COCi6IBS23bNGAZ1kxsTddTdVZy2ze8bwxiZb2R4T/+TtZEeBtt/blOzTNO6fR4/bya+BbN4dUKjf6vId7utWutU4Fg+M15ulUdJlnWWFkjQGnFzoPufs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925587; c=relaxed/simple;
	bh=aMq6Il5Jn+JxfznQrzbYpAr12ZkqpukxsjcV3KO40zo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=VT9zuPG3XsEWTodUcTW4DawwBH9OvY/6hJb2GMrwIwybMqGq+QoL8JJeM8rWhfmAa3TRW3n1Rct/fanWETjjg7SiODqaGAp6bk0jU/pBjmL8Q3ruJ+TFq/ADmHWjLBPeO2k108Hx/B/v+jja2inFuW9RtVkqDH1RaZ81Vd/fXWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hArhjcY9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hArhjcY9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F40B91F000E9;
	Fri, 28 Aug 2026 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925585;
	bh=136ucrOGxKA9SkLTfq5BiP5n7Q3HPT68H0U7l9wKJho=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hArhjcY9XbA5Em3QTc0pG6pAClA0SUc6PiZUg86xXMwiC7+DPzSv7D60iI+YnqNgM
	 Ht/3FATal/4FFo9P2wlJY5k8DW8E+olsJlH5AIxUH2HdteLMgzJKoqkJrCtqSq2lyE
	 k3VWVEq6XqQp+nYEXnwrLloZHrxPxR00JGlbkvlm9dbqaEkn9VmsZfM2C5ftCy4AsP
	 bL+93aGCnQ8FFJMl/0gUL2TCg65GE2pokyvjceuN6RWuPOeCK+4HjE/dHImRSxAAU9
	 HQ4g+QxuPFATNJt+XiHdkQuqCmgKfPq9VIOEijIRc9p1DTRstUnRT+X5kzaNMgGS0H
	 R8e9cQ9hH9ezw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 08/15] soc: starfive: Add jh7110-hdmi-subsystem
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: vkoul@kernel.org, dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, robh@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, lee@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, linux-phy@lists.infradead.org
In-Reply-To: <20260828-jh7110-clean-send-v2-8-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134828eucas1p1b4061de1538ef0d3322dc32f3db6140e@eucas1p1.samsung.com>
 <20260828-jh7110-clean-send-v2-8-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:59:44 +0000
Message-Id: <20260828135944.F40B91F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] Missing `select REGMAP_MMIO` in Kconfig, leading to potential build=
/link errors.
--

commit 391d2ca299019c57f8ca3f0d4ee7e80cac19c1eb
Author: Michal Wilczynski <m.wilczynski@samsung.com>
Subject: soc: starfive: Add jh7110-hdmi-subsystem driver

This commit adds a parent driver for the monolithic StarFive JH7110 HDMI IP
block. It maps the shared register space and creates separate logical child
devices for the HDMI PHY and controller to break a circular probing
dependency.

> diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
> new file mode 100644
> index 0000000000000..7592d87dea37a
> --- /dev/null
> +++ b/drivers/soc/starfive/Kconfig
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Starfive SoC drivers
> +#
> +
> +if ARCH_STARFIVE || COMPILE_TEST
> +menu "Starfive SoC drivers"
> +
> +config SOC_STARFIVE_JH7110_HDMI_SUBSYSTEM
> +	tristate "StarFive JH7110 HDMI subsystem driver"
> +	depends on OF

[Severity: Low]
Does this Kconfig entry need to select REGMAP_MMIO?

If the kernel is configured with SOC_STARFIVE_JH7110_HDMI_SUBSYSTEM=3Dy (for
example, during a random COMPILE_TEST build) but without any other driver
that enables REGMAP_MMIO, the build will likely fail with a linker error.

[ ... ]

> diff --git a/drivers/soc/starfive/jh7110-hdmi-subsystem.c b/drivers/soc/s=
tarfive/jh7110-hdmi-subsystem.c
> new file mode 100644
> index 0000000000000..d893c1c29f98b
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-hdmi-subsystem.c

[ ... ]

> +	regs =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	regmap =3D devm_regmap_init_mmio(dev, regs,
> +				       &starfive_hdmi_regmap_config);

[Severity: Low]
Could the missing REGMAP_MMIO Kconfig selection cause an undefined
reference to __devm_regmap_init_mmio_clk() here during link time?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D8
