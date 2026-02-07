Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF1726CE3F;
	Sat,  7 Feb 2026 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770476052; cv=none; b=ecsH+Bht5PlHInM0/tZfRZU0mT+/K28NxMcUVUIpkNTB6nnRvTbuCuHABF7u+C0phMPbWAb0AB+7IExidWFowX57yRu+UDdBJj+rFBEgl8j7+VvjRFyOM1lXFOCt3Gkhvm6n1wt7Vr5srYbRvJMhr3fjjxpBhLmCDAd2o8O7iP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770476052; c=relaxed/simple;
	bh=RFfl8gMPLYha6nVERWdbRdNuFFRlEftacWu5PZE7Ow8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia1eXwsnN1YJNii0NTa8kRlKpnAmSvJchcK2DP64AlmNtQfdIV1YD86N+fbL8eJx3g7IbgqIRgRyrHBKZMxZfIgAesQij1MedoOSbgiwLR+ycRB5xGfIx3p0A/RepGGohsRq0HcV32ih23kSnZlQYmJMPuSuq9wFXnnc7IbJC9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RRz3imbZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RRz3imbZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F089C116D0;
	Sat,  7 Feb 2026 14:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770476052;
	bh=RFfl8gMPLYha6nVERWdbRdNuFFRlEftacWu5PZE7Ow8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RRz3imbZXKljLoQRsrMI27f58kgGqZL1LQJPSlufrNrPQ4P2RzA8kyNUvO2x9HDxi
	 3+/b6z0VZfax178pfmVPw7ntVnURDncjdDQCAiuk0h4MIcBMUDkYpZ2iXYy8ccUCl0
	 v6ZZuOT0L3pIZhhWlFL7f6Zm9SK3Wc6MOFa9axJddTlTAplxCzqb1SCt9QhU/ZGeO6
	 jfyrJeKTD2TmzsYQKwBA9K8fapmSBtWQ4xWfMb3jFhamMqhTEoWS0OUVFzsTuTe5u2
	 1VH3S3vEYB3X40RKJakVlzznap6UGViXPZWHiKqNza69C66WNAdZu1TsyiBMBD1+NH
	 27V+760s/EJiQ==
Date: Sat, 7 Feb 2026 14:54:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com, bmasney@redhat.com
Subject: Re: [PATCH v5 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260207-stifle-chowtime-8502c0a57f70@spud>
References: <20260202-atlantis-clocks-v5-0-0922e43acaba@oss.tenstorrent.com>
 <20260202-atlantis-clocks-v5-1-0922e43acaba@oss.tenstorrent.com>
 <20260205-upbeat-tortoise-of-admiration-b3c0eb@quoll>
 <CAEev2e8_4LSLNvHsiC4d7Rrd2GmjQ_5GRHU6b9-Ha69+yvn5cA@mail.gmail.com>
 <92512903-4651-4ac3-b3ea-c9297e866a3a@kernel.org>
 <CAEev2e99LEoi83_d09NEJwzcSiYdFFZvLOFZUTRRrYtL_qCErw@mail.gmail.com>
 <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jHVaJZpxu2xKHNVj"
Content-Disposition: inline
In-Reply-To: <e242a327-b53e-4b24-a9c1-9ae990de901e@kernel.org>


--jHVaJZpxu2xKHNVj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 07, 2026 at 10:37:02AM +0100, Krzysztof Kozlowski wrote:
> On 07/02/2026 05:18, Anirudh Srinivasan wrote:
> >>
> >>> this version and I have mentioned this in the changelog in the cover
> >>> letter) named "tenstorrent,atlantis-prcm-xyz". The bindings document
> >>
> >> Where did you mention it? I went TWICE through it.
> >=20
> > Conor and I were discussing these in a previous series and were
> > referring to them as rcpu prcm and !rcpu prcms. I use these terms to
> > refer to it in "Changes in v4".
>=20
> There is no way I could have guessed it. If you remove a compatible you
> say "removed compatible" not "removed !rcpu".
>=20
> >=20
> >>
> >>> suggests picking a more generic name in this case, so isn't
> >>> "tenstorrent,atlantis-prcm" okay for that?
> >>
> >> No, because I don't want to keep guessing this. The docs clearly ask y=
ou
> >> to post complete bindings, which now became less-complete, but fine.

I don't think it actually is "less complete" without the other
compatibles. The non-rcpu prcms function differently to the rcpu prcm
(they seem to be consumers of clocks that the rcpu produces) and are not
supported by the drivers in this series. They're different devices and I
think should only be documented when support for them comes along. v4
had problems that were caused by trying to document them without
actually having driver support figured out.

> >> Then the next rule asks you to use compatible as filename. You cannot
> >> keep skipping the rules.
> >=20
> > I will add all the compatibles back, so there will be 4 of them named
> > "tenstorrent,atlantis-prcm-xyz". In that case is it appropriate for
> > the filename to be "tenstorrent,atlantis-prcm.yaml"?
>=20
> Yes


--jHVaJZpxu2xKHNVj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaYdSCgAKCRB4tDGHoIJi
0uoHAQCaCjMG/cpV7RHWl20TNwzsA3A4KKkeZmrUhJiHt4QHMQEAx/dKSWtHh9np
+LtAoExBU4w5bFzgofZEw3ZwR36quQY=
=qWUU
-----END PGP SIGNATURE-----

--jHVaJZpxu2xKHNVj--
