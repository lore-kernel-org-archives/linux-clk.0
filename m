Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 697C13AD52B;
	Wed,  3 Jun 2026 16:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780502893; cv=none; b=N2uAdcrjs6EOEfQODopsgfrCwZvQivGhcgUWH6sqKkcYzOGeEv3mK8ylfayjxFK34mFe+b+wL3gjGk3yRr9aAa54aIrZnntEa+sKJXMlIuBadqZYgLaePcUdRIy1YpB5duNX6klvjNv9q5Z98IRbkkNi0VHB5fsAcztJPp3mpE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780502893; c=relaxed/simple;
	bh=FA0xQoILQqub+rvtajqFi3ePzhMoUg83iC4gxCGEUDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tYseWrxx5qt/5rp7pDVN+1aaAozi5S6OTwDuCLQ4VnuMCrekakjqAQXOUW53e4ntZMYANr0oUXTHCdvwagiq+5NrdIbCQiB8VCVXsEQvRMLJyBFZaz9iB6MkW2udTpqJKwYfuBmZFvRC2DNdd3D9dxXVqo4d/wyKCqlxSzhiM/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VUSO/A7x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VUSO/A7x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C14AD1F00893;
	Wed,  3 Jun 2026 16:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780502892;
	bh=F3mD29aDqfpJd7nw1lljndcL5wp80gSNpUcOx+2pKgg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VUSO/A7xKYz+1rOAXkU1k3JZTgN8sbe+hTxg+YLKB8OuwYpN2Yz47ZhD+ZxND99wK
	 yw/OGRIOvBtis38calrE5rSwDHhVWHwyWvbQd8oxv4ShYT5uRSnTHbyWllS0uAKSeA
	 BD1y/0EZevBdLD0q1Sw8zcwVbdj2xNI2htPaDOm6cMKSF9yNPJeXq+c9LlyGJg3VLo
	 nbW9q2QoQpFzWDp3Tvq/7kZHiJpIQsGKWlKheAStOsrnOy6nC9iaMVULH23g5XHUeN
	 uQBCffBhpyIHWVsSwe6Lx6GdVuKHxqVL1gSemFjix68nZ5gb8xpKdCF9daTdR+fQlX
	 JQlQ2V7sg1Oxg==
Date: Wed, 3 Jun 2026 17:08:07 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, monstr@monstr.eu, git@amd.com,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v3 2/5] dt-bindings: clock: versal-clk: Fix mio_clk index
 range in clock-names pattern
Message-ID: <20260603-parasite-hefty-8da6d54deb0a@spud>
References: <cover.1780499520.git.michal.simek@amd.com>
 <5662c24a9e65310fc6520afc95f1a639fe6d221e.1780499520.git.michal.simek@amd.com>
 <20260603-catlike-uncrushed-b98b66dc92c1@spud>
 <c33b3684-bf96-4c2f-8251-9ac7c1444c3f@amd.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="l4BagllEPKb3euRk"
Content-Disposition: inline
In-Reply-To: <c33b3684-bf96-4c2f-8251-9ac7c1444c3f@amd.com>


--l4BagllEPKb3euRk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 03, 2026 at 05:35:37PM +0200, Michal Simek wrote:
>=20
>=20
> On 6/3/26 17:33, Conor Dooley wrote:
> > On Wed, Jun 03, 2026 at 05:12:07PM +0200, Michal Simek wrote:
> > > The clock-names pattern "^mio_clk[00-77]+.*$" was intended to constra=
in
> > > the MIO index to the valid range 00..77 (ZynqMP has 78 MIO pins),
> > > but a regex character class cannot express a multi-digit decimal rang=
e.
> > > Replace the bogus character class with an explicit alternation that
> > > enumerates the two-digit decimal values 00..77.
> > >=20
> > > Fixes: 03d4a1004053 ("dt-bindings: clock: versal: Convert the xlnx,zy=
nqmp-clk.txt to yaml")
> > > Signed-off-by: Michal Simek <michal.simek@amd.com>
> > > ---
> > >=20
> > > Changes in v3:
> > > - New patch in series
> > >=20
> > >   Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.=
yaml b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > index bef109d163a8..d843d95801b5 100644
> > > --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > > @@ -116,7 +116,7 @@ allOf:
> > >               - const: pss_alt_ref_clk
> > >               - const: aux_ref_clk
> > >               - const: gt_crx_ref_clk
> > > -            - pattern: "^mio_clk[00-77]+.*$"
> > > +            - pattern: "^mio_clk(0[0-9]|[1-6][0-9]|7[0-7])+.*$"
> >=20
> > What am I missing that prevents 0[0-9] and [1-6][0-9] being merged?
>=20
> correct it can be put together [0-6][0-9].
> Was playing with [0-9||[1-6][0-9] or with leading zero and decided to use=
 00
> as was intention in past.

Ah, right. In that case,
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--l4BagllEPKb3euRk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaiBRZwAKCRB4tDGHoIJi
0kPDAP0bzLSAEF9NzU/d4L2MiiDBNCaRVDo6n4KAjWuF1yW1OAD+JOTJnYNp75Zv
6zPL2XVrogdE+lNiBwltDexh9yyQSAk=
=Mmmy
-----END PGP SIGNATURE-----

--l4BagllEPKb3euRk--
