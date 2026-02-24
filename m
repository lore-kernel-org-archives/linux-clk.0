Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7B5E555;
	Tue, 24 Feb 2026 17:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771954590; cv=none; b=saIeqhG4UjaADy1B47/IMAnLy2UDvgdEcxwVMkcjZoIpSfle8Hu+S9kB4u5+cUivNrNo440t46DZ+r++5tS1wtO8Jq+IVqxuWxZXBsmWmzs+sUUSKPfoakQQ6mE8HmxIBlTLHVWLKKSij549PAv6LQI0sDg6rPSvOXMiut9oVIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771954590; c=relaxed/simple;
	bh=xSmbzUw5iMxQDdpWElFmPaglUBPSo1GRMrPeTHcyCfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVnmy+4RRMjV627WmTp5OVUwdjFtUymjvmmyK9ZMxBTtHJquVux91CZQiPRgH/MBEDqw7miLPpBMD7Rp94MsJQiAGA2pBXF8St1voZ2YPmpHbIqAmv7AQ4VPNjIpmODgnpPpFMTNhstGzRvMbvPb75Dzm3OTbKM4GouNso5mAa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nAWUqf3s; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nAWUqf3s"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BA00C116D0;
	Tue, 24 Feb 2026 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771954589;
	bh=xSmbzUw5iMxQDdpWElFmPaglUBPSo1GRMrPeTHcyCfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nAWUqf3sXmHuZb/KjeUrcjP80zgKBstHVp1GS8Nmrtz3vWFTbLpj0d0AYF52Bs4jC
	 NOqb1d3pCFIQsqOwls3+hP3uq0Jna2kqCCswKylAByuHHgU80Nio0nT/0zKTUlA/p0
	 GpnkFUGuxx0rcHGlaYFhypwVYekdeymhuOzCTWANHQW7/G5WBi+8HeCGrR6Z0dOyrt
	 Gbk+FL3BZ/E+/Nuf4w9V3DhsH/jKhz90N2gkm65+TVQZ3yLTmCq5VB/mYxrNwa74aq
	 r3c84hmZxuIha/M3jeVdr1TOc8bp54aQQTRrNxiZv/czvQ8+XG3RlsDGMGIlOlkb+R
	 8XrpGQaYkfBIQ==
Date: Tue, 24 Feb 2026 17:36:25 +0000
From: Conor Dooley <conor@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 0/3] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
Message-ID: <20260224-gotten-showing-f5f276daa541@spud>
References: <20260222-clk-microchip-pic32-v1-0-ceacbcd515d1@redhat.com>
 <20260224-placate-runt-54aa8419ec40@spud>
 <aZ3ff9vq9yuCkwTQ@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AxT4YrSvvQh0ZT00"
Content-Disposition: inline
In-Reply-To: <aZ3ff9vq9yuCkwTQ@redhat.com>


--AxT4YrSvvQh0ZT00
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 24, 2026 at 12:27:27PM -0500, Brian Masney wrote:
> On Tue, Feb 24, 2026 at 05:10:42PM +0000, Conor Dooley wrote:
> > On Sun, Feb 22, 2026 at 06:51:03PM -0500, Brian Masney wrote:
> > > Here's a small series that lets us enable COMPILE_TEST for the pic32 =
clk
> > > driver so that this driver can be compiled on all architectures in the
> > > future to help avoid breakage.
> >=20
> > Why do you care about this platform? Originally I thought you cared cos
> > you were getting involved in clock subsystem stuff, but I see you doing
> > stuff with it in pinctrl etc. Is that just general cleanup work, or do
> > you actually have an interest in the platform?
>=20
> My sole interest is to clean up the clk driver, which spilled into
> larger work to clean the include header to allow this driver to be
> compiled on other architectures. If I was going to do this for the
> clk driver, it wasn't that much work to do the other pic32 driver
> cleanups while I was there.
>=20
> Honestly, I hope to done with all of these pic32 drivers after what I
> posted this week has been merged.

Not to pooh pooh your efforts, but I asking as I am wondering whether
the whole platform should be deleted. I'm gonna ask internally about it,
but none of the authors are around anymore and seeing
| git log --grep "pic32" --author=3D"@microchip.com" --pretty=3D"%h%x09%an%=
x09%ad%x09%s" -n 2 --date=3Dshort
| 5e972ac119c87   Conor Dooley    2026-02-24      clk: microchip: rename cl=
k-core to clk-pic32
| a726f1d2dd4fe   Purna Chandra Mandal    2016-06-02      MIPS: pic32mzda: =
Fix linker error for pic32_get_pbclk()
is bad omen.

--AxT4YrSvvQh0ZT00
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaZ3hmQAKCRB4tDGHoIJi
0l+AAP9laHWHU34tuSspOuu/pPOHUB9Wa3c33hsLrNJPFUdIOgD/Z3i5paBanWMa
USqkXbK+sj5Z7S4V4riugTLLSGuvoQQ=
=AxBN
-----END PGP SIGNATURE-----

--AxT4YrSvvQh0ZT00--
