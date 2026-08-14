Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11986343D8A
	for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 17:46:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786729589; cv=none; b=jiMIdeQvbgPkCVRTVRHQoRRO+oeHlI1dwl3DY1qyD3tDJ1WfS+bbe+04p3NPV5vEoDdhtlMwHM4chjAGBd/xSEd2gK/S6GnI19EcyJWBU1YA7Q5Vq3PLr2fdQzA79KjNdV4IMkZAWn4hG3FVon6XMsaHRq9SC6j+uMlgqUTlbqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786729589; c=relaxed/simple;
	bh=pHQHDxbUgUXawpMBwNmBaKB96flhW2yqXf2kNVAMug8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cUkx4g8aY4yjGFExR8yRfq/BtVIrMKDlh2w9V9pKQD/nFaZebzEs57bRiBxm1CUYFQb+Cw90dM/rl4l/kAJedvWOqw8/atFOTfgv6xWfKmrJ97SyFzr2tCceoDZC4bPbKiyLXzY6LRSeWp1thRU4jMm5u5x/OZh9N/nE+E61zxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=pT6ED4Tu; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pT6ED4Tu"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso632787f8f.0
        for <linux-clk@vger.kernel.org>; Fri, 14 Aug 2026 10:46:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786729586; x=1787334386; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i1r2xPJfkJhEKLocmkcDET9WPaG8FwcMD2/2OeeTJFY=;
        b=pT6ED4Tu7+iEGW0cmYvc9QJe7ANILzoGArP6yV+EaFqeNweV2SQYACOnyvO3ffgW8n
         aK5n4PX5AOVeW1C+Ggb11FMlEor9z4dHgk8h/9nkvtQbH7iac2mKuw5SH3snt/F6aSVj
         vBBMeSgyuYwbMDBBobMq0/iT5d/vGutKsFTYHtPd9QfRmbblt5VT5oRx27DrVZkaKqQc
         SET/niXwxhIP4rHANPd8G71UbI2bMsVZdraZOZABpp1bX1tUeIhORgayifIdM6NjmbDs
         FvBpmfX5R/zUtzIrYg4Ou89HEna9Q49R6TT1h0qI/ZZHGdMmssZ9oRJKpmDV+tKVbGxN
         /xyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786729586; x=1787334386;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i1r2xPJfkJhEKLocmkcDET9WPaG8FwcMD2/2OeeTJFY=;
        b=oJ+XTp3CCb9cXzaRGsFN6+UFmDXt8+I/Ed7/WZXGftnB1Imp2JJ2G2/g9uLgv6fDk+
         5JuNZcq7brt5G0BYe4i6dwspF/hh6Ebj00h7Z8c9p56v0MQBs7XPQqjZReAwNqHNwZTo
         cBEvIFJu0+gfeedMdR625JeMR4FC2Mfpyw/TFiZNo5e5vkSznBpoRbAQhrWFx+fguXT5
         8AlFXb1i+jlJkzZvOz4QSKCQ8lslMGEIMI9udIECi2Z+oPxwqOnYd7OTZm8nkKAVOn6f
         OZ0jQl1tHXso3pFcGM022eMihpj+9A9x/FtsuEi8VwmkHyUekwhlEYo6MtInVdG+1u8+
         U+2g==
X-Forwarded-Encrypted: i=1; AHgh+Rq4AQMDum1oO38ShWYEls92+WzWqAEpNXkYnFMwzb4Vj0COcdJgTwaKcEUgJc3hJTE8/XfDe2J5Tb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOH7dInK1qXFO3xfyZV7aN6CoRi1XpJ+vMmpokeBLrcMQV/SIL
	FGj/nnd4Fh8ma67lgfnk2fulonazPZLtEyfi5VF4FsOupiDjJ0PlH97M
X-Gm-Gg: AR+sD11zI7z4fqeN2RSbY+afH0xIXB5Hhqoxf1PEqEOg89yS+FWkOSmCUWnuG549p5b
	s95VQ3/ss+Zdh/q7fq/ODkgHxFAC2liCC1QCZnbK3+izBmWoQ4g2UhRq+c+76puMj0iZlS0IZNQ
	tkJYgQnEZ+tQB8YCH454qzLm8y8BK/vqmHyexeKkcCAT9gSA/CB/rDXkYwGpV46a7Vf0+lLu5ck
	12GiDXJFqVayxR0p9cSILu5p86ISBta+jb0Th3nSPf/NQaGK7Pn/WBels5laDneLOIxLm2NjfhJ
	0ybYBQZtvTsrcvMyx5qWhLo9S6WOIB4VmZQ3JZlLfYe1JwsU29LOobmSb5BJ24rWjU1eG4GvT46
	Xthn9a/Rm/ZScPVh1s5+qXPQpGEFu6xaI6AYfcGfp4knij2TNG69SY7tdqzOa5EL6TAugE6fQnW
	JWM9hLS496CdGyfvZplI1PqBHhnEYGX8XdHTuzByqHH5afyDJE1Reg6WTPiENw3+ibN2Rtn+uKv
	qMAcoIpCx4=
