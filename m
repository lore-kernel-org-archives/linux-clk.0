Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F6629B8E1;
	Wed, 28 Jan 2026 14:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611635; cv=none; b=l5IUtRc1krU5NcC64EXgAEAQuLwVBzPmS5ylgVkrfd863eeLjTKia3Ymf7CUl8wB9N1MyNyRmsjzi69BzxRax5mjj2AnrzTweP3tfYMt52CktJkM+vKOFMBomapqFKNmQA8/nOxAhORIT7+qLnhRDmMGyfoBfkUDyK+jdfo6dLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611635; c=relaxed/simple;
	bh=tHWNBPFYS91KkDSP5taGybUFdFj3eFVqHM55nD7uiTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gPba8+q9qbRDrdldgqZ43O8ikuuYfXiS6EFm7ibzeROYKXVUuLePZesmXLtNy1VE+cml5tLIKT/B8EVsjTyl9cWVhEKes3XPb4IOR3XTu2OWKF8f8SAH1VnMle3LprTxoQ8hVOqUgLA3YvYnWpAFVbS+ta3AH6NGp6vgJz7v0nQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ul09wiqX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ul09wiqX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF98C4CEF1;
	Wed, 28 Jan 2026 14:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769611634;
	bh=tHWNBPFYS91KkDSP5taGybUFdFj3eFVqHM55nD7uiTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ul09wiqX8UI6vXHuhBsL1eLLc7dCJAXEsJeehfRWsu+h1mwgsjjfsDX+NWjAL2b0/
	 4xqPup32t3j8pF3fJvYzjBxDVdTjfbqCjine4m+iR1kdAfSATO6+JS1XECxnrGg6is
	 LZ5YvjxU11g0ldUEHoMSJwXuoJcpmrGJfShYZe7EEnhLY5rVl0VxGyNsyOmNYKbAY0
	 iI4GVkNvMY/i7nt1HyCra7DRgdR/olvh0SbCo66t9XYKIAsHI3ADMRSK4Q4s63HEtX
	 BGbImqzNemsDZ6piY5Kvm38n1ehvBSDQFVIvExRsnn2/e+tvmf8632pV3aPoU2Fmp/
	 xO+gE52vLMC0A==
Date: Wed, 28 Jan 2026 14:47:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Yassine Oudjana <y.oudjana@protonmail.com>,
	Laura Nao <laura.nao@collabora.com>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
	kernel@collabora.com, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Message-ID: <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6800096.lOV4Wx5bFT@workhorse>
 <1cbf0f37-13de-46a5-a3c0-0509048c519e@sirena.org.uk>
 <6678782.DvuYhMxLoT@workhorse>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GDKwEpCHvyP7dewC"
Content-Disposition: inline
In-Reply-To: <6678782.DvuYhMxLoT@workhorse>
X-Cookie: I brake for chezlogs!


--GDKwEpCHvyP7dewC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 03:09:46PM +0100, Nicolas Frattaroli wrote:
> On Wednesday, 28 January 2026 00:14:29 Central European Standard Time Mark Brown wrote:

> > Do you have a debugging patch we could run which would say which clocks
> > are impacted?  I guess it's more of an issue for the platforms that give
> > no output but for at least Avenger96 I was getting earlycon output.

> Try this one

For the Avenger96 that says:

[    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
[    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
[    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
[    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu

https://lava.sirena.org.uk/scheduler/job/2412562#L563

--GDKwEpCHvyP7dewC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6IWwACgkQJNaLcl1U
h9BBPwf+LjkTj9Qp0vyhD/i/R80ajL4bZ1ZDsFjeS7Q9ndpXjMlkWi2WkEMZIwa/
P+8ztpF6h/fmEXd3p0CscB4vRcESWpxlen8r+emlnUb+3fauARNtpcCn2rKnHkOO
jD6NPuNlD8RtZ4I2CciBtNW62ueWIz6wicxe31v6YMianQtrz7x6ir8LJjYO8yLx
4vrxf50/IQcQYSaNAukI+kmPEL/61gjY6FK8/vj6in7tdZDiIU/tj2pjI5WVtP28
MzzqbpFGPx9OEPRwKeScc8p9c69qdWQ+WCORo6VxGo1FQ4r068BFEUjOKSNFwRWU
W3J95d/PsXOZF12bpTIlh1Kq63T43A==
=9Yi1
-----END PGP SIGNATURE-----

--GDKwEpCHvyP7dewC--
