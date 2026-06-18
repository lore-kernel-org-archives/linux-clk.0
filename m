Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5160432AADE
	for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 19:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781810903; cv=none; b=SXoDwXekOw/q+u6HA5sFhC+5D62rVc6jC003jDKJwcuzM8iqy3wYmiSs8m40/70JFT4YDIQO6EwoD4yuS6jJfLqqIfeHePYThlGY5WfqGHb/JDAOTYobKI4z7dDXGdua2dPFNvjzKxTecnHyGT0cEHMkC88jLvQCXWkgE82EkXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781810903; c=relaxed/simple;
	bh=A153VHEeuRIzzseIS0sssGTKG4lkc/OZ1lFglcZ7OeQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VyPwBKS8lsqa6NTcgt4Dbi6OcgL6zMQFEPL1LIXWx3HCVas6ZiyavBEFUxcBlR8iIQXsZsgjnLbDFhE64soyhqwo1ZrPwVdTfcq8cn0p/tvvJc3fTfuoRdn5DOX9fZDoEgWBpwqfqH3OHspKN49OHVgZ2Dh76Z1NiFGWUytB/bU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ACSpJz1T; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ACSpJz1T"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4921e4dd62dso10567625e9.0
        for <linux-clk@vger.kernel.org>; Thu, 18 Jun 2026 12:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781810901; x=1782415701; darn=vger.kernel.org;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=;
        b=ACSpJz1TowvtUTlneYCY6z4s+BILPdMJRGznqH8qQSVrUZwO7ueog16BfKFjr9nPAQ
         wUCjisZSN2PdZmMl2gtuvqsiWw9ABycuiICmWIXfqGCsFpxgOHrKaobjMueDqyFANIHZ
         heGDxYEk3+753FgsIAOnwoeEQkQ7kKaCmvHun6I/ZYukGzqk26rEZiAAxlB12j9tOWlJ
         taQIV6NtI6vQQMSPUyLgCgZ4cH9FU21uzCZfxva7H566E70uulf1VvpP3ow3eWCLeOfc
         GcGLa1Ll5Z+SsntEsMcfMVk9J+TX9h9aRsMP5FxOmJJqANBQkwG3WlJmTeQCaUoLxESC
         1m2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781810901; x=1782415701;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g7F4n8mgpmXvR1ZomD7s5qVMQgPf2THfCdABQ8kzmgU=;
        b=MiT4SyvJNtwmO4fk0KIDTUGp2D6sO+xXp1vAnVLNxBqB0OqhxSEz0IbHaEj5YwL8qQ
         XYQEq2eXRFC9a0uUHu4vkzIWIzvjkr0CSIorHQPDaSwgrAxH15CZSGlnbxltfPuokl7J
         oRL/eu4hdsmURwbAHNcxfSsGdAeiI59PZjA74NIfFlMSoUan/BqiEmW8pjSz0fSISeV5
         gQnqBEPFEM52G0wd1E85sKoYCzIoE0jnZ4vNthF7ohfKAVHZmbbKOqagfJFYijIzUAz4
         koI39UbHqBW+vFfu8KqK5djTDy1MCUMUarbt4JZFJ1yjSy+6jmzx5dQdwh1vUmdc+GRy
         5bKA==
X-Gm-Message-State: AOJu0YxgnBnZ3SpI99nWsx0fVAbqWopRN7nsHYIFBSRxN00bd4HMDo6t
	Yjs6Hs9YE68Ba2Dr0m/FSjZzD7JIk/DuTRB1f9Olzl0rPJNnyPguQ3PH
X-Gm-Gg: AfdE7cn0OzIrLg+Rta4b/xi/O5bMfR/7pvxtbbU7Ak8Gc9TqPqcCuZIlr74OTu1JOEv
	OCqPuIUsSS72sOPiWDceWx5B+Q72zY3l2/x14YwGsCh008TcyK6mOEU2OYYZI2nb4Z4nY1y5LQ5
	B+3hY1QW275jeRsGQKKfo8+5trl8WPUruify4Kx865/mPLRx7KPCuhdy6yky0b28Gf605bkSq26
	kLvUVpjdGPT5mtVZcrIapeVkzJYak5/blqZenVm2MWkBCwqsFiytX+WlglYHhKYNmuriUiJc3He
	TO3EKkFpi+SSeSv4v2a7fb0ww7vSJrlRo9/+iVxl8x5PMoiBynZmwUZ7QGAaKj4gKUCZDMUrD+2
	QcaUZGpUFmQM80Iyyj247q9kLb0e9pXM+k4vLmHOHD6oyYFa5T/SN1mn6ybjbX2vlaeoqZRAt8R
	XoDi46EwnK25AYaY/HDlubbQ==
X-Received: by 2002:a05:600c:4745:b0:490:b26c:64ad with SMTP id 5b1f17b1804b1-49240a051c5mr5075335e9.5.1781810900283;
        Thu, 18 Jun 2026 12:28:20 -0700 (PDT)
Received: from strix.localnet ([197.250.96.160])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fd29883sm11319845e9.14.2026.06.18.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 12:28:18 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Thu, 18 Jun 2026 22:28:01 +0300
Message-ID: <8K1EfEWITAurt--cymuLyw@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
References:
 <20260616-zx29clk-v4-0-ca994bd22e9d@gmail.com>
 <20260616-zx29clk-v4-10-ca994bd22e9d@gmail.com>
 <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart7cqxV3SpSTKGVocmuEIt-Q";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart7cqxV3SpSTKGVocmuEIt-Q
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Subject: Re: [PATCH RFC v4 10/12] reset: zte: Add a zx297520v3 reset driver
Date: Thu, 18 Jun 2026 22:28:01 +0300
Message-ID: <8K1EfEWITAurt--cymuLyw@gmail.com>
In-Reply-To: <90c4f50eb23dec06497d46f9c0f522a6b90a918b.camel@pengutronix.de>
MIME-Version: 1.0

