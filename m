Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3F13CD8A5;
	Tue,  7 Apr 2026 16:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578662; cv=none; b=uyc5UBymmTN1CQKaF/ociPuX7iq6QYf79QLI+qQ/5cBna26KdhnhW/qsXsnUvmrYV868g2Xwey0E4izfTj+ebTrhVKyarKS6nfF+koGtsSieopGFjRHV1oxuQ+jcx9KfDDtmflE8Mg8qrn53DC1mxmTYrfkNXMADBy2K8WFErMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578662; c=relaxed/simple;
	bh=XUkqYHDb0qHhkKE0GAJTJARwcKTNJNt1XTYbva7YP6k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsiFWRcKRj8D1aISyKFHoj8rI8tBnRXqKPbYCM0KLofNVrVCDvcvEbiCqJnLSwsHMF1uGpapdec8BaalGLtqQNDO09c9LbKe6K8Cr74Pezzw6jqLaROjabAdMh6iPKR8CyXgaup3iMdE4+xCdMhL1BX3INmIosu2h5YaJ6P0XXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fm9Wbm7k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fm9Wbm7k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EFECC116C6;
	Tue,  7 Apr 2026 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775578662;
	bh=XUkqYHDb0qHhkKE0GAJTJARwcKTNJNt1XTYbva7YP6k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fm9Wbm7kaAJQMgxnP/Jhg8VaHxoGv+azrDsraqcnOFCxgrmhTCcTLTcVus86N6i9Z
	 i7N+8Z8iIsqfB9V9hWQZSQ6f3o/0nw3AKlQmZ9QyguI/ZSkJKz9HBPDuNhF3t4YJ9x
	 1YzhkHwTmUSQX33MI6FAIlfwSRDjYFVZy/uvjbcFMV/RfzwWJ4tQ/LtO+QDs+Ig9YP
	 O+RF6of/et5v7B3mw8OBdXDGC650NZxpsHsdRpl6bL2LRHC5q+6fYdhrv/BPfttSkI
	 UvBB2Cuv9k5/YakOdYBUvv6gRYAwN3JpdQNAkbO1sGAB+Qq/m3kx+HSoVFMDkGL1R+
	 YUPFWWeb2TLlg==
Date: Tue, 7 Apr 2026 17:17:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260407-fling-scouring-dbe2141cc79b@spud>
References: <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <8e7d0c53-aa23-4514-81a5-335a76bb0c45@kernel.org>
 <4d575f17-5cd5-495c-99a9-176b3393d54d@gmail.com>
 <20260326-nursery-outer-55799f675e14@spud>
 <8129d377-8a63-4589-820b-930a2b43a2f7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AIxz90TMny9eoN1E"
Content-Disposition: inline
In-Reply-To: <8129d377-8a63-4589-820b-930a2b43a2f7@gmail.com>


--AIxz90TMny9eoN1E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 28, 2026 at 03:58:47AM +0100, Vyacheslav Yurkov wrote:
> On 26.03.2026 19:32, Conor Dooley wrote:
>=20
> > > I was not sure how to provide a diagram in the mailing list, so I pos=
ted in
> > > on Github https://github.com/OSS-Keepers/clock-controller-guard/issue=
s/1
> > >=20
> > > It is a driver which models dependencies for other drivers. These are=
 soft
> > > or "indirect" dependencies, because we cannot access the FPGA unless =
the
> > > FPGA_PLL_locked, and GPIO is telling us we are good to go.
> > >=20
> > > Conor, I think this should answer your question as well.
> >=20
> > Not really, but it gets part of the way there. I want to know what this
> > provider actually is. I now know it is a PLL, not an off-chip
> > oscillator, but I know nothing about the interface that you have to it
> > (or if you have one at all). What compatible string/kernel driver does
> > it use?
> >=20
> > Because SoC-FPGAs can route GPIOs from the SoC part to the FPGA fabric
> > and use them as if interacting with something off-chip, I'm not sure if
> > we are dealing with an separate FPGA or a SoC-FPGA. Which is it?
> > Effectively I want to understand why you cannot just read the lock bit
> > from the PLL directly. In my experience with *SoC*-FPGAs, things like
> > PLLs that must lock for the fabric to be usable have a register
> > interface from which the lock bit can be read, that is of course not
> > clocked by the PLL output clock and therefore accessible before the
> > PLL has locked.
> >=20
> > I think more info is needed here to guide you on where such a "helper
> > driver" should be located and what the dt represetation should be.
>=20
> I really appreciate your feedback on this. Here's an attempt to provide a
> better exlanation.
>=20
> We have various use cases. Most of the time it's a PLL in the FPGA but it
> can also be some signal from a custom FPGA IP used to indicate if some
> preconditions are met and the IP is ready to be used (some kind of invert=
ed
> reset but exposed by the IP). For a PLL we typically get the signal
> connected either to a GPIO IP block (altr,pio-1.0) OR to a bit in a custom
> IP register.
> In addition, some of the IPs in our design do not have a proper split
> between registers and IP core, which means that if an external clock and/=
or
> PLL lock is missing and we access the registers we won=E2=80=99t ever get=
 an answer
> and thus stall the CPU.
>=20
> We are using a SoC-FPGA and use some GPIO IP within the FPGA (altr,pio-1.0
> for example).
>=20
> The PLL itself doesn't have any registers but the signal indicating that =
it
> is locked is available and routed to such a GPIO.
>=20
> The point is that we will have several IPs/drivers that will depend on the
> same preconditions (clk, gpios being high or low) and we want to use this
> clk_guard driver as an aggregator for those pre-conditions. Define once,
> reuse a lot.

Apologies for the delay responding, been sick the last week.
I think what you have here is not unreasonable, but may never have users
other than yourself! It's effectively gated-fixed-clock but the gpio
direction is inverted. I'm not keen on the "guarded" wording, but I
think I would want you to become a fixed-clock variant w/ a prefix that
indicates what's different. Then you get locked-gpios instead of
enable-gpios that gated-fixed-clock has.

Or maybe you're a gpio-gate-clock variant instead, and represent the PLL
as a fixed-clock (but I think being a fixed-clock variant makes more
sense).

--AIxz90TMny9eoN1E
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCadUuIgAKCRB4tDGHoIJi
0unPAP9V53V1weHoyZWYKDF8eAFHW2TpQ5Y3A/UyDJ5aJZw3fAEAiXGWAbNNxhAc
6LJHqDV7bY7RsewE78QHcgNBNKJgkAk=
=slSs
-----END PGP SIGNATURE-----

--AIxz90TMny9eoN1E--
