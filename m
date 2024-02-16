Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E51133422
	for <linux-clk@vger.kernel.org>; Fri, 16 Feb 2024 17:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708103728; cv=none; b=XALnPJlMvf/E39LBtEMJXUwUCnu/zaSvd/1kMl7sJA0vUijR+knnX8AgRhbOQ23sVCHyWoXFNO/BH447I1qsmVtniwXxBtBAc5Vk132OslmD+wTk9TxIutJp/MmSnhvpTBUgqCt0LTDOUWexnjKan1fyB2Ua5by4EOle02dEaeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708103728; c=relaxed/simple;
	bh=2I8OV5Za1AWND85vJD0b2TxUNUIbm60J0z8NTNeSk40=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B2tlY/2273EX7fpkrXM5mhvprDMutfSRXtoyBslcqTGdT2XaQNywILkoHhS6daNmGvsy3W6t13v/r1dsjl13JaxoYbG18Q+AJzC3fV0f21Z0l9fFyVjc7x1P/FsvW6DSwN3s7p/dyHqkUVK7Rulb5/QwrEWzUVH4Y4PNnP40m3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qWNZQlSC; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qWNZQlSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708103725;
	bh=2I8OV5Za1AWND85vJD0b2TxUNUIbm60J0z8NTNeSk40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qWNZQlSCD02bukeBtx4pELL3MaKZ1YF1NpDC7EBXOqhSGNyy+o48OS82nEgHFFxX8
	 McphMtGLfkikW0LxVe1kUcc8JQs8ke+oMQrwx64NOaT6kImFsVh+tuscP6tnRn50Qn
	 TARPbV4jrDIQeF8Nb+i8k9KVVY3hhadxsXuVvAO+mYMwugC+HmRcRRVXNNu7782h2q
	 x1xR6A2Q2Hpz1zp5W4r19veTJWG+Yy7KI28O9sEa+zj7W1v3eCRXihF+Wy6Ro2numC
	 L6HxjqRdYLLeDIsTwhXigyc8AagyhqEr+chyQpmj+OG3V4XC8+d7772ItAmmhWEymC
	 UALgzTIzh1MzA==
Received: from mercury (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sre)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 359703782042;
	Fri, 16 Feb 2024 17:15:25 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id C8CA31062D86; Fri, 16 Feb 2024 18:15:24 +0100 (CET)
Date: Fri, 16 Feb 2024 18:15:24 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org, kernel@collabora.com
Subject: Re: [PATCH v8 0/7] rockchip: clk: improve GATE_LINK support
Message-ID: <jh6ykinp6q45qzldujkvwmo6cnmuukhmzflq6jvpjtehbktzbw@ouuslnejf33p>
References: <20240126182919.48402-1-sebastian.reichel@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zxzppxu33phddue3"
Content-Disposition: inline
In-Reply-To: <20240126182919.48402-1-sebastian.reichel@collabora.com>


--zxzppxu33phddue3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Jan 26, 2024 at 07:18:21PM +0100, Sebastian Reichel wrote:
> This is a follow-up for Elaine's series. These patches are written from
> scratch, though. There are two parts:
>=20
> part 1:
> Elaine's series used to contain patches for the VO1GRF handling, but they=
 were
> dropped at some point because of the CLK_NR_CLKS feedback from the DT
> maintainers. I added some code, that should hopefully fix everyones conce=
rns by
> figuring out the right number at runtime. I also moved the correct handli=
ng of
> pclk_vo0grf/pclk_vo1grf before proper handling of GATE_LINK clocks, so th=
at it
> can be merged ASAP. These patches are needed for HDMI RX/TX support on RK=
3588.
>=20
> part 2:
> For proper GATE_LINK support I tried implementing the suggestion from Ste=
phen
> Boyd to use clk PM operations by creating MFD dynamically. This required =
some
> restructuring, since CLK_OF_DECLARE() is called before devices are availa=
ble.
> All of this can be found in the last patch of this series.

Any comments? It would be great if at least part 1 gets into v6.9.
That should be easy to review and unblocks further work.

Greetings,

-- Sebastian

--zxzppxu33phddue3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmXPmBwACgkQ2O7X88g7
+ppVQA//TarEYULVrOVAgyQdDuxfiGe4i5Ot5hRB7iF48whStXQ4i/lCWZpetNBe
Vw4oxoq2LSRXrBCIY4IVMx2hCplTeuTWLDbTkZv7UaAjjAYrOuw6xqamBK6VRK0C
EfnjHHHoKxc+jdg/f2pGdI33ftyO2YOQgUNkpVtjw3xwnYj1gRwBgnOnETP4BR2f
HlDQmF3NTF5lto7p1KETEWU01X5h549WXSX9p9NmhDJh8NmaLD0UvQU0e4MqqBG1
DTq5eNbK50kRg3bol6vSRqrYgHnTmFgS+ArCQx/mUWk1QeaQbbIuAQPvKmzWO6d5
VVtZgiGQ1rfCfGrLBIF+mte+V9cOcCWh8Og7NdTXSTUtaGFNk2qQRTJZQvcpehLn
8PsFdZQkNe3b+Wyajij1WYb2NAzKdhvgkvfvgq/jdrcR5o4ph/weVmwdZRqZybXQ
QtvaOkqxcz0Lx3Mwuy2FzB9GYzmGWU7iAKVZ9B8Fo+iu9L7d2vmDOiASZ8WfpQQK
WmjmOiLK2lfly/PdYYc0SJMRSz7zBwFPqPIyL8l+y4bADO2hFfW25bTZUuLCiuGb
pqD1zFtMWV44C0uVDH7vQNb8bGC4G+gt5xxiohf251A2JElV8JtHBi6oZmcHhzxP
TwYZ1QNu/aXs7RyxcS3HPfajLz1vCCAECDCsNRkdHAOF6gb4pb8=
=KXJq
-----END PGP SIGNATURE-----

--zxzppxu33phddue3--
