Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB985274B3A;
	Tue,  3 Feb 2026 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770119068; cv=none; b=pMFOWOfYwmqyQ23rSO4oCSh0aEZB3dpfcJ2B5b8eqDePIPxxj6CGTb3nDnNsgEEV7oE7Gm7YGgZVLUNpyOCcTXs12W6j+eC3mzWhnUbb26Y9U1Q+BSriBO/sZbfFM9wuhQJDWG6sTTJ8Woe1si8H4NGDHFySLL+roRzotdWesSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770119068; c=relaxed/simple;
	bh=ti6GPfXzNrGebiZu8scvVNHPqQoAoCsZtWggvYnGPHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egP76iGPUJ9B3EZYyV6g1nIghqbX23aOyh/svQ3Vafwoovovo8ImDrU6C6d/FfjfahYR07vy3ZpZH5k3c7hK0DWF5Vra5AnhQGfAjtTY0XcAJSgsAFsDySk1egc/QhN7HbJu75yMYYzM7IWP5aouHxfvwGOWUHKk53pqLfsGlO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dFhuPE9H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dFhuPE9H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3997DC19421;
	Tue,  3 Feb 2026 11:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770119068;
	bh=ti6GPfXzNrGebiZu8scvVNHPqQoAoCsZtWggvYnGPHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dFhuPE9HDwbP/PkMm1QWhsjsU7JLn5zWS/AJ4F23F5pHWZf8gC2UR+aKK26fXoy61
	 BLF40m1IMUuQ+F1UpKqxE2JkfDBIiNe/2WnZDJJ5/cxs5JHgQuWZUbQ5GFLcgXLE39
	 eevqhb5BM2X8TxSDhvxfIUrQND9I/h8NDWOdjh/aQsMWgQRslbKH/45m6atMIGbE/M
	 EKOU35iN5hUif/Ews03PVJJcJ2+UZFlOlE4rWXk19TEYauOxkHD9o/i2PzHPSHxvaT
	 X3SQZdn2fi3K66EzloiTBgQHt9Fbr9WBdxfKTOFUVYqQZgDpy/wscSrZfcb+JpJZ/T
	 HjU8d86BUu6Pg==
Date: Tue, 3 Feb 2026 11:44:22 +0000
From: Mark Brown <broonie@kernel.org>
To: Daniel Baluta <daniel.baluta@gmail.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel@collabora.com,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] clk: Disable CLK_OPS_PARENT_ENABLED parent only
 after CRITICAL check
Message-ID: <0cc467a6-2121-4a79-9143-71cce088bcc7@sirena.org.uk>
References: <20260128-ops-parent-enable-fix-v1-0-ff39cc37f98d@collabora.com>
 <20260128-ops-parent-enable-fix-v1-1-ff39cc37f98d@collabora.com>
 <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="0shkWHVSS9MR5KUA"
Content-Disposition: inline
In-Reply-To: <CAEnQRZABuXQsJ4-5u9uP8VM63of8EpiV1LcUxv_vSBuGT1uEBA@mail.gmail.com>
X-Cookie: Do you know Montana?


--0shkWHVSS9MR5KUA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 03, 2026 at 12:13:22PM +0200, Daniel Baluta wrote:

> Would you consider please reverting faulty patch above as i.MX8mp is
> still broken?

Stephen posted a revert yesterday:

   https://lore.kernel.org/r/20260203002439.1223213-1-sboyd@kernel.org

--0shkWHVSS9MR5KUA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmB35UACgkQJNaLcl1U
h9A4Vgf/Uvyj2AFwDKOzAlFFnP32o0XeoeZeQhAYu73zomn39yZ5TAhVi2zdEG+k
+jbtloMu8oyjExk7NhheXUVhNgO1CGBDCtNp+JpCSw0kryE+HTXQnCgVS6cbQvar
A3uLI1QEvKw7m+QXLuHu05MQb8Kzzogo8BuY3l5pOTJXWt7pUKitzxIImoIdibjI
kDw77odABT2YgZhcVgLsWbiQhwcViOBdkIHNOIRFUhMG5RHHNWyCdy+OASgcVPmn
ifVPRUNXJ46vrhNnUYwEu+ziRTg0IrLbAq4ddsUMgb7CW08QIJYaRfInOPr9znkJ
izQGTgOS+AsikNGt+yoQiclJSnf17A==
=H2I7
-----END PGP SIGNATURE-----

--0shkWHVSS9MR5KUA--
