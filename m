Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C8D43859F5;
	Thu, 27 Aug 2026 16:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787849723; cv=none; b=JHWLG7MGa/1wqG2o0amfqTiKa3+8eS4gUz12YUtt3rxhvM8GuIu2KutZTEuClJVtegzL0gfx5Lvb3yhVO7zYmzT73UI4bS1+Hfq2QBrtSopGdWFYgU/EV06iogAAZDAAo7dSXRboIqd2LvV3MTJ/crTQCq0qa4OGKig26NPWv6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787849723; c=relaxed/simple;
	bh=IT+bDPqwMPhVv7pJKmfuTNtK+mO4WnLVCjybUfmqt4E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RXoCj49g/MIAN/yQsUg2N/eEZZvNgW5Nr1x4053Xr1/rGe/YcVFtMK+zZMdiU5am8r1+Fe7qCjQ/Ls0Et5PdnBLwgcizfJIl8pfqwrwrJwxZSwgFALI1zJvJGjKospS7ZIicW1SAoYvuhbfPvjWRzxnUryGYXcECv0jeS/x5G2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHkR+Yvd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHkR+Yvd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCCC1F00A3A;
	Thu, 27 Aug 2026 16:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787849722;
	bh=IT+bDPqwMPhVv7pJKmfuTNtK+mO4WnLVCjybUfmqt4E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=EHkR+YvdRCowwKkxTrZzHnEzyyUFyfSVROIXzkfnqT4qALJKNuBUBZ7Utg8P3i+T1
	 7WnT/nX++DEvl7X6PtXob8XT37aweg65aTXmZRp2+/J8mPsgCH4racLS2au9/TfLgV
	 +LETtS0fk7+q4eN+ru3fX/EPopJYtj50Vpjegu3ra2RDDJ3NBsgzsT1Dy///9qQjkQ
	 El+Zvzig/E7hArqIaQpu1ImznvUuTvkfXxTAcHmFVX5KUdOiv9fYFXPQv7NtZA7k5F
	 TQGfkNC5yYE1vhUf9IhyglPCTPjmq2xqV6FPBaJbusikxCLlQpwtEGZNlpHKqIfE2Z
	 K44NZVl72OfLw==
Date: Thu, 27 Aug 2026 17:55:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <20260827-parcel-isotope-22b344bace78@spud>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
 <20260810-smilingly-kung-1fddc5e18df6@spud>
 <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6a7JqWW12ldR6L0p"
Content-Disposition: inline
In-Reply-To: <c53ce2d5-4674-4bda-9e92-fb4fbdc32da8@gmail.com>

--6a7JqWW12ldR6L0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2026 at 10:23:20AM +0200, Vyacheslav Yurkov wrote:
> On 10.08.2026 18:58, Conor Dooley wrote:
> > On Mon, Aug 10, 2026 at 11:54:03AM -0500, Rob Herring wrote:
> > > On Mon, Aug 10, 2026 at 11:40:00AM -0500, Rob Herring wrote:
> > >=20
> > > I missed that this is N input clocks and 1 output clock. But that lea=
ds
> > > to other questions. You've implemented a clock mux then? I still don't
> > > understand for what h/w that makes sense. Which input clock is select=
ed?
> > > The locked one?
> >=20
> > Yeah, I thought this was n inputs and n outputs, with each gpio
> > signalling that an individual PLL had locked.
>=20
>=20
> It is n input clocks and 1 output clock. It is kind of a mux, but the CPU
> doesn't control the clocks or GPIO signals. The whole idea is that
> peripherals check the output clock, when it's locked that means _all_ the
> clocks are locked and GPIOs are in expected state. That's why the selecti=
on
> operation is not really implemented.
>=20
> Actually the number of input clocks don't have to correspond to the number
> of the GPIOs, because the GPIO signals indicate the locked state of the
> clocks that are not accessible to the CPU.

I'm not entirely sure what you mean by this, but it is starting to sound
like you're only having one output because that's the minimum you need to do
to ensure that this driver has probed before the peripheral(s) using the
N input clocks. Requiring other input clocks to be stable before
declaring the input that's actually connected to the output stable
appears to be a shortcut/hack rather than an accurate description of the
hardware. If that's the case, I'd be much happier with this if this was
implemented as either a) N inputs with N gpios and N outputs, or b) 1 input,
M gpios (if multiple represent the stability of that input) and 1 output,
with N instances, one for each clock.
On the other hand, if this is genuinely a mux, then the binding should
reflect that, rather than only describe a subset of what you can do and
the driver should only check the actual parent out the output, rather
than the N-1 other inputs.

Thanks,
Conor.

--6a7JqWW12ldR6L0p
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapBr9QAKCRB4tDGHoIJi
0sBsAP0be2Ty0vroBWIHM986UTYNfJr+ERcKihD7EHjKMCMsjgEAtbskLw5P59Co
gvq0jEh/b4jYbLyS3R2YKshkj3QllQY=
=khXB
-----END PGP SIGNATURE-----

--6a7JqWW12ldR6L0p--
