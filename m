Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CB730E84B
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 15:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776870740; cv=none; b=Frj/7eunpTztEDcNIsGaOIP2x7LXNkX3E6IGh9eBGTmAbIr0XRg3DLF3rdjszQf09nNwqxOtSx0udk6UhBwuq04wm2Itlsiu56RjyvloEnBezd3sob/HNNmIRBhGvr7aSn85hZkDiMEKnM2p4R1sesSC+l8YCsBHbdmD2ROc3BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776870740; c=relaxed/simple;
	bh=+mxPr67dmi6eGFQEyDC3BhSbmybQ9ZfOoBp7zRL6wIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U5nUFuWTv14YJOEiqoMvgkqWyEc5xDPUV9YUmAom8M98TIZBD3tKS2o7qsV+3zTbfhqvNu1ZMpmMr65BnT58FD2qm5+1uBS8acMmB+8OhtUXkH1TaseBPoPV5lu4aBQloPWUVSPKShWGgvYh2kXlWocCjXq38ZUzf0rDs6EQS+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XdzwLERF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XdzwLERF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BA4EC2BCB2;
	Wed, 22 Apr 2026 15:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776870740;
	bh=+mxPr67dmi6eGFQEyDC3BhSbmybQ9ZfOoBp7zRL6wIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XdzwLERFkYdJ669m1kPKbBDvvaSbC2lPrz2VXhRFzFnBHNGLDlDZ2ffYtquR6W9G/
	 d5Yp4X98uyHhA9SpdwxWdCC/Q8pFrdAi4alhKteYf4zdf1hQ3zZVt06nL41RppUK3r
	 kwKnazcflpTTjePKX6CZusiw4DJ1HFUOeV4KrTDtYSnXm9WGvuhEg3hJw0Og7r+JHN
	 Aq16VxCuwdW+ILHs3vqgVlD+HhXt8l1J/xglzb6vlFHcm0fp4A6KhI2eQZBT5d3Qrd
	 BoUL694meGKIoHoV5K6SwsZLVCroGOp4OM1G6R2iJ2tDKN1IntC9HQpRDtn0mMzfcl
	 uGtJ1njG+jZ1w==
Date: Wed, 22 Apr 2026 16:12:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Stephen Boyd <sboyd@kernel.org>
Cc: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Stefan Wahren <wahrenst@gmx.net>,
	Maxime Ripard <mripard@kernel.org>, Melissa Wen <mwen@igalia.com>,
	Iago Toral Quiroga <itoral@igalia.com>,
	Chema Casanova <jmcasanova@igalia.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	kernel-dev@igalia.com
Subject: Re: [PATCH v7 1/5] clk: bcm: rpi: Manage clock rate in
 prepare/unprepare callbacks
Message-ID: <18719902-4b4f-4766-ba92-658f3576f68b@sirena.org.uk>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
 <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
 <5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LHYlK3DZlkasQWhb"
Content-Disposition: inline
In-Reply-To: <5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk>
X-Cookie: I don't get no respect.


--LHYlK3DZlkasQWhb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 01:49:24PM +0100, Mark Brown wrote:
> On Thu, Mar 12, 2026 at 06:34:23PM -0300, Ma=EDra Canal wrote:

> > On current firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> > actually power off the clock. To achieve meaningful power savings, the
> > clock rate must be set to the minimum before disabling. This might be
> > fixed in future firmware releases.
>=20
> I'm seeing boot regressions in -next with NFS root on Raspberry Pi 3B+
> which bisect to this commit.  We get a likely unrelated oops from the
> firmware interface and the boot grinds to a halt some time later since
> the ethernet never comes up:

This boot regression, which was originally reported against -next
several weeks ago, is now present in mainline.  Ma=EDra quickly provided a
fix:

  https://lore.kernel.org/r/20260401111416.562279-2-mcanal@igalia.com

which I have confirmed works but I've not seen any other response to
either that fix or the original thread.

--LHYlK3DZlkasQWhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmno5UwACgkQJNaLcl1U
h9C8uAf/ZO4wI21Uzl5bCxYBY8Jno+VC7J4vtbL64QxVmWsUJS8BkYFC8/7ag7Xb
3aX+wZAeWYuf+4kqIxij9+BdG+DUMiB2na+K9l42GGjTzNOxGlrrGZbswySitPsr
h1ZXondy/6andS/ka69t4b+iHh0V6QJC/j2vVgrYGU3rg6M+jc39EZ88pwbCKej2
ZCJc/vbmmaR9d/rqkcUFelHQcdTaIdDe7bT9WWbXplaBNKYvvPVyOsNfUtjDr8An
mpRjI+38T2F+ILIjrqcY0PgvIQLKLqOpjYLl3UOsKp6WcuQirHNc0KT1t2GW43FM
4MpOkPYfCgX7zx85X1PKJ1M63CuknA==
=kuy8
-----END PGP SIGNATURE-----

--LHYlK3DZlkasQWhb--
