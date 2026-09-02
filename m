Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFEA447DD66;
	Wed,  2 Sep 2026 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788349661; cv=none; b=Uko0Qz4TkfJJH3/gl6v//++4bmeB3xlRyXpNtRa08mPEycDGQ6w3OZa+uKPxAhY5D4u5szq6OpDTbpRCjY/UG5nB5Wr89Q3J7vozxKCgw0RvY4GakDZGGj67dI2cz7L98Ep34aVg4FoRF5SI7afIi2/m90MOAXEau9I2LS1U8/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788349661; c=relaxed/simple;
	bh=nRoCwnC7vqeGyQ+ZVvfLmY4mBtZpq/RhAkK3JjTtimU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=LsXcytW36W9ZIqVYsXfCTJvIpepz+I9Ah/GHfVFv/FJKS+Ewggm2tQdNutjXf3uXXcNhfvaLe5iTipa6+aHU1dxgWbGgM0HywJ08o1hXQsLSU9KdWqh58Qx9wRJjcQMSuhEa2RYeZejVAM4zrJuv3rCVsy8oVdFQbwp6rE4hyrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CGZK7twx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CGZK7twx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 484BE1F000E9;
	Wed,  2 Sep 2026 11:47:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788349649;
	bh=92BYcfSC4AfwZZL0OUuB2sOkcRELE1Co5rBUqGOqPWY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CGZK7twxQgaz5bE8s3bFFvVOvJjhQ/STxmkvvFgp7t1TmHmudZwF8trBHBxw9pxk4
	 r9hKSZCawsr44rRyEeAjq1V0KO1bg5tBk92PE4IDcyvkssHGlGkSIto+sWsx1GMife
	 0mvC5SLsJQP8SiYQJ79P77b1TbxSt4OTNz7lZIEwSwoaphREi7+yO/ZUwt9oOL0grP
	 hzwYqlYI0/7DWguvTJ8I37ikc8d2PG9/PvLDJAib4/ES/v+n4JKzL+dbQZRHsXYLyE
	 HX6WINFjjQBe5QZPaVdb6cRkVHfhmDFdy+gtN9veZ2ExWkAxK1ynDRl6kxzNgxMS1q
	 snWLwd+4Zv5ew==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 10/12] pmdomain: renesas: r8a78000: Add SCMI
 remapping support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, wsa+renesas@sang-engineering.com, conor+dt@kernel.org
In-Reply-To: <3aa6baf625d49686b5a8baec400ef63612ba8288.1788338320.git.geert+renesas@glider.be>
References: <cover.1788338320.git.geert+renesas@glider.be>
 <3aa6baf625d49686b5a8baec400ef63612ba8288.1788338320.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Sep 2026 11:47:28 +0000
Message-Id: <20260902114729.484BE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 5 potential issue(=
s) to consider:
- [High] Unsafe lockless modification of a globally shared SCMI generic_pm_=
domain structure breaks SCMI consumers.
- [High] Use-After-Free of priv structure in r8a78000_mdlc_attach_dev() due=
 to lockless access.
- [Medium] Memory leak of Open Firmware (OF) device nodes acquired via scmi=
_find_proto().
- [Medium] Resource leak of reset_control structures acquired via reset_con=
trol_get_from_provider_exclusive().
- [Low] Mixing goto-based error cleanup and scope-based cleanups in r8a7800=
0_mdlc_attach_dev.
--

commit 61539c706c75d056855ecfa70e1aa4d445ba46bf
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: renesas: r8a78000: Add SCMI remapping support

Extend the Module Controller driver for R-Car X5H with SCMI support, to
remap hardware power domain, module, and reset IDs to abstractions
(power domains, clocks, and resets) offered by the SCMI firmware.

> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> index 2668fc2ac9cbd..0238bf8c1e385 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c

[ ... ]

>  static int r8a78000_mdlc_attach_dev(struct generic_pm_domain *domain,
>  				    struct device *dev)
>  {
> +	struct of_phandle_args pd_spec, scmi_spec;
>  	struct device_node *np =3D dev->of_node;
>  	struct r8a78000_mdlc_priv *priv;

[ ... ]

> +	scoped_guard(mutex, &r8a78000_mdlc_lock) {
> +		hlist_for_each_entry(priv, &r8a78000_mdlc_list, link) {
> +			if (priv->np =3D=3D pd_spec.np)
> +				break;
> +		}
> +	}
> +
> +	if (!priv) {
> +		dev_err(dev, "%s: MDLC %pOF not found\n", __func__, pd_spec.np);
> +		of_node_put(pd_spec.np);
> +		return -ENODEV;
> +	}
> +
> +	id =3D pd_spec.args[1];
> +	of_node_put(pd_spec.np);
> +
> +	map =3D mod_map_find(priv->mod_map, id);
        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

[Severity: High]
After scoped_guard() releases the lock, if the MDLC device is concurrently
unbound via sysfs, could r8a78000_mdlc_unlink() remove and free priv before
it is accessed here locklessly, resulting in a use-after-free?

[ ... ]

> +	ret =3D pm_clk_create(dev);
> +	if (ret)
> +		goto fail_put;
> +
> +	ret =3D pm_clk_add_clk(dev, clk);
> +	if (ret)
> +		goto fail_destroy;
> +
>  	return 0;
> +
> +fail_destroy:
> +	pm_clk_destroy(dev);
> +fail_put:
> +	clk_put(clk);
> +	return ret;
> +}

