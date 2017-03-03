Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailapp01.imgtec.com ([195.59.15.196]:58571 "EHLO
        imgpgp01.kl.imgtec.org" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1752064AbdCCXXy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Mar 2017 18:23:54 -0500
Date: Fri, 3 Mar 2017 23:23:05 +0000
From: James Hogan <james.hogan@imgtec.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Heiko Stuebner <heiko@sntech.de>, Jason Uy <jason.uy@broadcom.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Kefeng Wang <wangkefeng.wang@huawei.com>,
        Noam Camus <noamc@ezchip.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wang Hongcheng <annie.wang@amd.com>,
        <linux-serial@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Linux MIPS Mailing List <linux-mips@linux-mips.org>,
        David Daney <david.daney@cavium.com>,
        Russell King <linux@armlinux.org.uk>,
        <linux-clk@vger.kernel.org>, Viresh Kumar <viresh.kumar@st.com>
Subject: Re: [PATCH v2 1/1] serial: 8250_dw: Allow hardware flow control to
 be used
Message-ID: <20170303232305.GU996@jhogan-linux.le.imgtec.org>
References: <1484164100-9805-1-git-send-email-jason.uy@broadcom.com>
 <1484164100-9805-2-git-send-email-jason.uy@broadcom.com>
 <CAAG0J9-n0toSJL8Ze8Esq81dYnpfrTd42bMiR94zw_btBLjsww@mail.gmail.com>
 <1488394220.20145.68.camel@linux.intel.com>
 <20170303002129.GS996@jhogan-linux.le.imgtec.org>
 <1488547866.20145.74.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="eu12+zRL7gQwOC+E"
In-Reply-To: <1488547866.20145.74.camel@linux.intel.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

--eu12+zRL7gQwOC+E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 03, 2017 at 03:31:06PM +0200, Andy Shevchenko wrote:
> On Fri, 2017-03-03 at 00:21 +0000, James Hogan wrote:
> > The CONFIG_HAVE_CLK=3Dn implementation of devm_clk_get() in particular
> > seems highly questionable to me, given that commit 93abe8e4b13a ("clk:
> > add non CONFIG_HAVE_CLK routines") which added it 5 years ago says:
> >=20
> > > These calls will return error for platforms that don't select
> > > HAVE_CLK
> >=20
> > And NULL isn't an error in this API.
>=20
> Which is okay. I dunno what should be returned from clk_round_rate() if
> clk is NULL. I would fix CLK framework, though I would like to gather
> more details.

Hmm, the common clock framwork is just one implementation of the clock
API that won't use NULL as a valid clock handle. HAVE_CLK=3Dn is just
another implementation that does return NULL as a valid value, and
accepts that value in the other clk functions.

> Btw, I hope you also noticed this one:
>=20
> http://www.spinics.net/lists/linux-serial/msg25314.html

Interesting.

Following Russel's past advise[1], the following patch on top of Heiko's
patch also fixes things for me on Octeon:

[1] https://lists.gt.net/linux/kernel/2102623

If thats an acceptable fix I'll post it properly. Thoughts?

Cheers
James

diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/8250/82=
50_dw.c
index 223ac234ddb2..e65808c482f1 100644
--- a/drivers/tty/serial/8250/8250_dw.c
+++ b/drivers/tty/serial/8250/8250_dw.c
@@ -267,6 +267,8 @@ static void dw8250_set_termios(struct uart_port *p, str=
uct ktermios *termios,
 	rate =3D clk_round_rate(d->clk, baud * 16);
 	if (rate < 0)
 		ret =3D rate;
+	else if (rate =3D=3D 0)
+		ret =3D -ENOENT;
 	else
 		ret =3D clk_set_rate(d->clk, rate);
 	clk_prepare_enable(d->clk);

--eu12+zRL7gQwOC+E
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYufrZAAoJEGwLaZPeOHZ6dsIQAJ956pbafQjyZZoAJCoVVwY1
eahyEn46RIgiTsgmDIypoJrHQ58yHm4vOzZ+6/RGJFT5HK1mcUfjLTzjylj/RrVN
cANvUCA3ctGQZeb0A5CXEwLyauqXnPF0r0BMSWdXSVH+iiHeQpWXhQWFDxEPy5E3
hYwy4KTU28EJADvRKN/aGJ0gqhGkYjGSNvNWRqaCoDhkoUb5VTSGz9Rl40uPHeIw
U11lVqMBk8BYaya9wQtXRTgLiNQ7JVqvIJ5ysmqPYbgC7O1KbAlbp1WboFokTllR
git98A8q9pSF8uWZ021GuNcUMsc8HAaL+ccTotRS81R3uEML7kXhvDzupIu6jm/P
36NnsQAmDgtaTOCEpBgDxbhwFJkWGR4e2dtrS1Lsz1ql8CALTIxThCuvylfHP0SZ
smopP0TC1A7uk7TaRv9u7y5IUOz+8eY17NhKyiFWc6NU1etNMDjYFuBSfBgAsB+O
0a6soaGYiHKvZehtKBxOPX1Jgnt5Z1uCyWFdNkHhTKK41SKY32q7lj7qXlafnBg4
rEUv3tYe6AscM89dU76Q1nohjQEMuzlCKnEPFKVrt0UbmWZj3gb1dH1SYq5uqBV7
fZ2CM+K+2GtYfc2sprtK81YPqkr9YbSFSkRrmyXvYdv6CWGSQm6ev1kT37rw5ikR
GPLTYOWTsxHeZQp2t5Gu
=uYM0
-----END PGP SIGNATURE-----

--eu12+zRL7gQwOC+E--
