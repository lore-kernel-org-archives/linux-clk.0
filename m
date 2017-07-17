Return-Path: <wsa@the-dreams.de>
Date: Mon, 17 Jul 2017 12:25:24 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: clk: renesas: rcar-gen3: Fix error return code in
 cpg_sd_clock_recalc_rate
Message-ID: <20170717102524.vk2qdpjmzmyplknx@ninjato>
References: <1492624001-3758-13-git-send-email-ykaneko0929@gmail.com>
 <20170714142559.p6xp6dp4whlqcr5n@ninjato>
 <CAMuHMdV0fLG6m5hdyMpeKxb1nz_L+xEmyjvZV0iotXMSK517zw@mail.gmail.com>
 <20170717091801.GA2129@katana>
 <CAMuHMdVhuN1ozEmtDJnn63rvktE7Aj4FACzweaJzCMzP1q8BKw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s7rxevo65pchyjnj"
In-Reply-To: <CAMuHMdVhuN1ozEmtDJnn63rvktE7Aj4FACzweaJzCMzP1q8BKw@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--s7rxevo65pchyjnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I do not mean that -EINVAL is correct. Obviously it isn't. But blindly
> replacing -EINVAL by zero may not be the right solution neither.

Okay, it may not be perfect but it is definately better :)


--s7rxevo65pchyjnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAllskJAACgkQFA3kzBSg
KbaG3xAAr2dRfq93nv17LfqR5MCDeQiqk7JpQXFWIGPk+cWt6vkT3DUCbV3Q1Ack
pA6M+AF7wNH94w7XSJ2R2wtZW5FDk1KSwNXnPO1NiqFp1yrsIC8b8iZ1HHNZfiVc
VQjdrb89qykUEuF9YHLSUrH2CpIUuceHrbFzXycwIHMRNhcOicwHXGjscKVA99OD
r4sd7VVf3mDcVcYKi8peFStRNLe2ZYAKpRres/fJDjSC+iDbg0aquv/qpjmZms0T
+2u/t5NrgZT35s/5zVoKQIZKXKruARrdzVuRwzZRXd16oT2eCTdwn/lJtYUJNCLt
Ugqwr3k1cklJFxCYtDjhv9ZmIIcbK0dn/kI8qQVOvk1GLWNsIemZAs3RNqYWhxmc
pWdCgG7Bh3n7XV4gRGXq3m/EGIbGjaloelchtNMuZmVUUqoOgUGgfuNOSAANS4xX
VYtX3GFWJNANQ3l9PCR98C9SHCpG7lEbndBLlcDYNVhv7n3TtqBnMhYXuqZeRQ9T
/Ut/Akf4TD7snIhMmWigDIosoKICvkDqO7jSrS2bZzmfeTU8nb2iwK957KG3+IcX
5I9qiPAxRjCGZdDZFN7bPxT2q17+DbG7vTWWUZGHt+g8VokP3EGPRiamKXRXDcdo
OXagy9X5YUY6EO/TUjJl5xeMN7n+wzb/3pA8WCLAkL690+f/MKc=
=QEoA
-----END PGP SIGNATURE-----

--s7rxevo65pchyjnj--
