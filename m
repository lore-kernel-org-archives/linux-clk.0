Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30612239099
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771238658; cv=none; b=GXqUXj82Wrg44SRcI9tEi2wbUGBisBQEkuELJNAv2+6xJ3qbgDnElV9rPmAOUaXBpxB5mpkMlOjXiNymkJTa/HWR64p6/UjsfJStzwG39fKI6K7ugkPujBPDohyjg0QDiAQUmAjgKDn0zSXSNIzdMT/SmQzmPr32rrqq8sd14Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771238658; c=relaxed/simple;
	bh=PVqVaBr/n+vwwiVRZTvOnHrcTVldkSg7n8bljp1tGzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lBYYF/i+lp2dvR8Pp4sULK/pHRDmgFGtKpm8S6ojFA+ifEPpKXsL+bHSXTJsGWb+ECpv7KtkVKYnpIFBjz6LWQsv5k2/e+5I/5miIaicWbLJsd2XKQ8+/ZzvERgn37Ka+I92Qx5dfnavuDZ/JUsorU0j2Z5GhNM02NTjIiEBU4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmBwJPlV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmBwJPlV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 381F9C116C6;
	Mon, 16 Feb 2026 10:44:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771238657;
	bh=PVqVaBr/n+vwwiVRZTvOnHrcTVldkSg7n8bljp1tGzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OmBwJPlVNExeRF54zvsjriY5JlorTcvzKff5l9TBCiGJeN5TtxLsvVzNEpxJtLzS3
	 jJkx2NBYEUYEQMpagAVbB7iT2d1gV/4HnKU0LCBBu87yA0163B3k9R9lSjrvBXeAu9
	 S8BXhkbcQuJXeBERpqFgLSCeGXVSArZY3wO+6c3NvLyJFmMrZ5LTdapPGjowOns/br
	 /9OjdVF+NW7pwbKvlZSPHRfeJFNm4YooDvmf6MVsH1biZKzm3Uh193l7KYi6GTbUqa
	 ux+LpFR7/ApWvdPLe2qxIxPyM+tIDQp8tvsJgcMPWioZOrUhxde1TX7puX9hlGD7rs
	 1tPLgguHKnBCQ==
Date: Mon, 16 Feb 2026 11:44:14 +0100
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
Subject: Re: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
Message-ID: <20260216-vigilant-resourceful-coati-32baed@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="xzldcocj7z527ets"
Content-Disposition: inline
In-Reply-To: <20260213-v3d-power-management-v5-2-7a8b381eb379@igalia.com>


--xzldcocj7z527ets
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/7] clk: bcm: rpi: Add a comment about
 RPI_FIRMWARE_SET_CLOCK_STATE behavior
MIME-Version: 1.0

Hi,

On Fri, Feb 13, 2026 at 03:52:55PM -0300, Ma=EDra Canal wrote:
> On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> actually power off the clock. Document this behavior so that clock
> consumers understand they may need to set the rate to minimum before
> disabling for meaningful power savings.
>=20
> Suggested-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>
> ---
>  drivers/clk/bcm/clk-raspberrypi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-rasp=
berrypi.c
> index 9783385d5859836898683209e320fcc928dfdc71..2e63121af0900ac9b4874b666=
cf6d02baa8be11c 100644
> --- a/drivers/clk/bcm/clk-raspberrypi.c
> +++ b/drivers/clk/bcm/clk-raspberrypi.c
> @@ -308,6 +308,12 @@ static void raspberrypi_fw_unprepare(struct clk_hw *=
hw)
>  	u32 state =3D 0;
>  	int ret;
> =20
> +	/*
> +	 * On some firmware versions, RPI_FIRMWARE_SET_CLOCK_STATE doesn't
> +	 * actually power off the clock. To achieve meaningful power consumption
> +	 * reduction, consumers need to set the clock rate to minimum before
> +	 * disabling it.
> +	 */
>  	ret =3D raspberrypi_clock_property(rpi->firmware, data,
>  					 RPI_FIRMWARE_SET_CLOCK_STATE, &state);
>  	if (ret)

This creates a pretty weird hole in the abstraction layer and clock API.
Like, if you set the minimum rate, unprepare the clock, and then put the
clock handle, the minimum is not there anymore and you don't have that
guarantee anymore.

I don't think we ever nailed the semantics of what happens to the clock
range once the clock is disabled. And if we do, it's not because a clock
consumer disables and clock that it's actually disabled.

Couldn't we turn it backward and always set the ideal minimum firmware
rate before disabling the clock (possibly by checking the firmware
version first) ?

Maxime

--xzldcocj7z527ets
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZL09QAKCRAnX84Zoj2+
djAVAX9Q18LM3+xl6lnztiRizzCV0M1hYddMtP85RAk7fw/L5yDk+YQhTBRCMnwk
ZknIze0Bf2qnOyS9bBuPn/Kb6JyP4n0xHs0o7sS9KDjZ1ZKMguDNgmRaXmc/AHXs
oaQUSyfJ2g==
=kbtw
-----END PGP SIGNATURE-----

--xzldcocj7z527ets--
