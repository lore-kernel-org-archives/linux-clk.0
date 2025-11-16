Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B934EEC3;
	Sun, 16 Nov 2025 07:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763278092; cv=none; b=Y2DhDLOnh1ckhF6xIcGmr4QJUy/dsF9z4viST9J5n56PQynqWauBI1etY9tuRs0B3I6tCMG9g/fEM9+DebVAycmwkFnq5x3+92vLeiLH3r1xv0c1/UbUR1EeEoxuu+6SgwRkH5tkju6u+fTT206Qrijr+QdC/aTm+g8wdM/wVqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763278092; c=relaxed/simple;
	bh=qogSDDXcShGgVAm0p/uLf75a5Ve5231bqdzgHBF/ApA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=V/Z4dGqNL+iiz9ZyAWOgQCUhv6rUNE9B9nzMfdFdLQHJlON3VnmiK4Kw2qQOOA12YKceMYLVuvnH2gHsG4OyMjdXNbLbxvWv33NFmo7BZVbgvP9fVxIyQTPklAhcYb28GmYr32UqlL80MiWjQJnDVf5uwvR8ggWQaBhNzCBODsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NZsUNiyB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NZsUNiyB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDE7DC4CEF5;
	Sun, 16 Nov 2025 07:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763278090;
	bh=qogSDDXcShGgVAm0p/uLf75a5Ve5231bqdzgHBF/ApA=;
	h=Date:From:To:Cc:Subject:From;
	b=NZsUNiyBC886qeFVAY20lNsFzBEIVP5agxbfWIZVkDAuRdPUYFHHli9oUGivoTgSO
	 VvwN+y1rk72t3Q8kmSP6sarUCfVwphNYHKDou1BF8FOM2p3UWgHLFWA1PhnNTyWFoZ
	 c7mt+blf2sREBnNS9k/igEXAMIP1C/sCt4e2fn33EjdFlx1oVlEl/p85LuHpdgWtvC
	 WJ8jYKgBqtlxbfkVtOnqc2iAVz13DbHb/nvpJtS659uFgLEZm74R3MoItHzdBRHhny
	 XuzTpM0ipyua1FiUkPlvqi9Km8eMwuj74gu9xSV59bjgN5nlLsVc80vJbQ21ttIxHF
	 o2rgDbsv3EAmQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 696E95FE35; Sun, 16 Nov 2025 15:28:07 +0800 (CST)
Date: Sun, 16 Nov 2025 15:28:07 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner clock fixes for 6.18
Message-ID: <aRl9B9SH9bVxcORm@wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C4VOJFtnijsWYGmh"
Content-Disposition: inline


--C4VOJFtnijsWYGmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-fixes-for-6.18

for you to fetch changes up to 2050280a4bb660b47f8cccf75a69293ae7cbb087:

  clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate (2025-10-23 02:06:47 +0800)

----------------------------------------------------------------
Allwinner clk fixes for 6.18

Just a couple fixes for the A523 family. A couple clocks are marked as
critical, and the lower bound of the audio PLL was lowered to match
the datasheet.

----------------------------------------------------------------
Chen-Yu Tsai (2):
      clk: sunxi-ng: sun55i-a523-r-ccu: Mark bus-r-dma as critical
      clk: sunxi-ng: sun55i-a523-ccu: Lower audio0 pll minimum rate

Jernej Skrabec (1):
      clk: sunxi-ng: Mark A523 bus-r-cpucfg clock as critical

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 4 ++--
 drivers/clk/sunxi-ng/ccu-sun55i-a523.c   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

--C4VOJFtnijsWYGmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmkZfQcACgkQOJpUIZwP
JDD7cxAAuPMK3X2tTDpHIB2v0ywFMrTwyV1VUXlxcEcWvCavy0h4PPJ8yV3+0mFd
Q0oJRmrTP5z2bX7TvNdtigim9xteb8WHkHD76rLWOjO4zAGoobwglEz7JJ58nvkL
dkU5JtzTYt8bUHrZM6uPpnfSwRcAGuFnwmm09EqfjC7ef85SLlEjzbiyua5D0qen
m6E+1D7EmdHHbaCEzi+ANq5wQBa8JyyvaQxmka35j7y/qNYf+Vbbuy+HB0Wrz+3C
SOv6FO/5KbqEkSdUvfJSz3qIjjpekNr4amxwf+H8qGsiZAXzgZamXJ9dC8RmCwLq
xJar7fpVV/LaeT+Ry0nXNOdQDkqz2ZAu39GpAOFhXF+iWOLBYLw1pzTPGxda7LuZ
XmVSyDgs8FQQD5DEVGIRRokRWkM9O05G6fC/glV20Ev5IKaYL9QUzHdoZdlYlAEs
BXaJYyQPCpTWHQPKYc3/sOHW9f4czbGnr3b/dGLEwagOhGPf1gaHK1if11TgmqFo
nzZjSKVjBUZyLQv4hH4yWfS5pyJcsLos+rt1MI4iEnJfWq36HUPs/UMFR76SCwmf
WvZ5U2tr6k5M6UBO9kpOhe78ziU1KXdn6X8HLvmTzLOfz+vQoQKUDaPGa4kaVOqV
1GwtH2cFBfNMSDsZaKWmZ8siHbVGhsbMAPwfquWnReTLrxMxdjo=
=aiiO
-----END PGP SIGNATURE-----

--C4VOJFtnijsWYGmh--
