Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795033327;
	b=c9o1uToGD9QP/GJehBXy+azfDBnsOXUy+jsrOsTi0RDzGsnG3zutMNqzfxHMdIvS9x20
	 ed+J3GXTpZRTGD8COTelvKHAZ+uXPiJM2up30NsZU8y3omCLFf5rQGWXFjDmWjJRHIBzR
	 hSD6u0ZbmuMDatAHraaTVRgpA9SI7D2911G+cDHx7mxp8KpEIpbrKO2v/Mp2wAxZFd5fT
	 soGr+VFi00dKDHTLOSvGeFmH4sEz12Mnu2ylDIJD/9xpz31XP/ZUOziamMP6z52QK7cd4
	 T79XLjNBaqzHpM/Qp+9jtLc6K1G6S1599KI4+yO5e40F2H3zliU+7BvYH+h6rw5X78w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033327;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=iP6H1R9//lSGzYtE8e3/NGtYHMNBBprSpDdNynqBbhg=;
	b=l8wNri7DDzRHDFA9bLmRTScCnUJd02S4YkdBSuoHevmw/k0E43JGtKCt9GxIKB52vxaw
	 fVK5jSIv7lhpCoOB/AnNa4C8+E8apvdMQjN51URrMSkj4C08glWoJKPWZ443Emc7yhpCO
	 9cEYRi4Fqn/+VxU2ad6kFn6hcCyvIr0Hs8kvDWI1eih6Zgh0vAyBJb5p95vayqnUYJINR
	 8U9MQv74HIx02pxkVOkp6miVqDcMapsDDANB5CCQ0phJMNLEJW8LLjAOzPpXVlHUKOiJI
	 /4E6NlB8lhKULyMbPNuOaKH/23Z4JPBo+SytmnJKPuE5zvBQSKYVp5zPIAsKApznrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="nV/vNx7J";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE94606A32C;
	Wed, 18 Nov 2026 20:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=nV/vNx7J
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948E31F000C6;
	Wed, 18 Nov 2026 20:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795033326;
	bh=iP6H1R9//lSGzYtE8e3/NGtYHMNBBprSpDdNynqBbhg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nV/vNx7JQJu1AmJAi1lpXXu+PggZsMpYm5B1vFz5xHSZaAvW4sbpw5O8Pf+ZTAa7p
	 oaY1aMN8eBkEkSndpk1qa49nimIZ9qACTpk83q46u5Ce78TS1ETmNwcPDSdKL2yvYM
	 WPYAxk2Qd1ChjmQJ4VlXcDRwAPoqDt+9puLFgqHYU3C9iUVh6nJk1pxopDKIaXA5XE
	 A9VA2ZzbjPJmxmXDwyQhE8uJDheS/aqO3/GAm5ORy3knFQD73CbMvEJ7TLcEZ/TkkZ
	 4ThP9Z+TLxoZhTy+6zOAx8EZZUB2Mpol+AwBiEBSo8mlanxp8CSb0xlPLm6emd+iYp
	 hiV5FBGUPeO2Q==
Message-ID: <sashiko-outbox-221928@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 14/15] pmdomain: renesas: r8a78000: Add SCMI
 remapping support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <e6816327da51f9fbeef67f13aac723b891e5042f.1795029012.git.geert+renesas@glider.be>
References: <cover.1795029012.git.geert+renesas@glider.be>
 <e6816327da51f9fbeef67f13aac723b891e5042f.1795029012.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 18 Nov 2026 20:22:06 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] pmdomain: renesas: leak of exclusive reset controls in
  r8a78000_mdlc_probe()
- [Medium] pmdomain: renesas: leak of scmi_clk_np reference in
  r8a78000_mdlc_probe()
- [Low] pmdomain: renesas: mixed scoped_guard() and goto in
  r8a78000_mdlc_attach_dev()
--

commit 35d53b7b58584e545d3609ea7bb1ae4726d2bdc8
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: renesas: r8a78000: Add SCMI remapping support

This commit extends the R-Car X5H Module Controller driver to remap
hardware power domain, module clock, and reset IDs to SCMI power domains,
clocks, and resets when SCMI firmware support is available.

> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> index 733bf68dab2ce..79f6f1a9ae95d 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
[ ... ]
> @@ -178,8 +280,148 @@ static int r8a78000_mdlc_attach_dev(struct generic_=
pm_domain *domain,
>  		return -ENOENT;
>  	}
> =20
> -	dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> +	if (!priv->scmi_clk_np) {
> +		dev_dbg(dev, "Ignoring HW module 0x%x\n", id);
> +		return 0;
> +	}
> +
> +	entry =3D &priv->mod_map->entries[idx];
> +	dev_dbg(dev, "Mapping HW module 0x%x to SCMI clock %d fck parent %d\n",
> +		id, entry->fw_id, entry->fw_fck_parent);
> +
> +	clk =3D scmi_get_clk(dev, priv->scmi_clk_np, entry->fw_id);
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
> +	parent =3D scmi_get_clk(dev, priv->scmi_clk_np, entry->fw_fck_parent);
> +	if (IS_ERR(parent)) {
> +		ret =3D PTR_ERR(parent);
> +		goto fail_put_clk;
> +	}
> +
> +	if (!clk && !parent) {
> +		/* Ignore missing SCMI clocks */
> +		return 0;
> +	}
> +
> +	ret =3D pm_clk_create(dev);
> +	if (ret)
> +		goto fail_put_parent;
> +
> +	if (parent) {
> +		ret =3D pm_clk_add_clk(dev, parent);
> +		if (ret) {
> +			pm_clk_destroy(dev);
> +			goto fail_put_parent;
> +		}
> +	}
> +	if (clk) {
> +		ret =3D pm_clk_add_clk(dev, clk);
> +		if (ret) {
> +			pm_clk_destroy(dev);
> +			goto fail_put_clk;
> +		}
> +	}
>  	return 0;
> +
> +fail_put_parent:
> +	clk_put(parent);
> +fail_put_clk:
> +	clk_put(clk);
> +	return ret;
> +}

