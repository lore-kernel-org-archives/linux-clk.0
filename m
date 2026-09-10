Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 178B559220A
	for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 19:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789067712; cv=none; b=MM0htjhDUxmIfcCa/+X44ICMBW66i1yRbYiW8xvqJYfgmrsvofHYymEh8BVibp5vchB06u89V3xix2t1fyqb/IZHN+OqgITXipUascQWD/XSUTBh63H7LruJNnA7RfhhqS8pX//JUPgJmKErz4ipVm1uCQbuE+kUcjCnU/oUuQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789067712; c=relaxed/simple;
	bh=SIjCw6vu2Nolc5BGLxkzrlpiPylpl82CNVXXbYaAcVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aOyy9e4EXbxChG0l9BdA8KCi/Hao/dFFJrxC9ZVQgAdLZ3q8t83080UwRaROD6PTc/hr+u22qJgdsP5Pq8zlJU28vJyy0405dOc1DQBjhMHcTMskT2JMQ35Kg0GZmAhIEwf/Vz8eJnfYb84KpQjzjYt/ZEDm1WxSjvXKPsz7K78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVgfi3CC; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVgfi3CC"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-47ddf7b09e5so105941f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 10 Sep 2026 12:15:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789067708; x=1789672508; darn=vger.kernel.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=;
        b=sVgfi3CChuwLTM+233Ebm3W2XQR5ob8Xmj2hxYfYfBh6UdzmZAd1F8P50WlsFsU/AZ
         psvIeuA7urpNdHC2OKN7WLUacvzOHSzyoK/yWr4EvMZhEwlAOrrd4qZ9wbIAMYT/wK8i
         lSShDdJYiQFVx7of2GRr06kIfjHJpM4xRLWjwXxno3BVR7+ZVlFqyqNzU+yOOuCw2cF+
         wN8myad8Eud2RRGywrPRDk/FoSdbXXUNLVzpgDWHMNVjK0204CXFQZbmQt4ZB6onKvg2
         lMiY6Ew7FJo8UYojSKirkpmc+BC8Y3Le64BX8nt+4+wAjjUsAbpkmHFyr7PRoY9dOMBa
         T3aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789067708; x=1789672508;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4fbV+eT9jOuG2Qn7UfINqLkpoy41J2mIUSyeK6YfW10=;
        b=nPzFOF94L++IDHK8wlkjeUeYHEQG+KGxXdCMreq7fk8kc0AGJkqQuvlVHMfegpK0ad
         JbIlBWu+V2eW3FWj53H1MZCAKmOgDV8bj/nVDy2tef6mUovz0qqnhO21saYdWwu6bKR9
         bFhZ7guvPw4djUFttjbgQZQrMKqw2mV4usdHim8kissC6mNxxbt+rrJ5OVL1QVzS93zi
         YkD/KSo19C6h9tDT8Vn7kWHwP6Xo95yvKSNx042sTArU2Mmz/WapVFqU/FKppGj/u8cn
         an5/Ap+ZIEvsYpwKBNh9+VLjCaUCjWSFfodfE5FTihbnuuYv9upY/nFnkXYAlS62XJL1
         OIVQ==
X-Forwarded-Encrypted: i=1; AKwUvBwYFPxWKJdvaWqqvVDfmr4EHkDDawm5V5ssKdX0EZgPtR/NxiSQcF3r9AA283PXd52hnhytF1llCHM=@vger.kernel.org
X-Gm-Message-State: AFuF++kRfI+cbsGvU8rIlFE7Yk1P0x0JyFePf1VTCds+8AOAh5yVnpLo
	ULVOoJO0cvANzGyTAaU/H02ntQNJyaro9l4G2GGEF48Co5mjhZiMC8zo3kPhEge+dLh1Mw==
