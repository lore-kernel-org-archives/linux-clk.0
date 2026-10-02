Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4562D305680;
	Fri,  2 Oct 2026 16:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790958742; cv=none; b=iCcDqJCikJTxSU4k0L3cJTmcixpEGyVEMdxYoTOa/pZI19jKovaN/S8LPYwBzG+1pvXfvuVlhE9fJyP3js26Joxlin6QFV6nV/MHt2mJxFPXsQxTB3bz4NUTBYwQkd75/PV3m1A/s/jEOZq4G0vmuduKSPMnT1NlYGGZNlmt0ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790958742; c=relaxed/simple;
	bh=uxfVBfwSOuB75D2e85exi7+uFfYhlsrQty+NcIv6boQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIh7DlBpKzE/ef7vxMAaV/+yxz1VdFblp2PQNEir3jXLYmWjQZKTvY6ayJyiTlxJ2trQ1ZWE+Z3GAZfwF7WTGNjf/N02hOa6ddKKNO92bJWh/H6hI+NVdmxwdbift5tkBZazkY1FhASgAV/mVtbwOsl8rciLDXxwlu4PuU5iEkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTyp1hXZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTyp1hXZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 918281F000FF;
	Fri,  2 Oct 2026 16:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790958740;
	bh=uxfVBfwSOuB75D2e85exi7+uFfYhlsrQty+NcIv6boQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aTyp1hXZirIF8DPS3ieHatIXXXqhaXTWz+btP36Tt5fv80utdU7+b5/yPsjX+ESvp
	 XJHYdYEGH6AJL9sOw1AxcJF4cd3zfgOOmStVrxRxmqN397I5zGyjeh3utvOg+7fh8H
	 FeKb8PEgR0BKxZN5oKZcTVRTnbvko7eOgSBStanRz+AZd/d+Zp/nJAnEmlNTmyYEjY
	 I6xuLRGtNDeGL3++2P30Dtk3Gim0ilbDsXEpw2V5EQumGqWETyY0Rk9+Mn/Q2QFWya
	 CG1FzcINM8wu4r/ndtNUdPI9t7D8bQsO73FwdkicgVcr+ocG1NRnb2pXCxbJ6LehMe
	 dxj+59/R+4ZLA==
Date: Fri, 2 Oct 2026 17:32:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Brian Masney <bmasney@redhat.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: anlogic,dr1v90-cru: make
 external clocks optional
Message-ID: <20261002-diminish-hemlock-53c312598e59@spud>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-1-6e7d96612ac0@pigmoral.tech>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WhWOesNcYkUJujB7"
Content-Disposition: inline
In-Reply-To: <20261003-dr1v90-cru-dt-fix-v2-1-6e7d96612ac0@pigmoral.tech>

--WhWOesNcYkUJujB7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--WhWOesNcYkUJujB7
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCar/cjAAKCRB4tDGHoIJi
0jK+AQCyOByJ7hzNNmJWJcqHDvrRKrtzDP9vD9HLVd4wkDyZwgEAozMYNFcYlsV/
w3pfnIkuUnenISTZtRovKm2GxW1kiQA=
=700p
-----END PGP SIGNATURE-----

--WhWOesNcYkUJujB7--
