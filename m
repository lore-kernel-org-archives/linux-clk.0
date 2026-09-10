Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DFF1305E28;
	Thu, 10 Sep 2026 14:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050579; cv=none; b=vGParVCNTFesemYrjHbF9lAeMP9A/qBi1J7sWd1yESfM7UY37tjW9jincaBSQiaxs8Vp+Vgz4rdKz/lnJBLKtxie+gEmPZZ96J4EtxibP4M+kkeZPiTF0+cXYach61fmu6jSSqP5B8W9Pz9oLH3MO0IL9W/bvs1jw20gtx4Qr6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050579; c=relaxed/simple;
	bh=fBgq+4EXbbBzYBIR7ucTK9fodXJD1/OdrZQjldBQG+0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AkO6VlWCOiC+jh4OYguAEp/Dxa2Xf1Iyxfqrh6Ixziq4i+yQg1CVFtlgdesUG/rpP7z0UbPde8zI4t7WszfhUGhL7d6BWu7A0uBUHN9wB3IiedNhMVHg23Q2V7GLIH1REl2TSeQuauynK7v20H6gKepmOsJ6IiuPIdllh2zRQ7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m9XiHodu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m9XiHodu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6600C1F00893;
	Thu, 10 Sep 2026 14:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050577;
	bh=g2ipk3FGdDiuJSIVg6cvJJi7pD92TIsjkS0FwcC7cZg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m9XiHoduQF/ghyZTBxunx0bijrjO9fnKM0heIo4K6O+SZWvL4eaNrzEDspPU+jizn
	 7e3QE4orPZquuho4kktIUf36obhBOgXUzqhJAc4rDREDZZ+p0sd8+HZqEiJi4bCctp
	 DOzE3ZS/FzVYiQKfYkCm2mADgVTTnaO9oFLC0ceP5YZvQcSUpTY0fel6H5WRNAI30t
	 6hUhicEeRZ1OUAyL/RI0n3YJuAmm51q9rF2Rk5VvEE7OgRWU2946JZtg8/WgLygere
	 j0VUhKeEVNdW2TeqbAIrZelChIfepZQypNqQuhn2DyuNLohN+k4GzPqWdN3NflRZKt
	 NtgoIm+IFCc1A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 6/7] of: property: fw_devlink: Follow clock nexus
 maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-6-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <20260910-fw-devlink-nexus-ready-v2-6-17ac82dbe226@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:29:36 +0000
Message-Id: <20260910142937.6600C1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Stack buffer overflow in `of_parse_phandle_with_args_map` due =
to unchecked `list_size` against stack array bounds.
- [High] The function `of_parse_phandle_with_args_map` can infinite loop if=
 a device tree contains cyclic `<list>-map` properties (e.g., a cyclic `clo=
ck-map`).
- [High] Out-of-bounds read of `*-map-mask` and `*-map-pass-thru` propertie=
s based on unchecked lengths.
--

commit 44ed61de7bd2d691043db2b6326c916f60e9f97b
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of: property: fw_devlink: Follow clock nexus maps

This patch modifies fw_devlink to resolve clock properties using the
map-aware parser instead of a direct phandle reference. This allows
fw_devlink to correctly identify the clock provider when clock nexus nodes
are used, preventing indefinite deferral.

Link: https://lore.kernel.org/all/20260807-schneider-v7-2-rc1-eip201-upstre=
am-v5-0-8785f9531cf0@bootlin.com/

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index a9c51d639a2b5..48e05f7bae2fd 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1422,7 +1422,7 @@ struct supplier_bindings {
>  	u8 fwlink_flags;
>  };
> =20
> -DEFINE_SIMPLE_PROP(clocks, "clocks", "#clock-cells")
> +DEFINE_SIMPLE_NEXUS_PROP(clocks, "clocks", "clock")

[Severity: High]
This isn't a bug introduced by this patch, but by switching fw_devlink to u=
se
the nexus parser for clocks, it will now aggressively call
of_parse_phandle_with_args_map() during early boot for every clock property.
This exposes a few pre-existing flaws in that function to malformed device
trees, which can now crash or hang the boot process.

For instance, can a cyclic clock-map property cause an infinite loop here?

drivers/of/base.c:of_parse_phandle_with_args_map() {
[ ... ]
	ret =3D -EINVAL;
	while (cur) {
		/* Get the <list>-map property */
		map =3D of_get_property(cur, map_name, &map_len);
[ ... ]
		out_args->np =3D new;
		of_node_put(cur);
		cur =3D new;
		new =3D NULL;
	}
[ ... ]
}

Because there is no depth limit or cycle detection, a self-referential map
will cause the kernel to loop forever.

[Severity: Critical]
This is a pre-existing issue, but does this loop write past the end of the
initial_match_array buffer?

drivers/of/base.c:of_parse_phandle_with_args_map() {
[ ... ]
	__be32 initial_match_array[MAX_PHANDLE_ARGS];
[ ... ]
	/* Get the #<list>-cells property */
	cur =3D out_args->np;
	ret =3D of_property_read_u32(cur, cells_name, &list_size);
	if (ret < 0)
		goto put;

	/* Precalculate the match array - this simplifies match loop */
	for (i =3D 0; i < list_size; i++)
		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);
[ ... ]
}

Since list_size is read directly from the device tree without being clamped
to MAX_PHANDLE_ARGS, a large #clock-cells value will overflow the stack
buffer.

[Severity: High]
This is a pre-existing issue, but are the mask and pass array lengths verif=
ied
against the property bounds before access?

drivers/of/base.c:of_parse_phandle_with_args_map() {
[ ... ]
		/* Get the <list>-map-mask property (optional) */
		mask =3D of_get_property(cur, mask_name, NULL);
		if (!mask)
			mask =3D dummy_mask;
		/* Iterate through <list>-map property */
		match =3D 0;
		while (map_len > (list_size + 1) && !match) {
			/* Compare specifiers */
			match =3D 1;
			for (i =3D 0; i < list_size; i++, map_len--)
				match &=3D !((match_array[i] ^ *map++) & mask[i]);
[ ... ]
		/* Get the <list>-map-pass-thru property (optional) */
		pass =3D of_get_property(cur, pass_name, NULL);
[ ... ]
			if (i < list_size) {
				val &=3D ~pass[i];
				val |=3D cpu_to_be32(out_args->args[i]) & pass[i];
			}
[ ... ]
}

Because of_get_property() is called with a NULL length pointer, if the
clock-map-mask or clock-map-pass-thru properties exist but are smaller
than list_size elements, mask[i] and pass[i] will read out of bounds.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fw-devlink=
-nexus-ready-v2-0-17ac82dbe226@toradex.com?part=3D6
