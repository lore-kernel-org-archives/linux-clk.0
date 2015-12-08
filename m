Return-Path: <anholt@eliezer.anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Remi Pommarel <repk@triplefau.lt>, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Rob Herring <robh+dt@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Remi Pommarel <repk@triplefau.lt>
Subject: Re: [PATCH v3 2/4] clk: bcm2835: Support for clock parent selection
In-Reply-To: <1449418969-5565-3-git-send-email-repk@triplefau.lt>
References: <1449418969-5565-1-git-send-email-repk@triplefau.lt> <1449418969-5565-3-git-send-email-repk@triplefau.lt>
Date: Mon, 07 Dec 2015 17:32:04 -0800
Message-ID: <876109d8tn.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Remi Pommarel <repk@triplefau.lt> writes:

> Some bcm2835 clocks used by hardware (like "PWM" or "H264") can have multiple
> parent clocks. These clocks divide the rate of a parent which can be selected by
> setting the proper bits in the clock control register.
>
> Previously all these parents where handled by a mux clock. But a mux clock
> cannot be used because updating clock control register to select parent needs a
> password to be xor'd with the parent index.
>
> This patch get rid of mux clock and make these clocks handle their own parent,
> allowing them to select the one to use.

I see, you use the new flag now in this patch.  I take back the comment
on the previous patch.

Patches 1-3 are:

Reviewed-by: Eric Anholt <eric@anholt.net>

and I think they're ready to go in the clock tree, even while the DT for
setting up the bcm2835-pwm driver is being reviewed on the DT list.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJWZjMVAAoJELXWKTbR/J7os6kP/iRj62obZL4cYhW5sYW+h/Wg
R2fJlnlurA6FmgO1qUskPl9L3Kcsz3lmrH/JPjbnMgEMJTmap2KkZsNZ9mToAAWX
0Q7GJ802H0OAhWXEzlu00XNEQAWwGW29LqsUaJcW0ezGsPLJH9Mpv6tMWzmGsOw8
/hB4CDtUXrQjLBaGMgfTP4T43AdUgprASQBec7ZA5uSlQEx6oQKqMn/z5qnLk1b5
VDOCZK3CAFsZ5ltS8CHReTAGwo6T5/GrVAyPBVYdmUNQ6B/3BzBF0A43fJ1QAtbi
/u52ca3kS/RJVJynuYu2kbwk2iZ6xmQmESnPCuEVNBnVpgFTx3tn98zsjt93Cxb4
k2YXyykrPGuQt6qDISjih2KIGDgy5GZ3bsTN7sJMrzYkNZ0veIXB3hOBbhikp7pN
K60x0BHuPOFUeHyLfRoXJWIjtzSe8fy5AFOb/HYXlVMsnQJu0Yj6cabb2H16LDRY
JenUdAbeiMYij4yEfNDkVRYmza5J8psRPxIYUV+qx233xYpvGL98oIdz/hFhtziT
0V9q/geQYCA7Y2eyFZVQx4oMby+tzvP+EtOaH601S8jjwZme/yhdtMUBJXPD3Ch5
kPsiu1fS2qPkEhGQCJPu/Ib5PyDpsAPO5OL56BG/qe1vxYL3SoVMBdD+4xEVGydG
IBl+RPf03tI2MdWwengP
=HcT0
-----END PGP SIGNATURE-----
--=-=-=--
