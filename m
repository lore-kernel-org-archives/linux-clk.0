Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B1F07080D;
	Fri, 27 Dec 2024 17:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735321843; cv=none; b=ayZvbWFIMRw6jC9G8CHD8e2j0Sv+Z0Lu6gfUO6vv9qdQIL1fR9YbdZi4w9134BPrfIHStEpODBjErM4dI8y3lYFeXCyaG2NBKJNmLowIHJclTCCwc6HHyY8A41T0DGdWF0CYXe0I9ZdBjAZbMPNG/g9TtJa8QejKsNb40GmOZ98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735321843; c=relaxed/simple;
	bh=lFKrcYtuZBNCcS3Rc0vU8KzJ0UJlgoarPjv08P8MSGk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAg67pug9KnDNcxG7LA+EChUQnIjLE4Z7oY5WDTvOYmVnTdUMj0a5e76izzd/WOO7tj0z03x/mPTd0AOVcTRb9EtnBAevvN3NZOQsNg6v+rZcdgRKfrrVzD3k2c9C2G+Muj5RE1ulafkK82rcowOcJxgmJBJ7dJxhyqk35LPQQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WZ+uvKMg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WZ+uvKMg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9113DC4CED0;
	Fri, 27 Dec 2024 17:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735321842;
	bh=lFKrcYtuZBNCcS3Rc0vU8KzJ0UJlgoarPjv08P8MSGk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WZ+uvKMgnepkuP5QjdvQQbkxFYmxAAy5/gznpFmhzRyIdsv0eHdao7ce6/djJ9yIu
	 3pvxbSJGdC7rFJfLaHBZWj3uzn/EqyBAz756tLD4s9myf0SG8ilaYbq8fF+wNQHuQl
	 xRuBAAHxVE7czfsA3BGLLetLcHQfDIgv5IMkGFPECook+krjVPx8J9UAO/k1lQCcMi
	 xr5WjAcC62TAStKvAyIREijv+61N+QDdLQgQ/xQQ4XqjQoZbn2haOXTIsl4/rOtGz4
	 6FhDjcFWyQ6PN1acJdgZvegoHUg8rxLrr2fGgppAHLqkvV8iZgXi6gFw95eGesGfj4
	 OlS7mOuEsPmog==
Date: Fri, 27 Dec 2024 17:50:37 +0000
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 3/4] dt-bindings: clock: fsl-sai: Document clock-cells
 = <1> support
Message-ID: <20241227-recede-upturned-cb27af50e469@spud>
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-3-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="NfqBFz6hCIi/7oWO"
Content-Disposition: inline
In-Reply-To: <20241226162234.40141-3-marex@denx.de>


--NfqBFz6hCIi/7oWO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 05:22:23PM +0100, Marek Vasut wrote:
> The driver now supports generation of both BCLK and MCLK, document
> support for #clock-cells =3D <0> for legacy case and #clock-cells =3D <1>
> for the new case which can differentiate between BCLK and MCLK.
>=20
> Signed-off-by: Marek Vasut <marex@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--NfqBFz6hCIi/7oWO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ27o7QAKCRB4tDGHoIJi
0qKlAQDtcO0MUz+ZibWgZIZGp3Hz+KSAPoUD+4Br3mRnLwIpTAD/SewX4TJico3p
gc01kQjCowHE/YzY2y8MKh043acDkQk=
=y0G0
-----END PGP SIGNATURE-----

--NfqBFz6hCIi/7oWO--
