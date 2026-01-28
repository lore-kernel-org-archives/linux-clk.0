Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11200313527;
	Wed, 28 Jan 2026 17:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769620115; cv=none; b=P/Tw6hbga/FWSSUICNZBvHfdiKd3/Z57R3t3w8MQd6AiZwXfswO8d3DRDkIa8cw97Jo+ozX3s9ZFhEDgk1a/PJRPwcsDJELI7OijZmvq3X/bYWzF+YyAVArtEBY84dW4ZOpBz8T5yGfv9BWCEQnRqY4Zj04LbA3Ba391E3ImMkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769620115; c=relaxed/simple;
	bh=f92JorMVXZAxTrxStzte/NgjHdrAF6TknJcnijB+Wmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WO/9s3i/N8U24Av+UnQRUbHlOoFpUT5DRgZa6si/E4fBo6aKeq1tOqkj8Jl/UXawKzTObGJm8BTDvScJRZlaKkuUDa4fl6p/QWw+uLljwwNLtgAZfJMZSGCXt8uvIB/KgFmHE5ZsoKXfLXGunfKVyOFJnzquBrBpZkqSULJ2iUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DTTNDQUA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DTTNDQUA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99717C4CEF1;
	Wed, 28 Jan 2026 17:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769620114;
	bh=f92JorMVXZAxTrxStzte/NgjHdrAF6TknJcnijB+Wmc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTTNDQUAlr5l6THkjx24i8blVSe2OwDne0saZFlxQ8gzaE1Ar1y47e73wl/uXFL6n
	 /LNs7BgtZBy4qyO0jObdfNnV0XRajSiSrisGLHr2v+Q/U+jQ5SeqUFmk0T0zGsrcpL
	 fQuq0iaKsk2hdugDFbnL8bWyKtXUec7zVqI1HcYSK4/9bLoFwFk2Ug/91Nwj2EKXYA
	 p1vco4P4qqz29cpSklN2cZiTic06dq0bTT+FQQh0DrjqpGqKoPqX4sGHNLqySVNx+r
	 Rr4oxXoMjhQ8IB614dC21j906uAjxMuynSBV9jQr1pBo/ZC6NRAdfcWx1oBfnjiQHi
	 lMlLizBJscDvQ==
Date: Wed, 28 Jan 2026 17:08:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
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
Message-ID: <b12b05b0-154b-46a7-a760-cf0bdf67a8b9@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <5050249.GXAFRqVoOG@steina-w>
 <9ed19fb1-258f-44c4-b816-73c0d7d28a6e@sirena.org.uk>
 <4040610.5fSG56mABF@workhorse>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5H4TKIXeuvQhBs07"
Content-Disposition: inline
In-Reply-To: <4040610.5fSG56mABF@workhorse>
X-Cookie: I brake for chezlogs!


--5H4TKIXeuvQhBs07
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 05:31:35PM +0100, Nicolas Frattaroli wrote:
> On Wednesday, 28 January 2026 16:21:47 Central European Standard Time Mark Brown wrote:

> > > [    1.478360] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_div
> > > [    1.485259] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_div

> > As expected same result on i.MX8MP-EVK.

> This one puzzles me a little. arm_a53_div is neither marked critical
> nor is its parent. If arm_a53_div is required for the system to function,
> then I'd have expected at least it to be marked as critical, allowing us
> to do the workaround in init I proposed as an alternate solution for the
> stm32mp1 in my other reply.

Given that all the cores in the system are A53s I rather fear that it is
in fact critical and should be marked as such.

--5H4TKIXeuvQhBs07
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6QowACgkQJNaLcl1U
h9D9Ygf/cdCGE7T1qR/648Ls3rSPg4pjmtGvSDshbBZ4arj6XMt4qGLjJDM/9GT+
pdfIMSHITssC7TutL+XWNOYj9apZEw3CP7irmSM5p1of9b9IMpMKRG7WVHAY5UPG
HEgukH+mzZFVeqVtSbPhUlotUs6dTsfwgJFH47bQmevWyL3BvhIW3tuRIEOrNyEx
v8anef9iRv2wpuWWVCJNHy3tMOoW3VkIBoiYSTjKWXDuxgL2e5dGt4xO5ubm8flQ
3dmqP3EEtVs5HXu36hbCqrX3ziEDiUlTZZeyZbtl0DoZaUeRF9VjOtGZV8jQgXod
o2oz3BxKrwTrEvPutpqQheh7qo1hYA==
=zbUu
-----END PGP SIGNATURE-----

--5H4TKIXeuvQhBs07--
