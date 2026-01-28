Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1575533A70A;
	Wed, 28 Jan 2026 21:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769634912; cv=none; b=BFuHrOLtwluvVdQXwNeloJsH3/yyOiC5L1E72/NAfFH7ukUMiLmJP06H2Df2XuqRAjF6jAL2qaRGBw65gyMD26anDRQfT4DDHlulv+YBHZSD++AeHDGWGzrpW1RntmyPOnSe5VrPB7smrv74CgFqsFFwNKbF5Z4n94XsPixtRDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769634912; c=relaxed/simple;
	bh=OQDAe7kHqwluS4hvEjYu/+eXBFZjq8g2bIaji/mTcx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I75HIOGVIYQKxhyqh3B7NA3OBdnX+ZP9anPDUtW3GCAj0frw4LEh16RESZRfthVaKx4AmEapwxs9NmkhoeRpDVMgKWOWXfL1crdbdBEzoFFC7NyEvpyECo589msXjzI/uF4v3k2/gOJiUag8jDCEuIg9ZgOlf8Ox7bn+9MlGjdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Fb50FeRi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Fb50FeRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8469C4CEF7;
	Wed, 28 Jan 2026 21:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769634911;
	bh=OQDAe7kHqwluS4hvEjYu/+eXBFZjq8g2bIaji/mTcx8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Fb50FeRisHcFDRsGBhTQLrWYZFufTLrCL96ygW0yYMhG9zuixvQaD69oz/1ET+5m2
	 OCUEjozwYGW20GO/bf607/mnKqah0HLfLMZUNBXHFppXCLaJ5DqvTWmA7vQtlFH/YO
	 vS72NOqYPyOLuNaIc7TwFD9F1gzi+GhLJDqIMSHtS2WqwT8lsKhAsKqJb0qBlGWJkF
	 PnjXYS1hJeEy8576+XYo0OvhLubDAXEwMvoGsvvuN31Cg1JuIw8eJusfgrGe+fWRzq
	 QupRDPXL1ZH66+AUudiLVUGsFyMcAsKTEvzm+T7dt4an4MmLsFRDsS3O4FT0jKbkab
	 xKp1ghfH4tzoA==
Date: Wed, 28 Jan 2026 21:15:05 +0000
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
Message-ID: <20260128-whomever-account-2edbfd9fa227@spud>
References: <20260126-atlantis-clocks-v3-0-b016135551b7@oss.tenstorrent.com>
 <20260126-atlantis-clocks-v3-1-b016135551b7@oss.tenstorrent.com>
 <20260127-mystify-carmaker-150aa3fcd6c6@spud>
 <CAEev2e-p28J_H2oWdrtgGJ0Z=2iGn8FjFBN8ggU0t_Wtbi62rA@mail.gmail.com>
 <20260128-duckling-confess-88e64fabe752@spud>
 <CAEev2e9Y95bYDdvhJQ2954K2q5yMrGA3UF2U=QN83ZNbZ5LJBw@mail.gmail.com>
 <20260128-nappy-repaint-e464d9964134@spud>
 <CAEev2e9onS-ogepaTugmGSc4-p6H0ZL54n1yd3bofTWTnLRM-Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PyF6LdaTjELP3nym"
Content-Disposition: inline
In-Reply-To: <CAEev2e9onS-ogepaTugmGSc4-p6H0ZL54n1yd3bofTWTnLRM-Q@mail.gmail.com>


--PyF6LdaTjELP3nym
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 28, 2026 at 03:01:11PM -0600, Anirudh Srinivasan wrote:
> Hi Conor,
>=20
> On Wed, Jan 28, 2026 at 11:32=E2=80=AFAM Conor Dooley <conor@kernel.org> =
wrote:
> >
> > On Wed, Jan 28, 2026 at 09:42:42AM -0600, Anirudh Srinivasan wrote:
> > > Hi Conor,
> > >
> > > On Wed, Jan 28, 2026 at 9:02=E2=80=AFAM Conor Dooley <conor@kernel.or=
g> wrote:
> > > >
> > > > On Tue, Jan 27, 2026 at 05:39:33PM -0600, Anirudh Srinivasan wrote:
> > > > > Hi Conor,
> > > > >
> > > > > On Tue, Jan 27, 2026 at 1:58=E2=80=AFPM Conor Dooley <conor@kerne=
l.org> wrote:
> > > > > >
> > > > > > On Mon, Jan 26, 2026 at 03:07:14PM -0600, Anirudh Srinivasan wr=
ote:
> > > > > > > Document bindings for Tenstorrent Atlantis PRCM that manages =
clocks
> > > > > > > and resets. This block is instantiated 4 times in the SoC.
> > > > > > > This commit documents the clocks from the RCPU PRCM block.
> > > > > > >
> > > > > > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorren=
t.com>
> > > > > > > ---
> > > > > > This is pretty suspect sounding, if the PLLs for !rcpu are cont=
rolled in
> > > > > > the rcpu register region, why is it not a clock parent for the =
!rcpu
> > > > > > prcms?
> > > > >
>=20
> > Right. Looking at the mail from Krzysztof, I suspect he meant to
> > completely document and explain the rcpu prcm, not all of the prcms (he
> > couldn't really know they existed, based on your v1, right?).
> > I'd suggest you drop the !rcpu stuff for now, and submit it when you
> > have the driver for them ready to go. That's typically what's done to
> > avoid introducing bindings that need to be changed once the driver
> > actually turns up, since as you say you've not actually tested the
> > driver for those prcms.
>=20
> Okay, thank you for clarifying that. I think I interpreted the
> original comments as "once you add bindings, you cannot change them
> later". I guess the changes I have wouldn't break backward
> compatibility, so they'd probably be fine. I will do this the way you
> suggest.

Adding new compatibles is okay, they can have new properties and new
behaviours as long as the existing devices keeps working the way they
used to.
It's also okay to change the way existing devices work, by adding new
*optional* properties after the binding was written, but of course we'd
rather all these optional properties are documented from the get-go.

When we ask people to make the binding complete, we generally are
talking about optional features (though usually things like SoC clock
controllers don't have them) or for syscon/multi-function devices to
document all of the peripherals that they contain. It happens a lot that
someone comes along claiming a memory region is a clock controller, or
pinctrl and it turns out that there's also a temperature sensor or a
reset controller in there too which causes problems down the line if the
binding isn't written to account for that.

Obviously there are exceptions, and new required properties can be
introduced, by there needs to be a good reason to do so. Here's an
example from the last few days where the new property was required for
the driver to discover the full-scale range of the device, without which
it could not function correctly:
https://lore.kernel.org/all/20260128153824.3679187-6-o.rempel@pengutronix.d=
e/
New required properties for an existing compatible usually have to meet
a threshold somewhere around "the driver doesn't work properly without it"
to be accepted.

--PyF6LdaTjELP3nym
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXp8WQAKCRB4tDGHoIJi
0h4/AQCNjvlASS6wam49jvnLt3yAjSlQmrxVmglFbUwZ2EbzJwD+Ps0lZDGSRrF1
nq9OfRkHkEeG19rt5092c5ye4U8hBQk=
=oISf
-----END PGP SIGNATURE-----

--PyF6LdaTjELP3nym--
