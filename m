Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397D31400C;
	Mon,  2 Feb 2026 16:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770051279; cv=none; b=YAQWX8exIZCeALosrG03+Q9TctN4PASV7K7AV8VI33ERgiNKhXUAUaI6K32YVPQvM/HTGZdO8ed5c+GVna1ox155tpVp7z4BoSvn+7D6HFbsZBpFwgq8pxXmXqFpjM6nOu69aRNbmUvmv+gQQIfMD/JGYdlaVmZl6Qfhg1zxDxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770051279; c=relaxed/simple;
	bh=dFkuMT/PbjlmykiEzaX0lWh1FmgYYTDl3OTPj1VFmSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9KNCMlzhZhwxlAafyz+tCpbXOACLBdr0ZEvULCTFZuZfF+gkikfLcu3NQhVfg3hrHaH6fPUduWphftu6WXH/wVJcvb/8stYdQCJ14TTsBfq1uvipbT7YxV/x1dW+PIFq0DHUbNdoaTGKU/LnVwb6wea/SlWXyZX7LunSJePNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kI8WLpuY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kI8WLpuY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3571C116C6;
	Mon,  2 Feb 2026 16:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770051278;
	bh=dFkuMT/PbjlmykiEzaX0lWh1FmgYYTDl3OTPj1VFmSY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kI8WLpuYhsvo6gYvA61W/ciV+aGtbvKXKU+5m7TEoukt08Chnc1n9CkRrqroECPrN
	 MbhZ3R+dsdxBL9CtiFBCYhlKOSzsTxECZQVxO6JuRk+Ad5/Lfhsji5zkkJEmHBGjVc
	 AQQZWDOC3SCOztTIXdav3VmmVTZ7MMt/AN0+L/8usZiFYfKLHNQpNLXIpc7+3igurc
	 l6QT/rJ9P4v1zA/KqWEakBz2DdoTznGWy2K/sG1FCPR+TeSCHjb0ofIP9yCcZJz1TW
	 U+ohk0EKSvoLp1xMlxgbswOaIklRLgUbij0n/hKcAABmC0KzLQaJXglOvZwAhReMMj
	 Z62dzUs4rlLUQ==
Date: Mon, 2 Feb 2026 16:54:32 +0000
From: Mark Brown <broonie@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <e98290b1-274a-4f8c-b629-11c1167b0370@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
 <3745487.e9J7NaK4W3@workhorse>
 <176962688200.4027.9869545980331892869@lazor>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Ml7kgeSsfDfeG+D"
Content-Disposition: inline
In-Reply-To: <176962688200.4027.9869545980331892869@lazor>
X-Cookie: Save energy: be apathetic.


--/Ml7kgeSsfDfeG+D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 12:01:22PM -0700, Stephen Boyd wrote:

> BTW, I don't know what this patch is actually fixing, so I'm going to
> revert it. When it is resubmitted please describe the problem you're
> seeing.

The patch is still in -next today and the issues it causes are still
visible.

--/Ml7kgeSsfDfeG+D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmA1sgACgkQJNaLcl1U
h9CLcgf9EffwFr6JBb9N99fIsh3a56gSqW4r3a8ReNkp5RkHVfGkrLGXLY/JQlcA
lPrw0kTevGyqgvtyy9FVxO6qL4vSyMp/detgVS/sfQ5C1PpSBziZ9UbCg3icdnvL
/Wf5HqiF+tjB6iKlXZ/HjI2ZRqs81oZgPf5bXrMSKMcw61Xp9OTJkvZOd8jK/V+k
otYmjdIjM9+RCc3NFkhC/o7kNZu3iAuP4E1BnwjNbjkl4jKqhPF/vbP6uepW7r3L
0n9k8ZThsA6zw3nsC2nGR2vKqjlhqfHk9fZamyuDRLfmMtSy97Iesx4b3LxcbY/g
WFA/Shdt6/EseS46U+3RtkyEp/ncCQ==
=Y9/u
-----END PGP SIGNATURE-----

--/Ml7kgeSsfDfeG+D--
