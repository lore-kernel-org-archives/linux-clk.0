Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D18614F112;
	Sun,  5 Apr 2026 14:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775398653; cv=none; b=mnVaOwvw1pxIydH13vmEMKgg0EcvzZqV0uPa6iL5ew2DjC42fBZ8VA2wkkJWigKq9QSu1k71jfDdChR+5oeO1Fhlor5feam47yC87LUM1cHkuHL3sUwIW3SjJCFouVaBnultC9DAl5BzvXRdQrFgk7naJtayO2UAphyjmEnaakQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775398653; c=relaxed/simple;
	bh=9U9WUsLAwWkTw5pQIvu9c5gbXcp5l5B+VOel5/9aVmY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dONnY385tX42YsVmYF2tvYLE8OZ1VxSADKdpKACc5pv3717/2CiCwxsSlBzeur3LnNgkapRSfFglgG5hjyL7jIZw8A+rqTb7Y+m68irAIabgQO3mDK2TwkMRVpE3MaQlM31Y8FKUT3BJ0kueHFloOVZjMZfomaLs9nz0bJEkO98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uHediHjY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uHediHjY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6424C116C6;
	Sun,  5 Apr 2026 14:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775398653;
	bh=9U9WUsLAwWkTw5pQIvu9c5gbXcp5l5B+VOel5/9aVmY=;
	h=Date:From:To:Cc:Subject:From;
	b=uHediHjYpa0ho5eVe6TQ7yGqI+eLes22P1nbtiBXZJGv/OaH44Pm3obIS50r++tsY
	 pt51dzu2Lw6zP6rO9HNKcGOF+qeKuJZ8fiJTpP6z+NBNjncLWY+1vj63xgOekn0NnW
	 paL2Vn7MyayzeyDFWo6YW99CzyTniuSRKUnFLFsJU5Oq/XUmWp5zUB/ktfynqpqcGN
	 fEWRbmO1khvAbUyhQPRY+IyHdrjaLYIGg4gTAd27ui6P9hENOqwGi7UN8UVFmBi165
	 raFl7skbcXTZhAsBeQ80KjmbHG3lr8SlxJfIt9EqkjnhM794cpkJI6MZBwBJKfIi05
	 qr2t3c3XX7VCg==
Date: Sun, 5 Apr 2026 22:17:28 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: [GIT PULL] Allwinner Clock Changes for 7.1
Message-ID: <adJu-NeYb70E-1yS@home.wens.tw>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iK0ktflfZxsG4tRp"
Content-Disposition: inline


--iK0ktflfZxsG4tRp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-clk-for-7.1

for you to fetch changes up to fb20ccf70cf695f178d7c32e2d33b376560df0ff:

  clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock (2026-02-25 00:26:12 +0800)

----------------------------------------------------------------
Allwinner clk changes for 7.1

Just one change for this cycle, implementing support for the r-spi
module clock in the A523 PRCM block, which was somehow missing during
the initial bring-up.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      clk: sunxi-ng: sun55i-a523-r: Add missing r-spi module clock

 drivers/clk/sunxi-ng/ccu-sun55i-a523-r.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

--iK0ktflfZxsG4tRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmnSbvgACgkQOJpUIZwP
JDDZOhAAijVFzKd9NBwUv88FAjzYElGK7waUrgH5nFyyMQS2o2IraBPqBTuN4WDA
beoE6uuJxG6nikiJ01h5YVKQYS2Odxp+vWo8d2A+ttIc/eFDjtmxPsPqh0K8M6/u
7KdvgYyKYhOqoFOdiEM/3ABHThIyXgrZuVcU9tY5JzCnJFTVYb5Ta3gwLGF7rjIz
z2v35/wsWghdpoCxjoG05nWrX0fCu3lNWeybiQ+EYYm9ldYlGQ4bd7Bu2bzudje0
S+rig0W/ZTfeeDLLSIJoJll9BNy4K13Weaq8KdVn4XHp7iQue0JanBh7pm+7UzSP
L9T9hXtNj+Chf7wkP9NP2+0OznkF2gZmjBareeF5I3+n2lS3RxwkhUZRfOszfF8a
n10g1bx4Y3QV7JW3j9s+P3WGiubgd23dDpDdgkgOwNCOfHjDb3ZJ6v9Rlz4T5bct
r+qq728XoI0a/svGIgaCzOCOchPuJL/fohsDjvz6avBQv8ivj6b8FjzoxAVV0yF9
x7zR+XaTpXqkn2NHSr9KHJCumi01Zgac5kpN4Dhc6FZDqPZHTw4z+eeZFwrCCuRT
1pKs/Q7oAkIrf9ILQbOCL80IQWiMG7wp584TNCCl/HopLLtPoPAU9/o6OFf56K+Z
5uen/LuLCs0UasoAycKQWx3IqnX2xhQdFQ1F15NmgEvbcE3OblQ=
=7Km3
-----END PGP SIGNATURE-----

--iK0ktflfZxsG4tRp--
