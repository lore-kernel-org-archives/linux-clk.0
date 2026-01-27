Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05D52D060B;
	Tue, 27 Jan 2026 17:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769534729; cv=none; b=JHJMsejY0UIjk+m1NLkLooE1dWQklhWo8/4RAJe5+a6BMm7oH7JiC9S85dKbZQxxy6n2/rJK52pcs4hgptn2MojavxBzdPXXUHiqQ/R2wwx/TD5Umqquf+5L+KYPS5Nsf3QZWx755USP1dm1ApLqYSYbd/s5JS67fQwDM99QD5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769534729; c=relaxed/simple;
	bh=rW38RPoI3oC7pNCyY0rJv3O6uYwRPEMNoNEw8/xECFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O2FDfj+LiKEyUst/udz1BG4CXgYkvfgRdslu6E3aeNYf/2LIwvbomvTo/ZXl6C4Ul8CYFu/gV24RXCBfk4lufn/HCoNLnLmrnC9cgK/Bkw+jMgFJC+HXkZ4SE5LHTDzJ5PwBigW0maFc74i1zUYQVAfeRtMTFXIl1olb3eSkD6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=broqQYSU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="broqQYSU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAA8C116C6;
	Tue, 27 Jan 2026 17:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769534729;
	bh=rW38RPoI3oC7pNCyY0rJv3O6uYwRPEMNoNEw8/xECFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=broqQYSUyCZFqhUBVTkrR+dH3UsWbklfnhuW3B0HJf/2US/ZGqbFoSwMfI9QS1+AU
	 irWM9QESApcK+/HViaWyDz080JoEFiS0H+7X2Yim/C5wv1xUlffScWUGE/g8LVxGIV
	 TVN+um2U/fSPVvxp2GsbZgXoVXkLUd6HMzxhYuAeiu0e69LTvhBCvSO8gVgSXU6hjC
	 Dab1HZsAECYGVgpU0E+i1X6hDDlJp680ohEBrUC3Il2mZdg3kKCYf6oqZsIBefj5Eb
	 qbpJC/mdaHmzKFtpfLnH58a+cPtH8mXxN6l0b8KiaQUE9PipMMwAYCJZXz82bLnZVB
	 d0oMLucv9S9uw==
Date: Tue, 27 Jan 2026 17:25:04 +0000
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
Message-ID: <4ea31b0d-af6e-44f7-86e4-35a43b8c71e7@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <20251010-mtk-pll-rpm-v3-1-fb1bd15d734a@collabora.com>
 <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RF8mwgvq6/WUQAl0"
Content-Disposition: inline
In-Reply-To: <036da7ce-6487-4a6e-9b15-97c6d3bcdcec@sirena.org.uk>
X-Cookie: I brake for chezlogs!


--RF8mwgvq6/WUQAl0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 05:01:35PM +0000, Mark Brown wrote:
> On Fri, Oct 10, 2025 at 10:47:09PM +0200, Nicolas Frattaroli wrote:
> > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > operations, such as setting the rate or switching parents. However,
> > another operation that can and often does touch actual hardware state is
> > recalc_rate, which may also be affected by such a dependency.
>=20
> I'm seeing boot regressions in -next on the Avenger96 which bisect to
> this patch in -next.  The board resets during startup:

I am also seeing some similar regressions even earlier on i.MX8MP
platforms, though they're resetting even earlier before any output is
produced (even with earlycon).  Didn't confirm yet with a revert or
anything though.

--RF8mwgvq6/WUQAl0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAml49O8ACgkQJNaLcl1U
h9DWogf/Z6f+ynVN93YYO78VeYBg+sDQozhRTPncQpjvglNt8Mq+zTZKAzdWU8fo
jwbjNVtpH6kamkMp5b/tIVaFzuD8cHU0B0AdnVcnueJXNJ49AxUy9oIZlKCJTS6f
bMFQoiJ6nniK04tIBXw7KUjIOqetkXLva4CtzYO7Lp/CHsp6nJF6ExXMxodiy9R9
EFOwyOMcWNtVg+C/ekXKzvtoYWOWBZ7ug39ftHJwnpUYLLX4tqj4e2F3UWTT6zd6
4BiaA6euXIAGpX+ndLto43Ecm2QwSMrZ+r3KGQelFMY3G7GnGkzZxAgb1G1dlE4I
wUCqqcDUxVEXsebEpYs7GbyDTI+Mhw==
=uEAl
-----END PGP SIGNATURE-----

--RF8mwgvq6/WUQAl0--
