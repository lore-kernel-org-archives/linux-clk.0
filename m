Return-Path: <eric@anholt.net>
From: Eric Anholt <eric@anholt.net>
To: Boris Brezillon <boris.brezillon@free-electrons.com>, Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, Stephen Warren <swarren@wwwdotorg.org>, Lee Jones <lee@kernel.org>, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH 1/2] clk: bcm: Support rate change propagation on bcm2835 clocks
In-Reply-To: <1480626020-20031-2-git-send-email-boris.brezillon@free-electrons.com>
References: <1480626020-20031-1-git-send-email-boris.brezillon@free-electrons.com> <1480626020-20031-2-git-send-email-boris.brezillon@free-electrons.com>
Date: Fri, 02 Dec 2016 11:01:09 -0800
Message-ID: <87lgvyf956.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Boris Brezillon <boris.brezillon@free-electrons.com> writes:

> Some peripheral clocks, like the VEC (Video EnCoder) clock need to be set
> to a precise rate (in our case 108MHz). With the current implementation,
> where peripheral clocks are not allowed to forward rate change requests
> to their parents, it is impossible to match this requirement unless the
> bootloader has configured things correctly, or a specific rate has been
> assigned through the DT (with the assigned-clk-rates property).
>
> Add a new field to struct bcm2835_clock_data to specify which parent
> clocks accept rate change propagation, and support set rate propagation
> in bcm2835_clock_determine_rate().
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

A possible simplification would be to limit VEC to only PLLH_AUX, since
that was how the HW designers intended it to be used.  Then you could
just have SET_RATE_PARENT flag, rather than the bitfield.

Still, this seems to be correct and fixes the bug.  Both patches are:

Reviewed-by: Eric Anholt <eric@anholt.net>

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlhBxPUACgkQtdYpNtH8
nuj2CRAApeHXicEG/F5cchyCcUoMsNlELcGnwrwfOKDkspYXyYixCamihW4/dd+V
pl9hnCxhKM8RZPzxNcKawj5J35oZa7EGIQKf2qBlAX9nWt+C3lzdZjEeWeyzbKuE
Urni3tAg1M7Spcg4iYDrrUhGomgjqYlnW0/R5zNAKlNAdoSjjWbY/t7g9LuHSRNN
ve4W0NIQnH/jw9ZmgqBoPilHvpXFpf3ivx7U2k0FKeGzj8C0dh3/ckeyZi5A/8Cc
N0brcM2B1TKPMNkGBpyLRVrGpdbC7pVd/Hr9jPjUuqwyLfTKctn7lkEuxuTs308u
rppe6jeyJz3dyRAWl1nvOZ6GhRCS/+hJlzrqFGQGDXLXLJJKbGVXTr+2ulK2LF/8
kFedACqtxVkSdAD/s1paUQ1xuUm4fwyoES5llRdLAK+ZnbEzNfW7FhdBaimmZ+eg
wt7RXDXnxbAJwlnMRU31iltIDc882HQJnCn7bbm/xPEANDo/LNvrjW9YuNwbNKEO
f9YfO4h3XpDstbj8ljK4mDbjeau/sAymYnlLWzWbMLQNstlJRNoFZS1owc967+Wf
xoFyys0iL4pie9FgmEhhm1ba6elQ/r48yZR/lnCPjgtymy+dyDV+q9/Bqx7mXWIU
xFlLpRaFtNVMsYUcWnEI+9WhXq1zJ5czaQSMrZW7pU+0vfLcE7Q=
=ROYh
-----END PGP SIGNATURE-----
--=-=-=--