[Severity: Low]
Since this function uses scoped_guard(), does mixing it with goto-based err=
or
handling conflict with the cleanup guidelines, which recommend converting a=
ll
resources to scope-based cleanup or none of them within a given routine?

[ ... ]

> +static const struct power_map *fill_power_map(struct r8a78000_mdlc_priv =
*priv,
> +					      const struct power_map_in *map_in,
> +					      struct device_node *scmi_power_np)
> +{
> +	struct of_phandle_args scmi_spec;
> +	struct generic_pm_domain *genpd;

[ ... ]

> +		genpd =3D of_genpd_get_from_provider(&scmi_spec);
> +		if (IS_ERR(genpd))
> +			return dev_err_cast_probe(dev, genpd,
> +					"Failed to get SCMI power domain %u\n",
> +					map[i].fw_id);
> +
> +		dev_dbg(dev, "SCMI power domain %u is %s\n", map[i].fw_id,
> +			genpd->name);
> +
> +		map[i].genpd =3D genpd;
> +
> +		/* Hook up clock domain support */
> +		genpd->attach_dev =3D r8a78000_mdlc_attach_dev;
> +		genpd->detach_dev =3D r8a78000_mdlc_detach_dev;
> +		/* Setting flags this late has no impact, but does not hurt */
> +		genpd->flags |=3D GENPD_FLAG_PM_CLK;
> +		genpd->dev_ops.stop =3D pm_clk_suspend;
> +		genpd->dev_ops.start =3D pm_clk_resume;
> +	}

[Severity: High]
Does overwriting the callbacks on the external genpd structure owned by the
SCMI provider break native SCMI clients? If a client bypasses MDLC and
attaches directly to the SCMI domain, the core will invoke
r8a78000_mdlc_attach_dev(), which expects an MDLC node and returns -ENODEV,
potentially denying access.

[ ... ]

> +static const struct mod_map *fill_mod_map(struct r8a78000_mdlc_priv *pri=
v,
> +					  const struct mod_map_in *map_in,
> +					  struct fwnode_handle *scmi_reset_fwnode)
> +{
> +	struct fwnode_reference_args scmi_spec;
> +	struct device *dev =3D priv->dev;
> +	struct reset_control *rstc;

[ ... ]

> +		scmi_spec.fwnode =3D scmi_reset_fwnode;
> +		scmi_spec.nargs =3D 1;
> +		scmi_spec.args[0] =3D map[i].fw_id;
> +
> +		rstc =3D reset_control_get_from_provider_exclusive(&scmi_spec);
> +		if (IS_ERR(rstc))
> +			return dev_err_cast_probe(dev, rstc,
> +					"Failed to get SCMI reset %u\n",
> +					map[i].fw_id);
> +
> +		map[i].rstc =3D rstc;
> +	}

[Severity: Medium]
Does reset_control_get_from_provider_exclusive() return an unmanaged
reference that must be explicitly freed? If so, will returning an error on a
subsequent loop iteration leak the references acquired in earlier iteration=
s?
There also appears to be no reset_control_put() cleanup during driver unbin=
d.

[ ... ]

>  static int r8a78000_mdlc_probe(struct platform_device *pdev)
>  {
>  	struct device *dev =3D &pdev->dev;
>  	struct device_node *np =3D dev->of_node;
> +	struct device_node *scmi __free(device_node) =3D NULL;
> +	struct device_node *scmi_power_np =3D NULL;
> +	const struct mdlc_data *mdlc_data;
> +	struct device_node *scmi_reset_np;
> +	struct device_node *scmi_clk_np;

[ ... ]

> +	scmi_power_np =3D scmi_find_proto(scmi, SCMI_PROTOCOL_POWER);
> +	if (!scmi_power_np) {
> +		dev_dbg(dev,
> +			"Cannot find SCMI power domain management protocol\n");
> +		goto fallback;
> +	}
> +
> +	scmi_clk_np =3D scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK);
> +	if (!scmi_clk_np) {
> +		dev_dbg(dev, "Cannot find SCMI clock management protocol\n");
> +		goto fallback;
> +	}
> +
> +	scmi_reset_np =3D scmi_find_proto(scmi, SCMI_PROTOCOL_RESET);
> +	if (!scmi_reset_np) {
> +		dev_dbg(dev, "Cannot find SCMI reset management protocol\n");
> +		goto fallback;
> +	}
> +
> +	ret =3D scmi_get_base_info(scmi, &version);
> +	if (ret =3D=3D -EPROBE_DEFER)
> +		return dev_err_probe(dev, ret, "SCMI provider not ready\n");

[Severity: Medium]
Since scmi_find_proto() returns device nodes with an elevated reference cou=
nt,
do these references leak on this -EPROBE_DEFER early return? Additionally,
they do not appear to be released with of_node_put() on the success path
either.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1788338320.gi=
t.geert+renesas@glider.be?part=3D10