X-Gm-Gg: AYBFou0KvZ+uKUcUfc7NlXTgq8AXctQTglTtXC1S5cX5Ij2y33wAJ6OaeQ6xAhnGfGZ
	KtEVBXyD5ikFZrU/91vrLBkfSNnSvWoJVySMwVx9ajabmgsSWAjrYNsMgTeepi60+26m/9UdSax
	odimL62EdMWmwGeSapFRlgWPVU7HoLwAvletyHoh3i5FIb67OlaJX+nGUwZCJuXIWuM2uOGigtP
	W/qnHb8BXVIgIDuRzNTG0elrQKZkfvoyvyzl+jN0Zmv/AtuX7qA/IPUEEN0WXDH0kpfZBjDFLpm
	06xwy9LBOsNeVhmJVWIbPNKYWLNp6CMdl8mj8VxexLIEXRbZBdKFWCLwPgYba+F4meeN/Vu4c2N
	MUFt3vDCnarHns5IO2NVJyPqduSfPTqouI5dGMwmA3fmSzclmUpmu1X0BmdgX3VfQ2DYkzix9/O
	NWp+wCzGaH7OqZNqris39AWJwcdMoztSYJGWNq30W62G40zE+lH1m0DiTy3MmjGD52unUn0FtS3
	ACFfUGaGw==
X-Received: by 2002:a05:600c:a07:b0:49c:fc6c:be0d with SMTP id 5b1f17b1804b1-49e619bd19cmr5097405e9.19.1789067707645;
        Thu, 10 Sep 2026 12:15:07 -0700 (PDT)
