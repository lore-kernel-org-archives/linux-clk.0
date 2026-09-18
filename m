Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7447F4FC343
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 13:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739693; cv=none; b=C7ed5f80msKd5J8PYdIfqdegREtf0a+pTkcYX5sPvJrvDIfd5gXgtZ9utnnUk9Hr3pYzKiww3/nxXO8Qrvc6I1M03oCymCVyU5i1TzHi2Pceo30RIriNSAKinWJvy2hlW8rn2DOVhr5QS8tNJJSKfOCwiIDTUfPzWY+kMEcVs1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739693; c=relaxed/simple;
	bh=yp7HMr0aWV681B77Js62TvRWsJBPqCQDHzf1UvVZYLo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TlyeelZZu0ONQK0BuvQ7W4zKaGSC2wSFDMCp3DjD62YpZeiY1wTuLixqc1/Lc5ruoU6MGk2VD4lM8/i3c75UKBgkyYSC1u6oXCDG1yr5U1crH5wzMEyR3s6cESjN3SJ3XfL0UTHUNVyA4+du0rY5rcF2LOMtQZvQPi8ore3uWHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=cMO984W2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="cMO984W2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd4ba9f68so10619555e9.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 06:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789739682; x=1790344482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BctPu7dKYbEuQZ+gJ77lmkNhAUrzQqQjO9Xv3Wy0GBA=;
        b=cMO984W26/UJrtafZkWGlKSPKU0rOOGFZuf4OXO+TEaQbDSrpuSlMrcCF26cktzsuX
         Oqj2QBZGP7t1Qs+aQf4jtrcbwUbzZ/YP1H7YzSEkrc/h2oEWltX6ZCjeMXjd3X/HBMMy
         9suiT21DmANn8BXVPUA9NdxtaSxtXc7ruVX0ElUqRSjbLMvpE+1qRI8JGOuGsrQ+d+iw
         Syzryc/r4xlSWiknSzs0qtzwRkSyCZqQqLxfs5DRs5lG2O+WqD1uZjhHj2HA45X327ct
         kpLUc8Cn6dilH+v6cO6T4SGgO4vZs1rGZ7Xzhxep5YI03UTEVCa5ZNM6CjlCBid31/jt
         Jt8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739682; x=1790344482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BctPu7dKYbEuQZ+gJ77lmkNhAUrzQqQjO9Xv3Wy0GBA=;
        b=VsEGlA7zcx/0ntYV94d0MJ5WzJttAw3QRaR2DxOR/fc/NwMI/sXU7H9cJcHX90mijn
         XqWnc0+EnaPyhIH0PIlmhXEBjJi2X3k0H7rMHrznapBf6kirzhXXLSfglOGN4Sq0mkky
         wLjkiGNjrt0MwSXbO4pY1knZgbmyeGjd+1dD6qiFNovZxroEvbpLowfAcV6QK5KnYtY4
         9pO8kjauhvACScj7ctJPbwI2+p8kvoE9MmM/DDIJnGbEZ0sifq4HgcCGd4CISxem1ql2
         rUK9J23sFjMrRG5C/uH9PobweoMEmq1vLUGkG3MKXYtciwneOokTFEK7MBIhgHVf3fyS
         mLZQ==
X-Forwarded-Encrypted: i=1; AKwUvByoB0qz6YoOQOC9JOPECuNWwOcIFoZPvkGQ6RtW3XYd0GPU3UD/D6yUqtnXl30L8gSBGxuMQF0lyZg=@vger.kernel.org
X-Gm-Message-State: AFuF++mYsmBUZ42XEPUj9NkvpUSaVvAmRyKFxupsR3i75aMdEfj6ZHKK
	dSSrsspDDFaNA2ud3sZK90yO1bPaU4WEw5pw8fUo7jGyaaswIdaT96nEBVuN1ksj0Eo=
X-Gm-Gg: AYBFou0bJMrYKyJXk7ghzbrDQ0mQGfcw0UNZ8DvZHYohjZEgaokwWHq6fLTR/UP2F+5
	lMFszf2fDpRhVboMvNw/OEoa0qWlNhDRXhT5ynP7ohTSeoKDtByh4RP2eoHHVJf9WPQHBnQKSKo
	bA+G0dF8rZAF8dBXaAqp7uBToISAHQl0PmGcI6088n/i40fuGcImL5ohIW833Wch8/3b+8kfnzl
	i98K+BNzll2JGXf6/HtqE9d8sbx/nSDdb9GiGuz/tWO7XKBtkNnhgoQq2D+mvzxsmkjMDFo1ezP
	S8GbSvXmHSInZaZ3JubD1JbkAU+IRRGL8F0ba8Qwo+5pT4XYUl34uFIvAVg1eVi0RG3KDFLz2Gt
	f9iXHLzn9ets97DWehGo9xyc5bOlPzos2VjlPlyo16iV6tzVbhip1oHbM7urO8oPxNgNKWWoLGS
	k7MPRjvn6WHe37h2ykXggnBPTZvH/zgsgiVhTw0TBjiX4BpyoRRSFXdJGiH4CJAw2vT0BWb5JDn
	3k0Fz4MjwjSBGr5QU6Uh0SbkIm64g3nLCfBU2Bqk7nH1geg5QHaY45ez2SD4Q==
X-Received: by 2002:a05:600c:310e:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49fc5681249mr33668935e9.5.1789739681828;
        Fri, 18 Sep 2026 06:54:41 -0700 (PDT)
