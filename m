Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F7E3FEB11
	for <linux-clk@vger.kernel.org>; Tue, 31 Mar 2026 14:44:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968278; cv=none; b=AItXA+9n2kinS9qKdnaHxwS5avOyl3oNJetrZilZAshU6D8JPZldxn0uWX8IhF9Pb9UBSxZ/0ri8cs85OII+pghuiLTgSh2+pLhpK/52Ot+4wIhjdKO30Tb1XfMIG372DrxfZ/AAhqBq/DYIWacZ6D5XE/Dt9/q4PltRnPIIzDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968278; c=relaxed/simple;
	bh=3Jhe3TYvRFJkGv7Zr9SSw2NSWBUOqC4UfBtpEzkNAq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kf1l5aNCG7v5/Ga/nx5KLweKfXYWcS30Y13N9bsotc/QP37SiU3ZPzNSjKgPUzBcI2t5xBlR4wY1c14f9hhfpxttu9CBSEYtGsI8DC7eGuHAHwezB2oFaKHoq6U+8HjuuRvEI5emrywK5hjB7KHWXMGX6BgP4hK3YA4kX5uy2cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rj6yay0F; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rj6yay0F"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D34BC19423;
	Tue, 31 Mar 2026 14:44:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774968278;
	bh=3Jhe3TYvRFJkGv7Zr9SSw2NSWBUOqC4UfBtpEzkNAq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rj6yay0F8xnQmb2P+v/FnkDjrmuTOcOJYfOxuiibrcXSN9gjxUZ4lLxVRJbEbUYcS
	 JN7r1VaXkvKla+H4EMfP13kjj5KfmKUrTosQUkMKLfJkQYOVXJwf1rs9/Qh5DQQJry
	 ymJfWPTgj8DhkiErhAymB7y3E3e5qJLlgB66V/NM86KxvwDSkxvRgERA4O2T8AFwOU
	 RDyfZ4Rs4dxSJOF36eVqZyClMR5Z1okIXEgkQ4hAts6VxccPH8hoCBK2CcfORUMbem
	 q97xkpxD0/oWeQnKHq+ajwsKw9BWSA0PVbpuTEzR0lhadJ75DkuojegAu/+PCiYayh
	 5u3BksmTnqH8g==
Date: Tue, 31 Mar 2026 15:44:32 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
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
Message-ID: <8a3c104f-9259-46a9-a6d2-a907d699e49c@sirena.org.uk>
References: <20260312-v3d-power-management-v7-0-9f006a1d4c55@igalia.com>
 <20260312-v3d-power-management-v7-1-9f006a1d4c55@igalia.com>
 <5f0bec08-f458-4fba-8bf3-06817a100c4c@sirena.org.uk>
 <d251c380-f2f5-4daf-9661-bbb6dc6c959e@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mw1gwsm7ZbtolsXc"
Content-Disposition: inline
In-Reply-To: <d251c380-f2f5-4daf-9661-bbb6dc6c959e@igalia.com>
X-Cookie: I just had a NOSE JOB!!


--mw1gwsm7ZbtolsXc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:32:07AM -0300, Ma=EDra Canal wrote:
> On 31/03/26 09:49, Mark Brown wrote:
> > On Thu, Mar 12, 2026 at 06:34:23PM -0300, Ma=EDra Canal wrote:

> > > Rather than pushing rate management to clock consumers, handle it
> > > directly in the clock framework's prepare/unprepare callbacks. In
> > > unprepare, set the rate to the minimum before disabling the clock.
> > > In prepare, for clocks marked with `maximize` (currently v3d),
> > > restore the rate to the maximum after enabling.

> > I'm seeing boot regressions in -next with NFS root on Raspberry Pi 3B+
> > which bisect to this commit.  We get a likely unrelated oops from the
> > firmware interface and the boot grinds to a halt some time later since
> > the ethernet never comes up:

> I've managed to address this issue locally with the following diff:

> diff --git a/drivers/clk/bcm/clk-raspberrypi.c
> b/drivers/clk/bcm/clk-raspberrypi.c
> index df2d246eb6ef..ef5ae3b4adca 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -160,6 +160,7 @@ raspberrypi_clk_variants[RPI_FIRMWARE_NUM_CLK_ID] =3D=
 {
>         [RPI_FIRMWARE_VEC_CLK_ID] =3D {
>                 .export =3D true,
>                 .minimize =3D true,
> +               .flags =3D CLK_IGNORE_UNUSED,
>         },
>         [RPI_FIRMWARE_DISP_CLK_ID] =3D {
>                 .export =3D true,

> It looks like the VEC_CLK can't be disabled at boot time. Otherwise, a
> bus lookup will happen (similar what happens to other RPi firmware
> clocks).

> Is it possible for me to test this change in LAVA CI before sending it
> to the list? Just to double check that this patch indeed fixes the
> issue on your side as well.

I can give you access to submit jobs easily enough, if you're already
familiar with LAVA and have somewhere to host the binaries that'd work.
It might be more straightforward for me to just test it.

--mw1gwsm7ZbtolsXc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnL3c8ACgkQJNaLcl1U
h9DMywf/c7JBjgSLiPt0az2ROBbBsrilMJsPqSNTsDXA7X5NknfUFp72tFaotahG
8vusN+z69oaPzUBfSXNsdkuURtbFw+lfZvxE4POlhNUeCVHgMtV2d3ZMkOp08tXW
gsRgIsUPBRLUmJ1tbBJ2gLJefotLzW2GMgl9p2jn/fX9K7JGzb3WEE0mlGz+cEi5
hhbYGyU5uEgI4inXmDrG5zb68H+yhuYSAFcmKVhGjPs+8C0UNLX8cD8sOYo64KR0
6dYyMlGKUGrQyleLJ9kvD/k+enQTS043Vz81Iu0dGsn+RUM9J114a4jOg0R+0V4I
JdWePwdWTSYwrYz1SOACpRqaYrMVEQ==
=AW0Y
-----END PGP SIGNATURE-----

--mw1gwsm7ZbtolsXc--
