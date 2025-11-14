Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2FD345CC6;
	Fri, 14 Nov 2025 17:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763142912; cv=none; b=ORns+eGVpywY0s1HXrWfHFk3pi2xZ8++N9i8gMPaLoh59IaKiqs+NpOFa04piCsZjC/Cy6hBA4IDPws6ImaSoN/fikDyroCSpqLGy10DvlB7/cXmJ5yzsXVzCLdwXC/aQfArJP3EGzqb97AoPbJLbcAXZ1lONliiWBnWwPBrFAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763142912; c=relaxed/simple;
	bh=Bbn75JmNL83npodCTJTBOAPaDgy6voJdhk7xvelQSXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xz9kcjy3TTnNsYsAmksYY6PULLFQfH7ERIoONcCjWxrLossGtoh3ICuIMcAFTXSKX/yJZxJqHKOGhD7b+o/GCNYafU29Cj8aYxyQSGPyf6+dsRR3m0CmUzPgsvtEubL/mXJkmWJMgyAJnLayDNVukGIiI6pGHE7XUESX7R9RJB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a6X541PQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a6X541PQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49221C19424;
	Fri, 14 Nov 2025 17:55:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763142911;
	bh=Bbn75JmNL83npodCTJTBOAPaDgy6voJdhk7xvelQSXk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a6X541PQcR+vUg9Qe47frMIQly2Sd2xFW7KLq4G7AYVFOl1az3CbbARBIl5b8fPYq
	 QnFc8mT9SIpMPZ9+2+2DbhMLb2/hv3dgG6I2aBUBnEwCCPRh0xBAy24Us3RujLoG7F
	 QESqh1+T5o/Wd2b3dBZjoZXHpbckcsCdChLlgoF5mi46lf3JQLSoZ3NqQA6bMd3Oi9
	 9akNt/t/3Sz2BvWKZKEQgRTdFq+Mq+7c0xg/GFBHKJUWQsJsFrh3Q5tlFCvurg7ltg
	 7yBmNSc57mki9Pzv9PNasRGIfkXiYByHmq1aClYxWdpspQ9yry2xG63Kea7bGBT5J+
	 R+EEG+Rj4UdvA==
Date: Fri, 14 Nov 2025 17:55:06 +0000
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
Subject: Re: [PATCH 2/2] dt-bindings: clock: tmpv770x: Remove definition of
 number of clocks
Message-ID: <20251114-gatherer-landlady-de35d5ecab9e@spud>
References: <20251114065358.854817-1-yuji2.ishikawa@toshiba.co.jp>
 <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2MovHCO94YyZNoex"
Content-Disposition: inline
In-Reply-To: <20251114065358.854817-3-yuji2.ishikawa@toshiba.co.jp>


--2MovHCO94YyZNoex
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 14, 2025 at 03:53:58PM +0900, Yuji Ishikawa wrote:
> Remove the definitions of number of clocks from bindings because they
> prevent adding new clocks. Since the previous patch removed all refereces
> within the driver, they can now be deleted.
>=20
> The same for resets and plls.
>=20
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--2MovHCO94YyZNoex
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRds+gAKCRB4tDGHoIJi
0lV2AQDV0BxOT40o+VE6NKbdmT7olKBY8l4rzUaLXTsZxea9EQD/dfaGYz26GiUt
Odbl5zIWpStM9pj9OXriS0kswZdHYQY=
=Vb4j
-----END PGP SIGNATURE-----

--2MovHCO94YyZNoex--
