Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED28319847
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 13:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763127039; cv=none; b=GkqYvet1oyZVADx5Wq/5S7chRhv22NEpUAgmsPwLb+w/13h8InA8Zeqe1VNzP4ie/uRIuy6qa0P6qmJA1HKAl/JVygymh4cbv6iGnqeFN8dc/ip7vwIYhfdYZbiGPQGDkvjJNcueTgRCt6dAT3fqBkGotB2aMTvkY43Z5vYAfqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763127039; c=relaxed/simple;
	bh=XGyDo4LqxtpBLuczg+0iuG4Awh+JhQ1Wi8g5gNLY170=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShhhWXFhWnLbQOKbtHLD028iYtt4weRzSQIRMVp2LZ/XjIZlQPbR0h5y+kQERILLhon7tNNBdh1eTm02m3h7OUzUK7PdeRrheozvxFkZmnn0L5yaFDV6siEd5XDeky1EosDdHdOorbdbu80BMirVP0XvqiSBqHZZQd9ECpvVum8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KzfInjbx; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KzfInjbx"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42b38693c4dso986326f8f.3
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 05:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763127035; x=1763731835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RLiSyBxzCacFpRrMJeXNpJbRRbCeUrtYn7SsWh9poBw=;
        b=KzfInjbxs7BWFbu/Qg8qboDzrsT1aovbqn7ICUX5cEDSJwT+Jg9KLCy4SZE1KOHzQX
         yF+UvwoRKbJBAE9I/XheZLecx7iR0EL0iIswA92F3qLG9/447/laJb3gGvBP2UrUhRf7
         mLWGoUsJI+D8y6SYClMRlfuT+SgugxGBdDAnzOcNUYX3fF+QRvQPbcKmcK+kAjB1D0y9
         yZEUj9Fl53xs49zVEIB76yCWQej1b8QUXh9n1JMmjawMQRW2rVeSwYwryfab1jtIdDTW
         cZTB5YdeSBcSqLSKSy2+ZTsY4AQ+2QLZpOb7EXmHBxchcNso1PgveQSq+uAwnF/X+4vc
         2XbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763127035; x=1763731835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RLiSyBxzCacFpRrMJeXNpJbRRbCeUrtYn7SsWh9poBw=;
        b=YdZuWnljWyW05kPWd1mGhKEg58UyNEZF9SoR3yjxyeUPWWqxMQ9FBjBKVfd0M5wRgL
         es+JkxaWu96UWeMb40DIqvLB4h7LcVByocJFdvevyZhe57+Yfio0hEAPzbMs+YMQ1ryq
         G/SVU7RmVObb6W6gES5qs436udkUOGzXK9NutcgUlG3SPbvCgADpE+rV+BaS9wlvfjw8
         yBUkmsFn3dfHa0LdUlkKLxdCY+EHmvhpeyA8Fs9iNUw8oUZZG1UQ8R1P1H5hYXTCBv1v
         5xdXn3xSeqmk/5VlspRUXn4uBeqWyLi9iKwX4dNQChHLdvID68bo/tp52je6B0ML+IMY
         hkmQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZEKRwdWliGq6hltB0ZqiQynv2w/rUdNBq4aRBRIfZzLIaAjvPCEOXxbrMik6wpWTC2JgXvUH8Qmo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrgdWUig9u3hJsdUX/W7bBRCs0lxd986rIXW8dQ34dTZ74tmNU
	drkndyNGq0O8luYnPbhPj0jFghF62Qds0ZfNeVKaApVNLRPjLgZ+WCgW
X-Gm-Gg: ASbGncu8a2h6uoA26zmTZGIu4UgF0BekpXVRyfWkveeLVHLAK7Sf+A2pNy/VxDXz1te
	KP9Dosw6ky7D8nDHvnbPsqIcBb9gMJcDiBAQSH1Nr5In/eqsOceJB8ViQcq28/J4ptq0KpKm79Q
	kho2tpatUv+ElPHX5sSm0gfg5zQkQMKaBVe3C3o5rknRmku3gpHPji6731icvyPs4LwWMYFBUG/
	oUQl6xYAfOoCjTye7ZiQBGnmbjayGxpxEFxW90/8M+mTbsmfUpZNshCebspTkPS6ZAlqQKpOutx
	OBaSwLGoE3YPlTU+TmxFhw1Wsa3aWhrFkWlqfilVq5ge0cIOd3HhPjYOW8cKnDL+rU9AP5Vv1rm
	VT/dagJmJ0KLCiuLKlqCqcxZbAWIXWaj/fwZouD986X2qL02P1T+CN7p39N8Qk9HZIYQiCVczop
	N4BRuPWztsFXUSMz0GSVDI5ELvNpEiEKplTuJ5FiaylBlBXkwIBgTPpMRVVRMVWv/F5Lqdi1AEl
	A==
