Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795797608;
	b=PQ7jobZdWdN34VZbdS28y2YwEoG85USHSj+1Ids1xjW8+l8Z5UUWuQWlmRhqEwZ+JsuH
	 UpNUB3ay2lSGoBcsTwBQT7Cp0++DHfLIKJ2iF2Cl0tdFZDNuf/WyXvL8ubYjVbTIHHpQ3
	 pyQbcihxKQIrJfgC5x08nF2tT1u8N1PqRabI9rQ1Sd84QrI+aE/emOhDhFf2QtpL9sV1f
	 Y7CrZHAa1y5soIf44J8PBy4+kd3CwAGkpkC6lZRRqOlu7qSmRcY7KlZO/4lplZDcZ5E1+
	 eqCA2sYq99C5qdF0qa3ARs4ANsoaEHvcZkNBYnjOORQvuz+/aB3E3RDRGQzuZUgo2og==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795797608;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=ACOt+QaxpLA5NERudLEOoYNMpeiiu7/ocr887Em0ZUw=;
	b=ctGLpc3gPyIb0WPJB+UG5i4A8EyVmDOxh0CIGXi22yVPaK5GNUrEFPTNkuuDL64yq6KG
	 utnVfJTq5mgO1UtOcW6GFs0Gj1xDcBSBD5TIL0aoOLKez0dCQMYW3N44psbERhDJbCpEh
	 CKC7X5IqafTvynXKw6BI9Mj9Jvtq9ckeSRdpsYrjHlYRnJf+PplrKUA4nzS9CNxa1Tf99
	 c7L6M/cLN9P8Lk1zUlTkb+4FcaH+7XSf1NkOEbYnaPOdNWGfCdviNnoDyQ3j/jDwxtM5D
	 V3H24sl+FivPKxHA1U5lXs9tlF/IM6kpB7yfiMiyinai+pPAn4SRgG2h3IDp3Sk7kWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NErW5z9j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DB8606A69B;
	Fri, 27 Nov 2026 16:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NErW5z9j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9643A1F00898;
	Fri, 27 Nov 2026 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795797607;
	bh=ACOt+QaxpLA5NERudLEOoYNMpeiiu7/ocr887Em0ZUw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NErW5z9jy7bNksEsEfDyFWFmMBfo+nueO0QU3k0dXsJtDQe9gQUaRrYRGGpeEQC/2
	 HzGoP03ggGE8elQe5GtxLPYOif1AhOa9ga8uXn4vpsLLBYY7mg9A+minfaSPGiX8ON
	 CIzmGpwuJ+4yws8JClqG4YUI7LVgvMlVDI7sVgvWCccvAtQVtrYKv71N6j63sbGJsp
	 xFLGayYtoM6k19TjYTjwj39sPqi8GFt0Coyt0fHHECxCbUrk351vaBZjS2Z/gvhFQa
	 rgLOjVIYTmQxWI6IDezQlYV0omKzFRHUyjSVduIP/8WSm9DQWBv+v0FhIrcA6wuep0
	 ydbGoyljN+hhg==
Message-ID: <sashiko-outbox-237909@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 13/14] pmdomain: renesas: r8a78000: Add SCMI
 remapping support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert@kernel.org>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <21bac4cbc704669700d62351ec8aefe1165b90ce.1795796064.git.geert+renesas@glider.be>
References: <cover.1795796064.git.geert+renesas@glider.be>
 <21bac4cbc704669700d62351ec8aefe1165b90ce.1795796064.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 16:40:07 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] pmdomain: renesas: NULL deref in r8a78000_mdlc_put_rstcs() on
  error
- [Medium] pmdomain: renesas: device_node leak of scmi_clk_np in
  r8a78000_mdlc_probe()
--

commit 8f10b43c90068feddde62d11d56b7f918de1b8e1
Author: Geert Uytterhoeven <geert+renesas@glider.be>

pmdomain: renesas: r8a78000: Add SCMI remapping support

This commit extends the R-Car X5H Module Controller driver to remap
hardware power domain, module clock, and reset IDs to SCMI firmware
abstractions when SCMI is available.

> diff --git a/drivers/pmdomain/renesas/r8a78000-mdlc.c b/drivers/pmdomain/=
renesas/r8a78000-mdlc.c
> index 733bf68dab2ce..654c46f581478 100644
> --- a/drivers/pmdomain/renesas/r8a78000-mdlc.c
> +++ b/drivers/pmdomain/renesas/r8a78000-mdlc.c
[ ... ]
> @@ -178,8 +280,165 @@ static int r8a78000_mdlc_attach_dev(struct generic_=
pm_domain *domain,
[ ... ]
> +static void r8a78000_mdlc_put_rstcs(void *data)
> +{
> +	struct r8a78000_mdlc_priv *priv =3D data;
> +
> +	for (unsigned int i =3D priv->mod_map->size; i--; )
> +		reset_control_put(priv->rstcs[i]);
> +}
> +
> +static struct reset_control **r8a78000_mdlc_get_rstcs(
> +					struct r8a78000_mdlc_priv *priv,
> +					struct fwnode_handle *scmi_reset_fwnode)
> +{
> +	const struct mod_id_map *map =3D priv->mod_map;
> +	struct device *dev =3D priv->dev;
> +	struct reset_control **rstcs;
> +	int ret;
> +
> +	if (!map)
> +		return NULL;
> +
> +	rstcs =3D devm_kzalloc_objs(dev, *rstcs, map->size);
> +	if (!rstcs)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (unsigned int i =3D 0; i < map->size; i++) {
> +		struct fwnode_reference_args scmi_spec;
> +		s16 fw_id =3D map->entries[i].fw_id;
> +		struct reset_control *rstc;
> +
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
> +	ret =3D devm_add_action_or_reset(dev, r8a78000_mdlc_put_rstcs, priv);
> +	if (ret)
> +		return dev_err_ptr_probe(dev, ret,
> +					 "Failed to add reset put action\n");
> +
> +	return rstcs;
>  }

[Severity: Medium]
Can r8a78000_mdlc_put_rstcs() dereference a NULL priv->rstcs pointer if
devm_add_action_or_reset() fails?

r8a78000_mdlc_probe() only assigns priv->rstcs after
r8a78000_mdlc_get_rstcs() returns, so calling devm_add_action_or_reset()
before priv->rstcs is set causes the failure path to index priv->rstcs[i]
while priv->rstcs is still NULL and leak the reset controls in rstcs.

[ ... ]

> @@ -249,6 +517,47 @@ static int r8a78000_mdlc_probe(struct platform_devic=
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
> @@ -295,11 +622,14 @@ static int r8a78000_mdlc_probe(struct platform_devi=
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
Does this leak the scmi_clk_np device_node reference when SCMI_PROTOCOL_RES=
ET
is missing?

If scmi_find_proto(scmi, SCMI_PROTOCOL_CLOCK) succeeds but
scmi_find_proto(scmi, SCMI_PROTOCOL_RESET) returns NULL, probe jumps to
fallback without setting priv->scmi_clk_np, and the unconditional
retain_and_null_ptr(scmi_clk_np) at the end of probe prevents the __free()
cleanup from releasing scmi_clk_np. Using no_free_ptr(scmi_clk_np) when
assigning priv->scmi_clk_np would avoid retaining it on the fallback path.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1795796064.gi=
t.geert+renesas@glider.be?part=3D13
