Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A37435FC18
	for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 17:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757611353; cv=none; b=J2HMaFnSgsEryRCeaVghsUG9upM7eJkUMyEfG2clWaHi/TV/9zwjSTYrXWPUFL6UjPNSOOZqlBkiqmqZNLYYYip4CqsCofVppQDT4h8YCVRMdNPDrLED6lCEngMKZ2EP3S/npDzDmpU89Id+j3NapvjsdTV3gWZBPJczz54erxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757611353; c=relaxed/simple;
	bh=6SGthHS4qrvYOf3o0liwoAGvJXCeYkPogYQn1CUGiwo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=THtIAKrwYbX7FDv4lvwH9vY3KZztqYarjWWrz7aG7+++8C0vcRXt91feLDB6SV3FemRS512XFIxqaP172zrqy92+Gmdr05tp3QW5JmRoZjscfrRAkzja9wFEhE+MQD+ClfDqgYRO2CEKkCunW7JkE48SwvjzxpoYKMmq1JsIHOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NrD2ri/X; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NrD2ri/X"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3e751508f21so771646f8f.0
        for <linux-clk@vger.kernel.org>; Thu, 11 Sep 2025 10:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757611350; x=1758216150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=al+SGVJLrQ5Ai/9RbesG/7WJAj4tFEzw9mmlTmlbQoY=;
        b=NrD2ri/X+HgTLoJdS5cK3jk/4XvZ/tr7aKsdf6UxEr52HXyXTc1RGcHizDLthifJcd
         bES/yBJ9mtCLx3aUJ5G9XNO44NLVj5t8DkPubgRI64qkdUuVM5PMvqFLiVy3CZlY9Rx0
         ErfvxL7JWpX7xgAHdZrLJ/346oPk1AZ8ep7R01fTjmEtErwZzpSJW3SMQQh4F+BXaJrU
         dr7Wb9EPHMb5gGnBq5MzpVjzwJyooz6WAtLyyv2Qo6IPBnrdTtTVWk+AyD0zTa1wtUXI
         6on7dzQIFFdfISzzhnvQ6hsCr2JMYsk7LC1tO7Nf9jOdAwQOSJc/hvLNhEaGZ0zF/4nd
         LAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757611350; x=1758216150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al+SGVJLrQ5Ai/9RbesG/7WJAj4tFEzw9mmlTmlbQoY=;
        b=NoQmSu/B7YQx9zE+BdtLr91ZgsbXkLqmi3uutF0FGSrNwnZZa5m68iYW8eIUOSKabR
         rhIIyP9dXy6LofGLIET1rphTgo6t5p5q4gjrZSZvCXr3LFt9OTOQyk9CN46XzGsf/cJl
         uMuIyM1mdUGE0TUgv5myOxR2YZP+L8SjmrCM9I7FxORO1sIPjE7TYSjpN/LGgeeB0DJf
         HdeO2ODiYjBrDSknnkLTQ5tawRnUUngxowWQffW8tFjzWFBeKwsEmy+o8nOPrjuE8wk2
         lv2eZzcgzI+HAyOG5WLAktyC2eEZmlOMZgY1Xv1SbADuXpfazGRZuyw852uC9ZNzuLqM
         ed9A==
X-Forwarded-Encrypted: i=1; AJvYcCVLly5fIjp5hV3kKnvQlfos8LMVYrqiLKQO8bx6z3H7VJkmfkyj1mZMqOYNOIbEmOt3Sd2B2xwt0t4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeOxHzY0zQcMO2t9hgK1RZInwC74HgXNFeEsIgrOwEbJ0izBE+
	BSSx84Kto7XMeYPfXLEqTMBdEXVueV7nJ/mCwZv7jmoCpzingzaAWi5K
X-Gm-Gg: ASbGncu9l++Jc74quvIrCWClddBig2z+GSHj/UGRCn7fR0FhzeJUws1AfgZpXDAZGBU
	Qupt3C0GOlBRBrhlWZwklf1ZzdzIZGiffIAKzIs2jn2JEkvFULFARvS4b3FCkyzwuqDTmeiKTxW
	PKG6X1I+DtVQFfSvLwj2FUZ9QqM16UCdaUa80lGVCEuEqynCyAMFGgb38SrHXOGem/LKRlgRx+v
	XjMM6TQ28ZGfyzfI7qN40xVBp6YnbqZuWnm7ZtP8kB0uxac4n0RgUhk0rxpNP2lYUWRzCYgFjxM
	IbB+Pixv7iHeymPOAjWu5k9esjtpqG5WvY4G/w4oKOHskpV6ZcCNHSKTyjruM8Tyx7sCk0Hvfa9
	KGt1Wn0izS9zrZpQOkepgdaZFaW8VF8moJ529XDrVE7hOsjv8KArjpAziM+7YsuaIaeT4qfKmu9
	o8ZBNc2YGo