Am Donnerstag, 18. Juni 2026, 12:24:26 Ostafrikanische Zeit schrieb Philipp=
=20
Zabel:
> On Di, 2026-06-16 at 23:26 +0300, Stefan D=C3=B6singer wrote:
> > This drives the auxiliary devices created by the clock driver.
>=20
> Which auxiliary devices? Which clock driver?

The ones from patches 7-10. But I guess you're telling me to spell this out=
=20
for readers who see my patch in the kernel commit log rather than the=20
submission series.

> > +	[ZX297520V3_UART0_RESET]     =3D { .reg =3D 0x78,  .mask =3D BIT(6)  =
|=20
BIT(7)=20
> > },
> Is this a single reset line controlled by two bits (do you know what
> they are)? Or might these actually be two different reset controls that
> are just always set together?

Most devices on this SoC have two reset lines. In most cases asserting one =
is=20
enough to reset the device, and consequently both need to be deasserted to=
=20
bring the device out of reset. In some cases both need to be asserted to re=
set=20
the device and it keeps operating fine with only one asserted. I believe I=
=20
documented some of that in comments, but maybe I forgot to move it from the=
=20
clock part of the driver.

Exceptions apply - some devices have only one reset bit and for some I have=
n't=20
found any. USB as you noticed has 3.

I don't really know the difference between the two lines. I don't have a=20
datasheet and ZTE's downstream kernel only operates on the USB resets. The =
old=20
upstream zx2967xx code had no reset driver at all. So I found the resets by=
=20
setting the registers and then single bits to 0 and seeing what disappears=
=20
from mmio space. Everything on this board except USB comes with resets=20
deasserted on boot.

I'm pretty sure that what I identified as resets are actually resets and no=
t=20
extra clocks because previous device configuration gets lost after assertin=
g a=20
reset, whereas it is retained when disabling pclk.

I absolutely expect to run into surprises and epiphanies in the future and=
=20
problems on as of yet untested types of zx297520v3 devices.

> > +	[ZX297520V3_USB_RESET]      =3D  { .reg =3D 0x80,   .mask =3D BIT(3) =
|=20
BIT(4)
> > | BIT(5), +		.wait_mask =3D BIT(1)},
>=20
> Same as above, are these actually three separate reset lines?

It is likely a combination of the same 2 indistinguishable lines (4, 5) and=
 a=20
separate USB PHY line (3) - this is what ZTE's code suggests, but it is a m=
ess=20
of #ifdefs and redirection, so I don't know if I isolated the correct=20
codepath. (No, a kernel built from that ugly code doesn't boot, so I can't =
add=20
printks).

The PHY reset line does not do anything observable on my device if I recall=
=20
correctly. It might be nonexistent, it might be a leftover from older=20
revisions or some devices might have different PHYs, similarly to how Ether=
net=20
PHYs differ.

I'll double check those USB resets before I resend. It's been months since =
I=20
looked at this particular part of the board, and maybe I missed something. =
On=20
the booted ZTE kernel and in the bootloader, when booted via USB, all 3 are=
=20
deasserted. When booted via the NAND boot chain they are asserted when the=
=20
kernel takes over.



--nextPart7cqxV3SpSTKGVocmuEIt-Q
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmo0RsEbFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoiEm8P/AvHfClRvmy9YL9udTPC
Z4QCPIQLCeqVhdF7G8jxr++QtOAWGVMwzMmhkV/HjMOZKzngI/79K7GOXh+ZWacu
8urWF49rVNSwd66BJAspTEzrhAFzDKyuqRni9MxHUKUZQhwHR74mB3jbvJN7Ro1T
ivQumkIS2UvKvSXrrn5jN3oy/Nyrvp7D+18fd6olrwCBAqxufx2XnUStim/unV+j
EetwGC0+OFgDrN3baOlhVHbZpa3sf1R+K7VfUp83K1SaAIil0DbmXho49O6AnV58
4x8xOXR+e7cJn9Wwal90xb6uhNumK/Pcg1JfxazDu1r3LoO/zNeBuQPhVipny1/L
5rScYzShnt6RwEhn97EY1+JIUcFl+sSfcsLrM0g9N8IRY6ZF86xwK1uhzZtHVhqa
iduxPvaxGWzK/I4VO9gLVQ+SzI31jX13AquwVe1wMzR4aWJlBVDqV8eyzDT3xQpT
pM88XTEW8HucCi8UNTM1UuFwiaEmKBjyp7zRCci16eRY9RkzlADhCT2oQ5SXGaf2
uy6ke7LyzUvSN4HUzUhN5RY/Kt8qaDi9V/K9yKYc8w/k21N/hdfryJEsouPfmGJq
EzjOugd9lByljMjhYc2sj6xazXsNLKNNounCgqw2hUyzg5OAdQZRB+fV/c19/QCP
AIr5phGYT29fwL4Rd0gyO5GJ
=KeDM
-----END PGP SIGNATURE-----

--nextPart7cqxV3SpSTKGVocmuEIt-Q--



