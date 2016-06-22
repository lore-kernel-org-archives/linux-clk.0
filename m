Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 22 Jun 2016 12:02:06 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mark Brown <broonie@kernel.org>, Lee Jones <lee.jones@linaro.org>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Ian Campbell <ijc+devicetree@hellion.org.uk>,
	Kumar Gala <galak@codeaurora.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, rtc-linux@googlegroups.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 5/8] rtc: ac100: Add clk output support
Message-ID: <20160622100206.GV26668@lukather>
References: <1466391138-12862-1-git-send-email-wens@csie.org>
 <1466391138-12862-6-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="buDNgeHiu+HCsDEc"
In-Reply-To: <1466391138-12862-6-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--buDNgeHiu+HCsDEc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jun 20, 2016 at 10:52:15AM +0800, Chen-Yu Tsai wrote:
> +	/*
> +	 * The ADDA 4 MHz clock is from the codec side of the AC100,
> +	 * which is likely a different power domain. However, boards
> +	 * always have both sides powered on, so it is impossible to
> +	 * test this.
> +	 */

If that ADDA clock is exposed by the codec, why are you putting it in
the RTC?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--buDNgeHiu+HCsDEc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXamIeAAoJEBx+YmzsjxAgep8QALb4QiyE0axUbD8L9KkpG7V0
dOsu/m7Qg+xvaQRGz5AUkytzp3EggzTyyaDQdwL9FaPQEzkxsq275QRu81jfcW28
pYi02XaSUpvAeMIlcAil4xKRzR9M7pWrL8/d/GBwMn/5Znw4nc2cosR4iwfMOH6i
aKSw9pJYjWRqqjaT6QZn+iny3v+diTETG4IAcPqBnljpXCuUHjYYEOJS+PNLYQvL
c09lui5fc9t7ZLIJgQsrJ7hSiNu5XL/qErRWNYxXQqwX4QJnURRW0S+q4z0wysWT
+Z77rMsKo6KKRqDDJRlnVtYwTiyrXnWgCKKI8m23e21biTdCEC1mKdDZciX26v2F
TgTo5+htGKknjpo5qeg+qukL+8aK0kHnLLSaHRLtXScIXYQEMFcY74+RlNcsnNPM
tMQSXcKbGm3HvLediuU4ldUGwQblu6aIDNBPcnetDGH1ehh/ocIfuCH2YSiBQF0g
Po8Yybgn4+kcpIjwIHoWEF4WvjeWY+EbX0/LuSbwl/L6CwzFe2u9HKK76rqPWwlp
E6uG57uWFFzwXtvMem9PKsC8McUU9571GYlSCUxN5ThmhH+cmbeshwN5U5RA7otp
RewA+kwqB0JYzzVdj89gFbaYfIcaXM93uImBinkoCxWMpLxHdtQ9EIcumTcO8zjg
Tuc3OrdLvJzf9H8ybHdv
=Z3pe
-----END PGP SIGNATURE-----

--buDNgeHiu+HCsDEc--
