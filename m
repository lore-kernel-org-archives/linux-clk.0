Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Phil Elwell <phil@raspberrypi.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Stefan Wahren <stefan.wahren@i2se.com>, Florian Fainelli <f.fainelli@gmail.com>, linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: bcm2835: Limit PCM clock to OSC and PLLD_PER
In-Reply-To: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
References: <866b60bb-d1c8-726e-3a2d-11a34f9e8ac7@raspberrypi.org>
Date: Wed, 31 May 2017 14:24:26 -0700
Message-ID: <87efv4btyt.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Phil Elwell <phil@raspberrypi.org> writes:

> Restrict clock sources for the PCM peripheral to the oscillator and
> PLLD_PER because other source may have varying rates or be switched off.
> Prevent other sources from being selected by replacing their names in
> the list of potential parents with dummy entries (entry index is
> significant).

I might be up for giving my r-b on this, but first I'd like to check if
we can simplify even more.  Looking through this list:

static const char *const bcm2835_clock_per_parents[] = {
	"gnd",
	"xosc",
	"testdebug0",
	"testdebug1",
	"plla_per",
	"pllc_per",
	"plld_per",
	"pllh_aux",
};

PLLA is off and unused and we don't want any peripheral to turn it on
(unless we wanted PCM to do so, but we aren't doing that here).

PLLC's rate gets changed by the VPU and so it isn't reliable.
67615c588a059b731df9d019edc3c561d8006ec9 made it so that nobody uses it
that isn't using it by firmware setup, and EMMC is the only one that the
firmware is having use PLLC.  Would we be better off just having EMMC
always be on PLLD?  Or, we could special-case EMMC to be the only one to
use PLLC.

PLLD is stable.

PLLH should only be used as a parent by VEC (or HSM, assuming that
drm/vc4 rate-sets PLLH_PIX first, but I don't know of a reason for HSM
to not just be fractionally divided off of PLLD).  If you've got
firmware display in use, it may change rate or be disabled behind
Linux's back, so we don't want anything but Linux-controlled VEC to use
it.  We could special-case VEC to be the only one that had PLLH_AUX as
parent.

So, my proposal would be to basically make everything but VEC and maybe
EMMC use your new list, and drop the code in
67615c588a059b731df9d019edc3c561d8006ec9.  That said, if you want to do
this first for PCM and then extend it to the rest of the clock
consumers, I'm fine with that.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlkvNIoACgkQtdYpNtH8
nug6QA//cbShLjzSXXObEiu2SuNkBGqOpRq+yY1x9L9QV0lSGwCCi7kK+StYXwe0
y61RBfEC3LVr4dXn43gTVbvArDqmo8htOEACwqiYfiWfs2WskINPEnXRgQDSht28
1NUETjco3npS9z6XMHPmYIJlflcGcL1H8h61XRsoF5KpTTKF4jE9FP3eNjUFqufD
RbonXHGYc8xW8lAcjBXFu9OGaCFYqLXCIYoe/JqPJJFfhoJ6zpUx8JZC+aLRc3A3
19+MAF8YqKg+nQnruMdEnD2TUNVHw39PVoONuREgnffJiayf3c064AuEgnwt0Xxq
CKkKCffbON6knprLfbZxsj07jCxwiEn4jtIRYEeKj3J7xRJviR8I+cQb9y1qlPiM
JbE9DSyJDHEnS9iNcswcXVHNGRRJGLY0CPdW9yjiCoZdPKD37SNNf2fsXo8VgoPu
UglsCNnmAQY3mOYu/Fla/USJIRu6vx61y1h1Tjn2JNSGefq5gqnCx8bzPNR1eh8B
v8my6yRMyEzBqdZlBENws7jDkpQg1TERogIUW4BlBJNlNffcuL7fdLLELrX1F1l2
yd71Djgm7MURZC5uz2y72jzxFcfVGOXzMH1ndeh/3yxZgxvhlzna4tzQMwumQOIq
q41+iAhwKRYXVxdLDBvxKNqy/5QgV9mmNAczdK+JoTqKBhsbby4=
=g/Nb
-----END PGP SIGNATURE-----
--=-=-=--