X-Google-Smtp-Source: AGHT+IEkwCAU/UDUcPwD0Y2oC6Cjayd4uEvKVlhGx0N1h1LmikPqq6SKErYIBBoArS7lWmOvMtPcYw==
X-Received: by 2002:a05:6000:26c1:b0:3e3:2c0b:dc3d with SMTP id ffacd0b85a97d-3e7657b9cdcmr160359f8f.17.1757611349960;
        Thu, 11 Sep 2025 10:22:29 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3e7607e13f4sm3156998f8f.57.2025.09.11.10.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 10:22:28 -0700 (PDT)
Date: Thu, 11 Sep 2025 19:22:26 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <treding@nvidia.com>, 
	Svyatoslav Ryhel <clamor95@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 0/4] clk: tegra: add DFLL support for Tegra114
Message-ID: <o6agzaasqcnfibvtf5hgvjxlbrcgz4ulld657xfduhitk465pd@l27ge5ilkpjv>
References: <20250829122235.119745-1-clamor95@gmail.com>
 <wmbbnybxsnbhnkifqfwp7g7bklurxgx3qe4djxcwdcs6aketcy@kqiwizt46gee>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4m23ttv7p46bf745"
Content-Disposition: inline
In-Reply-To: <wmbbnybxsnbhnkifqfwp7g7bklurxgx3qe4djxcwdcs6aketcy@kqiwizt46gee>


--4m23ttv7p46bf745
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 0/4] clk: tegra: add DFLL support for Tegra114
MIME-Version: 1.0

On Mon, Sep 01, 2025 at 04:57:37PM +0200, Thierry Reding wrote:
> On Fri, Aug 29, 2025 at 03:22:30PM +0300, Svyatoslav Ryhel wrote:
> > DFLL is a dedicated clock source for the Fast CPU. The DFLL is based on
> > a ring oscillator and translates voltage changes into frequency
> > compensation changes needed to prevent the CPU from failing and is
> > essential for correct CPU frequency scaling.
> >=20
> > ---
> > Changes in v2:
> > - dropped 'drivers:' from commit title
> > - aligned naming to Tegra114
> >=20
> > Changes in v3:
> > - add DFLL support for Tegra 114 was split into dt header addition,
> >   DFLL reset configuration and CVB tables implementation.
> > - added cleaner commit message to dt header commit
> > - added T210_ prefixes to Tegra210 CVB table macros
> >=20
> > Changes in v4:
> > - expanded commit message of car header adding commit
> >=20
> > Changes in v5:
> > - renamed tegra114-car.h to nvidia,tegra114-car.h
> > ---
> >=20
> > Svyatoslav Ryhel (4):
> >   dt-bindings: reset: add Tegra114 car header
> >   clk: tegra: add DFLL DVCO reset control for Tegra114
> >   clk: tegra: dfll: add CVB tables for Tegra114
> >   ARM: tegra: Add DFLL clock support for Tegra114
>=20
> Hi Michael, Stephen,
>=20
> Given the cross-dependency between the dt-bindings header, the driver
> and the DT, do you want me to pick this up into the Tegra tree and
> resolve the dependency there?

I've applied these four patches to the Tegra tree now and plan to send
the drivers/clk bits to you as a pull request. Let me know if you have
any objections.

Thanks,
Thierry

--4m23ttv7p46bf745
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmjDBVIACgkQ3SOs138+
s6EsbhAAveaZCF46Un/jnPJTP0ZvUFKqK9n8UqAdtzZLD+01XEz7gWGYGh3c7296
Exo4ShFpAdHtu0ebHjCPd7xNk97wRwKMx8VxhjBST4RBW7hqZSjs/b4ErAY0i7Ya
qnLXVUTqJxMD8RjinA0ndzyIzxp2VBRKQlhC/9EUkHBE5BPWcndfrGtwy2mWL417
iDSLGZiGx+XT9a2XKV04kioYJbgfPASIvDKJU9XtLTVKU238rvhfolLhuZGsN8eE
Fgadt1EwK7msPvrVJZVgp9SiM9riqzVHfIPnPcUC9fLvHjiVjBeSzXuH/88yYObE
+xdh0n77T2iNhwvV2g403iWvmmkDHc2ofy7NP37cvj87p+FsAGnFF5Fss4zpfxl9
pzRYn6EuYS1dm9KNGRvphvOqSCzUeOooFEMSz+UuH9v5WpauW8njKUk5TZDPoHaX
LxRg5de6hCkoN4sntE4MLyJKMuu67IkG8/RyKNF0Uxv9S75URyk3a89doNr/nqoN
CK5aaxRrmR9W8l573himO4rrVw/A/x8CwR52HZrXBXwj0X4ILbRMQVVjPppLdeg6
/BZFb5jUWFfFNz0x2Ws/IkojZprXFsoaMu1i5fTmkLbPOWUmkMj7neP1lDtvmxCS
p4ZPhDJA6UHCnzCRCEOLd2he0jSxufBBNXjZdv9jo5i8PpGeq6g=
=F/Cm
-----END PGP SIGNATURE-----

--4m23ttv7p46bf745--
