Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F61115746F;
	Sat,  9 May 2026 18:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778350958; cv=none; b=W/bZN+vbb+AtCNw3CxjaUws8x+hrHpFlG0yUgfo8iRjp46szyiAWu7aoVfrT/RnHevkZSxlvj6NVGEHld275pxwA2gNhEbVUdAbbhhTvy+iDwWZC+VVKOj74kco5KSKxKpCfSYR8DxwUjHA2+tVrFrXSqqd/JtcGsqdKFiQSXs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778350958; c=relaxed/simple;
	bh=ZhGIZNKnVR0exJcAd5IFAHDvDHJZNJJv2gvh2LcOnRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YOBk/xiFvS07rSApzEzv3Cq8T/3E7mG8ldIGAq7sbGRdM4D5HdyTBzocVH28X3Ik/k6la0uIJCnBcSA65PVEAIOKgOA8P+gPoax66Y7CwM4pb7dZf3om32QrP1wYqJSvq5wQ3SMygyKyuvFCMza/nUQTKviv8vTv4Lao8kyweBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bQVGqENC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bQVGqENC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABB4C2BCB2;
	Sat,  9 May 2026 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778350958;
	bh=ZhGIZNKnVR0exJcAd5IFAHDvDHJZNJJv2gvh2LcOnRo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQVGqENCMk/G0RJHEZQWU9AH82pTLbTQHbxHvFf1CAp4vkaNM1OZJphCXbFhoJpSG
	 3d6tH4qDaJoo84mEaPUVWXmyTc3G8+HBSbrmZmQyiNmD4T41IjHbglrLAVojY0NAks
	 L07xI7RvZEhwgqM9gR5RzrEDYaJMwPZ9VZojo7MpUxaf2pF8b+V0xjIH1ObQpDTHYB
	 XTfb0TosEFtuyazMQ9+6Hol3g6ZnmU+4lOIJdFbAHiNUwdiyjllg+0phigiLEj1f6E
	 L/GenHMwVbiAF8nF5gaf6VVrJWLbRcR06iYEwGgwsj38Vpyg/8qNgpJbSM+l2m+P5j
	 4iHAHpdyOB5PQ==
Date: Sat, 9 May 2026 19:22:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Vyacheslav Yurkov <uvv.mail@gmail.com>
Cc: Rob Herring <robh@kernel.org>,
	Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: Add clock guard DT description
Message-ID: <20260509-cosigner-routine-fe98d5f6706f@spud>
References: <20260318225510.GA639444-robh@kernel.org>
 <7c7034a7-686a-42c2-bdba-6f31b5179f7c@gmail.com>
 <20260319-yearly-wrongful-883f7fd86a69@spud>
 <b45d9845-2d56-4fdd-a3ac-b0e0e27ba573@gmail.com>
 <20260323-sanctuary-semantic-432089feb1c7@spud>
 <d097826c-3db5-4902-acee-ffcff7436d4e@gmail.com>
 <20260326-lustiness-borrower-530898a5ce28@spud>
 <f3e27db5-d84d-4b6a-9d6f-25fcc9044efc@gmail.com>
 <20260421-each-candy-67380b760d26@spud>
 <30758adf-0ec1-4f20-ae3f-e5ca92bac730@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kk9Z8zfE2/upAnIV"
Content-Disposition: inline
In-Reply-To: <30758adf-0ec1-4f20-ae3f-e5ca92bac730@gmail.com>


--kk9Z8zfE2/upAnIV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 12:13:41PM +0200, Vyacheslav Yurkov wrote:
> On 21.04.2026 19:28, Conor Dooley wrote:
>=20
> > > Before I send a v2 I'd like to clarify a few more things:
> > > - I provided a schematics by means of the URL. I believe there's no u=
nified
> > > way to provide something like that in the documentation, is there? So=
 the
> > > only way to describe it properly would be to summarize the descriptio=
n from
> > > the mailing list, right?
> >=20
> > I don't believe anything we have at the moment is what you're looking
> > for.
> >=20
> > > - I'm going over the Common Clk Framework again, and perhaps I unders=
tood it
> > > wrong. You mentioned that I have to implement is_enabled, but I imple=
mented
> > > is_prepared. It seems that I just have to move my is_prepared impleme=
ntation
> > > to is_enabled. Does that sound correct?
> >=20
> > Effectively yes, I think.
> >=20
> > > - In my particular use case I don't need enable/disable ops, but to k=
eep the
> > > driver generic, I'd probably want to have the bulk_enable implementat=
ion
> > > inside, because I don't know which clocks are assigned in a device tr=
ee. The
> >=20
> > Why don't you know this? I'd expect there to be 1:1 mapping of gpios to
> > clocks, with an equal number of input and output clocks, since all
> > you're doing is detecting if the clocks are ready to go?
> >=20
> > > clk_core_enable function only enables 1 parent clock, not the the lis=
t of
> > > parent clocks. Or I'm missing something here?
> >=20
>=20
> Thanks for your support. Yes, I talked to the HW team and I have this
> information.
>=20
> One last important bit, which I'm trying to figure out, is how to notify =
the
> users of the driver about the state change. I understand that Common Clock
> Framework doesn't support clocks drifting to unlocked state, and I'm OK w=
ith
> this limitation. Right now what happens on the clock consumer side is that
> it gets -EPROBE_DEFER when any providers are not there or not initialized.
> But if the state of GPIO is not the expected one, then -EBUSY is propagat=
ed
> to the probe of the dependent driver. I can also change EBUSY to
> EPROBE_DEFER, but how to trigger the deferred probe again is something I
> don't know. The only alternative I can think of is a call to rmmod / insm=
od
> from the userspace.
>=20
> Is there any other way to achieve this?

I don't know, that's a question for the clock subsystem folks.

--kk9Z8zfE2/upAnIV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaf97aQAKCRB4tDGHoIJi
0tmrAQDWMszIhDcCLwYZID/3TYRFcjYoUOmzV1ef2YOtlMIhlgEAqVNPiT5MTLL4
TVp67lpani3Fb1vkJucb/tujHU/p9gk=
=Qsli
-----END PGP SIGNATURE-----

--kk9Z8zfE2/upAnIV--
