Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428698;
	b=tEjAyrfjjYO0GLx7iZ9395zdQxkXBAwGGoq/SyX0zX4d1UjO4eDLlxkgoOVgePOJ5GbT
	 iY149vYLktC9UGDxJQ6rCyYyNCyxZQOFECwppxvLqNZw3s8c1P2SgrOPw0Hdu0Gg0HIEJ
	 iMxPkLDUn54SRphV73ZUcpJanwOqU9TlZf0ZK9s2LVWFAPAFv1hc224B6X4p0/pV7Sr/R
	 H7Jip81NymGXog/yjM4KKYo2AQHiz2P9xEg3K/9nA8m6/nXi+DoeTU9EL1qVf/lwEjMVB
	 4HG/88pXBt91voJ9j1U/NT4wTtfn14SWjVHnGM9agFyrdSgYXDg6I7w3J1f9+vf5lZw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428698;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=2zhhd1eEjuORztzKR2E0hxoBTlVwdi2f3ssxH8CIdr4=;
	b=kYXq7AKABfOAlDDx9mb4oosNHKnVh656ITUJVAd05ZaTUPzFY8vTQdcU6wNep8AkdX1c
	 CoRT1r2mkQUyvD4pWvAJ5UNK+IQgDG/ePMt+FcC8YH+csNHl58z5lcQQQ31NNDCxd6eR0
	 9g94OEw5q4OcuxdTpH3mfrr2BgK/GeFpZ6jUV9hC7lwHsdt8o59SrA5C2IThEh6hueHX1
	 ON/u4gMNbaLSIrBpXOcklHD65JNUOu085KcoC7vCVAT1I34QgII42G4ksJiPeKk5BZTMe
	 rpIZ1wJFE9LN4uNhL/7PrAHwpGZ+2roistUcdYjc6bRMW8JJYVDE2R+SxD9Mfkwl6Jw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=OrTMXlAl;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A498E606A32C
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 10:11:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A498E606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=OrTMXlAl
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2zhh
	d1eEjuORztzKR2E0hxoBTlVwdi2f3ssxH8CIdr4=; b=OrTMXlAlc7y5ZEcxZcR0
	3gGqbjRCkA1Z31VBk5/N9jy3BrLFHTy09HwVb5u3Au1MTFRzYNVztLF9H1008ajw
	pqmgnyjtWZUWj4+n8YefbbvCr17h5ypnU2s/UKL6d9DOyAFkE8HFaamVcE2IdDbp
	FAjLY5AwSlwcwYFdAlv4oGa2YmLKM+OV0g588bpEv58q0D234zFiMOnXPsM6rFAA
	mCferKHkgue73cNnL0DhnUi/F/+Aueviet8LrQVC69/ERK1RML6E+kCb1BG3YBP1
	Bwbl6miAmjKqfdQRxyfYhzMLWdjBj/25IQN4gQ/xVzOuXFOsqt5NgJZHMnRyhSEr
	dQ==
Received: (qmail 2655639 invoked from network); 23 Nov 2026 11:11:33 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 11:11:33 +0100
X-UD-Smtp-Session: l3s3148p1@knt+0e5gSrYujnsu
Date: Mon, 23 Nov 2026 11:11:33 +0100
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
Subject: Re: [PATCH v2 0/3] clk: renesas: r9a06g032: Add reset controller to
 clear resets for mii converter
Message-ID: <awQRVRjdSX9vtw61@ninjato>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="APV7O7fo23abPKXl"
Content-Disposition: inline
In-Reply-To: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>

--APV7O7fo23abPKXl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 01:16:51PM -0800, Kyle Hendry via B4 Relay wrote:
> On the rzn1, there are two resets for the mii converter in the system
> controller. If they are not cleared by the bootloader then the kernel nee=
ds
> to do it.=20
>=20
> To handle this, I've added a reset controller interface to the clock
> driver so the miic driver can deassert them.

I took patches 4-6 from v1 to actually test this series. Worked fine and
the resets were deasserted (I added some debug prints):

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--APV7O7fo23abPKXl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEEVUACgkQFA3kzBSg
KbbOuw/+NmeRwl80UT8zRscw+nxapGVFTkcpvHxUDvQ/YQlMRmrdq8dtyV+m/7Uv
/T1LXRVLG4mKP8I6Xlt3PgnyCHZrBa0csn8fxmfuCTelsXU9hamhlBFlQho6cx71
p86TwcW+d1CyUXLPiccGMpiSccRaMz87RVtSqLsGhOhioC9XAdZ60FGWMT+b62zn
KZfJzPDpLRA8/dQs1PGWMPkDpEBQbEISOW05O7c9K8v1cD4mdCOp58LQFS02u4N2
idrsCQ8HH3sxPQUiC7kyYb7EAFOUvNNkPFKICRFTcbWokPfe3FQcbxAe6O483CRi
5Idm4XH9e+tgVHugSnGhfx0hKP1Hz412ZOjisdd0ouSR5RI/62OW2w/D/CFJTlSJ
2C4xisd0YaZpR2/uXAOALIBR8i1Lkw3iX4+dmBC161t8AdLFvMG2vdQS/JmDVOvK
kA74880hg0GzEppZyExgoECbjeUxBKTAAH0a7as0LqzRbUhZerh7lprJrGSfk/Nl
uCS4y1XNoOcVSX1ZEZ8gkova5KxlFYdlWPu+qNJr4+TAX1mL8jNFxEDkzfuDEuh0
msp9EPpwrS4JhLfwC3kUzqPkFFNejb+S8fr6xC9rjRBlvv60pbbv/xmxu+ZVKTwF
6xzuhY5jrV+qGqLhGo9KvaJV18MBUCPqpWV5IEv8iCjOBREtjNI=
=aUdw
-----END PGP SIGNATURE-----

--APV7O7fo23abPKXl--
