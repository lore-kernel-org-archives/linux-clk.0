Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322D71E2858;
	Tue, 27 Jan 2026 23:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769555675; cv=none; b=UTzYYBRizsC3jyZB/OCQIAnG6YSgV7lRGe4oyvPP9sqLX5RZxuEahSt5fGnlSSvNqt7Ecq0ffEMLZcYzuZtL0N1jheSr97eb+ortTHvnefrAMa+RTJrPCu6EUjTD5t2MYMn5cuImjMwN51NP+2kxtkAHIhkvaXPGeqPJxJcPZaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769555675; c=relaxed/simple;
	bh=lqGjeRJOOzbn2aNNwZF3ZUIE//glBDeRc/EymDCY/oU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T+J8tLoOAluU6jReD3ZUwgDUEmYyp4WYpMW4kvKdvem+3NGjaPbzxLiJeYzv8UFMvi3IcRKGPrBo0VrsdPizQGphmSWnQDKpwobLoTOZEAv1K1IYrE2moyR0I8s2hTw3mUhh3dJMyG1GqJ6UAokojHrYez37svqCCBBVjZK7IdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XRrqoY0H; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XRrqoY0H"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8C36C116C6;
	Tue, 27 Jan 2026 23:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769555674;
	bh=lqGjeRJOOzbn2aNNwZF3ZUIE//glBDeRc/EymDCY/oU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XRrqoY0HY1rd+7oIyEmMd1s8RxC6ZmyxVP1V3A6vmlKSlhMCNqOBMEx6SBPFIKpLS
	 t1YKeY4VVfEWkvauBpePcx6dnAcpe+8uzBKWdNIJqY1u4DGgGYeZcRmx3LhScrex/8
	 Gsb//82WvJQG11Sd+Qu8vvhlLhec8dg3xpgaTAUxqnFlZzLLIRrh8AdH7jZIzaiBFd
	 8UDoXjcyDV1sFOPFmVFWpkn5Ri+GF/anLsmWazsD5lpPoLWjBcK5BrQwbB137J5GjU
	 irxnqlNWYLleLGajbvFZC2vVHq3QL/gTAJzC4LTexexmxSIAI1BlfrijcfkHVo5EOM
	 Mge8OQN0YTA7A==
Date: Tue, 27 Jan 2026 23:14:29 +0000
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
Message-ID: <1cbf0f37-13de-46a5-a3c0-0509048c519e@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
 <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
 <6800096.lOV4Wx5bFT@workhorse>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MCyY9aE0n3Y5i22y"
Content-Disposition: inline
In-Reply-To: <6800096.lOV4Wx5bFT@workhorse>
X-Cookie: I brake for chezlogs!


--MCyY9aE0n3Y5i22y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 27, 2026 at 07:18:02PM +0100, Nicolas Frattaroli wrote:

> Can someone let me know which clocks (with which parent) in those
> affected devices is causing this? I'm wondering if this change
> unmasked some undeclared dependency that it's now stumbling over
> because it's enabling the parent earlier than ever.

Do you have a debugging patch we could run which would say which clocks
are impacted?  I guess it's more of an issue for the platforms that give
no output but for at least Avenger96 I was getting earlycon output.

> To not have me break everyone's -next for days on end, feel free
> to drop this patch. MT8196, which this was added for, doesn't boot
> with mainline yet anyway.

Please, this is making my test lab miserable.

--MCyY9aE0n3Y5i22y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml5RtQACgkQJNaLcl1U
h9DT4Af9H5KfN9aVa29dFU6jbyVXWwck19anfXKhQzIfvchEMsZ5KMAIgbBV5EmK
hUM3KNvyUhjwoURJEXuxgi04z0WFIlAbbJ4/w9LAfBaFQGR57GlyF6VQGqhasxsR
guZub6177/4RjZ+IVfEniKsKdSlarac9XzKhWLCSzpSM6vKwMRwEU59N2dEPklOM
DJa4MRkqm0U1z/njEH6r//49UDOTB9mHTiJ7ysDHJ3FCnzWXDAEeED5kLKILRbJq
v3RGTh3x0yt8MvnO/gnZFSkx/R/xlPidk0aY5ytelWxqK10zNZUa3OLGMwVXuN/+
ulPx6atTjVbUUiG2r4Xc05kzyTNluQ==
=wXYP
-----END PGP SIGNATURE-----

--MCyY9aE0n3Y5i22y--
