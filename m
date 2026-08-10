Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315AE42EEA1;
	Mon, 10 Aug 2026 16:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786381097; cv=none; b=q8D6k0FNZEKWxyByfm6ymV33O3Viu2jZ99RYhXAF5WCQu8rKmMMFvQUr3/xGbngp56WpW+slbRQJI2MGAOt+0MqDI/kfKQ2H37DZk7Pz2qUwb/BWlqBeYhYanxiPmEw3D+KstX4jyhm1I9me4MG5g+SbMjTmRooP/exVL9eA8EQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786381097; c=relaxed/simple;
	bh=os10B0j0fEnW1cAjNJNAUeD/HJks7zKuDjBm+O5A0PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7YFjoDedUFwZYcBIHLqeXjZ17JzFiImTqnt7NGMcke8WreIOC2469s7DpBj/UkJquQBzPbVWIl6bRm3562DYO6byx1DApTZ8h80Rg5EQlH1LD5fEoW7MXo6rv/sc5ENzI0SfpAfoLonpLnManAJ/iPYOqoO+KfX3gCgKOHbCg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ogso5/mF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ogso5/mF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBF41F000E9;
	Mon, 10 Aug 2026 16:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786381095;
	bh=4paVSVu+1jxeXrclBzVnfhMw+qSR6xaaFSimx/GK6nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ogso5/mF6b35f3sP2e5TkzI1zTPApgws23zs9X6z4MeY1PtFL6wi0dKOnxVtGPRNH
	 VVa0+VGDPYbVCzVK56ZbIVMRxa+YHTY9DGQURti+B/5SfnUgKZYpDrK2GAcPa/viiP
	 g2Sh90FMZtE3Hzpf7ZXlsa0yLoTYfdJfgxHqEPgzumTj0m8z+pArv9sQUSycwczsaB
	 pzv6UbnjvDgug8DSVg9kvnqXB46SFQSvP+p17KXIKC+OaYQsDEkRS9jEYz4qX56wgw
	 H3QKI++xNn/4N6haVKmTxpofqLBJaUc4cGwdpQiYm5VeeLDPtkuphGwzJEW3tD4SnB
	 5/EdAO3gGSLrQ==
Date: Mon, 10 Aug 2026 17:58:11 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	Vyacheslav Yurkov <uvv.mail@gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: Add GPIO-locked fixed clock
Message-ID: <20260810-smilingly-kung-1fddc5e18df6@spud>
References: <20260726-feature-clock-guard-v4-0-e9c8b372b71c@bruker.com>
 <20260726-feature-clock-guard-v4-1-e9c8b372b71c@bruker.com>
 <20260810164000.GA1846263-robh@kernel.org>
 <20260810165403.GA2145873-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n3vGzFEWqR3y7Ezm"
Content-Disposition: inline
In-Reply-To: <20260810165403.GA2145873-robh@kernel.org>

--n3vGzFEWqR3y7Ezm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 10, 2026 at 11:54:03AM -0500, Rob Herring wrote:
> On Mon, Aug 10, 2026 at 11:40:00AM -0500, Rob Herring wrote:
> > On Sun, Jul 26, 2026 at 05:40:24PM +0000, Vyacheslav Yurkov wrote:
> > > Some hardware designs provide fixed-frequency clocks generated outside
> > > software control, such as by FPGA-resident PLLs. While the clock rate=
 is
> > > fixed, a separate GPIO signal indicates whether the clock source is
> > > locked and producing a valid output.
> > >=20
> > > Describe a GPIO-locked fixed clock provider that exposes a fixed-rate
> > > clock whose availability depends on one or more GPIO lock-status
> > > signals.
> > >=20
> > > Signed-off-by: Vyacheslav Yurkov <uvv.mail@gmail.com>
> >=20
> > I think you can drop this. Just update your author email.
> >=20
> > > Signed-off-by: Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> > > ---
> > >  .../bindings/clock/gpio-locked-fixed-clock.yaml    | 59 ++++++++++++=
++++++++++
> > >  1 file changed, 59 insertions(+)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/gpio-locked-fixe=
d-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-cl=
ock.yaml
> > > new file mode 100644
> > > index 000000000000..4d17889c51ad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/clock/gpio-locked-fixed-clock=
=2Eyaml
> > > @@ -0,0 +1,59 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/clock/gpio-locked-fixed-clock.yam=
l#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: GPIO Locked Fixed Clock
> > > +
> > > +maintainers:
> > > +  - Vyacheslav Yurkov <V.Yurkov.EXT@bruker.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: gpio-locked-fixed-clock
> > > +
> > > +  "#clock-cells":
> > > +    const: 0
> > > +
> > > +  clocks:
> > > +    description: Input clocks whose validity is monitored by this pr=
ovider.
> > > +
> > > +  clock-output-names:
> > > +    description: Names of the clock provided by this controller.
> > > +    maxItems: 1
> > > +
> > > +  locked-gpios:
> > > +    description: |
> >=20
> > Don't need '|' if no formatting.
> >=20
> > > +      GPIOs to check the lock state.
> > > +    minItems: 1
> > > +    maxItems: 32
> >=20
> > Please explain better how multiple GPIOs work? Why would you ever have=
=20
> > more than 1 lock signal per clock? And you can only have 1 clock given=
=20
> > #clock-cells=3D=3D0.
> >=20
> > Do you have an immediate need for more than 1? If not, I'd drop=20
> > support for it for now.
>=20
> I missed that this is N input clocks and 1 output clock. But that leads=
=20
> to other questions. You've implemented a clock mux then? I still don't=20
> understand for what h/w that makes sense. Which input clock is selected?=
=20
> The locked one?

Yeah, I thought this was n inputs and n outputs, with each gpio
signalling that an individual PLL had locked.

--n3vGzFEWqR3y7Ezm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCanoDIwAKCRB4tDGHoIJi
0iqyAQDqTpkjpqLHaGBVRrPhynZcPy0jB2pmjJzbzesV0W8eKgD/T9G7ABJSJdeM
ZdMYY41A1P3pItRNAU2si+VjHb38NA4=
=huv5
-----END PGP SIGNATURE-----

--n3vGzFEWqR3y7Ezm--
