Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793901653;
	b=Xh7EtuqShDTp9yY8+iSOFS8okUe676QrMy1CJC488amMC8rELdL3u/aHQaFpxObcNFQi
	 mGafcki6hBj78Hcuez63Fj4LISpx8lLWLbNyrLYyWsQ4qWOimf2H3oeMIWSfhRQdT+g5u
	 s8aaVD+QnwWu/oH/Huwa1DlQMTTGvUIdaDaSri+ZnidAZz5b6Z8+h9ZuzQQhbCpjP0kU7
	 E7EEA9XjkqzmMoAqsIs2mx4TyomVVS3nPsHi6AD/iEEFyxIkS+Vp10ziCwxrAI4v1JhRO
	 6tgT9oY4/gr5p1msdUKL+aYZnIcW6JL2vifwKBy/u1F1JDhdMEge9UEUaSdkmaLVAQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793901653;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Inlr+njTt/rVY4K43pqcnuWrarYJ/kbkIpHGLKmNG8I=;
	b=yIpmpsR2SPtL6D0s1pxFoDofr6beeBdodlslOzNXvdvG3u6islHZ9tNuGCGefR+ho5zh
	 2biMKfibC5ZWtQj4h75PKgbM/B5hVq6KFHTJ6E5abSTaKi7Ue0M8l33VW1YpoVbmZf8BE
	 hrhVUR5bHpIA9XuCM4hRrLBbbRl90gbepjW0BZLoS1CQ8x+AmJLaE6gqiI4xMBRDMP1pa
	 lUGqsbP/Bf+c7dkgAOD6qTop6agHc/x/93s/bLJWZPS2lAZkeGz1KgNSKije0pQ8fXKeD
	 DWU5JEV0U8kL/LJ5qJaa/iXubN8QEgzpsLJX2sfiRRXUXP5pd8SmtdkFivXg+qS1Zkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="cfsDYG/L";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2DA606A32D;
	Thu,  5 Nov 2026 18:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cfsDYG/L
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC14F1F0093A;
	Thu,  5 Nov 2026 18:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793901653;
	bh=Inlr+njTt/rVY4K43pqcnuWrarYJ/kbkIpHGLKmNG8I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=cfsDYG/LQYPBMtQD/vm9LvEqZb3NkdrSd39jY/KDXFQZZ5g0HK/qUctGbvmF32zdf
	 VS/ZTjIj+nYx7DVMb7BqoCWX7UbJErh8NYWnq2j3VjmzaUnC0QYnYSyo8//93tLTNZ
	 ES9qXHscRLLhxm5ntqJCvMCTFTsCa8mU/2uKoLeEwHSZ/SNLYpz83UgcUQpNXPMWkW
	 uukldLAqj7yYz6QZ37gy/LpMx2eyQSqzlz3wqc/lkjKKZOwvV2dPJOeZopKmoB5/9N
	 RCDILNTRGePIiP4RKRITZen28EV1AI9/DSTH512zgE8fhsNDyD2nVFt213aU69CJFk
	 I0XuQ1hmdkDOg==
Date: Thu, 5 Nov 2026 18:00:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Yixun Lan <dlan@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] riscv: dts: anlogic: drop unused DR1V90 external
 clocks
Message-ID: <20261105-tribunal-eject-539fe27c8271@spud>
References: <20261003-dr1v90-cru-dt-fix-v2-0-6e7d96612ac0@pigmoral.tech>
 <20261003-dr1v90-cru-dt-fix-v2-2-6e7d96612ac0@pigmoral.tech>
 <20261002-crimson-unwrapped-b067e86de38c@spud>
 <ar_wmUWEXgIzq1XM@redhat.com>
 <20261008-c59c47fb901176a0137497d9@squawk>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C3g66+F14rjrV4Um"
Content-Disposition: inline
In-Reply-To: <20261008-c59c47fb901176a0137497d9@squawk>

--C3g66+F14rjrV4Um
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 08, 2026 at 03:12:43PM +0100, Conor Dooley wrote:
> On Fri, Oct 02, 2026 at 01:57:45PM -0400, Brian Masney wrote:
> > On Fri, Oct 02, 2026 at 05:33:24PM +0100, Conor Dooley wrote:
> > > On Sat, Oct 03, 2026 at 12:28:40AM +0800, Junhui Liu wrote:
> > > > The external CAN and watchdog clock inputs are not routed on the ML=
KPAI
> > > > FS01, the only board currently supported. Drop the two fixed-clock
> > > > placeholders from the common dtsi, as fixed clocks require a valid
> > > > clock-frequency property.
> > > >=20
> > > > Both clock muxes select their internal parent clocks after reset, so
> > > > the CRU operates correctly without the external inputs. Keep only t=
he
> > > > required oscillator input to the CRU.
> > > >=20
> > > > A board using these external clocks should define them in its own
> > > > board-level dts and override the clocks and clock-names properties =
of
> > > > the CRU node.
> > > >=20
> > > > Reported-by: Yixun Lan <dlan@kernel.org>
> > > > Fixes: 7849521aaac2 ("riscv: dts: anlogic: add clocks and CRU for D=
R1V90")
> > > > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > > > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > >=20
> > > Per the v1, Brian said he would rebase the clock tree, so I'll just
> > > squash this into the original patch I think.
> >=20
> > It's already rebased, and dropped from the clk-next history.
>=20
>  Cool. Note to self: 7,5 material, cos I don't have the headers to do
>  anything with "riscv: dts: anlogic: add clocks and CRU for DR1V90"

7.4-rc1 is out, so I have circled back and grabbed this.

Cheers,
Conor.

--C3g66+F14rjrV4Um
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCauzETwAKCRB4tDGHoIJi
0rESAQDbzZS4mTD6EzbYritTQTwi2yB7lkxeAIXr0Jq91Vt2VQEAwXTEKIQpVz0R
9MTIyjWiUDWMR1Doeucqy97kAp7WngQ=
=X8EE
-----END PGP SIGNATURE-----

--C3g66+F14rjrV4Um--
