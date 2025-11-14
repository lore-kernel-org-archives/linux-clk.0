Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FDD3451AB;
	Fri, 14 Nov 2025 17:54:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142889; cv=none; b=iotT1jCmlsd96LQ++SF8rQePKYcvxquQ4CoigBcDtxSzIm+l/rDTBV8KbrwtZOM4+rYtrx6dnypOjAU57FArIDHlD+lcMXRo2I+i33pkb0uFUsV8sTG1CfRlANrcaK7EWGv3KCWtoGy/I7y+5WtGKTbroLUyYE0C3esDy5UDANw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142889; c=relaxed/simple;
	bh=Wdd4m8H94V0HEUG8X+Wlhilt+04J47Ja1Rp/HOiJ9C0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JfrgxtAoJ+xuooojT8+pS/h+UW7Xu9qhNdP6ilZacV6iW4xSpgBdXXyj7sxi1AH/0QkAFWUx7RBL8nJ/7bjhzvpJcuAz44SDtInHA+O/Mv69YE66d6utzDmW3fi4cc96xtXBiLE4efqKIZqDrtn/vqU+Swlu259icuesYVDNt9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqwR0FCN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqwR0FCN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4C3CC4CEF1;
	Fri, 14 Nov 2025 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142888;
	bh=Wdd4m8H94V0HEUG8X+Wlhilt+04J47Ja1Rp/HOiJ9C0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dqwR0FCN0QKUErLUhb3He7F2rZpXq7+jPj/RTnXwu4HzkZ6VFeAnZyfLpNvp/AiON
	 qFNWmuFX8AaCMQtTgIMwadNSMnCI5gqVuGVXYydMczkoRCkpSaWzHbo1qOIqVoBovM
	 bW1HYPtvLzzMU9WMeEohb87QaBbhymqUJ+0sUAnv8VDiHIlN6KL9j5yBtNrwsjLwL/
	 3jYi00/jfCwVm7MqgcbfTW1KFEW2TGKbjR1ou79oKdU2q4BHxBxdqAZWOJTGyOrDOm
	 FxnKXZZEtMj5Rc8JJXS/yYiu5f5L+i/FrEPvmceKlK5nMICb4cnfMcbJ88IBYR6ngE
	 ZztUsiTj3YUIQ==
Date: Fri, 14 Nov 2025 17:54:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clock: tmpv770x: Add VIIF clocks
Message-ID: <20251114-sugar-landline-4807f7aea78a@spud>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
 <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9rif5lqzeUnw9k0G"
Content-Disposition: inline
In-Reply-To: <20251114070512.855008-2-yuji2.ishikawa@toshiba.co.jp>


--9rif5lqzeUnw9k0G
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 04:05:11PM +0900, Yuji Ishikawa wrote:
> Add clock and reset identifiers for the Video Input Interface.
> These identifiers support two instances: VIIF0 and VIIF1.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> ---
> Changelog v2:
> - Do not modify existing identifiers to avoid breaking ABI.
>   Keep existing identfiers for VIIF0.
>   Introduce new idenfifiers for VIIF1, following the same naming conventi=
ons.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--9rif5lqzeUnw9k0G
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRds4wAKCRB4tDGHoIJi
0i3mAP9BZ58ecSObGvNAeb+JOYPmq90PTYrAPcd7dTnM5cjFMAD+MjZ8JbcqgUAM
+iTdGaIZBLWumfgiZZnUNc5aoli9Ugw=
=yIFm
-----END PGP SIGNATURE-----

--9rif5lqzeUnw9k0G--
