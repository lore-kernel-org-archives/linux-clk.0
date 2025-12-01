Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4021E3DED;
	Mon,  1 Dec 2025 21:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764625073; cv=none; b=UTGzRJ4mOsSX7VRvaJafD49iL1mEsrTuyF1MYLYFW+1zSKcB4Qffzl3VYOxa05jDY7VHDyQ32xX+uVVwUOy4Yg5G44siVrysvUXu6gyZm8c6jmR7/EOVUZlYNpXMnD2pk6igtOA1W+Jzw69OuskV/gMTpRKonQb/BwOkOtTA1Z0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764625073; c=relaxed/simple;
	bh=BNtF9/uKumcWQNeEHcReguYIoYLdcFtvytO06WfPaPc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hXvULFT1utoj7FsU6LRaTIETczjq5dXc/BR9N1ppzZxkzL4uT2SQpCq/5kDlGmmCHJeWU/BiMnSD3Yw9exmgI8Sfins62nRanJ8zi7J4Mpe6iyr62uipIw25n7DGODOss5sTaCKhKc+E9Lr2s1MqvqNlxZtKC17xS7euXT4BhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y//f6b0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y//f6b0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61A7EC4CEF1;
	Mon,  1 Dec 2025 21:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764625072;
	bh=BNtF9/uKumcWQNeEHcReguYIoYLdcFtvytO06WfPaPc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y//f6b0FIIlrb5XSeeNL6qKynT/qlAMkUGHnOxM+lX8PsO2MwuVQYpO6a/Q5TJBBg
	 uwdaBsMRsFGuZ7Qm9hSQWRe5/htW0ZjZZh7lGBz/+GdFtOpFVW+1OlMlmEdMMwNntu
	 QYDJm6YmiR6R5I9ZhQ/jPHFzj/v+md9gDvf5A3inG0IIOPyL55OO/PjFIpirewwSgH
	 iD0xUcN+5R9hfolugkJPnltDn+xxfOeIIT//nSjSBLnTkz2cU3cx5yfcFT1bferEla
	 Rns1Kipy/q4PShSeIEoKtY0HUCZqOUPZkVaEInX5oeqa2gT8Kpwk4GqaUeVS2XUKud
	 xHDrDAFhCvcaQ==
Date: Mon, 1 Dec 2025 21:37:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: kernel test robot <lkp@intel.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	claudiu.beznea@tuxon.dev
Subject: Re: [PATCH 2/2] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <20251201-unrefined-diligent-cdb02d2ea686@spud>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
 <aS3X9VXVlKNQyDoz@redhat.com>
 <20251201-outpour-defame-49a3c68a362b@spud>
 <aS4D_RsvasDQQael@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wTzfKcwWP9RLdsIj"
Content-Disposition: inline
In-Reply-To: <aS4D_RsvasDQQael@redhat.com>


--wTzfKcwWP9RLdsIj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2025 at 04:09:17PM -0500, Brian Masney wrote:
> Hi Conor and Claudiu,
>=20
> On Mon, Dec 01, 2025 at 06:09:25PM +0000, Conor Dooley wrote:
> > On Mon, Dec 01, 2025 at 01:01:25PM -0500, Brian Masney wrote:
> > > On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> > > > Hi Brian,
> > > >=20
> > > > kernel test robot noticed the following build errors:
> > > >=20
> > > > [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> > > >=20
> > > > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney=
/clk-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251=
126-035403
> > > > base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> > > > patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fix=
es-v1-2-6c1f5573d1b9%40redhat.com
> > > > patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be=
 compiled with COMPILE_TEST
> > > > config: loongarch-randconfig-001-20251127 (https://download.01.org/=
0day-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> > > > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-pro=
ject 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> > > >=20
> > > > If you fix the issue in a separate patch/commit (i.e. not just a ne=
w version of
> > > > the same patch/commit), kindly add following tags
> > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpE=
E9-lkp@intel.com/
> > > >=20
> > > > All errors (new ones prefixed by >>):
> > > >=20
> > > > >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.=
h' file not found
> > > >       12 | #include <asm/traps.h>
> > > >          |          ^~~~~~~~~~~~~
> > > >    1 error generated.
> > > >=20
> > > > Kconfig warnings: (for reference only)
> > > >    WARNING: unmet direct dependencies detected for TSM
> > > >    Depends on [n]: VIRT_DRIVERS [=3Dn]
> > > >    Selected by [y]:
> > > >    - PCI_TSM [=3Dy] && PCI [=3Dy]
> > > >=20
> > > >=20
> > > > vim +12 drivers/clk/microchip/clk-core.c
> > > >=20
> > > > ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/t=
raps.h>
> > > > ce6e1188465998 Purna Chandra Mandal 2016-05-13  13 =20
> > >=20
> > > I only build tested this on arm64. I'll post a v2.
> >=20
> > MIPS I believe is where this is used.
>=20
> So looking into this further, it looks like asm/traps.h is actually not
> used by this driver, so I'll go ahead and drop that include in v2.
>=20
> > Hmm, I think this is in a MAINTAINERS blind spot, Claudiu not CCed on
> > it. We should probably do something about that. Can you CC him on v2?
>=20
> Yes, I'll CC Claudiu. I don't see any existing entries in MAINTAINERS
> where it looks like this driver would fit neatly.

This whole folder is kinda missing, probably there should be a
MAINTAINERS entry covering this and the at91 dir, since Claudiu usually
applies the patches for the !mips microchip stuff. That's probably
something for us to sort out though, not your responsibility!

--wTzfKcwWP9RLdsIj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaS4KqwAKCRB4tDGHoIJi
0qAUAQDYlMW4aBTgLRARKCPI7sJVlUBUEJxQdLUw9siq9tjcHwD9HL1NQziDp2cI
MqCEEr2ecfs1GQvuBRSZiS12O4KFfw8=
=89fO
-----END PGP SIGNATURE-----

--wTzfKcwWP9RLdsIj--
