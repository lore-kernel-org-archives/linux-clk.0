Return-Path: <maxime.ripard@free-electrons.com>
Date: Sat, 23 May 2015 09:49:30 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@linaro.org>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 1/7] clk: Add a basic factor clock
Message-ID: <20150523074930.GI8557@lukather>
References: <1432241646-9511-1-git-send-email-maxime.ripard@free-electrons.com>
 <1432241646-9511-2-git-send-email-maxime.ripard@free-electrons.com>
 <CAGb2v64rqRC24wPWz5xYZv=w2QAtsCb-pd76Qynkb5NBCptXhQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UlsYxwg8UDQn+EKZ"
In-Reply-To: <CAGb2v64rqRC24wPWz5xYZv=w2QAtsCb-pd76Qynkb5NBCptXhQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--UlsYxwg8UDQn+EKZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 22, 2015 at 12:35:35PM +0800, Chen-Yu Tsai wrote:
> Hi,
>=20
> On Fri, May 22, 2015 at 4:54 AM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some clocks are using a factor component, however, unlike their mux, ga=
te
> > or divider counterpart, these factors don't have a basic clock
> > implementation.
>=20
> I think "multiplier" would be a better name here, considering it is the
> counterpart of "divider". "factor" implies you can multiply and/or divide
> the clock rate.

You're probably right, I didn't though of it that way :)

> Unless of course you plan to add that? :)

Hmmm, no, not really.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--UlsYxwg8UDQn+EKZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJVYDEKAAoJEBx+YmzsjxAg3pUQAKPzK0aQrnQrXDBlBpC2K83G
FXeUdSwnrWHTCwosMKJZw+LFfn6tnGkMjgxZEyGifiZUvmzOugJ15spbkQT/p1pF
Tg/bTVsNGF/cGyM+B2dxvUalcV15SBATtKNc/Hx7CrYnprgTw3ystxMP8afEJz8m
GV9aAX/lJ5FvfX/zZSuprczmJ4zUDrKe5s9Q8tvR2jAuG2d7K2zy84T/VOditssv
kXDa92282o/hRChWfTszoQniJNQm9uE4FToPZS7x3EzO89ETMkxygoxURoBoDFAT
BA7Wh1wBSQwxDsg2lAu+4FTVHXySVZWjM0dK8iuLzv5ZCMZMkEKgvO0kTzkfS9nF
LBskbPXVW2vRQ7snHTkbGZ1BZ9ESLF//TSBlxYsh4T6DChMFvTlPzPWtPfsZIii8
8OS950ZOd/Mukm4V37uqwmQgybB40DAtpDzDP433Fr0J0ke8ttdhzs5lh4ikYWch
gaHqI/MA5AHN/k3TODFL4uqdOEAJgATndvHxeHl/y6fJKAcjgIGcatmMxIn7iM9R
xCZuzg15qh2v0EZiLsi6RqNm1g47tG8yKw+TP9/6BeNt+SSEs+H972kefyDerVMA
mxsgXIsU0D6MHK1YdU6/JOKN/th4Nwe4mMa3CKljYS9EyuFNaV2zoF1V+MZmwniw
cpgRZLWUK6pg6o+7nptd
=hmZa
-----END PGP SIGNATURE-----

--UlsYxwg8UDQn+EKZ--