Received: from localhost (p200300f65f19a90444c8989fe13f5be4.dip0.t-ipconnect.de. [2003:f6:5f19:a904:44c8:989f:e13f:5be4])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4872008023dsm4183569f8f.29.2026.09.18.06.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:54:40 -0700 (PDT)
Date: Fri, 18 Sep 2026 15:54:39 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
Subject: Re: [PATCH v2 4/7] of: property: fw_devlink: Follow PWM nexus maps
Message-ID: <aq1CSswlo57jZpMH@monoceros>
References: <20260910-fw-devlink-nexus-ready-v2-0-17ac82dbe226@toradex.com>
 <20260910-fw-devlink-nexus-ready-v2-4-17ac82dbe226@toradex.com>
 <20260910143106.B457C1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="izmtx4jkinsmqk5r"
Content-Disposition: inline
In-Reply-To: <20260910143106.B457C1F000FF@smtp.kernel.org>


--izmtx4jkinsmqk5r
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/7] of: property: fw_devlink: Follow PWM nexus maps
MIME-Version: 1.0

On Thu, Sep 10, 2026 at 02:31:06PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>=20
> Pre-existing issues:
> - [Critical] Missing bounds check in `of_parse_phandle_with_args_map` all=
ows a malformed Devicetree to trigger a stack buffer overflow.
> - [High] Missing cycle detection in `of_parse_phandle_with_args_map` allo=
ws a malformed Devicetree to cause an infinite loop.
> --
>=20
> commit 17ae1bc408452875cfad3c0d990add52c676f9b9
> Author: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
>=20
> of: property: fw_devlink: Follow PWM nexus maps
>=20
> PWM consumers use of_parse_phandle_with_args_map() to resolve specifiers
> through pwm-map properties. fw_devlink instead parses the pwms property
> as a direct phandle reference, so it records the nexus node as the
> supplier rather than the mapped PWM provider.
>=20
> Use the map-aware parser for pwms so fw_devlink resolves the same
> provider as the PWM consumer API. Direct PWM references continue to work
> because the map-aware parser returns the original provider when no
> pwm-map property is present.
>=20
> Link: https://lore.kernel.org/all/juuc4af7ndbajcl7gzf4tg5qz2q2j5tt3rvql4j=
bauradujrre@gc5nbdhhixaf/
>=20
> > diff --git a/drivers/of/property.c b/drivers/of/property.c
> > index eba7e9fe6c386..a9c51d639a2b5 100644
> > --- a/drivers/of/property.c
> > +++ b/drivers/of/property.c
> > @@ -1426,7 +1435,7 @@ DEFINE_SIMPLE_PROP(extcon, "extcon", NULL)
> >  DEFINE_SIMPLE_PROP(nvmem_cells, "nvmem-cells", "#nvmem-cell-cells")
> >  DEFINE_SIMPLE_PROP(phys, "phys", "#phy-cells")
> >  DEFINE_SIMPLE_PROP(wakeup_parent, "wakeup-parent", NULL)
> > -DEFINE_SIMPLE_PROP(pwms, "pwms", "#pwm-cells")
> > +DEFINE_SIMPLE_NEXUS_PROP(pwms, "pwms", "pwm")
>=20
> [Severity: Critical]
> This isn't a bug introduced by this patch, but this change exposes a
> pre-existing stack buffer overflow in of_parse_phandle_with_args_map() by
> parsing pwms properties automatically during early boot.
>=20
> Does this code overflow initial_match_array[]?  If a provider node in a
> malformed Devicetree has a #pwm-cells property larger than MAX_PHANDLE_AR=
GS
> (16), list_size is read without bounds checking:
>=20
> drivers/of/base.c:of_parse_phandle_with_args_map() {
>     ...
> 	/* Precalculate the match array - this simplifies match loop */
> 	for (i =3D 0; i < list_size; i++)
> 		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);
>     ...
> }
>=20
> Because fw_devlink now automatically calls parse_nexus_prop() and
> of_parse_phandle_with_args_map() for all pwms properties, this regression=
 can
> now be trivially triggered without requiring consumer drivers to probe.

Does this need

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d71ae0449360..68d3eaa86742 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1579,6 +1579,9 @@ int of_parse_phandle_with_args_map(const struct devic=
e_node *np,
 	if (ret < 0)
 		goto put;
=20
+	if (list_size > MAX_PHANDLE_ARGS)
+		return -EINVAL;
+
 	/* Precalculate the match array - this simplifies match loop */
 	for (i =3D 0; i < list_size; i++)
 		initial_match_array[i] =3D cpu_to_be32(out_args->args[i]);

?

Best regards
Uwe


--izmtx4jkinsmqk5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmqtQp0ACgkQj4D7WH0S
/k4i3Qf/ZU6j+f+F7wEOu0lkTb81o0hWsS22SRSxwiuDLT4jWT5t4IuoK/x5BS40
JKehGVJAkVNIKR1zWwqVGuq88y1UfVBj1TvaBL5be1eUZ2UmVQ5J9kcH3TNVHTD/
b4XoZbJncEfEx7aB22zQmXPepdavf2m8L2Slxa4L6fk465otOat2RcnetYXb4l+6
Q3zxUPTZrevAOJxTIR7RwwV5LC67fFVGfn8aIQ9nHMOMKruF8nVKVmJyxqaSTzx+
QLAOsskHoXZSvj2rNgWXxfMJgovl8D1qiVSJyuFWeeWMootDtMgQfU2FR8HhJvJ4
pUzkPXQobT0JAAUTcSA216S0XpJZOA==
=lw9L
-----END PGP SIGNATURE-----

--izmtx4jkinsmqk5r--
