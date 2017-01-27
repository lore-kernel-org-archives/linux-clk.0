Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 27 Jan 2017 11:03:56 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 1/2] clk: sunxi-ng: Call divider_round_rate if we only
 have a single parent
Message-ID: <20170127100356.leltnpslzjuhzjwc@lukather>
References: <53c56d23af099d8a41460d5ac59a2c792c8d050c.1485250845.git-series.maxime.ripard@free-electrons.com>
 <20170127001250.GQ8801@codeaurora.org>
 <CAGb2v67pdKYW5jaa1jA5+QbEV50iPNt-9Z7MNE90P+vUYVocNQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xurnmgrfy3hrd2jn"
In-Reply-To: <CAGb2v67pdKYW5jaa1jA5+QbEV50iPNt-9Z7MNE90P+vUYVocNQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--xurnmgrfy3hrd2jn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 27, 2017 at 11:30:05AM +0800, Chen-Yu Tsai wrote:
> On Fri, Jan 27, 2017 at 8:12 AM, Stephen Boyd <sboyd@codeaurora.org> wrot=
e:
> > On 01/24, Maxime Ripard wrote:
> >> The divider_get_val function that is used in our determine_rate callba=
ck
> >> doesn't try to change the parent rate at all, while clk_divider_bestdi=
v,
> >> used in divider_round_rate, does.
> >>
> >> If we have a single parent, call divider_round_rate.
>=20
> I guess my "clk: sunxi-ng: mux: Get closest parent rate possible with
> CLK_SET_RATE_PARENT" patch somewhat takes care of the multi-parent
> case?

It looks like it does yes :)

> Still, the underlying clock type doesn't get to specify what
> is considers to be the best parent rate.
>=20
> >> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> ---
> >
> > Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Merged the two patches with Stephen and your Acked-bY.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--xurnmgrfy3hrd2jn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYixsIAAoJEBx+YmzsjxAgivsP/R68wTmTD3v+hvDtV+CJQJh7
vRXHtHOcVWEG154Qt4X3gqts3YvAx4ySBjjnNpPDZd4azL4LCjORn2TQoDuu8c7H
rcV30JddrwseLoYhPBL6SrUifoPWyi6VaQbugfznCA+oLBcZLcnSMPARYV4n3NEH
J5eY6LdvWxFkGDD89SlccwV6x6RWMw74aqNIA1nCNxT+q4yV/YUfPkCLVSENEgb7
9iQ+ZrZo/eBjZHoomEhCjRXN5tUDj3J+vbOgUQOCFbknnviim8hm4NCPX72qBGtl
zjYodbo2UpgoaRNqSNVS2myDLv9JCqwmGLMz7EfAgY5T7sRxxCz+EURZTDLAl1+z
cUVsx5WNcG5MW2g8e7zq3PD5DylRM5MFmf7D/QvDXoLWE4fRcOlEtws4BGi5EQG7
0B50X6C4liQExXcxNs+kOHZMf6g9riUuq6+eyHg+8Lub2cv9JHtGQeFBX+YvsPvy
gQ0yhlmZ091kt0euzlAp6yCz23/5fKxeHpC3qt05OwAsE7w3Z7JdnAfHhLfTjskq
jXm4QIyRGz4wTlkE3IcUCyYvztlXPZU9YFn9eQ0V05FAbtKe45WjmgawncKPoHV2
DGnjEjgl1MgnxlUT1NIgD1xe9Ty/8RYAqpuO4ZSyFeohryqnO8UD/hALCs+QJRq5
kwwh0vlSz5GUo6kxXyMk
=B3hx
-----END PGP SIGNATURE-----

--xurnmgrfy3hrd2jn--
