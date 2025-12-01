Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807831F30BB;
	Mon,  1 Dec 2025 18:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764612570; cv=none; b=GFQQtuifgqyGodf3eLOqIGl5HoKjIzFynDw9ebsRKw4UnuFejaoId3bp3BVYaRoTz2IlUkzA8Gscs5x9SoZLxUOLALJIoXsKNnIIMAG6yBasyMe5540qrhY+GOSeRMv29HoO+OYvRvTDHyjvuUkR4bRxVCZGtyAYfDkoC4NlJEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764612570; c=relaxed/simple;
	bh=czpaDkwx/fqLcPEGE2z448AC6pP+AxvJ8ZlklgA/Y7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DYyj7EdoZk+8nSpUXmoUJyti/nQWf/cyFskmvBVRHnrobHXcG9hTQ4XOVRXX6LmqdQBUi/K876tQr9Hxrcmd9/di5LlgIC66YB+Oq2lGyrCogL755qBCY6saHx/pMspPdunnCei9k1Ab/kgK8UQrp+SGaDQyrktlzaJGHDpzn+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J7Xds/II; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J7Xds/II"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E308C4CEF1;
	Mon,  1 Dec 2025 18:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764612570;
	bh=czpaDkwx/fqLcPEGE2z448AC6pP+AxvJ8ZlklgA/Y7M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J7Xds/II13x55G5fPxNzYAGzX5H1FXmTyayMyKC8xY1rrWMGJQfNV/KgTamAQdxP/
	 RysGsT5ON2bLRDsBNpJXL6rRqhUAF6B9gY+Pr1I9rvRlCPbDF7t3plzkBc9OOpB5NE
	 EvL/ElDk/SJPfi/knpQ3T7kVCHYBv82QyDfDCltlB/j71P9ZQsrslLUgrMw1opE6qx
	 Vb+BgI17fsgrT3qgVgeLV4/XXk2u1PY3qukzeMCFEzuO1t+2Mm4GpzmO4Qzj0tnrLF
	 gD/w+fMs6kD3andMo+uXTo1soZZgV/6ylmlvbQIfhu/RQ32gN+4RFD/yCWisMRouX+
	 DD+1rxt+VRKmA==
Date: Mon, 1 Dec 2025 18:09:25 +0000
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
Message-ID: <20251201-outpour-defame-49a3c68a362b@spud>
References: <20251125-clk-microchip-fixes-v1-2-6c1f5573d1b9@redhat.com>
 <202511270924.0uDTpEE9-lkp@intel.com>
 <aS3X9VXVlKNQyDoz@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Z5vusTeHna7+I5B"
Content-Disposition: inline
In-Reply-To: <aS3X9VXVlKNQyDoz@redhat.com>


--1Z5vusTeHna7+I5B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 01, 2025 at 01:01:25PM -0500, Brian Masney wrote:
> On Thu, Nov 27, 2025 at 10:11:12AM +0800, kernel test robot wrote:
> > Hi Brian,
> >=20
> > kernel test robot noticed the following build errors:
> >=20
> > [auto build test ERROR on 92fd6e84175befa1775e5c0ab682938eca27c0b2]
> >=20
> > url:    https://github.com/intel-lab-lkp/linux/commits/Brian-Masney/clk=
-microchip-core-remove-duplicate-determine_rate-on-pic32_sclk_ops/20251126-=
035403
> > base:   92fd6e84175befa1775e5c0ab682938eca27c0b2
> > patch link:    https://lore.kernel.org/r/20251125-clk-microchip-fixes-v=
1-2-6c1f5573d1b9%40redhat.com
> > patch subject: [PATCH 2/2] clk: microchip: core: allow driver to be com=
piled with COMPILE_TEST
> > config: loongarch-randconfig-001-20251127 (https://download.01.org/0day=
-ci/archive/20251127/202511270924.0uDTpEE9-lkp@intel.com/config)
> > compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project=
 9e9fe08b16ea2c4d9867fb4974edf2a3776d6ece)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20251127/202511270924.0uDTpEE9-lkp@intel.com/reproduce)
> >=20
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202511270924.0uDTpEE9-l=
kp@intel.com/
> >=20
> > All errors (new ones prefixed by >>):
> >=20
> > >> drivers/clk/microchip/clk-core.c:12:10: fatal error: 'asm/traps.h' f=
ile not found
> >       12 | #include <asm/traps.h>
> >          |          ^~~~~~~~~~~~~
> >    1 error generated.
> >=20
> > Kconfig warnings: (for reference only)
> >    WARNING: unmet direct dependencies detected for TSM
> >    Depends on [n]: VIRT_DRIVERS [=3Dn]
> >    Selected by [y]:
> >    - PCI_TSM [=3Dy] && PCI [=3Dy]
> >=20
> >=20
> > vim +12 drivers/clk/microchip/clk-core.c
> >=20
> > ce6e1188465998 Purna Chandra Mandal 2016-05-13 @12  #include <asm/traps=
=2Eh>
> > ce6e1188465998 Purna Chandra Mandal 2016-05-13  13 =20
>=20
> I only build tested this on arm64. I'll post a v2.

MIPS I believe is where this is used.

Hmm, I think this is in a MAINTAINERS blind spot, Claudiu not CCed on
it. We should probably do something about that. Can you CC him on v2?

Cheers,
Conor.

Also, I *hate* the name of this driver, far too generic and seeing
patches for it always jumpscares me.

--1Z5vusTeHna7+I5B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaS3Z1QAKCRB4tDGHoIJi
0jJ2AP9ZKP/2TuR4mdDhAQc9QlnLEqxM2ElPEz+SjFT5IOTMpwEAut8G0Hxpfyis
DoF+qWvA9ut2E43BpXx0i+30GPGYpgs=
=ft9m
-----END PGP SIGNATURE-----

--1Z5vusTeHna7+I5B--