X-Google-Smtp-Source: AGHT+IGtw9+vFMKGdBkzC2iMdhNezX/RVOgAmM2RA0unvN+nz4Kf7Kpd8QEDSTj9Nw8LMYTpqShWMA==
X-Received: by 2002:a05:6000:2203:b0:429:bb21:94dd with SMTP id ffacd0b85a97d-42b59398e4cmr3336317f8f.46.1763127034720;
        Fri, 14 Nov 2025 05:30:34 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42b53f206aasm10033057f8f.40.2025.11.14.05.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 05:30:33 -0800 (PST)
Date: Fri, 14 Nov 2025 14:30:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, mturquette@baylibre.com, 
	sboyd@kernel.org, jonathanh@nvidia.com, linux-clk@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix memory leak in
 load_timings_from_dt() on krealloc() failure
Message-ID: <3wvnt4gywyffvqnxagp6c6h6oxxusboc5bascgng34mjshdamj@a75sqvemckg5>
References: <20251104074229.543546-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7yp2qls5f36b7k7w"
Content-Disposition: inline
In-Reply-To: <20251104074229.543546-1-vulab@iscas.ac.cn>


--7yp2qls5f36b7k7w
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix memory leak in
 load_timings_from_dt() on krealloc() failure
MIME-Version: 1.0

On Tue, Nov 04, 2025 at 07:42:29AM +0000, Wentao Liang wrote:
> The function load_timings_from_dt() directly assigns the result of
> krealloc() to tegra->timings, which causes a memory leak when
> krealloc() fails. When krealloc() returns NULL, the original pointer
> is lost, making it impossible to free the previously allocated memory.
>=20
> This fix uses a temporary variable to store the krealloc() result and
> only updates tegra->timings after successful allocation, preserving
> the original pointer in case of failure.
>=20
> Fixes: 888ca40e2843 ("clk: tegra: emc: Support multiple RAM codes")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/tegra/clk-tegra124-emc.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/clk/tegra/clk-tegra124-emc.c b/drivers/clk/tegra/clk=
-tegra124-emc.c
> index 2a6db0434281..ed4972fa6dab 100644
> --- a/drivers/clk/tegra/clk-tegra124-emc.c
> +++ b/drivers/clk/tegra/clk-tegra124-emc.c
> @@ -444,6 +444,7 @@ static int load_timings_from_dt(struct tegra_clk_emc =
*tegra,
>  				u32 ram_code)
>  {
>  	struct emc_timing *timings_ptr;
> +	struct emc_timing *new_timings;

Can we not reuse timings_ptr to avoid this extra variable?

>  	struct device_node *child;
>  	int child_count =3D of_get_child_count(node);
>  	int i =3D 0, err;
> @@ -451,10 +452,15 @@ static int load_timings_from_dt(struct tegra_clk_em=
c *tegra,
> =20
>  	size =3D (tegra->num_timings + child_count) * sizeof(struct emc_timing);
> =20
> -	tegra->timings =3D krealloc(tegra->timings, size, GFP_KERNEL);
> -	if (!tegra->timings)
> +	new_timings  =3D krealloc(tegra->timings, size, GFP_KERNEL);
> +	if (!new_timings) {
> +		kfree(tegra->timings);
> +		tegra->timings =3D NULL;
> +		tegra->num_timings =3D 0;

These two lines are somewhat pointless. The memory that tegra points to
will be kfree()'ed after we return below and the function will fail, so
nothing will ever access the memory anyway.

Thierry

--7yp2qls5f36b7k7w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkXLvcACgkQ3SOs138+
s6EHZg//ag3Ij35qO8R24R08YICA5PNy8S/hsOQPADvu2swgenuPr6Sc06YrYkBK
0Lxa6ge3dY28BlwkUL3G0OrYZp2ny+342ImoWlJooNSQfqmVZuXKPoUzwhrcotuU
42id12ubgDi1gd81F2ch0zK8ELMMeSKUtLHCsAj67f3fxouJ5Zit9CeVEMlETSz8
DV0DRURkT3p1jDv5jWWg/FYJ64EUAomlIhQDA8O6MizmIa9TkinFelAOdR+mTOZS
FFHRE4rZDnUabnGa/QUEqigtaKxAUBrb6uo97gYjBEYGtcLZBLJFr0Byip3a9ADT
g7X9lCl/hVABgndi1WvK0zC1RW0FDOKa+VHxyLnW48S7xoQydUTMAOp/qoTYrDvD
MFB+hH/9+OZsI77f4hnSlOu9MBPw2ljVOiUavNNrVnsCbvzWDrNcswiYfp4o+Rf/
LruqBJ3rYzprXJTlRl7zc1x6BtaFSGydirm630PlY9SeymEdhST3l5gEoSV9kG9v
wJ0e1xGywskfttyoLEgd6r2LOAmSpxQ88hgvrK/wr9Mw5LxQuHs11Hzij2/0rNRc
nf54Z9yxGpVQHeZxbNM8TRf6QGYP3FENPqT+tedfQaGjQPA6F87TmejvVMxC3+A1
wmLNfQcvUt2VkmaHfLsdTWBY62kRBKdCnCNvnf9veqGsmezeuyU=
=JsgF
-----END PGP SIGNATURE-----

--7yp2qls5f36b7k7w--
