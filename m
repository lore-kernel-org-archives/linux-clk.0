Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBC6176AC3;
	Mon,  2 Sep 2024 08:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725266416; cv=none; b=m3w5/LdEAT6p0jjRSHH+7Pstkhcutqbbljr2uRqmGa2HrvxuKOU3tqND9ug6+rwMwuepGxgEHZ6ajgiidhKkRPKxGn+HQAwtQczkzsyPt5wHhqXhoacHz43jgnk/A1eRFM/vcVYoNNaJvnlQInxtloMq6Q9nm3BRmWJSzuO336c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725266416; c=relaxed/simple;
	bh=zNVBx7xviAwbKHTfx4Cd4SpNx0sNkP8Yw7ZfBh6EPaU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCNBxOyhE17HCDup5gJU+bikIokFfKWtfcoQpGaBe+r2PS36xK7fV6lygW12qtUf5javLVfyGbxWRa4kAttBcoEFHdmgoTjZZcB2eOretEIebjbxmVzqCOa+VbBomap9TTEFTZyOGi6LAI9xhC3MUow2nYXDXC9QTIK8ZnuVGKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tpwSpcqh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tpwSpcqh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 915DBC4CEC2;
	Mon,  2 Sep 2024 08:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725266416;
	bh=zNVBx7xviAwbKHTfx4Cd4SpNx0sNkP8Yw7ZfBh6EPaU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tpwSpcqhmnWAu+sU4aTQSQpuSEhRXp5ZtfY5kld0q7iyzbrpXcRQzlKhTtefV/ENX
	 h/VeLM5nAwY473H9knvD1GDei7UjB5f3lv/xA2HlaN5RWJAcvP4P4h5ZB+1ulQu6ax
	 H5cqSMMy/VVYsrvEu20SYMUp1VqSY8aN/sp1R2RcPttiClDJwteDcrjgowUtlk7uCw
	 WESLblhafjlxwzT+2QQQYV9sSvpqhCbUP6LtXfts9CHe3rt6zQ5NLO6Ire977WTpD3
	 Hgmunb5RfV9NTRjomAiId8Gj3QE4MLVQoY6MLNr+YjiamkpnihRZaDg+YUrtTCBNjR
	 JzRMkkRNOGWEg==
Date: Mon, 2 Sep 2024 10:40:13 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, upstream@airoha.com,
	angelogioacchino.delregno@collabora.com,
	linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	ansuelsmth@gmail.com
Subject: Re: [PATCH 2/7] clk: en7523: set REG_PCIE*_{MEM,MEM_MASK} via syscon
Message-ID: <ZtV57eqI_9PbU1Pl@lore-desk>
References: <20240831-clk-en7581-syscon-v1-0-5c2683541068@kernel.org>
 <20240831-clk-en7581-syscon-v1-2-5c2683541068@kernel.org>
 <20240902-supplier-identify-b11b89a9a4da@squawk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BNuYohvowyycDFEL"
Content-Disposition: inline
In-Reply-To: <20240902-supplier-identify-b11b89a9a4da@squawk>


--BNuYohvowyycDFEL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, Aug 31, 2024 at 09:18:44AM +0200, Lorenzo Bianconi wrote:
> > +	map =3D syscon_regmap_lookup_by_compatible("airoha,en7581-pbus-csr");
>=20
> Is this compatible documented? (On a laptop in an airport with no recent
> kernel tree, so I had to resort to searching on github which turned up
> nothing).

ack, I missed that. I will fix it in v2.

Regards,
Lorenzo

--BNuYohvowyycDFEL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZtV57QAKCRA6cBh0uS2t
rLjmAP9CjFkXxw7p5AKa8zaywzRHZjMqC1JLFryTYF5XX6HqQQEAqKLlPfd+LGI2
S+cy+NVvz6MN2CYue7KUUBdTP8RS1Qs=
=ySg+
-----END PGP SIGNATURE-----

--BNuYohvowyycDFEL--
