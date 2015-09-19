Return-Path: <linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org>
Date: Sat, 19 Sep 2015 10:19:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Jim Quinlan <jim2101024@gmail.com>
Subject: Re: [PATCH v2 1/7] clk: Add a basic factor clock
Message-ID: <20150919081919.GA4684@lukather>
References: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
 <1432241646-9511-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64rqRC24wPWz5xYZv=w2QAtsCb-pd76Qynkb5NBCptXhQ@mail.gmail.com>
 <20150523074930.GI8557@lukather> <20150724000001.642.84690@quantum>
 <20150724065017.GJ2373@lukather>
MIME-Version: 1.0
In-Reply-To: <20150724065017.GJ2373@lukather>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Chen-Yu Tsai <wens@csie.org>, Michael Turquette <mturquette@baylibre.com>,
 "Stephen Boyd <sboyd@codeaurora.org>, Emilio Lopez <emilio@elopez.com.ar>,
 Hans de Goede <hdegoede@redhat.com>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============2680033303356597986=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=linaro.org@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2680033303356597986==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UIrAl4r1g2eOkvhC"
Content-Disposition: inline


--UIrAl4r1g2eOkvhC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Jim,

On Fri, Jul 24, 2015 at 08:50:17AM +0200, Maxime Ripard wrote:
> > Jim Quinlan submitted a similar patch. See here:
> >=20
> > http://www.spinics.net/lists/linux-clk/msg00691.html
>=20
> It looks very similar indeed.
>=20
> > I nacked that patch because Stephen and I are trying to figure out how
> > the basic clock types should work going forward. Code reuse is good, but
> > they are not very maintainable.
>=20
> What are the issues with maintaining them? The only drawback I'm
> seeing with introducing such a driver is that you can't really have a
> clock that is both a divider and a multiplier, but that can be solved
> by splitting it into two sub-clocks.
>=20
> From a pure maintainance point of view, refusing it would mean that
> each and every platform would have to come up with its own
> implementation. For example, we do have clk-factors.c for sunxi that
> does just that, and implies some cooperation from each clock driver
> that have to provide some code to determine the various components of
> the output formula. This can prove to be very challenging (and bug
> prone) for clocks like the audio one we have where we have 1
> multiplier and 2 dividers that needs some adjusting.
>=20
> Splitting it into sub-clocks for each of these components would allow
> to have less bugs, while keeping the whole thing very simple, and the
> implementation on the driver side very trivial.
>=20
> Overall, the clk-factors code we have (client side) is approximately a
> thousand lines of code logic that could be replaced by (less) trivial
> probing code for such a driver.
>=20
> > Since there are two potential users of this code, I should reconsider.
>=20
> Like I said, eventually, I'd like to leverage that code a lot more
> than for the single clock alone, and I think it could benefit other
> platforms too (like Jim has proven).
>=20
> > Can you two come up with a common implementation that works for both of
> > you?
>=20
> Yes, sure. Jim, how do you want to go with this? Do you want to
> resubmit your patch on top of 4.2-rc something so that I could give it
> a try? Otherwise, I posted such a patch this week
>=20
> https://lkml.kernel.org/r/1437235304-2208-1-git-send-email-maxime.ripard@=
free-electrons.com
>=20
> Can you give it a try and your feedback?

Ping?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UIrAl4r1g2eOkvhC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJV/RqHAAoJEBx+YmzsjxAgRMEQAKfvTd6jrbrtOJZrtaCngVM6
guaEyWvcAWvYuxyXOF4RwXTAG9IS6NgHaFK90dqPtZCHNA7ARlozVyu2SZMkvkbz
4yOqV4DX8L16GISpxVYj7bZ+HjmE8JEjUprLAv22cIGNEuLF8IIwgCWkUUjbCDWB
NA32NRGt2yj6Ge7IhSHqcQPzoW4Pdjdj52iIPdaHtg1A09lE8ciEETm2GiEt6t3o
qyOESXXcVHlXwkjytiB0mPBPLkVZpSgm7Saqa+wOso/cH1ThN+bGTzMi7W48prJZ
nGKCfx2REKXuBRJDGCEKMjxUXuJ3Wh6a6z31uz0K618znLwT6tkD8A+c06E/J2fE
pQwzGl3VOWgU9xEO/0arxM47l0Ez9pHlGKU2zz4t6LrCgLRIaVrVsIq0zuRhf4Dr
IyGmPKbgyOcPttIaanqesZRbV7ps5hHM07A5dPZVXXvFmyt0mQJaywGukYS04/5n
TSofeVV+nDYWFGrIMiSaC8Bm7etlpqOZ1XL/MXivm0PjdEvOa+bTTqLdzlzmdRBj
CExWcBJOBX21jBzpzPDG4e+O9b1XKpzzz7djINCU93pGZULdtq04FyvJ16WPErWk
cFsQ+pQ/TisixNXHfRBOJkfFOD3GI0500fv2Qukw/MOiRT/6XOrZKQp9j4CZn6I8
O6v9ZzxyMHOu5XRjJhjb
=vMW5
-----END PGP SIGNATURE-----

--UIrAl4r1g2eOkvhC--


--===============2680033303356597986==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2680033303356597986==--
