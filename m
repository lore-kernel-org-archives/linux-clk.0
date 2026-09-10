Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B58F391E43;
	Thu, 10 Sep 2026 14:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789050668; cv=none; b=r9Gawa97VW2fUftOaETkJ0mfAr6IZxqGh+DyLmWmTgMibRQsDs9ttc+7GkRbsh4ZoMIg2g8zWBCLrSu8HCwxRw2GzwBHUhH7i3oMklwJa9K4PXjxr8DkQiq7Mf8j2BOaRQ2TqX5cVf8/DAAvczeFcGUHTkK7T07VYitz+TLwbcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789050668; c=relaxed/simple;
	bh=TQV7TMBdjXuzMqe2zt+ZNX9y1pV3b9FZEE9+hKn6H88=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M8QIVuQRoJYw70VLgEf/FZgd7YVAWkaHSjTaLsSvMofXahHIIYIjsY/j2k7YBT2Y0c2BbLYmWbmgWx0P/u7l/AQsd33/jtZtvRXvPvY2Q925s87IUAW9A+QXEWsNWPElNm53DfbEDDHzD3b5wvoTji5ur7yg25lSa1+IEH6gz1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oDv/CtRE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oDv/CtRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B457C1F000FF;
	Thu, 10 Sep 2026 14:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789050667;
	bh=F6nX85DmNqzMGljX4iCOhMDoKE7JfZJAMbsQSV8CxLo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=oDv/CtREoktS6M7rAzQvQqv3CmJ1wiyvurOIzT7tz+NCJkPfSD5VhFhpY0eEoJ3Gr
	 Sw1m1jmlV4cbXMwxathDgQiowJNAsMzUPujgt/rNWU2rugbvavRnRaokuL4W3s9IEC
	 Eju+dPL+ngIeP3wzWg8ikdDjw7g8/Na5mHA8f8wMGC9LRth1Xxki0F28o/t/IlDM9R
	 aHcQZDDpgS7cOx3on+1favvQnKwI6I8e4zfuhz9bK4kg9e7oFkOsn2+NToxk2AMW3F
	 cgCptrMfXaOPTVegZsxm9Xo7sSBLN/1dRYwJmYX9G6G4IY8vnhr+p9T7mK+PoqtCBL
	 de5nejWAkYNZg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 4/7] of: property: fw_devlink: Follow PWM nexus maps
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ernest Van Hoecke" <ernestvanhoecke@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260910-fw-devlink-nexus-ready-v2-4-17ac82dbe226@toradex.com>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <20260910-fw-devlink-nexus-ready-v2-4-17ac82dbe226@toradex.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 10 Sep 2026 14:31:06 +0000
Message-Id: <20260910143106.B457C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [Critical] Missing bounds check in `of_parse_phandle_with_args_map` allow=
s a malformed Devicetree to trigger a stack buffer overflow.
- [High] Missing cycle detection in `of_parse_phandle_with_args_map` allows=
 a malformed Devicetree to cause an infinite loop.
--

commit 17ae1bc408452875cfad3c0d990add52c676f9b9
Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

of: property: fw_devlink: Follow PWM nexus maps

PWM consumers use of_parse_phandle_with_args_map() to resolve specifiers
through pwm-map properties. fw_devlink instead parses the pwms property
as a direct phandle reference, so it records the nexus node as the
supplier rather than the mapped PWM provider.

Use the map-aware parser for pwms so fw_devlink resolves the same
provider as the PWM consumer API. Direct PWM references continue to work
because the map-aware parser returns the original provider when no
pwm-map property is present.

Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4jba=
uradujrre@gc5nbdhhixaf/

> diff --git a/drivers/of/property.c b/drivers/of/property.c
> index eba7e9fe6c386..a9c51d639a2b5 100644
> --- a/drivers/of/property.c
> +++ b/drivers/of/property.c
> @@ -1426,7 +1435,7 @@ DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
>  DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", "#nvmem-cell-cells")
>  DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
>  DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
> -DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
> +DEFINE_SIMPLE_NEXUS_PROP(pwms, "pwms", "pwm")

[Severity: Critical]
This isn't a bug introduced by this patch, but this change exposes a
pre-existing stack buffer overflow in of_parse_phandle_with_args_map() by
parsing pwms properties automatically during early boot.

Does this code overflow initial_match_array[]?  If a provider node in a
malformed Devicetree has a #pwm-cells property larger than MAX_PHANDLE_ARGS
(16), list_size is read without bounds checking:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
	/* Precalculate the match array - this simplifies match loop */
	for (i =3D 0; i < list_size; i++)
		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);
    ...
}

Because fw_devlink now automatically calls parse_nexus_prop() and
of_parse_phandle_with_args_map() for all pwms properties, this regression c=
an
now be trivially triggered without requiring consumer drivers to probe.

[Severity: High]
This is also a pre-existing issue, but this patch similarly expands the att=
ack
surface by triggering it automatically during early boot via fw_devlink.

Can this loop run infinitely if the Devicetree contains cyclic phandle maps?

When following <list>-map properties through nexus nodes, there is no cycle
detection or maximum depth limit:

drivers/of/base.c:of_parse_phandle_with_args_map() {
    ...
	while (cur) {
		/* Get the <list>-map property */
		map =3D of_get_property(cur, map_name, &map_len);
    ...
}

If a pwm-map property contains cyclic references (e.g., node A maps to node=
 B,
and node B maps back to node A), could this cause a system hang or deadlock
during boot?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260910-fw-devlink=
-nexus-ready-v2-0-17ac82dbe226@toradex.com?part=3D4
