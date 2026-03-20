Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBD03C13EE;
	Fri, 20 Mar 2026 14:29:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774016949; cv=none; b=WJ1dHpu4l4l4XG96LiA8VLbb5nDYb/OZlxSLu/pq9VmRvWKdD0wxih8H0BD68t3ON3Lain7n4oweVDpuf79phpllg39BYBUpRwRdyLDVBi25r9NGv+qyjB3Ylpo7Olf4vSLIwPJrvJUNs3apOLSAQiQ6V13PFY8OLyvasmP8u/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774016949; c=relaxed/simple;
	bh=Fmoo0DapoaPJhMqEqYq5deJO3MZhRATe1HKMHY1bWos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mbCcwCyYu72NQZlX7bOzPUFAG9sZKHjaLm5azyI3TG3Z+r4yK7GHk62fsKMY3KpWkpdxMIV/IISPC6+zc4PxPGjrqGup7H6IjwoFJizU+4Mhf2koiw0p39rFYPn3gmmuhjNsxRPi+ku+Ig9lJLa0QFVQ5eOfrcIgVKQE3ogd1X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xpu4/Ke/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xpu4/Ke/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22F64C4CEF7;
	Fri, 20 Mar 2026 14:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774016949;
	bh=Fmoo0DapoaPJhMqEqYq5deJO3MZhRATe1HKMHY1bWos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xpu4/Ke/r2xeZNNp+ln9MluR+qPoLsC4wTeMEuvyBh2xKgAKiJsaijwi2p1GFYOx4
	 vErXICLx6ISViNOiVE4n4DAJkNuXCEZxbbFa1ZJR6EifN957nPixIFSpFImxwKCLFB
	 EfzuWAigmZwGlp6xfBq00/m0hqtaVVo3sCrra+MZBP8toEbZZhxNxAYrye4ITBO2h3
	 46gSm/RoFGOlHE4/35hSjQoiX6we4IggZGMFc45RVFOiKJ24dTypnAsjKsAuPRjPVT
	 tdHAJ5Mi3YVogO/0dIkncWJOhkbyogGIupU4tCPfvgcZewqHAF6lIYnDe4zEA9PbNl
	 dzocemjSO901g==
Date: Fri, 20 Mar 2026 15:29:06 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Alberto Ruiz <aruiz@redhat.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
Message-ID: <20260320-sticky-overjoyed-pheasant-9bb63c@houat>
References: <20260313-clk-scaling-v6-0-ce89968c5247@redhat.com>
 <20260313-clk-scaling-v6-2-ce89968c5247@redhat.com>
 <20260319-spry-incredible-dinosaur-e2d9da@houat>
 <CABx5tqK7TyshCZR0zPDBp=c6+DvcRE4tOearf=GGT1EB8uWNOA@mail.gmail.com>
 <20260320-daring-smiling-sturgeon-fbac05@houat>
 <CABx5tqKPyQeT6eD8n1DVGLWpjHPq8_x6xfeMB_acZW4sAbp1WQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="q766sjjelagi666l"
Content-Disposition: inline
In-Reply-To: <CABx5tqKPyQeT6eD8n1DVGLWpjHPq8_x6xfeMB_acZW4sAbp1WQ@mail.gmail.com>


--q766sjjelagi666l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 2/7] clk: test: introduce test suite for sibling rate
 changes on a divider
MIME-Version: 1.0

On Fri, Mar 20, 2026 at 09:08:29AM -0400, Brian Masney wrote:
> On Fri, Mar 20, 2026 at 9:03=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Thu, Mar 19, 2026 at 07:08:07AM -0400, Brian Masney wrote:
> > > On Thu, Mar 19, 2026 at 5:10=E2=80=AFAM Maxime Ripard <mripard@kernel=
=2Eorg> wrote:
> > > > On Fri, Mar 13, 2026 at 12:43:09PM -0400, Brian Masney wrote:
> > > > Anyway, what I'm trying to say at least is that, at least, we shoul=
dn't
> > > > frame it as a guarantee the framework provides, because it's really=
 not
> > > > the case.
> > >
> > > I see what you are saying, however these are divider tests, and this
> > > is the way that clk-divider works.
> >
> > Yes, this is an undocumented behaviour of *clk-divider*. clk-divider is
> > not the only divider implementation. If anything, it's the reference
> > implementation, but that's pretty much it.
> >
> > So when you say:
> >
> > > +/*
> > > + * Test that, for a parent with two divider-only children with CLK_S=
ET_RATE_PARENT set
> > > + * and one requests a rate compatible with the existing parent rate,=
 the parent and
> > > + * sibling rates are not affected.
> > > + */
> >
> > And
> >
> > > I want to demonstrate that the clk core is being called, and that
> > > ultimately the correct dividers are computed.
> >
> > This is only true for one implementation, and so far has been considered
> > an implementation detail. It's not something you can generalize.
> >
> > And to make my point clearer, I wasn't saying this test shouldn't be
> > there, I was saying we shouldn't do and document that generalization.
> >
> > > For example, on patch 7 of this series:
> > >
> > > - Parent, child1 and child2 all start out at 24 MHz.
> > > - child1 requests 32 MHz.
> > > - Parent is changed to 96 MHz, child1 at 32 MHz, child2 stays at 24 M=
Hz.
> > >
> > > Child2 keeps the same rate, however the tests show that the clk is
> > > actually updated since the divider is changed from 1 to 4 after this
> > > operation. This is to simulate what would be programmed into a
> > > register for real hardware.
> > >
> > > I can drop the expects for the dividers if you really want in the next
> > > version. Personally, I see value since these are divider-specific
> > > tests.
> >
> > Not really, these tests are clk-divider tests, nothing more.
>=20
> OK, I'll drop the checks for the actual dividers in the next version.

It really wasn't the point I was trying to make. It's fine to have that
test as a clk-divider test, but we should document it as just that,
nothing more.

Maxime

--q766sjjelagi666l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCab1ZsgAKCRAnX84Zoj2+
duALAYCa+UN7UTrR4kvNIOWVtn5jHwylzRHeP/MWL4w5BvjUROH2aMko96Ng4GoI
h3dCV0MBf2z0RD4YB+LiI1jxYZP/J+A7EPNx0SNA6cS0Ygt6vHm/5zu751l39pON
FIZuKaFSHQ==
=9y03
-----END PGP SIGNATURE-----

--q766sjjelagi666l--
