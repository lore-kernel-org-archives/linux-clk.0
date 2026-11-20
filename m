Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795213045;
	b=y9kWtTd0Z9yO4iF4ZGSc0I+vuLda+5VNkz+ID/eMLe9mlDB3iwFr73y/EtNscazTYp9p
	 VN0rEPFFvLv8zDIDdFE5Hg/QvhN8tDBd+RbB+47lde/i0UD22N78sJtVIKI7RfQOxO78W
	 0Us3OH4YBvFVYMaNlQ+jfMq/BMWFtJ0qfbuqspMhLV0cJfNs90pU8So4g6iTq7WlgP6Bd
	 28dV96PSA8H4r735yNtirDEr9V/HIbe8epAcN5K93Tiq0zxeG+tLpZ1PEA42817Ew4jfr
	 Hi02P/3MnATm1bsGatmrzWdJPttAzUZ0A9ieXo3+iN0bY/SZJFQ1xD4/Pie4/Bwy11A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795213045;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ugYvkLeIn+hCFsnanE87QPu37zEBsRIDzxdzwEyjNUc=;
	b=ReVZDpZAdupRH3u+uYmvW2p86I6fmcjZcXkfh27Lo0Ua3wdlOpXowDGacHMxnLlQBz1F
	 NhVCeDmMB/2PpVxEEjeriC8UCdKU5QVCHAtxmjLHX6Z6vpLsn6TYXOf/pKXffDcgPQOdS
	 +bfdXIEhoe+EVRAM24qDMzAe4UXXkaTeYrFPKcJ6CI0Ek5ias6TovMNcRhXoE6b5kXPHx
	 DoBQe+MVgocWPkB3dTBpJOe//dUa33NgGecmFkKcO4/T6fhc+8gTyEd4jiIxbhCIFtrXf
	 KomNRBBLGSUUEUf5NvLxqFAzpnL67HhLlIXoEQPSjNVzxE3Fq1jyd/rfIf9Im+H4aXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b="W/KOm7A9";
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A30606A6B7
	for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2026 22:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 47A30606A6B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=W/KOm7A9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ugYv
	kLeIn+hCFsnanE87QPu37zEBsRIDzxdzwEyjNUc=; b=W/KOm7A9slfv8kdbib0u
	6c4Tt0oohwCGQxXFmsUNOJuRExU1OO6r9i7UisDK6dcgAeKyNpFxjbAxhdsHjUtJ
	zvB1uuqctJaLMa7giFIBMmbrwJGCipDQrWevqNYF2ySzoTfiCDpPrRSqQhvW1nJA
	HThhj/fYPa7DorBJL5AYhRh6qI0Hqy63V4YOST7K2caVN41mn6yDze0TCnOwM6dl
	hDZOMSunhGEIaHt8e1fa+qO6UrAJcJvlya3H1nzalXkK+aPHkdhSCEzqVsnDAnEM
	oujGXaLNeYBrDOSwQx00q62RSdMZUPoOtmdpUUfsIhR6wstkgppV+bhaTgfCuAf1
	6w==
Received: (qmail 1629929 invoked from network); 20 Nov 2026 23:17:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 20 Nov 2026 23:17:18 +0100
X-UD-Smtp-Session: l3s3148p1@CtRsm7xgrOdtKXA1
Date: Fri, 20 Nov 2026 23:17:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] clk: renesas: r9a06g032: Add reset controller
Message-ID: <awDG6bClCPgRO3ZN@shikoro>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
 <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="i7NGJUNCA0p0si7Y"
Content-Disposition: inline
In-Reply-To: <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>

--i7NGJUNCA0p0si7Y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > +static const struct regbit r9a06g032_resets[] =3D {
> > +	[R9A06G032_RST_TS]	=3D RB(0x188, 3),
> > +	[R9A06G032_RST_MIIC]	=3D RB(0x188, 4),
> > +};
>=20
> [Severity: Medium]
> Since R9A06G032_RST_TS is 1 and R9A06G032_RST_MIIC is 2, can reset ID 0 be
> requested and accepted even though r9a06g032_resets[0] is unpopulated?
>=20
> ARRAY_SIZE(r9a06g032_resets) is 3, and without a custom xlate callback,
> fwnode_reset_simple_xlate() allows index 0.  If a consumer requests reset
> 0, assert and deassert silently become no-ops in clk_rdesc_set(), while
> r9a06g032_reset_status() calls clk_rdesc_get() with { .bit =3D 0, .reg =
=3D 0 }
> and reads bit 0 of offset 0x00 (R9A06G032_SYSCTRL_USB).
>=20
> Either the reset IDs should be 0-based, or the driver should provide an
> xlate callback that rejects unpopulated entries where !reg && !bit.

Seems like starting from 0 is the better (and easier) option after all.

> [Severity: Medium]
> Should CLK_R9A06G032 select RESET_CONTROLLER in
> drivers/clk/renesas/Kconfig?
>=20
> When CONFIG_RESET_CONTROLLER is disabled, devm_reset_controller_register()
> compiles to a no-op stub returning 0, so the reset controller is never
> registered and consumers such as pcs-rzn1-miic fail probe with
> -EOPNOTSUPP.

I agree.


--i7NGJUNCA0p0si7Y
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsAxukACgkQFA3kzBSg
KbZ5TQ/+LTk22zz7YpZoutzekpGc1HX6HqK2n1k1Qp6YZgMhPfNqRKr+eC2PizDk
SHDKPexnilYeYCcrrdi+WwUtRYwSOiAsv70evhdSANtrY3cm6fpl0Q1mEBUVG3ZI
Rvlg/2+Clb2WOK6lJTNCwdfy2Uzn+if2d8CmRUSopCfgn6h1csfj+9Fm3RVFXSRU
TTMrOd/L7jbVzsECcCGMTNesvigPPQcgI6lEoKOpqoT5SwbYtKvg5x6lovNSLpfD
QIZl+4cdrYq5uoqZOrpBW84fW8qRCa+TtkovI8EOnDTZ2hxJHBLA/2PCo+VWWXn8
V7eKXU2f1rBSPCs3vxLveRMbs968VRQbUyYVjrxg7JCAQpdqhQzbObZWxYXTndRt
5vUZZLz7m8p54xcowRgcgs2Xuh3jpY23W3zLK+qk5LJ8ajkBSV5+8tuuWFdLhZQf
ia6aGQuwA7iOh5ApObWkLBzcaI1FTNvJk33CHPTeAVBLYsZShKU47X7WojaAi+lD
XTMuFItP/ysMDR1xl2HjjkTM2sLLZt+6dDVHTnp7To6WcUs8VXGJg3Kz8hzahqEB
9Hrvy17/3DvCSCZPjUk+CiS7qddurtHpJyqGKsR7UyVHQSvU7+F1BcqMAY1pUP88
p9cS4ed2vz9GYLqEAfskV4w6LRn9vXjQAeM+Or6+k1QyXpVUilw=
=S+1X
-----END PGP SIGNATURE-----

--i7NGJUNCA0p0si7Y--
