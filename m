Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 105254A3F03;
	Tue, 15 Sep 2026 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486968; cv=none; b=PwYyHiVDGfg7cD8a93embsCQcCJmAAQwChnKjwAeABhOshrkSV5dTKXr4jCgjtXuY6vjWsQejRk+n/13lPU+BLo6pQiBIkF3LcsR66sT8Cx+qUhpZRNwdmv2U3khVcgb5qVyub5DmByYqyJLCX2fFa0Hon6MIdASIaEnDLIk56E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486968; c=relaxed/simple;
	bh=k25AYb4qZKIQDoiefNgb7MTlZ5VtWyh43e/+LbpZ2jQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=TJUBxsQCPJSD2vhfJp2t3B5WdZF/69tIaEw1c8bXhG0nLbccjTxRs9JKOKaXsRav9FXCgJ58POg6eULnWWCk6t0QXopjXYaCiQZBP9dZcIue50QozF6Zw6HlG+6BgH7tQpD3cOH3T/q2J5F3g4MJASh9x5WqSS5BY6TWEZpxBr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m4AcCZ4e; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m4AcCZ4e"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F6931F00893;
	Tue, 15 Sep 2026 15:42:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486966;
	bh=e8CA6A8+NEtvZVDKgf3JyCaOYgWoKmHI1CSRlYOsO9U=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m4AcCZ4eN0PJYC+6Kr7kdugxed4FtiCo+2MZR2ao2+V/K3jD/uQOz2YbShVwzBtnG
	 kb8ceIGGiJrLDSgWcSrBDx+i+XOBtes+rTK56qKzLUcfOY/N4Yk2q1CdV+/mF2x+DR
	 9cx3gStlE8ZGuZBtt+730Upg4dV2aaSrmZoOwJ/0odxds0hvjgPkRpT1wtha8+/jc3
	 dMjwlEF5RIrzsO/kj7UIPQpySbf1l9c86TzYQO9zo1GeTOLRN5bCkc2TBjZ0y8uvnP
	 vacuhVgtLIs+z+NVPFOa8i1c73FjjWzUbnp+loePtkTW1CJ4jvtBErEVtyp+WYj0XC
	 UHkScHcGqvppg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 13/20] soc: starfive: Add jh7110-vout-subsystem
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, robh@kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org, olteanv@gmail.com, mfd@lists.linux.dev, lee@kernel.org, vkoul@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, linux-clk@vger.kernel.org
In-Reply-To: <20260915-jh7110-clean-send-v4-13-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153236eucas1p1712930425e569f894c870299f245e99f@eucas1p1.samsung.com>
 <20260915-jh7110-clean-send-v4-13-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:42:45 +0000
Message-Id: <20260915154246.1F6931F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] soc: starfive: NoC bus clock leaks power during system sleep
--

commit f4b88d3831df8dc30fb442edb24499643c924a58
Author: Michal Wilczynski <m.wilczynski@samsung.com>
soc: starfive: Add jh7110-vout-subsystem driver

This commit adds a parent driver for the StarFive JH7110 video output
subsystem. It claims the NoC display bus clock and reset, and holds a runti=
me
PM reference to keep the PD_VOUT power domain active for as long as any chi=
ld
device exists.

> diff --git a/drivers/soc/starfive/jh7110-vout-subsystem.c b/drivers/soc/s=
tarfive/jh7110-vout-subsystem.c
> new file mode 100644
> index 0000000000000..af632692e2139
> --- /dev/null
> +++ b/drivers/soc/starfive/jh7110-vout-subsystem.c

[ ... ]

> +	bus_clk =3D devm_clk_get_enabled(dev, NULL);
> +	if (IS_ERR(bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(bus_clk),
> +				     "Failed to enable NoC bus clock\n");
> +
> +	bus_rst =3D devm_reset_control_get_exclusive_deasserted(dev, NULL);

[Severity: Medium]
Does this cause a power leak during system suspend? The NoC bus clock is
enabled here, but the pointer to bus_clk is discarded. This means it cannot
be disabled later during system sleep transitions.=20

While the genpd framework manages the PD_VOUT domain during system sleep, t=
he
clock framework doesn't automatically disable clocks. The software enable
count will remain greater than zero, which could keep the NoC bus clock and
its parent PLLs active and leak power during suspend (e.g., suspend-to-RAM).

[ ... ]

> +static struct platform_driver jh7110_vout_subsys_driver =3D {
> +	.probe =3D jh7110_vout_subsys_probe,
> +	.driver =3D {
> +		.name =3D "jh7110-vout-subsystem",
> +		.of_match_table =3D jh7110_vout_subsys_of_match,
> +	},
> +};
> +module_platform_driver(jh7110_vout_subsys_driver);

[Severity: Medium]
Because the driver struct lacks a .pm field with system suspend and resume
callbacks, it seems there is no mechanism to disable the NoC bus clock when
the system goes to sleep. Should the driver store the clock pointer in a
private structure and implement dev_pm_ops callbacks to handle disabling
and re-enabling the clock?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D13
