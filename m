Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mezzanine.sirena.org.uk ([106.187.55.193]:33856 "EHLO
	mezzanine.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751583AbcDVJly (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2016 05:41:54 -0400
Date: Fri, 22 Apr 2016 10:41:37 +0100
From: Mark Brown <broonie@kernel.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	lee.jones@linaro.org, lgirdwood@gmail.com, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com
Message-ID: <20160422094137.GB3217@sirena.org.uk>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-4-git-send-email-w.egorov@phytec.de>
 <20160421160120.GT3217@sirena.org.uk>
 <5719E8CD.1070304@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0TJQK8JvXJ+EbTps"
In-Reply-To: <5719E8CD.1070304@phytec.de>
Subject: Re: [PATCH v2 3/7] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--0TJQK8JvXJ+EbTps
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 22, 2016 at 11:03:09AM +0200, Wadim Egorov wrote:
> On 21.04.2016 18:01, Mark Brown wrote:

> >> +static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
> >> +{

> > This is fine but is adding a new feature and not part of the refactoring
> > that the changelog talked about so should be in a separate commit.

> This is not really a new feature.
> rk808_set_suspend_voltage() was using regulator_map_voltage_linear_range().
> I have just renamed the function to rk808_set_suspend_voltage_range()
> and added an ops struct for ranges.
> Yes, I have also added rk808_set_suspend_voltage(), but this is just a split
> for the two types of ops that the driver needs now.
> This was needed, because the driver used only linear ranges.
> IMO it should be a part of the refactoring.

If that's the case then split this into multiple refactorings each doing
one change so this can be more easily reviewed.

--0TJQK8JvXJ+EbTps
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGfHQAAoJECTWi3JdVIfQ9PYH/juXorEZfekYWBQuYa0LChNX
KZFbpGU/TXrPqbkGquD536ZzJZTeEKlKta0HlLMz4sMIZX/NyGx60eVHCWzU57rx
Tf2pUhVP7nmOIin//5psLXhgmYp95OUmJTJScNmpSvwaKpcDt9ye4O1xWVr8hjej
CUz88/GaJXKGLTvEg/9F/RMKFoKsiVQQpX2n9UVm2hDqa60dB/BcQah4JPbTOfJ7
G699Bis4ygsbmUDRkCHotb1v0kvjDLpKDEUoPDDiVGksGnPcVV9rQ/1mudv1RSUi
icDvoYg+7HsxTulJPHZJQzEzBzgm5GTqv9YIhvjzNuLiyTjrahVVfVmhrxQrB2A=
=wVTn
-----END PGP SIGNATURE-----

--0TJQK8JvXJ+EbTps--
