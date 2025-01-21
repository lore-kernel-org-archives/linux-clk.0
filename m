Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4166D1F238E;
	Tue, 21 Jan 2025 17:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737481140; cv=none; b=R7jlEZbMtjTT/f2qN3/3XXfXaw4wRzXytvQ7mxaT+N3V2UAqXjC7x7lhC7zcjYAgBzZyBsCv0AUUNJ12xUUIEdHNi8YHa64b9k6NFDU/AxAONV3IIC19u8qn4jzHM00lCPyNmM4mgpRzow2I/I0ToD9HnBzl2SpqtZLIgv1I8+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737481140; c=relaxed/simple;
	bh=t1rkrWpngB8qu0qIipVwW9LLPcWHKJVK6COBi/J1BpY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b9Yh4rnex4izsp4Zithlj3SPk1xfd4SVwXA6hd9046MFab4GUOCO+2w/KXQ0+wE2CrOePas1g0xXH26c+AvBEoa2IWeKkAr2xuNmGszBUJdU+C4S4KpNEX8qluW13Vw4whLocKrYrzFbbKHqKpav/3MzgUvEaYtdYFREBVcxNWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ajfIfNQB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ajfIfNQB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F280C4CEE0;
	Tue, 21 Jan 2025 17:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737481139;
	bh=t1rkrWpngB8qu0qIipVwW9LLPcWHKJVK6COBi/J1BpY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ajfIfNQBvTue6CtD5VhVhF9/E2qk9jDjJhV0NzExcP2VkUx2aLsxcK11UR6pvlP0H
	 olSn3FNnAN5QhBbvmrZ5pv6E+g7+a4dn9oacfDi6HGdT4S+Pz465IlabRPZzfAcr7m
	 qsGjvYwD2qgU01EskQgB7xLgQzliLJEQaxRcBPhzrmaI9Er1z7M0zCEoZwLX0OGrT4
	 QvCItcV3iN9LCLnrJ4CpMGluKkBd9Pc1VNM2PDVY2QVnZjjb0aH+sayIqrrxEsSZNN
	 T/3MGzsyw+zHg9V3egoPLxPyR821zp63YIGFy422sATrTQznzlmwmEgVk9J0K1Tf5T
	 amnyGMfni45hw==
Date: Tue, 21 Jan 2025 17:38:53 +0000
From: Conor Dooley <conor@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	pierre-henry.moussay@microchip.com,
	valentina.fernandezalanis@microchip.com,
	Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>, Lee Jones <lee@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 08/11] clk: move meson clk-regmap implementation to
 common code
Message-ID: <20250121-cheddar-kissing-bea27c6f2726@spud>
References: <20241002-private-unequal-33cfa6101338@spud>
 <20241002-hula-unwashed-1c4ddbadbec2@spud>
 <2b49c4df-a34a-42c5-8d44-9e47da630fe8@linaro.org>
 <1jwmiqsks3.fsf@starbuckisacylon.baylibre.com>
 <20241003-tacking-ladylike-dfe2b633e647@spud>
 <20241106-freefall-slider-db379b05821e@spud>
 <430bde3b35382e640843e32a9f351326.sboyd@kernel.org>
 <20241128-monstrous-embargo-a665d921410d@wendy>
 <e53adbf9fdf6e3f142083b0d40d074ca.sboyd@kernel.org>
 <20241206-threaten-showing-1214491f3899@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0nzZXl//t82IHPg6"
Content-Disposition: inline
In-Reply-To: <20241206-threaten-showing-1214491f3899@spud>


--0nzZXl//t82IHPg6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Stephen,

Any thoughts on the example I gave below?

On Fri, Dec 06, 2024 at 01:56:08PM +0000, Conor Dooley wrote:
> On Tue, Dec 03, 2024 at 02:50:31PM -0800, Stephen Boyd wrote:
> > Quoting Conor Dooley (2024-11-28 02:36:16)
> > > On Thu, Nov 14, 2024 at 05:29:54PM -0800, Stephen Boyd wrote:
> > > > Quoting Conor Dooley (2024-11-06 04:56:25)
> > > > > My use case doesn't
> > > > > actually need the registration code changes either as, currently,=
 only reg
> > > > > gets set at runtime, but leaving that out is a level of incomplet=
e I'd not
> > > > > let myself away with.
> > > > > Obviously shoving the extra members into the clk structs has the =
downside
> > > > > of taking up a pointer and a offset worth of memory for each cloc=
k of
> > > > > that type registered, but it is substantially easier to support d=
evices
> > > > > with multiple regmaps that way. Probably moot though since the ap=
proach you
> > > > > suggested in the thread linked above that implements a clk_hw_get=
_regmap()
> > > > > has to store a pointer to the regmap's identifier which would tak=
e up an
> > > > > identical amount of memory.
> > > >=20
> > > > We don't need to store the regmap identifier in the struct clk. We =
can
> > > > store it in the 'struct clk_init_data' with some new field, and onl=
y do
> > > > that when/if we actually need to. We would need to pass the init da=
ta to
> > > > the clk_ops::init() callback though. We currently knock that out du=
ring
> > > > registration so that clk_hw->init is NULL. Probably we can just set=
 that
> > > > to NULL after the init routine runs in __clk_core_init().
> > > >=20
> > > > Long story short, don't add something to 'struct clk_core', 'struct
> > > > clk', or 'struct clk_hw' for these details. We can have a 'struct
> > > > clk_regmap_hw' that everyone else can build upon:
> > > >=20
> > > >   struct clk_regmap_hw {
> > > >         struct regmap *regmap;
> > > >         struct clk_hw hw;
> > > >   };
> > >=20
> > > What's the point of this? I don't understand why you want to do this =
over
> > > what clk_divider et al already do, where clk_hw and the iomem pointer
> > > are in the struct itself.
> >=20
> > Can you give an example? I don't understand what you're suggesting. I
> > prefer a struct clk_regmap_hw like above so that the existing struct
> > clk_hw in the kernel aren't increased by a pointer. SoC drivers can use
> > the same struct as a replacement for their struct clk_hw member today.
>=20
> Best example I guess is to link what I did? This one is the core
> changes:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dsyscon-rework-2&id=3D35904222355e971c24b3eb9b9fad3dd0c38d1393
> clk-gate has my original hack that I did while trying to figure out
> what you wanted, clk-divider-regmap is a 99% copy of clk-divider with
> the types, function names and readl()/writel() implementations modified.
> Before your last set of comments I was doing something identical to the
> clk-gate change for clk-divider also.
> Here's the changes required to my driver to make it work with the
> updated:
> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commit/?h=
=3Dsyscon-rework-2&id=3Dea40211fe20f8bc6ef0320b93e1baa5b3f244601
> It's pretty much a drop in replacement, other than the additional
> complexity in probe.
>=20
> Hopefully that either gets my point across or lets you spot why I don't
> understand the benefit of a wrapper around clk_hw.
>=20
> Cheers,
> Conor.



--0nzZXl//t82IHPg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ4/brQAKCRB4tDGHoIJi
0nEMAP9cytqQKQB1hDGGUuuWB8kfRUG6ZyWTRYsNGzXuc2Ue7gEA8dAE6AfxgRC9
ekDfb4tyAyN/mrt6sVTLQWKZX1CKqwg=
=UWpp
-----END PGP SIGNATURE-----

--0nzZXl//t82IHPg6--
