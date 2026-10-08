Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED96149F107;
	Thu,  8 Oct 2026 14:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791468771; cv=none; b=O6/ObKRsWMCFvzEukv2DT1tloAHArEj+ysnLARO9bLCbbUqhMxEhvODGnrlXu+oXl5HosA3QtrXR407yYpp79oV3LatCrB1pPzpfPal95kk9UywMRgWhzmK9s1DS+8ITDvsg7NdVsoI+l7HZeH8S9gMEuHm5TPFShZqI1Eb4W/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791468771; c=relaxed/simple;
	bh=l2+Dw2sl5OPeSblngQFwY5OyEBVB0Z8ra9CpUyTrnOo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H+clkfXMjBGgmLkEcPdpbKdjkbskup/+rG8q9AWM/V2cOaVh12M5e5kNPuogh3qp61BUNI4uTigYNx/92eIWV8YXwJo/ckx/6WLPvt+07oUhTfC6cDSPYrvxSf2Bjtn4u1t6XGgyJ/FEA7kTNE2DDWML32fsoXGSgrTHzJRTu1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWoE9FP0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWoE9FP0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0723B1F00898;
	Thu,  8 Oct 2026 14:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791468769;
	bh=l2+Dw2sl5OPeSblngQFwY5OyEBVB0Z8ra9CpUyTrnOo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bWoE9FP0wQV5OmBAi0qERMdgFHVZF6+BMd1JtPaH3LfzPH7DHx+jug8rzZMePt6Bo
	 8oWlSPigSVelqXtNLkl7FQS+Qnnr4U6A5o4mSdEdXrYQKO1RUnTFjlvghrDb+kHEld
	 EvZFNSkry6zzvz61wZpbqg9gfUvMKMY0SqMRvrjd88vCANKWkmIDquJAS7dqNLTETS
	 Q59psaqqxlaWzPVLvclAh5/RlI8m7hR6lpKf1TjI4KhqccH4w19Q5CUYNeRqU9NMy0
	 MSeiyzgbpRuAEkcJYg1W4bnHS8FKV2aaGafaRv/5QuRqzQrScqNwyGBB2zEhbrVAF0
	 HtYKJZyi0sgRQ==
Date: Thu, 8 Oct 2026 15:12:43 +0100
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261008-c59c47fb901176a0137497d9@squawk>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
 <20261002-crimson-unwrapped-b067e86de38c@spud>
 <ar_wmUWEXgIzq1XM@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PORdzqZiVWL//Jy/"
Content-Disposition: inline
In-Reply-To: <ar_wmUWEXgIzq1XM@redhat.com>

--PORdzqZiVWL//Jy/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 02, 2026 at 01:57:45PM -0400, Brian Masney wrote:
> On Fri, Oct 02, 2026 at 05:33:24PM +0100, Conor Dooley wrote:
> > On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> > > The external CAN and watchdog clock inputs are not routed on the MLKP=
AI
> > > FS01, the only board currently supported. Drop the two fixed-clock
> > > placeholders from the common dtsi, as fixed clocks require a valid
> > > clock-frequency property.
> > >=20
> > > Both clock muxes select their internal parent clocks after reset, so
> > > the CRU operates correctly without the external inputs. Keep only the
> > > required oscillator input to the CRU.
> > >=20
> > > A board using these external clocks should define them in its own
> > > board-level dts and override the clocks and clock-names properties of
> > > the CRU node.
> > >=20
> > > Reported-by: Yixun Lan <dlan@kernel.org>
> > > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for DR1=
V90")
> > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> >=20
> > Per the v1, Brian said he would rebase the clock tree, so I'll just
> > squash this into the original patch I think.
>=20
> It's already rebased, and dropped from the clk-next history.

 Cool. Note to self: 7,5 material, cos I don't have the headers to do
 anything with "riscv: dts: anlogic: add clocks and CRU for DR1V90"

 Cheers,
 Conor.


--PORdzqZiVWL//Jy/
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasekzAAKCRB4tDGHoIJi
0jgcAQCV80DNHnZs3oA4mbKQsMOiguSK3pNNz515ouRmtabi8QD9Epi9eNek5bZS
tPAWl8KmezP6TImZIhyLE2yhXcBEIQM=
=Bhh6
-----END PGP SIGNATURE-----

--PORdzqZiVWL//Jy/--
