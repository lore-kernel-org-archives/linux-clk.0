Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767A5279DB6;
	Wed, 12 Aug 2026 02:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786501095; cv=none; b=oDz3GeFm2PL/3bDv31BwrjEIqixC0BTBjT+ntuBe7x7AzRn4xqwuNG1mk3cCL+xEja1nbJS4LuduDWi9m4GahAMQApxz8IDp8bQiUscL7Lahc60e8NjBg9XLGSB/wPxgBZgVKUBhG8hDpQqMi0g5w+mfsqvSHdk8Lf6h2q1dDVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786501095; c=relaxed/simple;
	bh=XxZ17txZJEboQIVpUcUMX69/wNbRx0LOO7W7Dg7AsdE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HcnAiNrHX5DlF0x6r90gDu8i8y1RPlZLyFAI/iartEQIZzJPjA7cmd8M/NuNnD8iwsVLQ819wTdObylPa27af7db+EuE48n6UDZ85haUAi10USjgBezPurcFuUXuL/dHZ0XHV9ABk3wC6pvZYn2RN0SmlRMWfzKOCy2/BXH+JLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUxzaZWl; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUxzaZWl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B251F000E9;
	Wed, 12 Aug 2026 02:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786501094;
	bh=bY0OFnSc0drGqsGwxgYlIBJ0NGilX1Kg+1xxboICm4E=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=EUxzaZWlmbGPsenpmLOT/Ns28AlVGJmiBMm7s9xV+DBO46C/kOBerhInfNGiPwRzL
	 +F4/LY6+58+5FJHH3IC59GZTqsP/PO42Z/m+qdXYG6GTfoAEMljTV/gsix35H306Rb
	 Rx7L2o5GdadgxlRxP8ZP/5/l26mvh/EUB34dHHeMl9pPMEK95otlVloQ0I4ANlXrVW
	 7mm1oVHRVB8j7tjIbbyyesBcjyHrXneXMCOElkzj54/5z4EcVl4GAwbqLU0h8QwmyW
	 Ebx9YCJQus8OcTDdshR6B7YennM4NRvv+UD445AM0wUI+ttvLDf7ptJuH6kVG/WNB3
	 CgNzMiK13O3HQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v13 10/11] clk: realtek: Add RTD1625-ISO clock
 controller driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Yu-Chun Lin" <eleanor.lin@realtek.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260812020009.3480538-11-eleanor.lin@realtek.com>
References: <20260812020009.3480538-1-eleanor.lin@realtek.com>
 <20260812020009.3480538-11-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 12 Aug 2026 02:18:13 +0000
Message-Id: <20260812021813.B9B251F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] The driver's remove path introduces a NULL pointer dereference win=
dow by nullifying the shared syscon regmap while devres-managed clock insta=
nces remain globally accessible.
--

--- Patch [10]: [PATCH v13 10/11] clk: realtek: Add RTD1625-ISO clock contr=
oller driver ---
commit b3740f40262849e43095598baf79bbd91f8f86bc
Author: Cheng-Yu Lee <cylee12@realtek.com>

clk: realtek: Add RTD1625-ISO clock controller driver

This commit adds support for the ISO domain clock controller on the Realtek
RTD1625 SoC. The controller manages always-on clocks and also registers the
shared reset controller as an auxiliary device.

> diff --git a/drivers/clk/realtek/clk-rtd1625-iso.c b/drivers/clk/realtek/=
clk-rtd1625-iso.c
> new file mode 100644
> index 0000000000000..6025c148adf83
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-rtd1625-iso.c

[ ... ]

> +static struct platform_driver rtd1625_iso_driver =3D {
> +	.probe =3D rtd1625_iso_probe,
> +	.remove =3D rtk_clk_remove,

[Severity: High]
Could this lead to a NULL pointer dereference during module unload?

When the module is removed, the driver calls rtk_clk_remove(), which clears
the regmap pointers for all clocks:

drivers/clk/realtek/clk-rtk-common.c:rtk_clk_remove() {
    ...
    for (i =3D 0; i < desc->num_clks; i++)
        desc->clks[i]->regmap =3D NULL;
    ...
}

Because the clocks are registered using devres via devm_clk_hw_register(),
they remain registered with the Common Clock Framework until after the remo=
ve
function returns.

If something queries the clock state during this window, such as reading fr=
om
debugfs (clk_summary), the framework can invoke callbacks that dereference
the nullified regmap pointer:

drivers/clk/realtek/clk-regmap-gate.c:rtk_clk_regmap_gate_is_enabled() {
    ...
    ret =3D regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
    ...
}

> +	.driver =3D {
> +		.name =3D "rtk-rtd1625-iso-clk",
> +		.of_match_table =3D rtd1625_iso_match,
> +		.suppress_bind_attrs =3D true,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260812020009.3480=
538-1-eleanor.lin@realtek.com?part=3D10