X-Received: by 2002:a05:6000:2087:b0:47f:96e6:70a with SMTP id ffacd0b85a97d-481606bcec4mr8999132f8f.0.1786729586010;
        Fri, 14 Aug 2026 10:46:26 -0700 (PDT)
Received: from strix.localnet ([197.250.226.224])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f219d3dsm10124274f8f.14.2026.08.14.10.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 10:46:24 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v10 04/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Fri, 14 Aug 2026 20:46:11 +0300
Message-ID: <gxF9XGmoS_qmWIfVagXDVQ@gmail.com>
In-Reply-To: <20260812131503.GR1072730@google.com>
References:
 <20260810-zx29clk-v10-0-63846490712c@gmail.com>
 <20260810-zx29clk-v10-4-63846490712c@gmail.com>
 <20260812131503.GR1072730@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextParthu9EI7NhQy6giXCUf6L9sg";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextParthu9EI7NhQy6giXCUf6L9sg
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Fri, 14 Aug 2026 20:46:11 +0300
Message-ID: <gxF9XGmoS_qmWIfVagXDVQ@gmail.com>
In-Reply-To: <20260812131503.GR1072730@google.com>
MIME-Version: 1.0

Hi,

Thanks for your feedback!

Am Mittwoch, 12. August 2026, 16:15:03 Ostafrikanische Zeit schrieb Lee Jon=
es:
> > +config MFD_ZTE_ZX297520V3_CRM
> > +	tristate "ZTE zx297520v3 Clock and Reset Manager"
> > +	depends on ARCH_ZTE || COMPILE_TEST
> > +	select MFD_CORE
> > +	select REGMAP_MMIO
>=20
> Is this used?

Thinking about it: Not in the way the build system cares, so I'll remove it.

The MFD child drivers call device_node_to_regmap(dev->parent->of_node), so =
a=20
MMIO regmap gets constructed for the MFD parent. But since the calls are in=
=20
the child drivers, REGMAP_MMIO shouldn't be needed to build and run this=20
particular driver, and the child drivers enable REGMAP_MMIO on their own.


> > + * Copyright (C) 2026 Stefan D=C3=B6singer
>=20
> Personal copyright, are you sure?
>=20
> Is that okay with ZTE?

I'm not affiliated with them. This work is my personal hobby project to hav=
e=20
some fun and learn things.

I'm not copying code from their kernel dumps either, the quality of the=20
drivers there is pretty atrocious.

If ZTE wants to have copyright of the upstream drivers I won't stop them fr=
om=20
doing the work themselves :-)

> > +enum zx297520v3_parent_type {
> > +      ZX297520V3_INVALID =3D 0,
> > +      ZX297520V3_TOPCRM,
> > +      ZX297520V3_MATRIXCRM,
> > +      ZX297520V3_LSPCRM,
>=20
> None of these are readable.  I suggest you improve the nomenclature.

I saw that most existing drivers use "undecorated" device names, i.e.=20
"TOPCRM", "MATRIXCRM", "LSPCRM" in this driver's case. I am concerned that=
=20
"TOPCRM" is generic enough that a (future) global header might define a mac=
ro=20
or enum value with that name, so I opted to semi-namespace them with the So=
C=20
name.

=46ollowing the example of max*.c, what do you think of TYPE_TOPCRM,=20
TYPE_MATRIXCRM etc?

The rest of your comments are clear to me, I'll implement them in the next=
=20
submission.

Cheers,
Stefan

--nextParthu9EI7NhQy6giXCUf6L9sg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmp/VGMbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiPokP/iptbRf3/QgYkQF1HNMx
5pOuSmrcFnzvT8WG+mpgA+2uorsOmUfPhxRF+BA9CgOgazibEyWWETdrkvPHy+/f
See03pTw5mH4LSt90AOqFDCck47OmmAfzY3AP48o61IR47EiB5eFxf0r1S35tYuE
ms1C/2a98Rw60mw+eFUz3iBHWOI5fX2+DXZjOaEf/Q7d5KsZyiHOg5QUop8bsmCh
YRKrMdRwLIbT8nZQyEwLiMJlFGvzdDrZc2Vo39rsPFrRjP+FZGvUc7YIymjWXYi0
m/GfFV6RQSmxxph+zLCnYfoG2MeHDc+ihgBRACTeYXy3B6FbOUNVfsCB3ENvw/4K
P+OhBdxhxSIswe5KMDR1zUAeCQfNCsnrzXlLyhMxuFm1VwgzA/DJOucR96rj69hl
Cne8/8AqirlMgKLNek1Fsze0DkKuxOLMsrDVHYTvlMMt/giA0EtsoQT9iNp7z0Q0
/dqmTve95/f18m4sorji135TkTiEpmYTdtn1FZVY/2/aUD4z907S7mAomm7kYviq
jIesXSWzh9SFfRugYKDWsk9AqiP7Av77bafFuLzpgQ5MBnsDPpYTdCZR0ngLaP3F
phrCAX4IayRFni2+kBYkRMgaGosJolehc+mC04px0CwobqERnJGQGlVbRvuPYVJv
jL7hUaUKDj90M7cPPNEtjQf9
=kRv0
-----END PGP SIGNATURE-----

--nextParthu9EI7NhQy6giXCUf6L9sg--