[Severity: Low]
This isn't a bug, but r8a78000_mdlc_attach_dev() already uses
scoped_guard(mutex, &r8a78000_mdlc_lock), and adding goto-based error
unwinding in the same function mixes cleanup.h helpers with goto labels.
Factoring either the list lookup or the PM clock setup into a helper
would keep them separate.

[ ... ]

> +static struct reset_control **get_rstcs(struct r8a78000_mdlc_priv *priv,
> +					struct fwnode_handle *scmi_reset_fwnode)
> +{
> +	const struct mod_id_map *map =3D priv->mod_map;
> +	struct fwnode_reference_args scmi_spec;
> +	struct reset_control **rstcs, *rstc;
> +	struct device *dev =3D priv->dev;
> +	s16 fw_id;
> +
> +	if (!map)
> +		return NULL;
> +
> +	rstcs =3D devm_kzalloc_objs(dev, *rstcs, map->size);
> +	if (!rstcs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (unsigned int i =3D 0; i < map->size; i++) {
> +		fw_id =3D map->entries[i].fw_id;
> +		if (!scmi_reset_fwnode || fw_id < 0)
> +			continue;
> +
> +		scmi_spec.fwnode =3D scmi_reset_fwnode;
> +		scmi_spec.nargs =3D 1;
> +		scmi_spec.args[0] =3D fw_id;
> +
> +		rstc =3D reset_control_get_from_provider_exclusive(&scmi_spec);
> +		if (IS_ERR(rstc)) {
> +			while (i--)
> +				reset_control_put(rstcs[i]);
> +
> +			return dev_err_cast_probe(dev, rstc,
> +					"Failed to get SCMI reset %u\n", fw_id);
> +		}
> +
> +		rstcs[i] =3D rstc;
> +	}
> +
> +	return rstcs;
>  }

[Severity: Medium]
Does r8a78000_mdlc_probe() leak the exclusive reset_control objects in
priv->rstcs if a later registration step fails?

reset_control_get_from_provider_exclusive() returns unmanaged references,
and get_rstcs() only calls reset_control_put() when its own loop fails.
If a subsequent call in r8a78000_mdlc_probe() such as
of_genpd_add_provider_onecell() or devm_reset_controller_register() fails,
the reset controls are leaked and remain marked exclusively acquired, so a
later probe retry will fail with -EBUSY.  Registering a
devm_add_action_or_reset() callback in get_rstcs() would release them on
probe failure.

[ ... ]

> @@ -249,6 +500,47 @@ static int r8a78000_mdlc_probe(struct platform_devic=
e *pdev)
>  	priv->dev =3D dev;
>  	priv->np =3D np;
> =20
> +	if (!IS_ENABLED(CONFIG_ARM_SCMI_POWER_DOMAIN) ||
> +	    !IS_ENABLED(CONFIG_COMMON_CLK_SCMI) ||
> +	    !IS_ENABLED(CONFIG_RESET_SCMI)) {
> +		dev_dbg(dev, "SCMI pmdomain/clock/reset support is disabled\n");
> +		goto fallback;
> +	}
> +
> +	scmi =3D of_find_compatible_node(NULL, NULL, "arm,scmi");
> +	if (!scmi) {
> +		dev_dbg(dev, "Cannot find SCMI firmware node\n");
> +		goto fallback;
> +	}
> +
> +	if (!of_device_is_available(scmi)) {
> +		dev_dbg(dev, "SCMI firmware node is not available\n");
> +		goto fallback;
> +	}
> +
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
> +	priv->scmi_clk_np =3D scmi_clk_np;
> +	info =3D mdlc_data->fw_info;
> +
> +fallback:

[ ... ]

> @@ -295,11 +604,14 @@ static int r8a78000_mdlc_probe(struct platform_devi=
ce *pdev)
>  		return dev_err_probe(dev, ret,
>  				     "Failed to register reset controller\n");
> =20
> +	/* Retained in priv->scmi_clk_np */
> +	retain_and_null_ptr(scmi_clk_np);
> +
>  	return 0;
>  }

[Severity: Medium]
Does retain_and_null_ptr(scmi_clk_np) leak the scmi_clk_np device_node
reference when the fallback path is taken after scmi_clk_np has been
found?

If scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK) succeeds but
scmi_find_proto(scmi, SCMI_PROTOCOL_RESET) returns NULL, probe jumps to
fallback before setting priv->scmi_clk_np =3D scmi_clk_np, and then
unconditionally clears scmi_clk_np via retain_and_null_ptr(scmi_clk_np)
at the end of r8a78000_mdlc_probe().

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795029012.gi=
t.geert+renesas@glider.be?part=3D14
