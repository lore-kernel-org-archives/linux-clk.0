Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 22 Sep 2015 16:04:24 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [linux-sunxi] Re: [PATCH 5/5] ARM: sun5i: Add C.H.I.P DTS
Message-ID: <20150922140424.GA4684@lukather>
References: <1442566130-3497-1-git-send-email-maxime.ripard@free-electrons.com>
 <1442566130-3497-6-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64E-gQu1U_qi2fTWiCmfgMdMR4X6yLUerV21d3E1uQ1cw@mail.gmail.com>
 <20150922124708.GZ4684@lukather>
 <CAGb2v662+mhFgv1DXz5muA+xGE99R1DVKOxtVPvJmc+tRFPXzQ@mail.gmail.com>
 <56015146.2070509@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mqHBVT07r4ObqsKY"
In-Reply-To: <56015146.2070509@redhat.com>
List-ID: <linux-clk.vger.kernel.org>


--mqHBVT07r4ObqsKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2015 at 03:01:58PM +0200, Hans de Goede wrote:
> >In short, this is not about "power supply" but VBUS detection. IIRC,
> >if no VBUS detection method is provided, the phy driver just waits a
> >period of time after an ID pin change and then considers VBUS invalid.
>=20
> Right, but that is a hack for boards with no / broken vbus detection
> (or vbus control), we really want to use vbus-det where available,
> so I agree that a TODO comment here would be good.

What's so special in our SoCs that makes that we can't just rely on
the ID pin ? (which seems to be working just fine here)

Other SoCs don't need to rely on such a hack as well.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--mqHBVT07r4ObqsKY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWAV/oAAoJEBx+YmzsjxAgL1wQAJhvuHyw3ueoDBogjq3RP0xI
19UwDGKDF8eqf2gOsAsXbktnP6DzVIJJJ4JncJad/Xp10lOeyJ6G42IfMkyVjokX
S+sWNANlQlMdKu+hJv1F6FNZBzL816GUQc8w2dRaMAbCDnW8KypBvliPDLwFzIpM
G0KZHmmcYBsGmbzL/Fk4ik3ovBODNnPl6bxngW8sh/yb8ZwkhwZnDTRUGbZTvfTN
BlEVsjBPvRLys0KPVAtM8gk8TNOwTouWh7xPjr1/RLNAJn4wuDj8heCLmMjlbncf
HhyI1BGVA05BXrbKBFRvl/sr9PlpfMRCasqlTLcRp7+rsTEE6W8TVVafyjslE3n8
CuYVHFn2tISA5lT4RZvVGlOOhZtcbM33Mp3VW/q9TMHJP5mi3M5zYxqyxEPaCS3u
KmJ0xD7WvJL7W15M/BGPaCYfcoMz1quyhNV5X9AMq2R5klx7CokGs7jIAqu3HxGY
QK+9uN9zHtzBivrS1yH1DnvfnO/ejCSCHN/QyMTt8XtgSRj6QgwnyMnqCMq5bMU9
79Q3EmrXyOUtRcVUHKnFMdJBKMFAz6IlZyPVl+sB+4Mg2verwMFo65N+YG47Z2Co
Mhn2pCJCxtweGGCWVsBd9slWPx/ppQyp8shMgG1ex/ISeU3+FBGpoDCorxPaF0K8
AIOMpYL0hCkzc4SCqPxw
=qaBp
-----END PGP SIGNATURE-----

--mqHBVT07r4ObqsKY--
