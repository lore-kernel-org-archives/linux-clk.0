Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B23F6435502;
	Fri,  9 Oct 2026 15:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791558752; cv=none; b=hrD/uCqQF+kw7+oLiVTUQLxJlfaH9i+jgZ0BIsXrEgVXJvCjeaGoZazdDMgCz7kSHrQmjyOolT5yQwH7x5U4ix/EdiZjIvwcuFufOVzeZrRclxZqhm9s6l+rat6rRULgX+hAkRmxmwHnfCoIQs5ZcuccA7i41dM6Q2E2ZchRVdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791558752; c=relaxed/simple;
	bh=olOmmPmGFqNNcg0Zst/W5zAkcZJI+Z29s/IoRZTUVb0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oogx42p4WWh6llMz6y+8xplfS9LHN9mQs9P7nnhmnJ+8cmSgznElAl/fFYlduo2nuf5K7dPswjiwgItYhB2VmdWFs9GRJyHZc5VhoWB4SIDQ12Jwz8ijigGC+YOvaOCx0VOxxNfsZ3N+uK30U5PxheJpCqLRI9+99vELOqebgk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Va5Cfc5A; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Va5Cfc5A"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D152F1F000FF;
	Fri,  9 Oct 2026 15:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791558751;
	bh=olOmmPmGFqNNcg0Zst/W5zAkcZJI+Z29s/IoRZTUVb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Va5Cfc5ApgvitCZfwLq10hTAk6Q8axCqH1oJ7iEcs/1Eyc9bXi1syE/gxIibblDt6
	 yaFodEUab3wv0ZQJLat9WHjH8DSaNUEeMGE6PcjTThf7Px0fAz9cYCN4oBkFGnsN9n
	 5e2dTKG5gsuMc7cuuKJKJcBgutaRgJgkZsyvldXK71mxKnHvs9NgyC70+coBgcE66g
	 vmZt7/cs2zrYt5I1V961+0lzRIBfG6FBEaSI7YjNWtVH24bGC3SN5DNmbedXv5X1Xv
	 f7BXcn5C5oF6Iaq3vlU2q5IV7jmlwr0ltIGCpayw7B5m6+bBz1uSeF3K74S4DUWwuK
	 4F4AY1kjNczlQ==
Date: Fri, 9 Oct 2026 16:12:23 +0100
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Felix Fietkau <nbd@nbd.name>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: airoha: Document support for
 AN7583 clock
Message-ID: <20261009-b41aedc4c5583a8a94926925@squawk>
References: <20261009070725.13196-1-ansuelsmth@gmail.com>
 <20261009070725.13196-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n0yqVrd99r7dCRww"
Content-Disposition: inline
In-Reply-To: <20261009070725.13196-2-ansuelsmth@gmail.com>

--n0yqVrd99r7dCRww
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--n0yqVrd99r7dCRww
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaskEVgAKCRB4tDGHoIJi
0i1KAP4/1fiyCdZE2W3Y0WE4NettwmrDS4G86eVh7uxRG8wuzQD/cgSngkQMm5Y7
ccQCm59F/i8zEdVHgK3CInCptLyi0w4=
=SaTR
-----END PGP SIGNATURE-----

--n0yqVrd99r7dCRww--
