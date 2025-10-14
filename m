Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81171304BDA;
	Tue, 14 Oct 2025 17:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463003; cv=none; b=OgQD2Nm/lgHlhFXBgq1tSeplC2srcWANX6OBxjO7FGB6xgt6bsp5VHcNLbtXZB5wZ/KR180nL3NCJzUJCbWtGVXHPkjt1AVuJz/YfvOOGsgFNMwTWeHbT6SfEdiPruKA91gjSQx+OJ9R8VtqZESuC1vnI39Gxteck2tlMpp4pRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463003; c=relaxed/simple;
	bh=lxTHNrNEn65TcFb9Mt4czv1JDx4DrJ9v0Fa+yCS4Krg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tjs5t/fDaTCxlHwprQ2T//dVaciujQx81lS+A4FXGQzjMS25LXLByMz35SUHtrg22h6NfefdOBpkbSJsECvUdELtoGm01yZmMQAeTlLm0GOGI8nyUmY9n5IUnu7JkO5eX+oN0YjVchcH2P0qLqR/gQk9jhJGLE0FlJiAjgl0V3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l/SUphFl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l/SUphFl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1876DC4CEE7;
	Tue, 14 Oct 2025 17:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463003;
	bh=lxTHNrNEn65TcFb9Mt4czv1JDx4DrJ9v0Fa+yCS4Krg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l/SUphFl5Wg/gx5N5k+Obv7h+O3tC3/feJaFfUrS4jrkuhteB2GIcThVkLlcZ4Aue
	 G99j3CpL4KpPxy0vri260ZUyjnSKrbuU/ujB7Vl4KRcDd3hsvSdGpVDyFJim5Mf+6q
	 s9V+ESXHn1MP3vpEJCRpsJq+rE+tWJ70zK2fF30GlH6husKzPWy2knQOHdswMTahTd
	 mRnE6L1A6jps9qrBa9Rn4zHqJh9xMIjAs+OQw6GA9n+UX0O1ZgrPad3PWX950QI9G6
	 p7rhutp8TOI63Eip8w0f6lBYVe1B78ddP1TBsRN6WWPHW6zSpVnxJZINBagTcuPqqk
	 jv/hKlRi6qx2g==
Date: Tue, 14 Oct 2025 18:29:58 +0100
From: Conor Dooley <conor@kernel.org>
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clk: si522xx: Clock driver for Skyworks
 Si522xx I2C PCIe clock generators
Message-ID: <20251014-sixfold-backslid-2f4158e35011@spud>
References: <20251011223846.261652-1-marek.vasut@mailbox.org>
 <20251013-finally-stopped-7f5ebac801b3@spud>
 <de68a605-8b42-4dba-bd59-4708a5bcf542@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bj3uk/bTyhAiE5NY"
Content-Disposition: inline
In-Reply-To: <de68a605-8b42-4dba-bd59-4708a5bcf542@mailbox.org>


--Bj3uk/bTyhAiE5NY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 14, 2025 at 12:56:29PM +0200, Marek Vasut wrote:
> On 10/13/25 10:00 PM, Conor Dooley wrote:
>=20
> Hello Conor,
>=20
> > > diff --git a/Documentation/devicetree/bindings/clock/skyworks,si522xx=
=2Eyaml b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
> > > new file mode 100644
> > > index 0000000000000..6ad26543f9d21
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/skyworks,si522xx.yaml
> >=20
> > Can you just pick one of the compatibles here?
>=20
> I reused the existing pattern from previous binding document.
>=20
> Documentation/devicetree/bindings/clock/skyworks,si521xx.yaml
>=20
> I can use the 52202 for this binding document if that is preferable ?

yeah, I'd rather that, thanks.

>=20
> ...
>=20
> > > +patternProperties:
> > > +  "^DIFF[0-11]$":
> > > +    type: object
> > > +    description:
> > > +      Description of one of the outputs (DIFF0..DIF11).
> >=20
> > typo, DIFF11.
> > Does this regex actually work? I don't think it allows anything other
> > than DIFF0 and DIFF1, since it evaluates 0-1 as a range and 1 as another
> > range.
> Fixed both, also fixed rs9 bindings and patch posted.

--Bj3uk/bTyhAiE5NY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO6IlgAKCRB4tDGHoIJi
0rM2AQCOXXBQrTp3nRW9SfSppsqxuctCkfpuiNofG/c85xgiIwD9FkGhCIJtoYg+
VMZhnY43W0SJvmkehrQRRhBFb117wAc=
=DBm2
-----END PGP SIGNATURE-----

--Bj3uk/bTyhAiE5NY--
