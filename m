Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793998088;
	b=Qy6EktVQyg8+6JhKNs7M+hh39FqiQX4RLLrha6B3hvPrMjfVNPj+r61fydy7nPZePAFy
	 edHwMxEpDEHfQ61RIQLq0/Ij5SRGUVqKzZBq4+Z92un53hu517lQFWHBLmTs3bhWkdzad
	 oat5ehMvMVywGjZROsl49T7SZmHIsdhbgIvfDpfyilHlhWHqF+FFnO6bYU+fRqLJYtkDI
	 bg0gUqj3xUemivOMh/tdQkavTT7zV9NbTkZP6npsTaIDDVH4U3mF0nn0MbL+hVrvxJUME
	 kldtLp4Md0pD0fSFKpIVHeKzO3YF9tLOJmB+w9Za15V3KVK+2pnB90fPxkkB7craz+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793998088;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=HZho2msgoJMdouDBhI/tZS+qfCR+U++y56XOVqrTM1M=;
	b=uOvAZh9S8c/5ZCWh7sXRWz83HylT0FkGYiORoyPIFXZO3ZjEcgIpouRFOfpzBmfgKd+9
	 whIaJnbZ0cNbWojYJlRGe5mwcJ2KW8wx9A/HuZqrqjeKpJUIJs6/5vqcEA51Qkrvw2EdB
	 7a5Y2+RVy6WGjKH1L0LggH9T1M/XEAt4YNb4C4l7AsK5dSgP/SogLKIDyaGcXhus6/13f
	 4GiFS4kHYNYk6Tajqxcvb5/vo8dRiCectjfDK0AoJbz0yH3JZf/TpXodX3xIUopuDjy0w
	 fsUW/mn8CiRrt5Wc6ZqVwvaPEmKC24OKzEQO9A7e2gtIjQNeXnRxeseueMDi3z9Uy7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIr5sIzw;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7779606A326;
	Fri,  6 Nov 2026 20:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NIr5sIzw
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5AE1F0089F;
	Fri,  6 Nov 2026 20:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793998087;
	bh=HZho2msgoJMdouDBhI/tZS+qfCR+U++y56XOVqrTM1M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NIr5sIzwS2dfqHfuqwatw7sGo8fIj91w5JB/t+CRq5heewdF7e/Q3g9bqdzswAUC8
	 ET4qWklG9GUx7R3W5HvZhRODQ8BUm1AKEmPInIYd2NShU8i9wYG0S6+QYe98JGhPsa
	 kpqZ1t7cTo/DvoKmvUw17MZIdH1y14qz3UwgEPkqUEF0i6P0QAu3fB5PPvGZS+DQ0L
	 jzwVAZfVrbgC1lkdxKJVUtnJLIteGLFtJBR+wj4AiJy5IHvE80+PLYOw/ls9lUEkxZ
	 o859DxAU+qbao+Wug7AGJHeEHsLUT0CfpjCXJvLxgPWApUV4KH2BDriljqQYdBPUZS
	 j+uT8HHNuTyzA==
Date: Fri, 6 Nov 2026 20:48:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 6/7] dt-bindings: clock: Add Amlogic S7 peripherals clock
 controller
Message-ID: <20261106-headband-buckwheat-fecbd459ee85@spud>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-6-7d501d62621f@baylibre.com>
 <20261106-unwilling-preoccupy-156dbb310448@spud>
 <au4p0xYEFkgEU6T4@macbook>
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
	protocol="application/pgp-signature"; boundary="LmB6H6jGQB3RSrN8"
Content-Disposition: inline
In-Reply-To: <au4p0xYEFkgEU6T4@macbook>

--LmB6H6jGQB3RSrN8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 06, 2026 at 08:34:37PM +0100, Carlo Caione wrote:
> On Fri, Nov 06, 2026 at 17:34:14 +0100, Conor Dooley wrote:
>=20
> > > +    #include <dt-bindings/clock/amlogic,s7-pll-clkc.h>
> > > +    #include <dt-bindings/clock/amlogic,s7-scmi-clkc.h>
> > > +
> > > +    soc {
> > > +        #address-cells =3D <2>;
> > > +        #size-cells =3D <2>;
> > > +
> > > +        clock-controller@0 {
> > > +            compatible =3D "amlogic,s7-peripherals-clkc";
> > > +            reg =3D <0x0 0x0 0x0 0x49c>;
> >=20
> > What's with the weird numbers in this example?
> >=20
> > Examples don't have to be real, but when it looks like this the
> > immediate thought is that the modelling of the device might be
> > incorrec.t
>=20
> The numbers are actually real, but the example simply lost their context
> because I copied the node from the S7 dtsi (not yet submitted), where
> the controller sits under the APB bus node (bus@fe000000) and the bus
> ranges make the addresses relative to it.
>=20
> 		apb: bus@fe000000 {
> 			compatible =3D "simple-bus";
> 			reg =3D <0x0 0xfe000000 0x0 0x480000>;
> 			#address-cells =3D <2>;
> 			#size-cells =3D <2>;
> 			ranges =3D <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
>=20
> 			clkc_periphs: clock-controller@0 {
> 				compatible =3D "amlogic,s7-peripherals-clkc";
> 				reg =3D <0x0 0x0 0x0 0x49c>;
> 				#clock-cells =3D <1>;
> 				...
>=20
> In V2 I'll use an absolute address for the sake of clarity (PLL has the
> same issue).

Before you do that, can you please share with me the s7 dtsi? Cos surely
you've got it in some git repo online somewhere.

--LmB6H6jGQB3RSrN8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCau49AQAKCRB4tDGHoIJi
0s31AQDovk3BCRNZkzAP0JDIfM+oVR7DeKQ2kE3TEp2hr8RKvAEAi5/KPKD3qcua
lDaZqwmPOKSB/JV+k2gT9cYzHgcbmAQ=
=tBnu
-----END PGP SIGNATURE-----

--LmB6H6jGQB3RSrN8--
