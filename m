Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884E528151C
	for <linux-clk@vger.kernel.org>; Tue, 17 Feb 2026 07:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771314316; cv=none; b=sEzJjWJfK1mhOM6JFGYwLif2lP/l/80tZdMxlxnlZCj76nCWOQH0jYy5X7jwoYWDkFO6sxAJp4irpZa+dZPt6a/Bx7AzcvoszldjaO4uUecxCIkvFtMGd2VFT8Y7GamLcV7FVXm/1bBj3MgrVBPmNMQ3lKdk05IiiatU61dYlU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771314316; c=relaxed/simple;
	bh=2SCaHPmmHOUeBJaqZQWfCOmJYKDO1gw3Ra7MsZgfvIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PDXbhZibRX+n+/2cVK7CGeFZO0aIx1qoF/Sq7qEKbeISih5l7HpZjx9cj4kXjLJh73uwWn6VlwYeHa94QRjaT5NF7TCB7lKVbNvUb/5W/s+SfixHIG24B+YAeZdqldtweOwZMHv6mOqFATKCCax+2vi9jPax53kR39SbPWP7fB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sti2F08u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sti2F08u"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C71C2C4CEF7;
	Tue, 17 Feb 2026 07:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771314316;
	bh=2SCaHPmmHOUeBJaqZQWfCOmJYKDO1gw3Ra7MsZgfvIE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sti2F08ueeiU39mBUfR0M/+OzAunNriD5726YArYv3Ytwug+iYhx1WTVaDU9AJ3Se
	 OfsuthKBSGJIXBQMmH5U9bRzXBkhQYrKLOn3jym1LQSHAWBtDegwT9dGutvOqkVOCY
	 IXeu7UzG1aPx7N1UGfePhicKwajugo/XKHxh0CASpZMANS87XbHixco/FvKuVVRr+A
	 z1xW4dG0B6C4YvCis1QIb26100F5hwH7m8PQzpuEUyOStdEzrtiohfPOyOqcs3ZnBo
	 b1fkl2rlF8z3ZYH8UC3U3iAD8yFFkdFkxMoSII9XUBd2RECYbMvVa/sTZL1/SdwcQv
	 vDyc4ZIj0TVRQ==
Date: Tue, 17 Feb 2026 08:45:11 +0100
From: Maxime Ripard <mripard@kernel.org>
To: =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Stefan Wahren <wahrenst@gmx.net>, Melissa Wen <mwen@igalia.com>, 
	Iago Toral Quiroga <itoral@igalia.com>, Chema Casanova <jmcasanova@igalia.com>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, kernel-dev@igalia.com
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
Message-ID: <20260217-quaint-phenomenal-macaw-20b550@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
 <20260216-brave-ara-of-typhoon-cf90ba@houat>
 <b55ac433-4fe7-4179-9777-278022ccd3cb@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="tgdafevhsdd5reyk"
Content-Disposition: inline
In-Reply-To: <b55ac433-4fe7-4179-9777-278022ccd3cb@igalia.com>


--tgdafevhsdd5reyk
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0

On Mon, Feb 16, 2026 at 09:18:31AM -0300, Ma=EDra Canal wrote:
> On 16/02/26 07:53, Maxime Ripard wrote:
> > On Fri, Feb 13, 2026 at 03:52:56PM -0300, Ma=EDra Canal wrote:
> > > If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will s=
kip
> > > HSM initialization, which would result in a bus lockup. However, those
> > > clocks are consumed by drivers (vc4 and HEVC decoder drivers,
> > > respectively), which means that they can be enabled/disabled by the
> > > drivers.
> > >=20
> > > Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
> > > drivers when appropriate.
> > >=20
> > > Acked-by: Melissa Wen <mwen@igalia.com>
> > > Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> >=20
> > It looks like sync_state would be a better candidate to handle this?
>=20
> I have the impression that CLK_IGNORE_UNUSED is still a better fit here.
>=20
> First, the clock framework has no sync_state integration. The only use
> of sync_state in clock drivers is done by Qualcomm's clock controllers,
> which uses icc_sync_state for the interconnect framework.

It's done at the device level, so you don't really need any kind of
integration, you could roll your own implementation.

> From my understanding, CLK_IGNORE_UNUSED is the idiomatic mechanism
> for "don't disable this clock during clk_disable_unused() and allow
> drivers to manage it", which is exactly what we are looking for.

Ish. CLK_IGNORE_UNUSED is kind of a hack that only does the first part
of what you stated. After clk_disable_unused(), all bets are off and for
all you know, all the unused clocks could still be disabled. You can
trigger such a condition if a driver gets and enables the clock, fails
to probe and disables it.

It's been mostly used for clocks that should never be disabled on the
system (and has been superseded by CLK_IS_CRITICAL for this use-case),
or to ignore clk_disable_unused, where sync_state() is the superior
solution.

> Apart from that, if we decide to use sync_state, I'm not sure we could
> handle granularity. sync_state is a per-device mechanism, not per-clock,
> and clk-raspberrypi provides multiple clocks (consumed by different
> drivers). With CLK_IGNORE_UNUSED, the protection is per-clock: once a
> driver calls clk_prepare_enable/unprepare() it manages that clock,
> regardless of what other consumers of other clocks are doing.

sync_state would replace clk_ignore_unused, so would run on the
controller device and disable all active clocks with no users.

But yeah, maybe CLK_IGNORE_UNUSED is good enough still.

Maxime

--tgdafevhsdd5reyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZQcggAKCRAnX84Zoj2+
dqAZAX9FIC16SlVDcviD9Y2sRbwr9brIcP4q0nuFqEvJfNkrfyS0IsifP24IJvPP
Mp/qj6sBgLxZd73gcDi35g0a9b0sOWqUJUzX4FUCqrqRdRRbb5gSzdpoopNycn4f
O1jlFJnbwg==
=jSWZ
-----END PGP SIGNATURE-----

--tgdafevhsdd5reyk--
