Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEED36BCCF;
	Wed, 28 Jan 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769613713; cv=none; b=WbrNzfWrqrVwltkRRBv7sNUbWw73PVHq+Tu0JZxGpgN9LsMHEfsdtY7iOsS+2W6pOCcu1uiR7M+FRnW8yG09koIzkFGykRD0x/rUteP0kfa6I9rrlsphGgeL4sWF7uqmkkR4501ymXG/O8sjGwjEp0H49t/sBTYz5rvuqhxqCV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769613713; c=relaxed/simple;
	bh=2Zsk/TGT8bvlH30c7bRKqZGLnaPYjVqj8G+Sc2lAWs4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fBUrqgd5ZzcxnE33NsVykjfo8KGjfqHSdgJXbqeF/eHUChDXI0oqp6klvoXGxZjntkxMG2LAUyKWbQwkExxSfylr3q7hx65PVi2h42DrCkCPiX+kfxBCoHlH8nzsN1IK/xrTdDYEPucDWZY8KKYTs99tuOUQT74zGtWkj8oOJ3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCZyoRxW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCZyoRxW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 207F9C4CEF1;
	Wed, 28 Jan 2026 15:21:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769613713;
	bh=2Zsk/TGT8bvlH30c7bRKqZGLnaPYjVqj8G+Sc2lAWs4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kCZyoRxWNUIsCCMvdJMuVqsPnyFOgo0Dz+j9bCO81IaGAqfmRP6E44MZtGOE54wz7
	 PYx/pXKywHFPviblAtG93DMrCus/kadmva8+7KlzrBbCnVugfC95tzvjP1XLdnjdNo
	 E4XMqICu81Fu2hY1rtmKhAS3QCrzhAJGyyugx9J5C/JSGH0ADLPXBE/KVG/uV5YTl6
	 yO6QwXUNHnZyT46k6AX7ObD35jhWtv+zhUSaZd5hMDCJRv7CNxVrjaVHvn99fkWG2o
	 siuie3dlrJ8w9/LWTb4cl+uv6CGAxeZF53EjoS/iAnFEAJ414Is2wq56qfF5GdvhTV
	 78gZ/GgLBYN2w==
Date: Wed, 28 Jan 2026 15:21:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
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
Message-ID: <9ed19fb1-258f-44c4-b816-73c0d7d28a6e@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
 <5050249.GXAFRqVoOG@steina-w>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Md653eiPAQTQmKBd"
Content-Disposition: inline
In-Reply-To: <5050249.GXAFRqVoOG@steina-w>
X-Cookie: I brake for chezlogs!


--Md653eiPAQTQmKBd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jan 28, 2026 at 03:55:54PM +0100, Alexander Stein wrote:

> This is for TQMa8MPxL/MBa8MPxL:

> [    1.452788] __clk_core_init: enabling parent audio_pll1_out for clkout1_sel
> [    1.457677] __clk_core_init: disabling parent audio_pll1_out for clkout1_sel
> [    1.464270] __clk_core_init: enabling parent audio_pll1_out for clkout2_sel
> [    1.471760] __clk_core_init: disabling parent audio_pll1_out for clkout2_sel
> [    1.478360] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_div
> [    1.485259] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_div

As expected same result on i.MX8MP-EVK.

--Md653eiPAQTQmKBd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml6KYoACgkQJNaLcl1U
h9BdDAf+LJ1ulqGfbkvZOnVZ4oTowdg5gj2J/KhpHUh8wswREs3lsK+zE2HYPJqD
xzLz9colzYFWtcunlROoy6O4ypwx1NUnXp/zjQ7+cCwyOWVUpdbnHA6e/MPoEgVw
6ZtqmrqFRP8g8UagGfHwCaZ3PYpq5U5fXCCeh7COP3t16QxETZ7GpjQbJ1vSDtQD
zxvr7MIYQ4qcYNcQuFCruyRzm6JexqF36jElGYOzkePJbpQDyEAv1lJc9EhDPszb
Om/NNCgD3RbHcGlmRNhc2vG3HfR/5EY7rx+NrcMeoY5V07n0ZN+SgUDd5NdI+bw4
BDl9pXjpcl8S+/VV6CBMuiIKSj1qYA==
=YfRa
-----END PGP SIGNATURE-----

--Md653eiPAQTQmKBd--
