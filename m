Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE552DB7A9
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 10:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771239200; cv=none; b=H8J4N9cGHa9M8NIle40btqZUhagD6z8NxYFIkULBbNNPZRANRWBqCc+1cMg4JziiqQX752Yb7ipSNZnLItg/848PdTnFFSFLkiLcE8L2WIF8A1sFSF19irJ5fXZncLgrSyiO8vFVtXmGrad3OE/jxke+JLca7tpwyujXVLiTUOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771239200; c=relaxed/simple;
	bh=73r6oJYAaTQYUPIRlcSqiRsKUT5t9iC1ySrVJ3cv2PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=baXlzMk+LbaRm24928oY444mBmgmmzrAtf/ILmTbuSiX5iMDDBwJq+BM/YU2GWJ8XCaG8epSRTKWnPwWc6fPWnjfQrtUIfrQA/mzpw7xYgdC66fx5stA1xl7VH7Vyy+nzPY+6Lgky5RyIGPStyedh9eksXKUudgGXHt89TzTtQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjIK17Wm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjIK17Wm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED90C116C6;
	Mon, 16 Feb 2026 10:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771239199;
	bh=73r6oJYAaTQYUPIRlcSqiRsKUT5t9iC1ySrVJ3cv2PA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OjIK17WmA0PJWl07PJBGiRBzUlffMMg2xOvZiE5oM0n6kc2Vd+/BhKjlBy700yag3
	 YKu3VHDVat4mK4p4XdZOeznRaw3ZDdBlWmCqn85Vso3REjKwvDAdV9ndz3yjccgNJB
	 CjSZh/dQj8kZiwSbwL7VhfyuN22WR0R5pbG5T9k8+xFTh/HtevsNdrGLFNLsxnnORl
	 GVM1WC6D9Klv0Ho2RCijaUoFH3DJ19vJO0W1zBnl6n7JqckbMh3PVT+NoSXw5BBIn2
	 X4Jp+/E72Gi7RxPth6eC8AoYL/FjM4IaJX6uoR5UDo7ptvBHtGml1T08DXaM5ihisa
	 /pVQzuZlUCWvg==
Date: Mon, 16 Feb 2026 11:53:16 +0100
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
Message-ID: <20260216-brave-ara-of-typhoon-cf90ba@houat>
References: <20260213-v3d-power-management-v5-0-7a8b381eb379@igalia.com>
 <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="7u5coffnzyskofrz"
Content-Disposition: inline
In-Reply-To: <20260213-v3d-power-management-v5-3-7a8b381eb379@igalia.com>


--7u5coffnzyskofrz
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/7] clk: bcm: rpi: Mark PIXEL_CLK and HEVC_CLK as
 CLK_IGNORE_UNUSED
MIME-Version: 1.0

Hi,

On Fri, Feb 13, 2026 at 03:52:56PM -0300, Ma=EDra Canal wrote:
> If PIXEL_CLK or HEVC_CLK is disabled during boot, the firmware will skip
> HSM initialization, which would result in a bus lockup. However, those
> clocks are consumed by drivers (vc4 and HEVC decoder drivers,
> respectively), which means that they can be enabled/disabled by the
> drivers.
>=20
> Mark those clocks as CLK_IGNORE_UNUSED to allow them to be disabled by
> drivers when appropriate.
>=20
> Acked-by: Melissa Wen <mwen@igalia.com>
> Signed-off-by: Ma=EDra Canal <mcanal@igalia.com>

It looks like sync_state would be a better candidate to handle this?

Maxime

--7u5coffnzyskofrz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaZL3HAAKCRAnX84Zoj2+
dohuAYC0vDJ/FuiU+oa1la5DCBEUlwydHTREfOq8Kpked+NeLcX1cm7K6HxdBWAK
w8XBDiYBgPoI8xNj91inpm/hk0GtF3FcEv28ZHvBeTOznX63UWUs6ba5A4/AOq9z
JpUmgE0Glg==
=awDT
-----END PGP SIGNATURE-----

--7u5coffnzyskofrz--