Received: from strix.localnet ([197.250.227.248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e61a33d72sm4385485e9.2.2026.09.10.12.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 12:15:06 -0700 (PDT)
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>,
 Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Russell King <linux@armlinux.org.uk>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 mfd@lists.linux.dev
Subject:
 Re: [PATCH v11 05/12] mfd: zx297520v3: Add a clock and reset MFD driver
Date: Thu, 10 Sep 2026 22:14:54 +0300
Message-ID: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
In-Reply-To: <20260910161711.GK1051768@google.com>
References:
 <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-5-f8ad59c6426c@gmail.com>
 <20260910161711.GK1051768@google.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPartKW3nFVAkQr2M_09ZHSiKcQ";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPartKW3nFVAkQr2M_09ZHSiKcQ
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Stefan =?UTF-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
To: Lee Jones <lee@kernel.org>
Date: Thu, 10 Sep 2026 22:14:54 +0300
Message-ID: <x9tzyTnKRAOyrdtSGnka0g@gmail.com>
In-Reply-To: <20260910161711.GK1051768@google.com>
MIME-Version: 1.0

Hi Lee,

Thanks again for your review!

Am Donnerstag, 10. September 2026, 19:17:11 Ostafrikanische Zeit schrieb Le=
e=20
Jones:
> On Wed, 26 Aug 2026, Stefan D=C3=B6singer wrote:

> If you use of_platform_populate() there is no issue with this living in
> soc/.
>=20
> You cannot use the MFD API outside of drivers/mfd though.

I'll keep it in drivers/mfd. of_platform_populate would force me to expose =
the=20
inner split of the CRM devices in the DT, which Conor and Krzysztof advised=
=20
against.

> > + * Copyright (C) 2026 Stefan D=C3=B6singer
>=20
> Are you sure ZTE are okay with you Copywriting a driver for their IP?

This is my free time work reverse engineering work, not something I did in=
=20
coordination with ZTE or payment from them. I only took information about t=
he=20
hardware from their GPL dumps and not code. In my understanding the copyrig=
ht=20
of this code should be mine, and putting (c) ZTE would even be misleading.

ZTE provided U-Boot sources on request. Their kernel sources were already=20
public before. Sadly they provided no material on their LTE components.

I didn't explicitly ask them for permission to upstream self-written driver=
s=20
for their platform because I don't think I need it and I'd just expect a=20
request like this to languish in their legal department.

The kernel once had support for a related zx296702 and zx296718 support tha=
t=20
was removed in 89d4f98ae90d ("ARM: remove zte zx platform"). This code was=
=20
written by Linaro and I believe commissioned by ZTE, so I don't think they =
are=20
upset about me doing their work for free. At some point I'll resurrect some=
 of=20
the drivers from back then, which will then of course carry the appropriate=
=20
Linaro and ZTE copyright notices.

> > +enum zx_device_type {
> > +	TYPE_INVALID =3D 0,
> > +	TYPE_TOPCRM,
> > +	TYPE_MATRIXCRM,
> > +	TYPE_LSPCRM,
> > +};
>=20
> What do each of these mean?
>=20
> Is the nomenclature taken from the datasheet?
>=20
> If not, can we improve it to make them easier to read for humans?
>=20
> Failing that, more comments would be helpful.
>=20
> > +
> > +static const struct mfd_cell zx297520v3_topcrm_cells[] =3D {
> > +	MFD_CELL_NAME("zx297520v3-topclk"),
> > +	MFD_CELL_NAME("zx297520v3-topreset"),
>=20
> Why are these works concatenated together like this?
>=20
> Same with zx_device_type above?

I don't have datasheets. The names are from ZTE's mmio defines, which I exp=
ect=20
to match whatever is in the datasheet.

zx297520v3 is the name ZTE gave that SoC (printed on the chip, in their ker=
nel=20
sources and boot messages). Yeah I wish it were less of a random string of=
=20
letters and numbers. I believe it should be in the MFD cell name as a kind =
of=20
namespacing. In the (unlikely) event hat support for a different ZX SoC is=
=20
added some day it will bring similarly named "top"/"matrix"/"lsp" controlle=
rs

topcrm / matrixcrm / lspcrm are the names ZTE gave the 3 clock/reset/misc=20
controllers. The DT binding docs in patches 1-3 elaborate on the respective=
=20
roles of these controllers (although that understanding is based on reverse=
=20
engineering, so it might be wrong)

=46inally, "clk", "reset" are the names I gave the child nodes.

Rather than write zx297520v3-topcrm-clk, zx297520v3-matrixcrm-reset I cut o=
ut=20
the "crm-" part.

Can you think of better names? Are you OK with the names if I add the above=
=20
explanation as a comment - a little bit shortened, and making sure I don't=
=20
repeat information that's in the bindings more than necessary?

Cheers,
Stefan

--nextPartKW3nFVAkQr2M_09ZHSiKcQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQJPBAABCAA5FiEEQxb0tqoFWyeVMl1sPRO8yFRPGiIFAmqjAa4bFIAAAAAABAAO
bWFudTIsMi41KzEuMTIsMiwyAAoJED0TvMhUTxoi1l4P/j2RW0zmocuD81Wb5sZv
znns4ujhGapOszlboqNQmeHKggVJawfrXfzWDfrJjPPoh/CtxKqMnktV0jNxud+F
2epOFBD7UpM75AM6FVhx++ol5zDBVsuGFUjJMTmJ8m9jji4bNEuZcD2mTtlAt9Hr
E19NYXZLQ1QsWdUi05+JaAx40GfP3swda/sENz78aOm4KNkcbbnE9OGaG4JaTbb5
xfNh3OZ5AlBeIKlfsZFdtJSKsb/iBpEIc24hMHVaWm+h+KjbFKpP4034lGwshYzT
tB1BoP+jJ+ebVTKzKTpT3xiuW+cLQDegDAyKhzYZulk4ILuzIq7JomMVn4P8UzHR
3YNTu8DdCEZbAqDDMNlWWTkpYRPTSvYtSbivB6DeCM6oO46o7WvlnFqcjWRqN4/z
j0s062KBfAkiodcaVaeLCjmg6aPqYKf0/yjhDTsjZRiDSn6nIs58JPh8PNhfgNhw
4XHOVKRhzTYxOrOJxP33xgwbQf9IeJQT6n3UFqw62ieLCpR5uFd31vIHHS+bH2kd
dAv3ER5fhNZcladCb4H4Nbx4TwiQ+ry3+KIPEJWre3zFNW0F79AGo1yz21/Buy6h
NBjFRtosY8KazSjZqVHFdCn9N6N0X+1x3R79gJgTRSXrCbk/icBx9pACGfOb0pET
wvukjxM7IWssDtOA0cwG+zAr
=PTj7
-----END PGP SIGNATURE-----

--nextPartKW3nFVAkQr2M_09ZHSiKcQ--



