Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56F9227D782;
	Wed, 28 Jan 2026 17:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769621573; cv=none; b=SgltsuW0YzX0g/D+v6nt3ayuM3JGsHDlA3S8nd8ahMFI3XMEzhydmy3FyUpvFLUEZPr6/1tv7ougpNhRJYEUxdPGXsc7oJ/QOJl+eFkO3JhCKOfzdoCKCxcqk0WQeHWIbqA2S66MCy8LhyFucWNW8LNUPZtLB2d6sZAf20FSPQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769621573; c=relaxed/simple;
	bh=hI6NqofsXTOOPFq8DfXONvDZU0fg8MOdgkvelsOyIzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OyR8AY/IJ+SVFGKxXQmtjzCS9h84ZSB+rECNW0HPw/TyUuiMSUKu+z20fJInYT4xquOF2dZkQTaRxal8BCryNQahj8La/AdE8hcm9nmIMSc07YnZlSqr+JDvwxS9Hg7sgRhsko/M6fVE9Ei87n/j6/C4ApxXIpzKh0TQ60KzQaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QK56Y3Gx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QK56Y3Gx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA12C4CEF1;
	Wed, 28 Jan 2026 17:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769621572;
	bh=hI6NqofsXTOOPFq8DfXONvDZU0fg8MOdgkvelsOyIzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QK56Y3Gx9Z3haf1058CMfTCwwZaPvIYCdL7tJI6/+9YpDKuZk9rj4/AXXcvH2/KLA
	 FAkq7nFqBDb2Lku2oDKC6wfRFt5p09yUBZZndYjU89xQm4SMo8+bJ8PHsk4p3cTK3o
	 5tlT7wGuY89NwE97zRCcysHg015ofI3FEPx+yO7jrWpL70ZOl8Su7pfPEUeAC5Blnd
	 VJvf7sw3vJbS5bAKJjrN1DbC7rD23FeXOF2DgVaEDUskZ2CVOrbRJV9rf/Ffex6om+
	 Bz7Zd+OWbWx2NENRvZjc7AkT6q4m7kGGnKPEDo1W70jiAFoceDBlIq+PtPBFAC+tQd
	 4yJowBm1u2l+A==
Date: Wed, 28 Jan 2026 17:32:46 +0000
From: Conor Dooley <conor@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
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
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: tenstorrent: Add
 tenstorrent,atlantis-prcm
Message-ID: <20260128-nappy-repaint-e464d9964134@spud>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud>
 <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud>
 <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VaO9E9H1PZRTiJNg"
Content-Disposition: inline
In-Reply-To: <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>


--VaO9E9H1PZRTiJNg
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 09:42:42AM -0600, Anirudh Srinivasan wrote:
> Hi Conor,
>=20
> On Wed, Jan 28, 2026 at 9:02=E2=80=AFAM Conor Dooley <conor@kernel.org> w=
rote:
> >
> > On Tue, Jan 27, 2026 at 05:39:33PM -0600, Anirudh Srinivasan wrote:
> > > Hi Conor,
> > >
> > > On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wrote:
> > > > > Document bindings for Tenstorrent Atlantis PRCM that manages cloc=
ks
> > > > > and resets. This block is instantiated 4 times in the SoC.
> > > > > This commit documents the clocks from the RCPU PRCM block.
> > > > >
> > > > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.co=
m>
> > > > > ---
> > > > This is pretty suspect sounding, if the PLLs for !rcpu are controll=
ed in
> > > > the rcpu register region, why is it not a clock parent for the !rcpu
> > > > prcms?
> > >
> > > I saw another clock driver doing it in the manner I did [1], and
> >
> > The example is using it just to check lock status, which I think is
> > different than what you've got here? What you wrote implies that the
> > whole configuration for these PLLs is in that register region.
>=20
> Yes, it seems like that example actually needs one regmap for
> configuring and another for checking lock status of the PLL, but in
> our case only one is enough.
>=20
> > > thought that it would make writing the bindings and the clock driver
> > > simpler. Each prcm node would have a single input clock (otherwise
> > > there would be a differing number of input clocks for each prcm node).
> > >
> > > What would you suggest that I do?
> >
> > I suggest that you model the clock tree correctly in devicetree, even if
> > that makes things more complicated. One prcm node having more input
> > clocks isn't something to be afraid of, it should be pretty
> > straightforward to handle in both devicetree and driver, and is not any
> > more complicated than having to deal with the syscon phandle that you
> > use at the moment.
>=20
> Understood.
>=20
> >
> > btw, where is the code for the !rcpu clock controllers? AFAICT, this
> > series only has the rcpu portion and I can't find the code that actually
> > uses the phandle. Why is the patch documenting stuff that has no user?
>=20
> I haven't been able to completely test the clock driver for the other
> subsystems yet, so that hasn't been posted yet. One of the comments on
> the previous versions of this series was to document the complete
> bindings, so I've tried to document all the 4 PRCMs.

Right. Looking at the mail from Krzysztof, I suspect he meant to
completely document and explain the rcpu prcm, not all of the prcms (he
couldn't really know they existed, based on your v1, right?).
I'd suggest you drop the !rcpu stuff for now, and submit it when you
have the driver for them ready to go. That's typically what's done to
avoid introducing bindings that need to be changed once the driver
actually turns up, since as you say you've not actually tested the
driver for those prcms.

>=20
> >
> > > This would also avoid having the clock tree in the driver contain
> > > multiple entries for some of the PLLs (one in the rcpu subsystem where
> > > it is defined and another where the same clock is referred with {
> > > .index =3D 0 }) which could become confusing.
> >
> > I don't really understand what you mean by this. Can you elaborate?
> > If you mean that multiple clocks produced by the prcm would all use
> > index =3D 0 as their parent, that does not sound abnormal to me. Without
> > being able to see the !rcpu driver implementations, I can't even make
> > guesses as to what the clock tree looks like.
>=20
> In the clock driver, you'd end up having something like this
>=20
> static const struct clk_parent_data osc_24m_clk[] =3D {
>         { .index =3D 0 },
>  };
> .
> .
> static const struct clk_parent_data pcie_pll[] =3D {
>         { .index =3D 0 },
> };
>=20
> Both point to index 0, but one is for the rcpu prcm and another is for
> the pcie prcm. To me, this felt like it might confuse someone looking
> at the driver. But it doesn't affect functionality in any manner.

If you think it is going to be confusing, then move the bits common to
!rcpu and rcpu prcms to a file, with the unique bits in dedicated files
perhaps? It seems like they'd be fairly different even with your current
scheme and keeping them apart would aid readability of the driver in
either case?
You can do this extraction as part of adding the !rcpu code, that
doesn't need to be done for the rcpu stuff since the concept of "common"
wouldn't exist in upstream until the !rcpu stuff arrives.

Cheers,
Conor.

--VaO9E9H1PZRTiJNg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXpIPgAKCRB4tDGHoIJi
0tmCAQCMz9cz9NcVHW/eTtgHv1aT9fv3jwGM8BPCavOxD+K7rQD/RF1rQxdGKrMA
K3cTriOhZZtOkI7Vs6o/fkQVuU4cGA0=
=4sdL
-----END PGP SIGNATURE-----

--VaO9E9H1PZRTiJNg--
