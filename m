Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42197 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932407AbdJQOhN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Oct 2017 10:37:13 -0400
Date: Tue, 17 Oct 2017 16:37:11 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Priit Laes <plaes@plaes.org>, Icenowy Zheng <icenowy@aosc.io>,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Quentin Schulz <quentin.schulz@free-electrons.com>,
        Mylene Josserand <mylene.josserand@free-electrons.com>
Subject: Re: [PATCH 04/23] drm/sun4i: tcon: Make tcon_get_clk_delay mode
 argument const
Message-ID: <20171017143711.intnpnenslwqyktr@flea.lan>
References: <cover.fe3d65d1ee05a55224d26e7d113388c428592b26.1508231063.git-series.maxime.ripard@free-electrons.com>
 <e6f92f126640aa6de639386f9b4677db3d8bb37b.1508231063.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v65BNixB8evAqk-7uRKL=OuRW2aa+4gNedz5CdXEBoFACw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="rj4pgjrnyvanp2up"
In-Reply-To: <CAGb2v65BNixB8evAqk-7uRKL=OuRW2aa+4gNedz5CdXEBoFACw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--rj4pgjrnyvanp2up
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 17, 2017 at 05:22:03PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 17, 2017 at 5:06 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > The drm_display_mode pointer can be mark const, so let's do it.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--rj4pgjrnyvanp2up
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZ5hWXAAoJEBx+YmzsjxAg4CEP/jrQBE+Ql/fyaCA8ilMUxXra
p1i+1KBNfHNw3YBRw65xIKbzu7ulyfCbEC/NpaEsljlxIoBd27521N7k39HKGXBy
31HAUVOxFtR7PCJeI50Y4RvUaIPuEEJMLdYbG+LU1KGWtoXRnpUcHCqnSHTE6oc4
ls/jBezRjlzBONeFfCVnjBC9gJdA2kIyUtSKD7zQCFm7zLEmOgXYkq2sL14XhCNh
hC5s8DniRQ1UnSS/JOKANjPClbQyXV0V1NFJ+edd2cV+OR7kn8rTj33uxw3F1tZV
f1sHsKCdJ2p0Hotr5LPv9kuu/v+CzOkzXub5k0k9IShTW2yfIb8mhe/g9ZXUJ1v9
mGkncke6O8CntU6FBB1/nub9qVPi/llyKo8frkHjNsFJdpTslWpKLGt7IdNAqXGN
4lo0kWh2EbroHDeYV7TrAwmaUXvoXCPjMjOvbIzSyJW858t0gbgJkeYfbMeh4Eig
IuZj8RKns765iEXwsSlqJsWpECUErcfMESUApW+x34f6uaKEdEiRiL69aY3Cr5F6
b21XLnuvvPBegEc/YLa+/1C7tVywP8Zf10sqEjF/Pbpe52YY7DlkScaXzyJOfYoX
lCDmkC9TwGySGSkAGSdeV2NVisY/351IMmD4AAoHVN7n8wfGgmuS9t5MKYWkDtzn
ggldEvcnANdYwACZo71U
=QpBM
-----END PGP SIGNATURE-----

--rj4pgjrnyvanp2up--
