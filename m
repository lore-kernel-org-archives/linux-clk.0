Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C6C26B971;
	Fri, 23 Jan 2026 17:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769188014; cv=none; b=Sw+GqxtZ9kpoXLydQ4lanAzKIpzpAhR0OF49zzEwMw7tJE32WExpvwNsb+vjLJqD0HxIqJbN1Az1h0N4rfB5R70TFEJfEztg05cVUJd9v5mo5r+tf/UkVBKD+rhh96DvvrbTez1u/9nytmAQGAi6tiMwFftZzyC0nF4Akgspgmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769188014; c=relaxed/simple;
	bh=S6IkRdXSFQzypn/cgmHg3KTxXN8Jcv25C2u6RZy8SFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hMka+Y1rKA1sNF4LH8uh5+Lv45Qo8KUg0XNxgbhWk9MYwGKP4oUwxLd+RTwXr+NSBiLTdKfkFmwfd6oxrDohaJL74uJMoqe3MrkYP/m5lSzj41mLdYk/kqA4b/AIJ1Ik7W4hxdGYhV9utnlIkP0f4VuZk3EmZPZaRJfV5HTJnZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfyqTvkB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfyqTvkB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098A1C4CEF1;
	Fri, 23 Jan 2026 17:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769188013;
	bh=S6IkRdXSFQzypn/cgmHg3KTxXN8Jcv25C2u6RZy8SFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IfyqTvkBjP5BbY85zyDvY6BVT2fnH9NtG6HV0d9ZyMX/Xoz0WHRooY3R42Z87Il10
	 5m+8QpSuF1ISZAx0e3uqgt7Yunirw2+RHU4qeoVIZKFxQgWtzXlNCJkKK35DJ1E+hV
	 HWtUxHoR/HP0UovWHJlXYNqI5st9R6ZkoDBwGY2Ou34WfyxNv+Uh4oYBUIUXRVDKhe
	 FYOxHatif5JqhMzQlZfcsGksWW2zi20PYjhTiDU0fWg1dh5PAeW9hvZD0KngR9qFTb
	 pAYd4U8mOreEcOMkM0RGMX2lYVPvPqK16HizwSGNEoKlNNynE63pFCKp8eIHCGw2nW
	 oP31CVvXKp6jw==
Date: Fri, 23 Jan 2026 17:06:49 +0000
From: Conor Dooley <conor@kernel.org>
To: =?utf-8?Q?=C5=81ukasz?= Majewski <lukma@nabladev.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: vf610: Add definitions for MTIP L2
 switch
Message-ID: <20260123-rework-stank-5a364bf88af6@spud>
References: <20260122125838.4144700-1-lukma@nabladev.com>
 <20260122-unlaced-porthole-1983bc69c03c@spud>
 <20260122202603.36ed7944@wsk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bo4H8p00HSNTdmeG"
Content-Disposition: inline
In-Reply-To: <20260122202603.36ed7944@wsk>


--Bo4H8p00HSNTdmeG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 08:26:03PM +0100, =C5=81ukasz Majewski wrote:
> Hi Conor,
>=20
> > On Thu, Jan 22, 2026 at 01:58:38PM +0100, Lukasz Majewski wrote:
> > > This patch adds VF610_CLK_ESW and VF610_CLK_ESW_MAC_TAB{0123}
> > > macros definitions for L2 switch.
> > >=20
> > > Those definitions describe clocks for MoreThanIP switch IP block;
> > > the switch itself and the MAC address lookup table clocks.
> > >=20
> > > Signed-off-by: Lukasz Majewski <lukma@nabladev.com>
> > > ---
> > >  include/dt-bindings/clock/vf610-clock.h | 7 ++++++-
> > >  1 file changed, 6 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/include/dt-bindings/clock/vf610-clock.h
> > > b/include/dt-bindings/clock/vf610-clock.h index
> > > 373644e46747..b6f7b1745cc2 100644 ---
> > > a/include/dt-bindings/clock/vf610-clock.h +++
> > > b/include/dt-bindings/clock/vf610-clock.h @@ -197,6 +197,11 @@
> > >  #define VF610_CLK_TCON1			188
> > >  #define VF610_CLK_CAAM			189
> > >  #define VF610_CLK_CRC			190
> > > -#define VF610_CLK_END			191 =20
> >=20
> > If end is modifiable, it is removable. If you need the define for the
> > driver, please move it there.
>=20
> Could you be more specific regarding your comment?

Values in bindings are immutable, so changing a definition is an ABI
break. If you can break the ABI for this definition, then you should
just remove it instead, because it doesn't represent a clock and it is
liable to change when you information comes to light (e.g. this patch).

> The VF610_CLK_END has now value 191.
>=20
> However, there are other clocks in this SoC - like CLK_ESW and
> CLK_MAC_TAB{x} - which were not taken into account earlier.
>=20
> What shall be done?
>=20
> Shall I remove the VF610_CLK_END entirely?
>=20
> Or move to the new "end" (as done with this patch)?

If you need VF610_CLK_END for your driver, rather than just using
(VF610_CLK_ESW_MAC_TAB + 1), please move the definition there.

--Bo4H8p00HSNTdmeG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXOqpgAKCRB4tDGHoIJi
0pPzAP0XViMQ/ABii3Q6VmMbs5OtfE4iZF8MVXW7nsPbcGgezQEAnxZGahwfSWqR
1SVWOQ4cmTwqZZh0ZNu3d0Ooagudugk=
=hCx5
-----END PGP SIGNATURE-----

--Bo4H8p00HSNTdmeG--
