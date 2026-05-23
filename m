Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1C55733E;
	Sat, 23 May 2026 14:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779544961; cv=none; b=Bg53krLGUm10FdBB0tJnwn8KCV5FRRb+YS92yWSEpGly+tGxPk2Z7eNNKHAW017XdT3FTgkj5MbGeJ4e6H5AnCZ6CtwGiVzgxosH+pyaaYxYGh3rqKu+fcYznQziMt+0AF3dZMAjJWshOFMdOgWSXHLY+8B/BS+aUxCdjCRc21U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779544961; c=relaxed/simple;
	bh=IIacKpDclHTRBLaiqOMrmGgH+LLrVbpimm5Qii68Anc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tCZYP66zr7FvPUTcVHxegG9PKku5JZpV6ZroWZ6w1TP5Veq1qRGpnG+x+Ncrg6c44olLcDEeEQ9erYsg6xZojzunHFssgHaS1Kck7dOssAFExxvo7ItK01bzXEnBJvJ2aCQJntjHJVj7xZ5msCvvL7eajodhNj0sjj5iAn4TvDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sk2JWHi2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sk2JWHi2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0371F000E9;
	Sat, 23 May 2026 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779544956;
	bh=IIacKpDclHTRBLaiqOMrmGgH+LLrVbpimm5Qii68Anc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sk2JWHi2l8zhp4EWktwru01wUxnB93bDG5vPw/18e8Sd1WNwhHip84XD29fuJkrmO
	 KtU5elrIdRaV6EJVbbm7N42d/A9O7YeT64W8x19mPJy6dJDxOinLgaqG2TtkuyGJOT
	 8Z5f3RM7Rc33yoAUmlNyMxuZ6pGDmwhLcDYYgkSrD/f3qROmUsEEW0xUpICuFgUtDG
	 CtxNvUcEU9HUnCiRfBotKMCcHWLrl++S7X5W5yJONS8SIZT5FjaasTFH0rDOmKK1ZC
	 PekJRjEvmoz82oCWon1NKEF3uXKEvNSWm9GKa5QtiG1MjR8M8dahi0A2plFx8vRXjX
	 RE6cFfa8peh0g==
Date: Sat, 23 May 2026 15:02:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
Message-ID: <20260523-punctual-backslid-712c06f0db61@spud>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
 <20260522-removed-lyricism-7c879febc3b3@spud>
 <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Af5l50mgOj8YPBBG"
Content-Disposition: inline
In-Reply-To: <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>


--Af5l50mgOj8YPBBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 03:00:15PM +0800, Xukai Wang wrote:
>=20
> On 2026/5/23 04:39, Conor Dooley wrote:
> > On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
> >> Fix all sparse warnings detected during LKP randconfig testing:
> >> - Replace plain integer 0 with NULL.
> >> - Add static modifier to k230_plls and k230_pll_divs.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lk=
p@intel.com/
> >> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> > Forgot to reply earlier, but I went and squashed this in.
> Thanks Conor!

I dunno if you saw my message about giving what I have in my
branches a go, but if you could try what's in the riscv-soc-for-next
branch, that'd be great. Just to make sure that I have all the bits in
place.

Cheers,
Conor.

--Af5l50mgOj8YPBBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahGzcwAKCRB4tDGHoIJi
0it2AP9Odv1YYkRltRYXt+7xWjYef8Cn7xzyCA9K0jeiEUz5NAD/QpwJMe7lZfjs
MZXMsNIopZd++T2/Iw93irRUB71e7wo=
=XTJn
-----END PGP SIGNATURE-----

--Af5l50mgOj8YPBBG--
