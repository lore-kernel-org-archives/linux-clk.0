Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from anholt.net ([50.246.234.109]:49278 "EHLO anholt.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751203AbdFERe7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 5 Jun 2017 13:34:59 -0400
From: Eric Anholt <eric@anholt.net>
To: Danilo Krummrich <danilokrummrich@dk-develop.de>,
        rjui@broadcom.com, bcm-kernel-feedback-list@broadcom.com,
        stefan.wahren@i2se.com, linux-rpi-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, sboyd@codeaurora.org
Subject: Re: [PATCH] clk: bcm2835: remove remains from stub clk driver
In-Reply-To: <20170605121933.25288-1-danilokrummrich@dk-develop.de>
References: <20170605121933.25288-1-danilokrummrich@dk-develop.de>
Date: Mon, 05 Jun 2017 10:34:56 -0700
Message-ID: <87y3t6xrr3.fsf@eliezer.anholt.net>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

--=-=-=
Content-Type: text/plain

Danilo Krummrich <danilokrummrich@dk-develop.de> writes:

> This commit removes the fixed clocks introduced as a stub clock driver
> added with commit 75fabc3f6448 ("ARM: bcm2835: add stub clock driver").
> Originally they were used to drive the AMBA bus and PL011 uart driver.
> Now these clocks are derived by the CPRMAN clock driver and configured
> in DT.
>
> Additionally, get rid of init_machine function in bcm2835 board file
> as there's nothing to do any longer.
>
> Signed-off-by: Danilo Krummrich <danilokrummrich@dk-develop.de>

This technically breaks loading a new kernel with an ancient DT.
However, in the Raspberry Pi world, the DT and kernel are always shipped
together, because the DT (even in the downstream firmware package) is
built out of the linux kernel tree and shipped alongside the kernel.

If the clock maintainers are OK with picking this, it's:

Acked-by: Eric Anholt <eric@anholt.net>

and I'm pretty sure it won't conflict with anything we've got going on
in arm/.

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE/JuuFDWp9/ZkuCBXtdYpNtH8nugFAlk1lkAACgkQtdYpNtH8
nuifTg/9H0ohLL1AN3vm00zgZLqU36DuMnUdR541WtXvonk82BsqHTFRqi6B59c+
gNVXVHn0Vau0fBxQT00DiN8rqitv+zYhWadGnMpDomZlwLw9zSnaS2lF9g16pCgh
DNXvRW4ieHLo2k3U06fe78L/rseEamqEcpg6DgoLwVp68FDKx+5eYNHVyjPkh8uv
8qq6r1y8ZBE9mxav2u6gf8tuVFnVJfhJQThUBkwRvpGOmjYvD15d+uQJt9jqcvT7
TWerHV+49igLDQfee4GVicIV+F0nE9leCQcZfAsK+LxVvd13HwiRFMq8ah6OBbiy
7pWzpT3zsK8u8+1fmId365hTiTMye83i1ZjDwjakT5uX4SYmwdR+LWiIUdKAG2Wa
0FZLu64019t/ngsC9jLD1BE7u0oZqPRNEmNpDM4RKqBDogxGQAhGYZdUSdm6AwKB
YeJ16I7EYHFPTODJGGciZynE+ilu3lJFvS15aPjQ0Dn7P9r36ngKY4z3FZ9DrEf4
tijpCdEoxvvqOm7QduMsdIodI4svoEVC19mZCsbMZbWrcmzo43f9oZDSlwhtt4b8
6UC4BxEPqi7b1rHNu8oixL7jYmM95lXfLDBpabetT2nX6v8eL/RbcHkciwiVWDgH
QEOdS6NQ0RyNE9JduujLIfUlXTt+ASUl5hfDPLliWCduWqLsHqg=
=vRxt
-----END PGP SIGNATURE-----
--=-=-=--
